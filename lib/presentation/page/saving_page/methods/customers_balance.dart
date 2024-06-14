import 'package:flutter/material.dart';
import 'package:waste_app/domain/customers.dart';

class CustomersBalance extends StatefulWidget {
  const CustomersBalance({super.key});

  @override
  _CustomersBalanceState createState() => _CustomersBalanceState();
}

class _CustomersBalanceState extends State<CustomersBalance> {
  List<dynamic> customers = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchAndSortCustomers();
  }

  Future<void> _fetchAndSortCustomers() async {
    try {
      List<dynamic> fetchedCustomers = await Customer().getBalance();
      fetchedCustomers.sort((a, b) => a['name'].compareTo(b['name']));
      setState(() {
        customers = fetchedCustomers;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saldo Nasabah')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text('Error: $errorMessage'))
              : customers.isEmpty
                  ? Center(child: Text('No nasabah found'))
                  : ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        final nasabah = customers[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Color(0xffF6F4BD),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    nasabah['name'],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Rp.${nasabah['totalBalance']}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}