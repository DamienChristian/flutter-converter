class Data {
  Map<String, Map> mainData = {
    // 'Volume': {
    //   'Mililiters': 1,
    //   'Cubic centimeters': 2,
    //   'Litres': 3,
    //   'Cubic meters': 4,
    //   'Teaspoons (US)': 5,
    //   'Tablespoons (US)': 6,
    //   'Fluid ounces (US)': 7,
    //   'Cups (US)': 8,
    //   'Pints (US)': 9,
    //   'Quarts (US)': 10,
    //   'Gallons (US)': 11,
    //   'Cubic inches': 12,
    //   'Cubic feet': 13,
    //   'Cubic yards': 14,
    //   'Teaspoons (UK)': 15,
    //   'Tablespoons (UK)': 16,
    //   'Fluid ounces (UK)': 17,
    //   'Pints (UK)': 18,
    //   'Quarts (UK)': 19,
    //   'Gallons (UK)': 20,
    // },
    'Length': {
      'Nanometers': ['*1000000000', '/1000000000', 'nm'],
      'Microns': ['*1000000', '/1000000', 'mic'],
      'Millimeters': ['*1000', '/1000', 'mm'],
      'Centimeters': ['*100', '/100', 'cm'],
      'Meters': ['*1', '/1', 'm'],
      'Kilometers': ['/1000', '*1000', 'km'],
      'Inches': ['*39.3701', '/39.3701', 'in'],
      'Feet': ['*3.28084', '/3.28084', 'ft'],
      'Yards': ['/1.09361', '*1.09361', 'yd'],
      'Miles': ['/1609.34', '*1609.34', 'mil'],
      'Nautical miles': ['/1852', '*1852', 'nmil'],
    },
    'Currency': {
      'EUR': ['*1', '/1', 'EUR'],
      'INR': ['*89', '/89', 'INR']
    },
    // 'Weight and Mass': {
    //   'Carats': 1,
    //   'Milligrams': 2,
    //   'Centigrams': 3,
    //   'Decigrams': 4,
    //   'Grams': 5,
    //   'Decagrams': 6,
    //   'Hectograms': 7,
    //   'Kilograms': 8,
    //   'Metric tonnes': 9,
    //   'Ounces': 10,
    //   'Pounds': 11,
    //   'Stone': 12,
    //   'Short tons (US)': 13,
    //   'Short tons (UK)': 14,
    // },
    'Temperature': {
      'Celcius': ['*1', '/1', 'c'],
      'Fahrenheit': ['*1.8 +32', '-32 /1.8', 'f'],
      'Kelvin': ['+273.15', '-273.15', 'k'],
    },
    // 'Energy': {
    //   'Electron volts': 1,
    //   'Joules': 2,
    //   'Kilojoules': 3,
    //   'Thermal calories': 4,
    //   'Food calories': 5,
    //   'Foot-pounds': 6,
    //   'British thermal units': 7,
    // },
    // 'Area': {
    //   'Square millimeters': 1,
    //   'Square centimeters': 2,
    //   'Square meters': 3,
    //   'Hectares': 4,
    //   'Square kilometers': 5,
    //   'Square inches': 6,
    //   'Square feet': 7,
    //   'Square yards': 8,
    //   'Acres': 9,
    //   'Square miles': 10,
    // },
    // 'Speed': {
    //   'Centimeters per second': 1,
    //   'Meters per seconds': 2,
    //   'Kilometers per hour': 3,
    //   'Feet per second': 4,
    //   'Miles per hour': 5,
    //   'Knots': 6,
    //   'Mach': 7,
    // },
    'Time': {
      'Microseconds': ['*1000000', '/1000000', 'mics'],
      'Milliseconds': ['*1000', '/1000', 'ms'],
      'Seconds': ['*1', '/1', 's'],
      'Minutes': ['/60', '*60', 'min'],
      'Hours': ['/3600', '/3600', 'hr'],
      'Days': ['/3600 /24', '*3600 *24', 'ds'],
      'Weeks': ['/3600 /24 /7', '*3600 *24 *7', 'wk'],
      'Years': ['/3600 /24 /365', '*3600 *24 *365', 'yr'],
    },
    // 'Power': {
    //   'Watts': 1,
    //   'Kilowatts': 2,
    //   'Horsepower (US)': 3,
    //   'Foot-pounds/minute': 4,
    //   'BTUs/minute': 5,
    // },
    // 'Data': {
    //   'Bits': 1,
    //   'Bytes': 2,
    //   'Kilobits': 3,
    //   'Kibibits': 4,
    //   'Kilobytes': 5,
    //   'Kibibytes': 6,
    //   'Megabits': 7,
    //   'Mebibits': 8,
    //   'Megabytes': 9,
    //   'Mebibytes': 10,
    //   'Gigabits': 11,
    //   'Gibibits': 12,
    //   'Gigabytes': 13,
    //   'Gibibytes': 14,
    //   'Terabits': 15,
    //   'Tebibits': 16,
    //   'Terabytes': 17,
    //   'Tebibytes': 18,
    //   'Petabits': 19,
    //   'Pebibits': 20,
    //   'Petabytes': 21,
    //   'Pebibytes': 22,
    //   'Exabits': 23,
    //   'Exbibits': 24,
    //   'Exabytes': 25,
    //   'Exbibytes': 26,
    //   'Zetabits': 27,
    //   'Zebibits': 28,
    //   'Zetabytes': 29,
    //   'Zebibytes': 30,
    //   'Yottabits': 31,
    //   'Yobibits': 32,
    //   'Yottabytes': 33,
    //   'Yobibytes': 34,
    // },
    'Pressure': {
      'Atmospheres': ['*1', '/1', 'dg'],
      'Bars': ['*1.01325', '/1.01325', 'dg'],
      'Kilopascals': ['*101.325', '/101.325', 'dg'],
      'Millimeters of mercury': ['*760', '/760', 'dg'],
      'Pascals': ['*101325', '/101325', 'dg'],
      'Pounds per square inch': ['*14.6959', '/14.6959', 'dg'],
    },
    'Angle': {
      'Degrees': ['*1', '/1', 'dg'],
      'Radians': ['*0.0174533', '/0.0174533', 'rd'],
      'Gradians': ['*1.11111', '/1.11111', 'gr'],
    },
  };
}

Data dataObj = Data();
