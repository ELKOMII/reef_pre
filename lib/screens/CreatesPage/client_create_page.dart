import 'package:erp12k/blocs/main_bloc/main_cubit.dart';
import 'package:erp12k/blocs/main_bloc/main_states.dart';
import 'package:erp12k/src/app_color.dart';
import 'package:erp12k/src/app_location.dart';
import 'package:erp12k/src/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class ClientCreatePage extends StatefulWidget {
  const ClientCreatePage({super.key});

  @override
  State<ClientCreatePage> createState() => _ClientCreatePageState();
}

class _ClientCreatePageState extends State<ClientCreatePage> {
  final key = GlobalKey<FormState>();
  String city = '';
  String address = '';
String government='';
String placeMark = '';
  @override
  void initState() {
 
getAddress();
    super.initState();
  }

  getAddress()async{
   LatLng? position = await LocationService().currentLocation();
      List<Placemark> placemarks = await 
 placemarkFromCoordinates(
    position!.latitude,
    position.longitude,
  );

  Placemark place = placemarks[0]; 

   address = place.street ??'غير محدد';
   city = place.locality ??'غير محدد';
   government = place.administrativeArea ?? 'غير محدد';
   placeMark = place.subAdministrativeArea ?? 'غير محدد';
   setState(() {
     
   });
}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              title: const Text('انشاء عميل'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: key,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),Text('$city'),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: cubit.namecont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ*';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('الاسم'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: cubit.companyNamecont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ*';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('الشركة'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: cubit.phone1cont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ*';
                          } else if (value.length != 10) {
                            return 'الرقم خطأ*';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixText: '+20',
                            label: const Text('رقم هاتف 1'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: cubit.phone2cont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ*';
                          } else if (value.length != 10) {
                            return 'الرقم خطأ*';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixText: '+20',
                            label: const Text('رقم هاتف 2'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: cubit.emailcont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ*';
                          } else if (!value.contains('@') ||
                              value.length < 10 ||
                              !value.contains('.')) {
                            return 'البريد خطأ*';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            label: const Text('الايميل'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8),
                    //   child: TextFormField(
                    //     controller: cubit.addresscont,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'الحقل فارغ*';
                    //       }
                    //       return null;
                    //     },
                    //     decoration: InputDecoration(
                    //         label: const Text('العنوان'),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10))),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8),
                    //   child: TextFormField(
                    //     controller: cubit.areacont,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'الحقل فارغ*';
                    //       }
                    //       return null;
                    //     },
                    //     decoration: InputDecoration(
                    //         label: const Text('المنطقة'),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10))),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8),
                    //   child: TextFormField(
                    //     controller: cubit.area2cont,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'الحقل فارغ*';
                    //       }
                    //       return null;
                    //     },
                    //     decoration: InputDecoration(
                    //         label: const Text('المحافظة'),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10))),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8),
                    //   child: TextFormField(
                    //     controller: cubit.area3cont,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'الحقل فارغ*';
                    //       }
                    //       return null;
                    //     },
                    //     decoration: InputDecoration(
                    //         label: const Text('علامة مميزة'),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10))),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.green)),
                            onPressed: () {
                            
                              if (key.currentState!.validate()) {
                             
                                cubit.createClient( position:LocationService.currentPosition!,city: city,address: address,government:government,placeMark: placeMark );
                                AppNavigation.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('تم انشاء عميل'),
                                  backgroundColor: Colors.green,
                                ));
                              }
                            },
                            child: const Text(
                              'انشاء',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
