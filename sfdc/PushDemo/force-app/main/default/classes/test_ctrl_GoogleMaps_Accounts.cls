public class test_ctrl_GoogleMaps_Accounts {

	/* Constructor */
	public test_ctrl_GoogleMaps_Accounts() {
		updateAccounts();
	}

	/* Accounts */
	public List<Account> accounts = new List<Account>();
	
	public List<Account> getAccounts() {
		return accounts;
	}
	
	public void updateAccounts() {
		accounts =
			[SELECT Id, Name, BillingStreet, BillingCity,
				BillingState, BillingPostalCode, BillingCountry
			 FROM Account
			 WHERE BillingStreet <> ''
			 LIMIT 100];
	}
	
	/* Account Variables */
	public String account1Id {get;set;}
	public Account account1 {get;set;}
	public String account1Address {get;set;}
	
	public String account2Id {get;set;}
	public Account account2 {get;set;}
	public String account2Address {get;set;}
	
	public void updateAccountVariables() {
		for (Account a : accounts) {
			if (a.Id == account1Id) {
				account1 = a;
			}
			if (a.Id == account2Id) {
				account2 = a;
			}
		}
	}
	
	public void updateAccountAddresses() {
		account1Address = EncodingUtil.urlEncode(
			+ account1.BillingStreet + ' '
			+ account1.BillingCity + ', '
			+ account1.BillingState + ' '
			+ account1.BillingPostalCode + ' '
			+ account1.BillingCountry,
			'UTF-8');
			
		account2Address = EncodingUtil.urlEncode( 
			+ account2.BillingStreet + ' '
			+ account2.BillingCity + ', '
			+ account2.BillingState + ' '
			+ account2.BillingPostalCode + ' '
			+ account2.BillingCountry,
			'UTF-8');
	}
	
	/* Account Options */
	public List<selectOption> getAccountOptions() {
		
		List<selectOption> options = new List<selectOption>();
		
		for (Account a : accounts) {
			options.add(new selectOption(a.Id, a.Name));
		}
		
		return options;
	}
	
	/* Button Action */
	public void btnCalculateDistance_Click() {
		
		updateAccountVariables();
		updateAccountAddresses();
		
		googleMaps gm = new googleMaps(
			account1Address,
			account2Address);

		distance = gm.distance;
		duration = gm.duration;
		travelTime = gm.travelTime;
	}
	
	/* Results */
	public Decimal distance {get;set;}
	public String duration {get;set;}
	public Integer travelTime {get;set;}

}