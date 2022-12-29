<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Agent;
use App\Models\AgentDetail;
use App\Models\Booking;
use App\Models\AllCategory;
use App\Models\BookingDetail;
use App\Models\Feedback;
use App\Models\Wallet;
use App\Models\SubCategory;
use App\Models\AgentRating;
use App\Models\AgentRequest;
use App\Models\HelpSection;
use App\Models\Notification;
use App\Models\Subscription;
use App\Models\UserSubscription;
use App\Models\UserTransaction;
use App\Models\UserRating;
use Illuminate\Container\BoundMethod;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;


class AdminController extends Controller
{
    public function users()
    {
        $users =  User::where('remember_token', NULL)->get();
        return view('users', compact('users'));
    }

    public function delete_user(Request $request)
    {
        $user_id = $request->delete_user_id;

        $booking = Booking::where('user_id', $user_id);
        $booking->delete();
        $user_subs = UserSubscription::where('user_id', $user_id);
        $user_subs->delete();
        $user_trans = UserTransaction::where('user_id', $user_id);
        $user_trans->delete();
        $agent_rating = AgentRating::where('user_id', $user_id);
        $agent_rating->delete();
        $user_rating = UserRating::where('user_id', $user_id);
        $user_rating->delete();
        $user_delete_from_notification = Notification::where('user_id', $user_id);
        $user_delete_from_notification->delete();

        $users = User::findOrFail($user_id);
        $users->delete();
        return redirect(route('users'))->with('error', 'User Deleted successfully');
    }

    public function logout()
    {

        Session::flush();
        Auth::logout();
        return redirect('login');
    }



    public function index()
    {
        return view('index');
    }

    public function admin_dashboard()
    {
        $users =  User::all()->count();
        $cat =  AllCategory::all()->count();
        $subcat =  SubCategory::all()->count();
        $booking =  Booking::all()->count();
        $agent =  Agent::all()->count();
        return view('dashboard',compact('users','cat','subcat','booking','agent'));
    }

    public function show_add_user()
    {
        return view('add_user_form');
    }

    //==========================================category Controllers =============================
    public function categories()
    {
        $categories = AllCategory::all();
        return view('all_categories', compact('categories'));
    }

    public function category()
    {

        $category = AllCategory::all();
        return view('category', compact('category'));
    }


    public function add_category(Request $request)
    {
        if ($request->file('img') == null) {
            $image_name = "";
        } else {
            $path_title = $request->file('img')->store('public/images');

            $image_name = basename($path_title);
        }

        $request->validate([
            'category_name' => 'required',
            'img' => 'required',
        ]);

        $category = new AllCategory();
        $category->category_name = $request->category_name;
        $category->img =  "images/" . $image_name;
        $category->save();
        return redirect(route('category', compact('category')))->with('add_message', 'Category Added successfully');
    }

    public function edit_category($id)
    {

        $category = AllCategory::find($id);
        return response()->json([
            'status' => '200',
            'category' => $category,
        ]);
    }

    public function category_update(Request $request)
    {

        $request->validate([
            'category_name' => 'required',
        ]);

        $cat_id = $request->query_id;

        $category = AllCategory::findOrFail($cat_id);


        if ($request->file('img') == null) {

            $image_name = $category->img;
        } else {

            $path_title = $request->file('img')->store('public/images');

            $image_name = "images/" .  basename($path_title);
        }

        $category->category_name = $request->category_name;
        $category->img =  $image_name;
        $category->save();
        return redirect()->back()->with('update_message', 'Category Updated successfully');
    }

    public function category_delete(Request $request)
    {

        $category_id = $request->delete_category_id;

        $subcat = SubCategory::where('cat_id', $category_id);
        $subcat->delete();
        $booking = Booking::where('cat_id', $category_id);
        $booking->delete();
        $agent = Agent::where('cat_id', $category_id);
        $agent->delete();
        $category = AllCategory::findOrFail($category_id);
        $category->delete();
        return redirect()->back()->with('delete_message', 'Category Deleted successfully');
    }

    //=============================Sub Category Controller========================================
    public function subcategory($id)
    {
        $sub_categories = SubCategory::where('cat_id', $id)->get();
        $cat = AllCategory::findOrFail($id);
        return view('sub_category', compact('sub_categories', 'cat'));
    }

    public function show_sub_category($id)
    {
        $sub_categories = SubCategory::where('cat_id', $id)->get();
        $cat = AllCategory::findOrFail($id);
        return view('managesubcat', compact('cat', 'sub_categories'));
    }

