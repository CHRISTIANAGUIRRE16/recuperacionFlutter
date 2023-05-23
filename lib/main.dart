import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _termsChecked = false;
  String _selectedCivilStatus = '';

  final _formKey = GlobalKey<FormState>();

  void _showTermsAndConditionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Términos y Condiciones'),
          content: Text(
              'Aquí se muestran los términos y condiciones de la tienda de mascotas.'),
          actions: [
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen
                  Image.network(
                    'https://picsum.photos/id/237/200/300',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 16.0),

                  // Campo de texto Nombre
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  // Campo de texto Correo Electrónico
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu correo electrónico';
                      }
                      // Puedes agregar validaciones adicionales para el correo electrónico aquí
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  // Estado Civil
                  Text(
                    'Estado Civil',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  RadioListTile(
                    title: Text('Soltero/a'),
                    value: 'Soltero/a',
                    groupValue: _selectedCivilStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedCivilStatus = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Casado/a'),
                    value: 'Casado/a',
                    groupValue: _selectedCivilStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedCivilStatus = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),

                  // Acepto los términos y condiciones
                  Row(
                    children: [
                      Checkbox(
                        value: _termsChecked,
                        onChanged: (value) {
                          setState(() {
                            _termsChecked = value!;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: _showTermsAndConditionsDialog,
                        child: Text(
                          'Acepto los términos y condiciones',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),

                  // Botón Registrarse
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Aquí puedes realizar acciones adicionales al presionar el botón
                        if (!_termsChecked) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Términos y Condiciones'),
                                content: Text(
                                    'Debes aceptar los términos y condiciones para continuar.'),
                                actions: [
                                  TextButton(
                                    child: Text('Aceptar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Registro exitoso, puedes realizar las acciones necesarias
                        }
                      }
                    },
                    child: Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterScreen(),
  ));
}












































/*import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _termsChecked = false;
  String _selectedCivilStatus = '';

  final _formKey = GlobalKey<FormState>();

  void _showTermsAndConditionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Términos y Condiciones'),
          content: Text(
              'Aquí se muestran los términos y condiciones de la tienda de mascotas.'),
          actions: [
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  // Puedes agregar validaciones adicionales para el correo electrónico aquí
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Estado Civil',
                style: TextStyle(fontSize: 16.0),
              ),
              RadioListTile(
                title: Text('Soltero/a'),
                value: 'Soltero/a',
                groupValue: _selectedCivilStatus,
                onChanged: (value) {
                  setState(() {
                    _selectedCivilStatus = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text('Casado/a'),
                value: 'Casado/a',
                groupValue: _selectedCivilStatus,
                onChanged: (value) {
                  setState(() {
                    _selectedCivilStatus = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _termsChecked,
                    onChanged: (value) {
                      setState(() {
                        _termsChecked = value!;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: _showTermsAndConditionsDialog,
                    child: Text(
                      'Acepto los términos y condiciones',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí puedes realizar acciones adicionales al presionar el botón
                    if (!_termsChecked) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Términos y Condiciones'),
                            content: Text(
                                'Debes aceptar los términos y condiciones para continuar.'),
                            actions: [
                              TextButton(
                                child: Text('Aceptar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
// Registro exitoso, puedes realizar las acciones necesarias
                    }
                  }
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterScreen(),
  ));
}
*/




















/*import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _termsChecked = false;
  String _selectedCivilStatus = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  // Puedes agregar validaciones adicionales para el correo electrónico aquí
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Estado Civil',
                style: TextStyle(fontSize: 16.0),
              ),
              RadioListTile(
                title: Text('Soltero/a'),
                value: 'Soltero/a',
                groupValue: _selectedCivilStatus,
                onChanged: (value) {
                  setState(() {
                    _selectedCivilStatus = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text('Casado/a'),
                value: 'Casado/a',
                groupValue: _selectedCivilStatus,
                onChanged: (value) {
                  setState(() {
                    _selectedCivilStatus = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _termsChecked,
                    onChanged: (value) {
                      setState(() {
                        _termsChecked = value!;
                      });
                    },
                  ),
                  Text('Acepto los términos y condiciones'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí puedes realizar acciones adicionales al presionar el botón
                    if (!_termsChecked) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Términos y Condiciones'),
                            content: Text('Debes aceptar los términos y condiciones para continuar.'),
                            actions: [
                              TextButton(
                                child: Text('Aceptar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Registro exitoso, puedes realizar las acciones necesarias
                    }
                  }
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterScreen(),
  ));
}
*/