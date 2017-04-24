import ceylon.regex {

	regex,
	quote
}


shared Integer add (String input){
	
	value numbers = parse(input);
	
	if (numbers.any((Integer element) => element < 0)){
		throw Exception("Negatives not allowed " + numbers.filter((Integer element) => element < 0).string);
	}
	
	value sum = addNumbers(numbers.filter((Integer element) => element < 1000));
	
	return sum;
}


String[] tokens(String input) {
	if (input.startsWith("//[")){
		value indexOfNewline = input.indexOf("\n");
		value delimeters = regex(quote("][")).split(input.substring(3, indexOfNewline - 1)).map((String element) => quote(element));
		return regex("|".join(delimeters)).split(input.substring(indexOfNewline + 1));
	} else if (input.startsWith("//")){
		return regex(input.substring(2, 3)).split(input.substring(4));
	} else {
		return regex(",|\n").split(input);
	}
}

{Integer*} parse(String input) {
	return tokens (input).map((String element) => Integer.parse(element)).narrow<Integer>();
}

Integer addNumbers({Integer*} numbers) {
	return numbers.fold(0)((Integer a, Integer b) => a + b);
}