    public function add_sub_category(Request $request)
    {
        if ($request->file('img') == null) {
            $image_name = "";
        } else {
            $path_title = $request->file('img')->store('public/images');

            $image_name = basename($path_title);
        }

        $request->validate([
            'subcategory_name' => 'required',
            'img' => 'required',
            'price' => 'required',
            // 'retail_price' => 'required',
            'subscription_fee' => 'required',
            'sub_desc' => 'required',
        ]);

        $subcatgory = new SubCategory();
        $subcatgory->cat_id = $request->cat_id;
        $subcatgory->subcategory_name = $request->subcategory_name;
        $subcatgory->img =  "images/" . $image_name;
        $subcatgory->price = $request->price;
        // $subcatgory->retail_price = $request->retail_price;
        $subcatgory->subscription_fee = $request->subscription_fee;
        $subcatgory->sub_desc = $request->sub_desc;
        $subcatgory->save();
        return redirect(route('showsubCategory', ['id' => $request->cat_id], compact('subcatgory')))->with('add_message', 'Sub-Category Added successfully');
    }

    public function edit_sub_category($id)
    {

        $subcategory = SubCategory::find($id);
        return response()->json([
            'status' => '200',
            'subcategory' => $subcategory,
        ]);
    }

    public function sub_category_update(Request $request)
    {
        //  dd( $request);
        $request->validate([
            'sub_category_name' => 'required',
            'price' => 'required',
            // 'retail_price' => 'required',
            'subscription_fee' => 'required',
            'sub_desc' => 'required',
        ]);

        $sub_cat_id = $request->query_id;

        $subcategory = SubCategory::find($sub_cat_id);


        if ($request->file('img') == null) {

            $image_name = $subcategory->img;
        } else {

            $path_title = $request->file('img')->store('public/images');

            $image_name = "images/" .  basename($path_title);
        }
        $subcategory->cat_id = $request->cat_id;
        $subcategory->subcategory_name = $request->sub_category_name;
        $subcategory->img =  $image_name;
        $subcategory->price = $request->price;
        // $subcategory->retail_price = $request->retail_price;
        $subcategory->subscription_fee = $request->subscription_fee;
        $subcategory->sub_desc = $request->sub_desc;
        $subcategory->save();
        return redirect()->back()->with('update_message', 'SubCategory Updated successfully');
    }


    public function sub_category_delete(Request $request)
    {

        $sub_category_id = $request->delete_sub_category_id;
        $agent = Agent::where('subcat_id', $sub_category_id);
        $agent->delete();
        $booking = Booking::where('subcat_id', $sub_category_id);
        $booking->delete();
        $sub_category = SubCategory::findOrFail($sub_category_id);
        $sub_category->delete();
        return redirect()->back()->with('delete_message', 'Sub-Category Deleted successfully');
    }


    public function agents()
    {
        $agent = DB::table('agents')
        ->join('all_categories', 'agents.cat_id' ,'=', 'all_categories.id')
        ->join('sub_categories', 'agents.subcat_id' ,'=', 'sub_categories.id')
        ->select('agents.*', 'all_categories.category_name', 'sub_categories.subcategory_name')->get();
        return view('agents', compact('agent'));
    }
    public function show_add_agent()
    {
        $categories = AllCategory::all();
        $subcategories = SubCategory::all();
        $url = url('add_agent');
        $title = 'Add Agent';
        $text = 'Save';
        return view('add_agents', compact('url', 'title', 'text','categories','subcategories'));
    }

    public function add_agent(Request $request)
    {
        //dd($request);
        $request->validate([
            'cat_id' => 'required',
            'subcat_id' => 'required',
            'name' => 'required',
            'lat' => 'required',
            'long' => 'required',
            'phone' => 'required',
            'email' => 'required|email|unique:agents,agent_email',
            'password' => 'required|min:8',
        ]);

        $agent = new Agent();
        $agent->cat_id = $request->cat_id;
        $agent->subcat_id = $request->subcat_id;
        $agent->agent_name = $request->name;
        $agent->lat = $request->lat;
        $agent->longitude = $request->long;
        $agent->agent_phone = $request->phone;
        $agent->agent_email = $request->email;
        $agent->password = $request->password;
        $agent->save();
        return redirect(route('agents', compact('agent')))->with('add_message', 'Agent Added successfully');
    }

    public function edit_agent($id)
    {
        $categories = AllCategory::all();
        $subcategories = SubCategory::all();
        $agent = Agent::find($id);
        $url = url('agent_update');
        $title = 'Edit Agent';
        $text = 'Update';
        return view('add_agents', compact('agent', 'url', 'title', 'text','categories','subcategories',));
    }

