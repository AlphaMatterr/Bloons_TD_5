#define cre @"Hacked By αlphaMΛTTΞR"

void (*addMonkeyMoneyOld)(void *self, unsigned int money);
void addMonkeyMoney(void *self, unsigned int money) {
	addMonkeyMoneyOld(self, 250000);
}

void (*receiveTokensOld)(void *self, unsigned int tokens);
void receiveTokens(void *self, unsigned int tokens) {
	receiveTokensOld(self, 200000);
}

void (*removeMoneyOld)(void *self, double money);
void removeMoney(void *self, double money) {
	return removeMoneyOld(self, money);
}

%hook AppDelegate

- (char)application:(id)fp8 didFinishLaunchingWithOptions:(id)fp12 {
	
	// Apply Hooks
	
	MSHookFunction(((void*)MSFindSymbol(NULL, "__ZN16CPlayerProfileV118ReceiveMonkeyMoneyEj")),(void*)addMonkeyMoney,(void**)&addMonkeyMoneyOld);
	MSHookFunction(((void*)MSFindSymbol(NULL, "__ZN16CPlayerProfileV113ReceiveTokensEj")),(void*)receiveTokens,(void**)&receiveTokensOld);
	MSHookFunction(MSFindSymbol(NULL, "__ZN12CGameProfile11RemoveMoneyEd"),(void*)removeMoney, (void**)&removeMoneyOld);
	
	UIAlertView *popup = [[UIAlertView alloc] initWithTitle:cre message:@"" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil];
	[popup show];
	[popup release];
	
	return %orig;
}

%end