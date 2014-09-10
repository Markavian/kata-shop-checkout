package bbc.coding.kata.core;

class TestRunner
{
	private var registeredTests:Array<Dynamic>;
	
	private var totalTestCount:Int = 0;
	private var totalSuccessCount:Int = 0;
	
	public function new()
	{
		// e.g. registerTestClass(CheckoutTest);
	}
	
	public function registerTestClass(testClass:Class<Dynamic>):Void
	{
		if (registeredTests == null)
		{
			registeredTests = new Array<Dynamic>();
		}
		
		registeredTests.push(testClass);
	}
	
	public function run():Void
	{
		beginTests();
		
		for (testClass in registeredTests)
		{
			runTestsOn(testClass);
		}
		
		testsComplete();
	}
	
	function beginTests():Void
	{
		trace("Tests initialised");
	}
	
	function runTestsOn(testClass:Class<Dynamic>):Void
	{
		var tests = Type.getInstanceFields(testClass);
		var instance:BaseTest = Type.createInstance(testClass, []);
		
		trace("");
		trace("Running tests on " + Type.getClassName(testClass));
		var classTestCount:Int = 0;
		var classSuccessCount:Int = 0;
		for (testName in tests)
		{
			if (testName.indexOf("test") != -1)
			{
				var testFunction = Reflect.field(instance, testName);
				classTestCount++;
				var success = runTest(testFunction, testName);
				if (success)
				{
					classSuccessCount++;
				}
			}
		}
		trace("Tests passed: " + classSuccessCount + "/" + classTestCount);
		
		totalTestCount += classTestCount;
		totalSuccessCount += classSuccessCount;
	}
	
	function runTest(test:Void->Void, testName:String="Unamed test"):Bool
	{
		try {
			test();
		}
		catch (exception:Dynamic)
		{
			trace("Test failed: " + testName + ", reason: " + exception);
			return false;
		}
		
		trace("Test passed: " + testName);
		
		return true;
	}
	
	function testsComplete():Void
	{
		trace("");
		trace("Total tests passed: " + totalSuccessCount + "/" + totalTestCount);
		if (totalSuccessCount == totalTestCount)
		{
			trace("SUCCESS");
		}
		else
		{
			trace("FAILIURE");
		}
	}
	
	
}