<?php

namespace App\Http\Controllers;

use App\Models\Agent;
use App\Models\AllCategory;
use App\Models\Booking;
use App\Models\BookingDetail;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\HelpSection;
use App\Models\UserTransaction;
use App\Models\Feedback;
use App\Models\Subscription;
use App\Models\UserSubscription;
use App\Models\AgentRequest;
use App\Models\AgentDetail;
use App\Models\AgentRating;
use App\Models\UserRating;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Notification;
use Illuminate\Support\Facades\Validator as FacadesValidator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

use function PHPUnit\Framework\isNull;

class ApiController extends Controller
{
   //=============================== User Login Api==========================
   public function login(Request $request)
   {

      $rules = [
         'email' => 'required|string|email|max:255',
         'password' => 'required',
         'device_token' => 'required'
      ];

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }

      $user = User::where('email', $request->email)->first();

      $data = [];

      if ($user) {
         if (Hash::check($request->password, $user->password)) {

            $token  = User::find($user->id);
            $token->device_token = $request->device_token;
            $token->save();

            $user_data = User::find($user->id);
            $user_avg_rating_count = UserRating::where('user_id', $user->id)->count();
            $user_avg_rating_sum = UserRating::where('user_id', $user->id)->sum('ratings');
            if ($user_avg_rating_count > 0) {

               $user_avg_rating =  round($user_avg_rating_sum / $user_avg_rating_count, 1);

            } else {

               $user_avg_rating = 0;
            }

            $user_data->user_rating = $user_avg_rating;
            $user_data->total_agent_rate_user = $user_avg_rating_count;
            array_push($data, $user_data);

            $rating  = User::find($user->id);
            $rating->user_avg_rating =  $user_avg_rating;
            $rating->save();

            $res['status'] = true;
            $res['message'] = "Password Matched! You have Login successfully!";
            $res['data'] =    $data;
            return response()->json($res);
         } else {

            $res['status'] = false;
            $res['message'] = "Password mismatch";
            return response()->json($res);
         }
      } else {

         $res['status'] = false;
         $res['message'] = "User does not exist";
         return response()->json($res);
      }
   }

   //=========================== Add Users Api ======================================
   public function add_users(Request $request)
   {

      if ($request->file('profile_img') == null) {
         $image_name = "";
      } else {
         $path_title = $request->file('profile_img')->store('public/images');

         $image_name = basename($path_title);
      }

      $rules = [
         'name' => 'required | min:5',
         'l_name' => 'required',
         'address' => 'required',
         'phone' => 'required ',
         'email' => 'required|email|unique:users',
         'password' => 'required|min:8',

      ];

      $validator = FacadesValidator::make($request->all(), $rules);
      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }
      $request['password'] = Hash::make($request['password']);
      // $request['remember_token'] = Str::random(10);
      //$users = User::create($request->all());
      $users = new User();
      $users->profile_img = "images/" . $image_name;
      $users->name = $request->name;
      $users->last_name = $request->l_name;
      $users->address = $request->address;
      $users->phone = $request->phone;
      $users->email = $request->email;
      $users->password = $request->password;
      $users->save();

      $data = [];

      if (is_null($users)) {

         $res['status'] = false;
         $res['message'] = "User Can't Insert Sucessfully";
         return response()->json($res);
      } else {

         $user_data = User::find($users->id);
         $user_avg_rating_count = UserRating::where('user_id', $users->id)->count();
         $user_avg_rating_sum = UserRating::where('user_id', $users->id)->sum('ratings');
         if ($user_avg_rating_count > 0) {

            $user_avg_rating =  round($user_avg_rating_sum / $user_avg_rating_count, 1);
         } else {

            $user_avg_rating = 0;
         }

         $user_data->user_rating = $user_avg_rating;
         $user_data->total_agent_rate_user = $user_avg_rating_count;
         array_push($data, $user_data);

         // $userss = User::where('email', $request->email)->first();
         $res['status'] = true;
         $res['message'] = "User Insert Sucessfully";
         $res['data'] = $data;
         return response()->json($res);
      }
      return response()->json($users);
   }

   //================== Edit Users Api ====================================
   public function edit_user(Request $request)
   {

      $finduser = User::find($request->user_id);

      if ($request->file('profile_img') == null) {

         $image_name = $finduser->profile_img;
      } else {

         $path_title = $request->file('profile_img')->store('public/images');

         $image_name = "images/" .  basename($path_title);
      }

      if (is_null($finduser)) {

         $res['status'] = false;
         $res['message'] = "User not found";
         return response()->json($res);
      }

      $rules = [


         'user_id' => 'required',
         'name' => 'required | min:5',
         'l_name' => 'required',
         'address' => 'required',
         'phone' => 'required ',


      ];

      $validator = FacadesValidator::make($request->all(), $rules);
      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }
      $request['password'] = Hash::make($request['password']);
      // $request['remember_token'] = Str::random(10);
      //$users = User::create($request->all());
      $users = User::find($request->user_id);
      $users->profile_img = $image_name;
      $users->name = $request->name;
      $users->last_name = $request->l_name;
      $users->address = $request->address;
      $users->phone = $request->phone;
      $users->save();

      if (is_null($users)) {

         $res['status'] = false;
         $res['message'] = "User Can't Updated Sucessfully";
         return response()->json($res);
      } else {

         $users = User::find($request->user_id);
         $res['status'] = true;
         $res['message'] = "User Updated Sucessfully";
         $res['data'] = $users;
         return response()->json($res);
      }
      return response()->json($users);
   }

   //=================================category Api =============================================
   public function category()
   {

      $category = AllCategory::all();

      if (count($category) == 0) {

         $res['status'] = false;
         $res['message'] = "Category Not Found!";
         return response()->json($res, 404);
      } else {

         $res['status'] = true;
         $res['message'] = "Category List";
         $res['data'] = $category;
         return response()->json($res);
      }
   }

   //=================================Subcategory Api =============================================
   public function Subcategory(Request $request)
   {

      $subcategory = SubCategory::where('cat_id', $request->cat_id)->get();

      if (count($subcategory) == 0) {

         $res['status'] = false;
         $res['message'] = "Subcategory Not Found!";
         return response()->json($res, 404);
      } else {

         $res['status'] = true;
         $res['message'] = "Subcategory List";
         $res['data'] = $subcategory;
         return response()->json($res);
      }
   }

   //===============================Add booking against user Routes================================
   public function add_booking(Request $request)
   {

      $result = json_decode($request->getContent(), true);

      $current_date = date('Y-m-d');
      //dd($current_date);
      $user_subscription = UserSubscription::where('user_id', $result['user_id'])->where('status', 1)->first();
      if (is_null($user_subscription)) {

         // $res['status'] = false;
         // $res['message'] = "Your Subscription Can't exists!!";
         // return response()->json($res);
         $lat = $request["lat"];
         $long = $request["long"];

         $nearest_agent = Agent::Select('id', 'agent_name', 'agent_phone', 'agent_email')->where('cat_id', $result['cat_id'])->where('subcat_id', $result['subcat_id'])->selectRaw("( 3959 * acos( cos( radians($lat) ) * cos( radians( agents.lat ) ) * cos( radians( agents.longitude ) - radians($long) ) + sin( radians($lat) ) * sin( radians( agents.lat ) ) ) ) AS distance")->orderBy('distance')->limit(3)->get();
         // dd($nearest_agent);

         $finduser = User::find($result['user_id']);

         if (is_null($finduser)) {

            $res['status'] = false;
            $res['message'] = "User not found";
            return response()->json($res);
         }

         $findcat = AllCategory::find($result['cat_id']);
         if (is_null($findcat)) {

            $res['status'] = false;
            $res['message'] = "category not Found";
            return response()->json($res);
         }

         $findsubcat = SubCategory::find($result['subcat_id']);
         if (is_null($findsubcat)) {

            $res['status'] = false;
            $res['message'] = "Subcategory not Found";
            return response()->json($res);
         }


         $booking_pics = $result['booking_pics'];

         if (is_null($booking_pics)) {

            $res['status'] = false;
            $res['message'] = "Pictures not Found";
            return response()->json($res);
         }

         $request->validate([
            'user_id' => 'required',
            'cat_id' => 'required',
            'subcat_id' => 'required',
            'booking_desc' => 'required',
            'lat' => 'required',
            'long' => 'required',
            'date' => 'required',
            'time' => 'required',
         ]);

         $price = SubCategory::find($result['subcat_id']);
         // dd($price);

         $booking = new Booking();
         $booking->user_id = $result['user_id'];
         $booking->cat_id = $result['cat_id'];
         $booking->subcat_id = $result['subcat_id'];
         $booking->booking_desc = $result['booking_desc'];
         $booking->lat = $result['lat'];
         $booking->long = $result['long'];
         $booking->date = $result['date'];
         $booking->time = $result['time'];
         $booking->booking_price = $price->price;
         $booking->save();

         $this->UserNofication($booking->user_id, 'Booking Notification', 'Your Booking Request Send To nearest agents', 0, NULL);



         $user = User::find($result['user_id']);
         $user_balance = $user->balance;

         if ($user_balance < $price->price) {

            $res['status'] = false;
            $res['message'] = "Please Recharge Your Wallet!!";
            return response()->json($res);
         } else {

            $user->balance = $user_balance - $price->price;
            $user->save();
         }


         $time = date("h:i:sa");

         $user_trans = new UserTransaction();
         $user_trans->user_id = $result['user_id'];
         $user_trans->trans_name =  "Service Booking";
         $user_trans->trans_price = $price->price;
         $user_trans->trans_date =   $result['date'];
         $user_trans->trans_time =  $time;
         $user_trans->save();


         foreach ($booking_pics as $list) {

            $booking_details = new BookingDetail();
            $booking_details->booking_id = $booking->id;
            $booking_details->booking_img = $list['img'];
            $booking_details->save();
         }

         $agent_request = new AgentRequest();
         $agent_request->booking_id =  $booking->id;
         $agent_request->save();

         foreach ($nearest_agent as $list) {

            // $data = DB::table('bookings')
            // ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
            // ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')->select('bookings.*','sub_categories.subcategory_name','booking_details.booking_img')->where('bookings.id',$booking->id)->first();

            $this->sendNotification($list->id, 'Booking Notification', 'You Have New Booking Request', $result['user_id']);

            $agent_request_details = new AgentDetail();
            $agent_request_details->request_id =  $agent_request->id;
            $agent_request_details->agent_id =  $list->id;
            $agent_request_details->save();
         }

         $res['status'] = true;
         $res['message'] = "booking Added Successfully!!";
         $res['nearest_agent'] =  $nearest_agent;
         return response()->json($res);
      }

      $end_date = $user_subscription->end_date;
      //dd($end_date);
      $db = date('d-m-y', strtotime($end_date));
      //dd($db);
      $end_date_finally = date('Y-m-d', strtotime($db));
      //dd($end_date_finally);


      if ($user_subscription->status == 1) {
         if ($current_date < $end_date_finally) {
            if ($user_subscription->orders > 0) {

               $orders = $user_subscription->orders - 1;
               $user_subscription->orders = $orders;
               $user_subscription->save();

               //dd($result);
               $lat = $request["lat"];
               $long = $request["long"];

               $nearest_agent = Agent::Select('id', 'agent_name', 'agent_phone', 'agent_email')->where('cat_id', $result['cat_id'])->where('subcat_id', $result['subcat_id'])->selectRaw("( 3959 * acos( cos( radians($lat) ) * cos( radians( agents.lat ) ) * cos( radians( agents.longitude ) - radians($long) ) + sin( radians($lat) ) * sin( radians( agents.lat ) ) ) ) AS distance")->orderBy('distance')->limit(3)->get();
               // dd($nearest_agent);

               $finduser = User::find($result['user_id']);

               if (is_null($finduser)) {

                  $res['status'] = false;
                  $res['message'] = "User not found";
                  return response()->json($res);
               }

               $findcat = AllCategory::find($result['cat_id']);
               if (is_null($findcat)) {

                  $res['status'] = false;
                  $res['message'] = "category not Found";
                  return response()->json($res);
               }

               $findsubcat = SubCategory::find($result['subcat_id']);
               if (is_null($findsubcat)) {

                  $res['status'] = false;
                  $res['message'] = "Subcategory not Found";
                  return response()->json($res);
               }


               $booking_pics = $result['booking_pics'];

               if (is_null($booking_pics)) {

                  $res['status'] = false;
                  $res['message'] = "Pictures not Found";
                  return response()->json($res);
               }

               $request->validate([
                  'user_id' => 'required',
                  'cat_id' => 'required',
                  'subcat_id' => 'required',
                  'booking_desc' => 'required',
                  'lat' => 'required',
                  'long' => 'required',
                  'date' => 'required',
                  'time' => 'required',
               ]);

               $price = SubCategory::find($result['subcat_id']);
               // dd($price);

               $booking = new Booking();
               $booking->user_id = $result['user_id'];
               $booking->cat_id = $result['cat_id'];
               $booking->subcat_id = $result['subcat_id'];
               $booking->booking_desc = $result['booking_desc'];
               $booking->lat = $result['lat'];
               $booking->long = $result['long'];
               $booking->date = $result['date'];
               $booking->time = $result['time'];
               $booking->booking_price = $price->price;
               $booking->save();

               $this->UserNofication($booking->user_id, 'Booking Notification', 'Your Booking Request Send To nearest agents', 0, NULL);

               $time = date("h:i:sa");

               $user_trans = new UserTransaction();
               $user_trans->user_id = $result['user_id'];
               $user_trans->trans_name =  "Service Booking";
               $user_trans->trans_price = $price->price;
               $user_trans->trans_date =   $result['date'];
               $user_trans->trans_time =  $time;
               $user_trans->save();


               foreach ($booking_pics as $list) {

                  $booking_details = new BookingDetail();
                  $booking_details->booking_id = $booking->id;
                  $booking_details->booking_img = $list['img'];
                  $booking_details->save();
               }

               $agent_request = new AgentRequest();
               $agent_request->booking_id =  $booking->id;
               $agent_request->save();

               foreach ($nearest_agent as $list) {

                  // $data = DB::table('bookings')
                  // ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
                  // ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')->select('bookings.*','sub_categories.subcategory_name','booking_details.booking_img')->where('bookings.id',$booking->id)->first();

                  $this->sendNotification($list->id, 'Booking Notification', 'You Have New Booking Request', $result['user_id']);

                  $agent_request_details = new AgentDetail();
                  $agent_request_details->request_id =  $agent_request->id;
                  $agent_request_details->agent_id =  $list->id;
                  $agent_request_details->save();
               }

               $res['status'] = true;
               $res['message'] = "booking Added Successfully!!";
               $res['nearest_agent'] =  $nearest_agent;
               return response()->json($res);
            } else {

               $user_subscription->status = 0;
               $user_subscription->save();

               $res['status'] = false;
               $res['message'] = "Orders Finished!!";
               return response()->json($res);
            }
         } else {
            $user_subscription->status = 0;
            $user_subscription->save();

            $res['status'] = false;
            $res['message'] = "Your Subscription will Expire!!";
            return response()->json($res);
         }
      } else {

         $res['status'] = false;
         $res['message'] = "Your Subscription will Expire Please!!";
         return response()->json($res);
      }
   }


   //=================================Upload Image Api =============================================
   public function upload_img(Request $request)
   {

      if ($request->file('img') == null) {
         $image_name = "";

         $res['status'] = false;
         $res['message'] = "image can not upload successfully";
         return $res;
      } else {
         $path_title = $request->file('img')->store('public/images');

         $image_name = "images/" . basename($path_title);

         $res['status'] = true;
         $res['message'] = "image upload successfully";
         $res['data'] = $image_name;
         return $res;
      }
   }

   //============================booking_list againt user Api =========================================
   public function booking_list(Request $request)
   {


      $booking = Booking::where('user_id', $request->user_id)
         ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
         ->select('bookings.*', 'sub_categories.subcategory_name')->get();

      $data = [];

      if (count($booking) == 0) {

         $res['status'] = false;
         $res['message'] = "booking_list Not Found!";
         return $res;
      } else {

         $booking = Booking::where('user_id', $request->user_id)
            ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
            ->select('bookings.*', 'sub_categories.subcategory_name')->get();
         foreach ($booking as $que) {

            $query = Booking::where('bookings.id', $que->id)
               ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
               ->select('booking_details.booking_img', 'bookings.id')->first();

            if (is_null($query)) {
               $res['status'] = false;
               $res['message'] = "booking_images Not Found!";
               return $res;
            }
            $que->booking_image = $query->booking_img;
            array_push($data, $que);
         }

         $res['status'] = true;
         $res['message'] = "booking_list against user List";
         $res['data'] = $data;
         return $res;
      }
   }

   //===============================pending_list againt user Api ======================================
   public function pending_list(Request $request)
   {


      $booking = Booking::where('user_id', $request->user_id)->where('status', 0)->get();
      $data = [];
      if (count($booking) == 0) {

         $res['status'] = false;
         $res['message'] = "pending_list Not Found!";
         return response()->json($res, 404);
      } else {

         foreach ($booking as $que) {

            $query = Booking::where('bookings.id', $que->id)
               ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
               ->select('booking_details.booking_img', 'bookings.id')->first();

            if (is_null($query)) {
               $res['status'] = false;
               $res['message'] = "booking_images Not Found!";
               return $res;
            }
            $que->booking_image = $query->booking_img;
            array_push($data, $que);
         }

         $res['status'] = true;
         $res['message'] = "booking_list against user List";
         $res['data'] = $data;
         return $res;
      }
   }

   //===============================confirmed_list againt user Api ======================================
   public function confirmed_list(Request $request)
   {


      $booking = Booking::where('user_id', $request->user_id)->where('status', 1)->get();
      $data = [];
      if (count($booking) == 0) {

         $res['status'] = false;
         $res['message'] = "confirmed_list Not Found!";
         return response()->json($res, 404);
      } else {

         foreach ($booking as $que) {

            $query = Booking::where('bookings.id', $que->id)
               ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
               ->select('booking_details.booking_img', 'bookings.id')->first();

            if (is_null($query)) {
               $res['status'] = false;
               $res['message'] = "booking_images Not Found!";
               return $res;
            }
            $que->booking_image = $query->booking_img;
            array_push($data, $que);
         }

         $res['status'] = true;
         $res['message'] = "booking_list against user List";
         $res['data'] = $data;
         return $res;
      }
   }

   //===============================canclled_list againt user Api ======================================
   public function canclled_list(Request $request)
   {


      $booking = Booking::where('user_id', $request->user_id)->where('status', 2)->get();
      $data = [];
      if (count($booking) == 0) {

         $res['status'] = false;
         $res['message'] = "canclled_list Not Found!";
         return response()->json($res, 404);
      } else {

         foreach ($booking as $que) {

            $query = Booking::where('bookings.id', $que->id)
               ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
               ->select('booking_details.booking_img', 'bookings.id')->first();

            if (is_null($query)) {
               $res['status'] = false;
               $res['message'] = "booking_images Not Found!";
               return $res;
            }
            $que->booking_image = $query->booking_img;
            array_push($data, $que);
         }

         $res['status'] = true;
         $res['message'] = "booking_list against user List";
         $res['data'] = $data;
         return $res;
      }
   }

   //===============================completed_list againt user Api ======================================
   public function completed_list(Request $request)
   {


      $booking = Booking::where('user_id', $request->user_id)->where('status', 3)->get();
      $data = [];
      if (count($booking) == 0) {

         $res['status'] = false;
         $res['message'] = "pending_list Not Found!";
         return response()->json($res, 404);
      } else {

         foreach ($booking as $que) {

            $query = Booking::where('bookings.id', $que->id)
               ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
               ->select('booking_details.booking_img', 'bookings.id')->first();

            if (is_null($query)) {
               $res['status'] = false;
               $res['message'] = "booking_images Not Found!";
               return $res;
            }
            $que->booking_image = $query->booking_img;
            array_push($data, $que);
         }

         $res['status'] = true;
         $res['message'] = "booking_list against user List";
         $res['data'] = $data;
         return $res;
      }
   }

   public function feedback(Request $request)
   {
      $rules = ([
         'booking_id' => 'required',
         'rating_stars' => 'required',
         'desc' => 'required',
      ]);

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }


      $feedback = new Feedback();
      $feedback->booking_id = $request->booking_id;
      $feedback->rating_stars = $request->rating_stars;
      $feedback->feedback_desc = $request->desc;
      $feedback->save();

      $res['status'] = true;
      $res['message'] = "Your Feedback Against Booking Added Successfully";
      return $res;
   }

   public function wallet(Request $request)
   {

      $user = User::find($request->user_id);
      if (is_null($user)) {
         $res['status'] = false;
         $res['message'] = "user cannot exist";
         return $res;
      }

      $code_check = Wallet::where('codes', $request->code)->first();
      if (is_null($code_check)) {
         $res['status'] = false;
         $res['message'] = "Please Enter Valid Code!!";
         return $res;
      }

      $rules = ([
         'code' => 'required',
         'user_id' => 'required',
      ]);

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }

      $code_status = Wallet::where('codes', $request->code)->first();
      if ($code_status->status == 0) {

         $res['status'] = false;
         $res['message'] = "You have Already Used this Code!!";
         return $res;
      } else {

         $code = Wallet::where('codes', $request->code)->first();
         $code->status = 0;
         $code->save();

         $balance = User::where('id', $request->user_id)->first();
         $balance->balance = $balance->balance + $code->amount;
         $balance->save();

         $current_date = date('d-m-y');
         $time = date("h:i:sa");

         $user_trans = new UserTransaction();
         $user_trans->user_id = $request->user_id;
         $user_trans->trans_name =  "Balance Added";
         $user_trans->trans_price = $code->amount;
         $user_trans->trans_date =    $current_date;
         $user_trans->trans_time =  $time;
         $user_trans->save();

         $res['status'] = true;
         $res['message'] = "You have Sucessfully Recharge Your Wallet!!";
         $res['data'] = $balance;
         return $res;
      }
   }

   public function wallet_user(Request $request)
   {

      $user = User::find($request->user_id);
      if (is_null($user)) {
         $res['status'] = false;
         $res['message'] = "user cannot exist";
         return $res;
      } else {
         $res['status'] = true;
         $res['message'] = "User Wallet!!";
         $res['data'] = $user;
         return $res;
      }
   }

   public function payment(Request $request)
   {

      $user = User::find($request->user_id);
      $user->balance = $request->new_balance;
      $user->save();

      $current_date = date('d-m-y');
      $time = date("h:i:sa");

      $user_trans = new UserTransaction();
      $user_trans->user_id = $request->user_id;
      $user_trans->trans_name =  "Remaining Balance";
      $user_trans->trans_price = $request->new_balance;
      $user_trans->trans_date =    $current_date;
      $user_trans->trans_time =  $time;
      $user_trans->save();

      $res['status'] = true;
      $res['message'] = "Balannce Updated Payment Done!!";
      $res['data'] = $user;
      return $res;
   }

   //=============================== User Login Api==========================
   public function agent_login(Request $request)
   {
      $rules = [
         'email' => 'required|string|email|max:255',
         'password' => 'required',
         'device_token' => 'required'
      ];

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }

      $agent = Agent::where('agent_email', $request->email)->first();

      $data = [];

      if ($agent) {
         if ($request->password == $agent->password) {

            $token  = Agent::find($agent->id);
            $token->device_token = $request->device_token;
            $token->save();

            $agent_data = Agent::find($agent->id);
            $agent_avg_rating_count = AgentRating::where('agent_id', $agent->id)->count();
            $agent_avg_rating_sum = AgentRating::where('agent_id', $agent->id)->sum('ratings');
            if ($agent_avg_rating_count > 0) {

               $agent_avg_rating =  round($agent_avg_rating_sum / $agent_avg_rating_count, 1);
            } else {

               $agent_avg_rating = 0;
            }

            $agent_data->agent_rating = $agent_avg_rating;
            $agent_data->total_user_rate_agent = $agent_avg_rating_count;
            array_push($data, $agent_data);

            $rating  = Agent::find($agent->id);
            $rating->agent_avg_rating =  $agent_avg_rating;
            $rating->save();

            $res['status'] = true;
            $res['message'] = "Password Matched! You have Login successfully!";
            $res['data'] = $data;
            return response()->json($res);
         } else {

            $res['status'] = false;
            $res['message'] = "Password mismatch";
            return response()->json($res);
         }
      } else {

         $res['status'] = false;
         $res['message'] = "Agent does not exist";
         return response()->json($res);
      }
   }

   public function subscription()
   {
      $query = Subscription::all();
      if (is_null($query)) {
         $res['status'] = false;
         $res['message'] = "Subscription cannot exist";
         return $res;
      } else {

         $res['status'] = true;
         $res['message'] = "Subscription List!!";
         $res['data'] = $query;
         return $res;
      }
   }

   public function user_subscription(Request $request)
   {
      $current_date = date('d-m-y');
      //dd($current_date);
      $end_date = date('d-m-y', strtotime('+30 days'));

      $user = User::find($request->user_id);
      $user->subscription_status = 1;
      $user->save();


      $rules = [
         'user_id' => 'required',
         'subs_id' => 'required',
         'pkg_name' => 'required',
         'pkg_price' => 'required',
         'orders' => 'required',
      ];

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }
      $user_subs = UserSubscription::where('user_id', $request->user_id)->where('status', 1)->count();
      $user = User::where('id', $request->user_id)->first();

      if ($user->balance >= $request->pkg_price) {

         if ($user_subs > 0) {

            $res['status'] = false;
            $res['message'] = "You have already subscribed !!";
            return $res;
         } else {

            $user_wallet_balance = $user->balance - $request->pkg_price;
            $user->balance = $user_wallet_balance;
            $user->save();

            $user_subscription = new UserSubscription();
            $user_subscription->user_id = $request->user_id;
            $user_subscription->subs_id = $request->subs_id;
            $user_subscription->pkg_name = $request->pkg_name;
            $user_subscription->pkg_price = $request->pkg_price;
            $user_subscription->orders = $request->orders;
            $user_subscription->start_date = $current_date;
            $user_subscription->end_date = $end_date;
            $user_subscription->save();

            $time = date("h:i:sa");

            $user_trans = new UserTransaction();
            $user_trans->user_id = $request->user_id;
            $user_trans->trans_name =  $request->pkg_name;
            $user_trans->trans_price =  $request->pkg_price;
            $user_trans->trans_date =  $current_date;
            $user_trans->trans_time =  $time;
            $user_trans->save();

            $res['status'] = true;
            $res['message'] = "User Subscription!!";
            $res['data'] = $user_subscription;
            return $res;
         }
      } else {

         $res['status'] = false;
         $res['message'] = "Please Recharge Your Wallet!!";
         return $res;
      }
   }

   public function chk_subscription(Request $request)
   {
      $user_subscription = UserSubscription::where('user_id', $request->user_id)->where('status', 1)->first();

      if ($user_subscription) {
         $res['status'] = true;
         $res['message'] = "User Subscription!!";
         $res['data'] = $user_subscription;
         return $res;
      } else {

         $res['status'] = true;
         $res['message'] = "Your Subscription Can't exists!!";
         $res['data'] = UserSubscription::where('user_id', $request->user_id)->where('status', 0)->first();
         return response()->json($res);
      }
   }

   public function help(Request $request)
   {
      $rules = [
         'f_name' => 'required',
         'l_name' => 'required',
         'phone' => 'required',
         'email' => 'required',
         'desc' => 'required',
      ];

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }

      $help = new HelpSection();
      $help->first_name = $request->f_name;
      $help->last_name = $request->l_name;
      $help->phone = $request->phone;
      $help->email = $request->email;
      $help->description = $request->desc;
      $help->save();

      $res['status'] = true;
      $res['message'] = "User Subscription!!";
      $res['data'] = $help;
      return $res;
   }

   public function user_trans(Request $request)
   {
      $user_trans = UserTransaction::where('user_id', $request->user_id)->get();

      if ($user_trans) {
         $res['status'] = true;
         $res['message'] = "User Transactions!!";
         $res['data'] = $user_trans;
         return $res;
      } else {

         $res['status'] = false;
         $res['message'] = "Your Transactions Can't exists!!";
         return response()->json($res);
      }
   }

   public function new_request(Request $request)
   {

      $agent_reqs = AgentDetail::where('agent_id', $request->agent_id)->where('status', NULL)->get();

      //  $data = DB::table('bookings')
      //             ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
      //             ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')->select('bookings.*','sub_categories.subcategory_name','booking_details.booking_img')->where('bookings.id',$booking->id)->first();

      $agent_req = DB::table('agent_details')
         ->join('agent_requests', 'agent_details.request_id', '=', 'agent_requests.id')
         ->join('bookings', 'agent_requests.booking_id', '=', 'bookings.id')
         ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
         // ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
         ->select('bookings.*', 'sub_categories.subcategory_name', 'agent_details.request_id')->where('agent_details.agent_id', $request->agent_id)->where('agent_details.status', NULL)->get();
      // dd($agent_req);

      $data_img = [];

      foreach ($agent_req as $req) {
         $request_img = BookingDetail::where('booking_id', $req->id)->first();
         $img = $request_img->booking_img;
         $req->booking_img = $img;
         array_push($data_img, $req);
      }




      // $agent_req=DB::select(DB::RAW('SELECT u.* from ( select `bookings`.*, `sub_categories`.`subcategory_name`, `booking_details`.`booking_img`,`booking_details`.`booking_id` from `agent_details` inner join `agent_requests` on `agent_details`.`request_id` = `agent_requests`.`id` inner join `bookings` on `agent_requests`.`booking_id` = `bookings`.`id` inner join `sub_categories` on `bookings`.`subcat_id` = `sub_categories`.`id` inner join `booking_details` on `bookings`.`id` = `booking_details`.`booking_id` where `agent_details`.`agent_id` = '.$request->agent_id.' and `agent_details`.`status` is null ) as u GROUP by u.booking_id
      // '));



      if ($data_img) {
         $res['status'] = true;
         $res['message'] = "Agent New Requests!!";
         $res['data'] = $agent_req;
         return $res;
      } else {

         $res['status'] = false;
         $res['message'] = "Agent New Request Cant Exists!!";
         return response()->json($res);
      }
   }

   public function on_going(Request $request)
   {

      $agent_req = DB::table('agent_details')
         ->join('agent_requests', 'agent_details.request_id', '=', 'agent_requests.id')
         ->join('bookings', 'agent_requests.booking_id', '=', 'bookings.id')
         ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
         // ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
         ->select('bookings.*', 'sub_categories.subcategory_name', 'agent_details.request_id')->where('agent_details.agent_id', $request->agent_id)->where('agent_details.status', '1')->get();
      // dd()
      $data_img = [];

      foreach ($agent_req as $req) {
         $request_img = BookingDetail::where('booking_id', $req->id)->first();
         $img = $request_img->booking_img;
         $req->booking_img = $img;
         array_push($data_img, $req);
      }

      if ($data_img) {
         $res['status'] = true;
         $res['message'] = "Agent OnGoing Requests!!";
         $res['data'] = $agent_req;
         return $res;
      } else {

         $res['status'] = false;
         $res['message'] = "Agent OnGoing Request Cant Exists!!";
         return response()->json($res);
      }
   }

   public function req_history(Request $request)
   {

      $agent_req = DB::table('agent_details')
         ->join('agent_requests', 'agent_details.request_id', '=', 'agent_requests.id')
         ->join('bookings', 'agent_requests.booking_id', '=', 'bookings.id')
         ->join('sub_categories', 'bookings.subcat_id', '=', 'sub_categories.id')
         // ->join('booking_details', 'bookings.id', '=', 'booking_details.booking_id')
         ->select('bookings.*', 'sub_categories.subcategory_name', 'agent_details.status')->where('agent_details.agent_id', $request->agent_id)->where('agent_details.status', '0')->orWhere('agent_details.status', '2')->get();

      $data_img = [];

      foreach ($agent_req as $req) {
         $request_img = BookingDetail::where('booking_id', $req->id)->first();
         $img = $request_img->booking_img;
         $req->booking_img = $img;
         array_push($data_img, $req);
      }

      if ($data_img) {
         $res['status'] = true;
         $res['message'] = "Agent History!!";
         $res['data'] = $agent_req;
         return $res;
      } else {

         $res['status'] = false;
         $res['message'] = "Agent History Cant't exist!!";
         return response()->json($res);
      }
   }

   public function status_chng(Request $request)
   {

      $agent_req_status = AgentDetail::where('agent_id', $request->agent_id)->where('request_id', $request->request_id)->first();

      $user_id = AgentDetail::where('agent_details.agent_id', $request->agent_id)->where('agent_details.request_id', $request->request_id)
         ->join('agent_requests', 'agent_details.request_id', '=', 'agent_requests.id')
         ->join('bookings', 'agent_requests.booking_id', '=', 'bookings.id')
         ->select('bookings.user_id')->first();
      // dd($user_id->user_id);

      $booking_id = AgentDetail::where('agent_details.agent_id', $request->agent_id)->where('agent_details.request_id', $request->request_id)
         ->join('agent_requests', 'agent_details.request_id', '=', 'agent_requests.id')
         ->join('bookings', 'agent_requests.booking_id', '=', 'bookings.id')
         ->select('agent_requests.booking_id')->first();
      // dd($booking_id);

      if ($request->status == 0) {

         $booking = Booking::find($booking_id->booking_id);
         $booking->status = 2;
         $booking->save();
      }

      if ($request->status == 1) {

         $booking = Booking::find($booking_id->booking_id);
         $booking->status = 1;
         $booking->save();
      }

      if ($request->status == 2) {

         $booking = Booking::find($booking_id->booking_id);
         $booking->status = 3;
         $booking->agent_id =  $request->agent_id;
         $booking->save();
      }


      if (is_null($agent_req_status)) {
         $res['status'] = false;
         $res['message'] = "Agent Requests Can't Found!!";
         return $res;
      }

      $agent_req_status->status = $request->status;
      $agent_req_status->save();

      if ($agent_req_status->status == '1') {

         $req_status = AgentDetail::where('request_id', $request->request_id)->where('status', NULL);
         if ($req_status) {
            $req_status->delete();
         }

         $this->UserNofication($user_id->user_id, 'Booking Notification', 'Your Booking Request Accepted By Agent', $request->agent_id, NULL);
      }

      if ($agent_req_status->status == '2') {

         $this->UserNoficationComplete($user_id->user_id, 'Booking Notification', 'Your Order Completed Successfully By Agent', $request->agent_id, $booking_id->booking_id);

         $booking = Booking::find($booking_id->booking_id);
         if($booking){
            $booking->agent_id =  $request->agent_id;
            $booking->save();
         }
      }

      if ($agent_req_status) {
         $res['status'] = true;
         $res['message'] = "Agent Requests Status Changed!!";
         $res['data'] = AgentDetail::where('agent_id', $request->agent_id)->where('request_id', $request->request_id)->first();
         return $res;
      } else {

         $res['status'] = false;
         $res['message'] = "Agent Requests Status can't Changed!!";
         return response()->json($res);
      }
   }

   public function notification(Request $request)
   {

      //dd($request);
      $notification = Notification::where('user_id', $request->user_id)->where('role', 0)->get();

      $data = [];

      foreach ($notification as $n) {
         if ($n->agent_id > 0) {
            $agent_name = Agent::find($n->agent_id);
            $n->agent_name = $agent_name->agent_name;
            array_push($data, $n);
         } else {

            $n->agent_name = NULL;
            array_push($data, $n);
         }
      }

      // dd($notification );

      if (count($notification) == 0) {

         $res['status'] = false;
         $res['message'] = "Notification List Can't Found Against User!!";
         return response()->json($res);
      } else {

         $res['status'] = true;
         $res['message'] = "Notification List Against User!!";
         $res['data'] = $notification;
         return response()->json($res);
      }
   }

   public function notification_agent(Request $request)
   {

      //dd($request);
      $notification = Notification::where('agent_id', $request->agent_id)->where('role', 1)->get();

      $data = [];

      foreach ($notification as $n) {
         if ($n->user_id > 0) {
            $user_name = User::find($n->user_id);
            $n->user_name = $user_name->name;
            array_push($data, $n);
         } else {

            $n->user_name = NULL;
            array_push($data, $n);
         }
      }


      if (count($notification) == 0) {

         $res['status'] = false;
         $res['message'] = "Notification List Can't Found Against Agent!!";
         return response()->json($res);
      } else {

         $res['status'] = true;
         $res['message'] = "Notification List Against Agent!!";
         $res['data'] = $notification;
         return response()->json($res);
      }
   }

   public function agent_rating(Request $request)
   {
      $rules = [
         'agent_id' => 'required',
         'user_id' => 'required',
         'ratings' => 'required',
         'agent_desc' => 'required',
         'book_id' => 'required',
      ];

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }

      $rating = new AgentRating();
      $rating->user_id = $request->user_id;
      $rating->agent_id = $request->agent_id;
      $rating->ratings = $request->ratings;
      $rating->agent_desc = $request->agent_desc;
      $rating->book_id = $request->book_id;
      $rating->save();

      $this->AgentNofication($request->user_id, 'Raqting Notification', 'You Have Rated Successfully By User', $request->agent_id,  $request->book_id);

      $res['status'] = true;
      $res['message'] = "You Have Rate This Agent Successfully!!";
      $res['data'] = $rating;
      return $res;
   }

   public function user_rating(Request $request)
   {
      $rules = [
         'agent_id' => 'required',
         'user_id' => 'required',
         'ratings' => 'required',
         'user_desc' => 'required',
         'book_id' => 'required',
      ];

      $validator = FacadesValidator::make($request->all(), $rules);

      if ($validator->fails()) {
         $err = $validator->errors()->getMessages();
         $msg = array_values($err)[0][0];
         $res['status'] = false;
         $res['message'] = $msg;

         return response()->json($res);
      }

      $rating = new UserRating();
      $rating->user_id = $request->user_id;
      $rating->agent_id = $request->agent_id;
      $rating->ratings = $request->ratings;
      $rating->user_desc = $request->user_desc;
      $rating->book_id = $request->book_id;
      $rating->save();

      $this->UserNofication($request->user_id, 'Rating Notification', 'You Have Successfully Rated By Agent', $request->agent_id, $request->book_id);

      $res['status'] = true;
      $res['message'] = "You Have Rate This User Successfully!!";
      $res['data'] = $rating;
      return $res;
   }

   public function sendNotification($id, $title, $data, $user_id)
   {
      //dd($data);
      $notification = new notification();
      $notification->user_id = $user_id;
      $notification->title = $title;
      $notification->description = $data;
      $notification->role = 1;
      if ($id > 0) {

         $notification->agent_id = $id;
      }
      $notification->save();

      $agent = Agent::find($id);
      $agent_token = $agent->device_token;

      $SERVER_API_KEY = 'AAAA63Z5CXw:APA91bHRwnOCsxCUvLca4DlnlD17Yv_tKXnLB1V0UAW3IOmqm8ose8XQKm0u3ZOAGeCxORGXt7awsw34qGGPgI4OvBafxc_YMn2uOitfCaI40XzqtTMxvyO74OMaj1QcfIT76pT5lbTG';

      $data = [
         "registration_ids" => [$agent_token],
         "data" => [
            "title" => $title,
            "body" => $data,
         ]
      ];
      $dataString = json_encode($data);

      $headers = [
         'Authorization: key=' . $SERVER_API_KEY,
         'Content-Type: application/json',
      ];

      $ch = curl_init();

      curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
      curl_setopt($ch, CURLOPT_POST, true);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

      $response = curl_exec($ch);

      //dd($response);
   }

   public function UserNofication($id, $title, $data, $agent_id, $book_id)
   {
      if ($book_id > 0) {

         $chng_status = Notification::where('user_id', $id)->where('book_id', $book_id)->where('role', 1)->first();
         $chng_status->status = 2;
         $chng_status->save();
      }

      $notification = new notification();
      $notification->user_id = $id;
      $notification->title = $title;
      $notification->description = $data;
      $notification->book_id = $book_id;
      if ($agent_id > 0) {

         $notification->agent_id = $agent_id;
      }
      $notification->save();
      //dd($data);
      $user = User::find($id);
      $user_token = $user->device_token;

      $SERVER_API_KEY = 'AAAA63Z5CXw:APA91bHRwnOCsxCUvLca4DlnlD17Yv_tKXnLB1V0UAW3IOmqm8ose8XQKm0u3ZOAGeCxORGXt7awsw34qGGPgI4OvBafxc_YMn2uOitfCaI40XzqtTMxvyO74OMaj1QcfIT76pT5lbTG';

      $data = [
         "registration_ids" => [$user_token],
         "data" => [
            "title" => $title,
            "body" => $data,
         ]
      ];
      $dataString = json_encode($data);

      $headers = [
         'Authorization: key=' . $SERVER_API_KEY,
         'Content-Type: application/json',
      ];

      $ch = curl_init();

      curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
      curl_setopt($ch, CURLOPT_POST, true);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

      $response = curl_exec($ch);

      //dd($response);
   }

   public function UserNoficationComplete($id, $title, $data, $agent_id, $book_id)
   {

      $notification = new notification();
      $notification->user_id = $id;
      $notification->title = $title;
      $notification->description = $data;
      $notification->book_id = $book_id;
      if ($agent_id > 0) {

         $notification->agent_id = $agent_id;
      }
      $notification->status = 1;
      $notification->save();
      //dd($data);
      $user = User::find($id);
      $user_token = $user->device_token;

      $SERVER_API_KEY = 'AAAA63Z5CXw:APA91bHRwnOCsxCUvLca4DlnlD17Yv_tKXnLB1V0UAW3IOmqm8ose8XQKm0u3ZOAGeCxORGXt7awsw34qGGPgI4OvBafxc_YMn2uOitfCaI40XzqtTMxvyO74OMaj1QcfIT76pT5lbTG';

      $data = [
         "registration_ids" => [$user_token],
         "data" => [
            "title" => $title,
            "body" => $data,
         ]
      ];
      $dataString = json_encode($data);

      $headers = [
         'Authorization: key=' . $SERVER_API_KEY,
         'Content-Type: application/json',
      ];

      $ch = curl_init();

      curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
      curl_setopt($ch, CURLOPT_POST, true);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

      $response = curl_exec($ch);

      //dd($response);
   }

   public function AgentNofication($id, $title, $data, $agent_id, $book_id)
   {
      if ($book_id > 0) {

         $chng_status = Notification::where('user_id', $id)->where('book_id', $book_id)->first();
         $chng_status->status = 2;
         $chng_status->save();
      }

      $notification = new notification();
      $notification->user_id = $id;
      $notification->title = $title;
      $notification->description = $data;
      $notification->role = 1;
      if ($agent_id > 0) {

         $notification->agent_id = $agent_id;
      }
      $notification->book_id = $book_id;
      $notification->save();

      $chng_agent = Notification::where('user_id', $id)->where('book_id', $notification->book_id)->where('role', 1)->first();
      $chng_agent->status = 1;
      $chng_agent->save();


      //dd($data);
      $agent = Agent::find($agent_id);
      $user_token = $agent->device_token;

      $SERVER_API_KEY = 'AAAA63Z5CXw:APA91bHRwnOCsxCUvLca4DlnlD17Yv_tKXnLB1V0UAW3IOmqm8ose8XQKm0u3ZOAGeCxORGXt7awsw34qGGPgI4OvBafxc_YMn2uOitfCaI40XzqtTMxvyO74OMaj1QcfIT76pT5lbTG';

      $data = [
         "registration_ids" => [$user_token],
         "data" => [
            "title" => $title,
            "body" => $data,
         ]
      ];
      $dataString = json_encode($data);

      $headers = [
         'Authorization: key=' . $SERVER_API_KEY,
         'Content-Type: application/json',
      ];

      $ch = curl_init();

      curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
      curl_setopt($ch, CURLOPT_POST, true);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

      $response = curl_exec($ch);

      //dd($response);
   }
}
