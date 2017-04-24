import ceylon.test {

	assertEquals,
	test,
	fail
}
import stringcalculator {

	add
}

test void given_an_empty_string_should_return_0() {
	assertEquals(add(""), 0);
}


test void given_a_single_number_should_return_said_number() {
	assertEquals(add("4"), 4);
}

test void given_a_comma_seperated_list_of_numbers_should_return_the_sum_of_numbers_less_than_1000() {
	assertEquals(add("1,2,3,34566"), 6);
}

test void given_a_comma_or_newline_seperated_list_of_numbers_should_return_the_sum_of_numbers_less_than_1000() {
	assertEquals(add("1,2\n3,3445"), 6);
}


test void given_an_arbitrary_delimeter_should_return_the_sum_of_numbers_less_than_1000() {
	assertEquals(add("//;\n1;2;3"), 6);
}

test void given_any_negative_numbers_should_raise_an_exception() {
	try{
		add("1,-2,3,-4");
		fail();
	}catch (Exception e){
		assertEquals(e.message, "Negatives not allowed { -2, -4 }");
	}
}

test void given_a_multi_character_delimeter_should_return_the_sum_of_numbers_less_than_1000() {
	assertEquals(add("//[***]\n1***2***3"), 6);
}

test void given_multiple_single_character_delimeter_should_return_the_sum_of_numbers_less_than_1000() {
	assertEquals(add("//[*][=]\n1*2=3"), 6);
}

test void given_multiple_multi_character_delimeter_should_return_the_sum() {
	assertEquals(add("//[***][===]\n1***2===3"), 6);
}