    public function agent_update(Request $request)
    {

        $request->validate([
            'cat_id' => 'required',
            'subcat_id' => 'required',
            'name' => 'required',
            'lat' => 'required',
            'long' => 'required',
            'phone' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8',
        ]);

        $agent_id = $request->agent_id;

        $agent = Agent::find($agent_id);
        $agent->cat_id = $request->cat_id;
        $agent->subcat_id = $request->subcat_id;
        $agent->agent_name = $request->name;
        $agent->lat = $request->lat;
        $agent->longitude = $request->long;
        $agent->agent_phone = $request->phone;
        $agent->agent_email = $request->email;
        $agent->password = $request->password;
        $agent->save();
        return redirect(route('agents'))->with('update_message', 'Agent updated successfully');
    }

    public function delete_agent(Request $request)
    {
        $agent_id = $request->delete_agent_id;
        $agent_ratings = AgentRating::where('agent_id',  $agent_id);
        $agent_ratings->delete();
        $agent_rating = AgentRating::where('agent_id', $agent_id);
        $agent_rating->delete();
        $user_rating = UserRating::where('agent_id', $agent_id);
        $user_rating->delete();
        $notification = Notification::where('agent_id', $agent_id);
        $notification->delete();
        $agent_delete_from_agentdetails = AgentDetail::where('agent_id',  $agent_id);
        $agent_delete_from_agentdetails->delete();
        $agent = Agent::findOrFail($agent_id);
        $agent->delete();
        return redirect(route('agents'))->with('delete_message', 'Agent Deleted successfully');
    }

    public function booking()
    {
        // $query = DB::table('bookings')
        // ->join('users', 'bookings.user_id', '=', 'users.id')
        // ->join('all_categories', 'bookings.cat_id', '=', 'all_categories.id')
        // ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
        // ->select('bookings.*', 'users.name', 'users.email' , 'users.marital_status_name' , 'users.address' , 'users.phone', 'all_categories.category_name', 'sub_categories.subcategory_name')->get();
        // dd($query);
        $query = DB::table('bookings')
            ->join('users', 'bookings.user_id', '=', 'users.id')
            ->join('all_categories', 'bookings.cat_id', '=', 'all_categories.id')
            ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
            ->select('bookings.*', 'users.name', 'users.email', 'users.last_name', 'users.address', 'users.phone', 'all_categories.category_name', 'sub_categories.subcategory_name')->get();

        // dd($query);

        return view('booking', compact('query'));
    }

    public function booking_details($id)
    {
        $agent_rate = AgentRating::select('ratings')->where('book_id', $id)->first();
        if($agent_rate){

            $agent_rate = AgentRating::select('ratings')->where('book_id', $id)->first();

        }

        $user_rate = UserRating::select('ratings')->where('book_id', $id)->first();
        if($user_rate){

            $user_rate = UserRating::select('ratings')->where('book_id',$id)->first();

        } 

        // dd( $user_rate);

        // $agent_name = Booking::find($id)
        // ->join('agents', 'bookings.agent_id', '=', 'agents.id')
        // ->select('agents.agent_name')->first();

        // dd($agent_name);


        // dd($user_rate);

        $query = DB::table('bookings')
        ->join('users', 'bookings.user_id', '=', 'users.id')
        ->join('all_categories', 'bookings.cat_id', '=', 'all_categories.id')
        ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
        ->select('bookings.*', 'users.name', 'users.email', 'users.last_name', 'users.address', 'users.phone', 'all_categories.category_name', 'sub_categories.subcategory_name')->where('bookings.id', $id)->first();

        $agents = Agent::select('id','agent_name')->get();

       

        return view('booking_details', compact('query','agents', 'agent_rate', 'user_rate'));
    }

    public function delete_booking(Request $request)
    {
        $book_id = $request->delete_book_id;
        $feedback = Feedback::where('booking_id', $book_id);
        $feedback->delete();
        $book_det = BookingDetail::where('booking_id', $book_id);
        $book_det->delete();
        $booking_det = Notification::where('book_id', $book_id);
        $booking_det->delete();
        $booking_dete = UserRating::where('book_id', $book_id);
        $booking_dete->delete();
        $booking_detel = AgentRating::where('book_id', $book_id);
        $booking_detel->delete();
        $book_det_from_agent_req = AgentRequest::where('booking_id', $book_id)->first();
        $book_req_delete_from_agent_details = AgentDetail::where('request_id', $book_det_from_agent_req->id);
        $book_req_delete_from_agent_details->delete();
        $book_det_from_agent_req->delete();
        $booking = Booking::findOrFail($book_id);
        $booking->delete();
        return redirect(route('booking'))->with('delete_message', 'Booking Deleted successfully');
    }

