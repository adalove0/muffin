void auto_log_info(string s, string color);
void auto_log_info(string s);

void main() 
{
	if (item_amount($item[earthenware muffin tin]) > 0 ||
	    (!get_property("_muffinOrderedToday").to_boolean() && 
			$items[blueberry muffin, bran muffin, chocolate chip muffin, earthenware muffin tin] contains get_property("muffinOnOrder").to_item())) {
		auto_log_info("Going to the breakfast counter to grab/order a breakfast muffin.");
		visit_url("place.php?whichplace=monorail&action=monorail_downtown");
		run_choice(7); // Visit the Breakfast Counter
		if (get_property("muffinOnOrder") != "" && item_amount(get_property("muffinOnOrder").to_item()) > 0)
		{
			// workaround mafia not clearing the property occasionally
			// see https://kolmafia.us/threads/ordering-a-muffin-at-the-breakfast-counter-doesnt-always-set-the-muffinonorder-property.26072/
			set_property("muffinOnOrder", "");
		}
		if (!get_property("_muffinOrderedToday").to_boolean() && item_amount($item[earthenware muffin tin]) > 0) {
			auto_log_info("Ordering a bran muffin for tomorrow to keep you regular.");
			run_choice(2); // Order a bran muffin
		}
		run_choice(1); // Back to the Platform!
		run_choice(8); // Nevermind
	}
} 