    //==================================change order status =========================
    public function status(Request $request)
    {

        $result = Booking::find($request->id);
        $result->status = $request->val;
        $result->save();

        // if($result->status == 0){
        //     $this->sendNotification($result->user_id, 'Order Notification','Your Order Status is Pending Please wait!!');
        // }else if($result->status == 1){
        //     $this->sendNotification($result->user_id, 'Order Notification','Your Order Status Approved by Admin');
        // } else if($result->status == 2){
        //     $this->sendNotification($result->user_id, 'Order Notification','Your Order Status is Cancel by Admin');
        // }

    }

    public function agent_assign(Request $request)
    {

        $result = Booking::find($request->id);
        $result->agent_id = $request->val;
        $result->save();

    }

    public function feedback()
    {
        $feedback = DB::table('feedback')
        ->join('bookings', 'feedback.booking_id', '=' , 'bookings.id')
        ->join('users', 'bookings.user_id', '=', 'users.id')
        ->join('all_categories', 'bookings.cat_id', '=', 'all_categories.id' )
        ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
        ->select('feedback.*','users.name', 'all_categories.category_name', 'sub_categories.subcategory_name')->get();
        return view('feedback',compact('feedback'));

    }

    public function delete_feedback(Request $request)
    {
        $feedback_id= $request->delete_feedback_id;

        $feedback = Feedback::findOrFail($feedback_id);
        $feedback->delete();
        return redirect(route('feedback'))->with('delete_message', 'Feedback Deleted successfully');
    }

    //========================================== Wallet Controllers =============================

    public function wallet()
    {

        $wallets = Wallet::all();
        return view('wallet', compact('wallets'));
    }


    public function add_wallet(Request $request)
    {
   
        $request->validate([
            'code' => 'required|unique:wallets,codes',
            'amount' => 'required',
        ]);

        $wallets = new Wallet();
        $wallets->codes = $request->code;
        $wallets->amount =  $request->amount;
        $wallets->save();
        return redirect(route('wallet', compact('wallets')))->with('add_message', 'Wallet Code Added successfully');
    }

    public function edit_wallet($id)
    {

        $wallet = Wallet::find($id);
        return response()->json([
            'status' => '200',
            'wallet' => $wallet,
        ]);
    }

    public function wallet_update(Request $request)
    {

        $request->validate([
            'code' => 'required',
            'amount' => 'required',
        ]);

        $wallet_id = $request->query_id;

        $wallets = Wallet::findOrFail($wallet_id);
        $wallets->codes = $request->code;
        $wallets->amount =  $request->amount;
        $wallets->save();
        return redirect()->back()->with('update_message', 'Wallet Code Updated successfully');
    }

    public function wallet_delete(Request $request)
    {

        $wallet_id = $request->delete_wallet_id;

        $category = Wallet::findOrFail($wallet_id);
        $category->delete();
        return redirect()->back()->with('delete_message', 'Wallet Code Deleted successfully');
    }

    public function subscription()
    {
        $query = Subscription::all();
        return view('subscription', compact('query'));
    }

    public function add_subscription(Request $request)
    {
   
        $request->validate([
            'package_name' => 'required',
            'price' => 'required',
            'total_orders' => 'required',
            'duration' => 'required',
        ]);

        $subs = new Subscription();
        $subs->package_name = $request->package_name;
        $subs->package_price = $request->price;
        $subs->total_orders = $request->total_orders;
        $subs->duration =  $request->duration;
        $subs->save();
        return redirect(route('subscription', compact('subs')))->with('add_message', 'Subscription Package Added successfully');
    }

    public function edit_subscription($id)
    {

        $subs = Subscription::find($id);
        return response()->json([
            'status' => '200',
            'subs' => $subs,
        ]);
    }

    public function subscription_update(Request $request)
    {

        $request->validate([
            'package_name' => 'required',
            'price' => 'required',
            'total_orders' => 'required',
            'duration' => 'required',
        ]);

        $subs_id = $request->query_id;

        $subs = Subscription::findOrFail($subs_id);
        $subs->package_name = $request->package_name;
        $subs->package_price = $request->price;
        $subs->total_orders = $request->total_orders;
        $subs->duration =  $request->duration;
        $subs->save();
        return redirect()->back()->with('update_message', 'Subscription Package Updated successfully');
    }

    public function help(){

        $helps =  HelpSection::all();
        return view('help', compact('helps'));

    }

    public function delete_help(Request $request)
    {
        $help_id = $request->delete_help_id;

        $users = HelpSection::findOrFail($help_id);
        $users->delete();
        return redirect(route('help'))->with('delete_message', 'User Deleted successfully');
    }
}
