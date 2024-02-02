package com.shop.deal

import android.content.Intent
import android.os.Bundle
import com.stripe.stripeterminal.external.callable.*
import com.stripe.stripeterminal.external.models.*
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    var methodChannel: MethodChannel? = null
    var mresult: MethodChannel.Result? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel!!.setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            if (call.method == "StartSecondActivity") {
                val amount = call.argument<Double>("amount")!!
                val bundle = Bundle()
                bundle.putDouble("amount", amount)
                //result.success("ActivityStarted");
                mresult = result
                val intent = Intent(
                    this@MainActivity,
                    MainActivity2::class.java
                )
                intent.putExtras(bundle)

                startActivityForResult(intent, REQUEST_CODE)
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == RESULT_OK &&data!=null) {
            val resultFromCardScanner = data?.getStringExtra("resultFromCardScanner")
            mresult!!.success(resultFromCardScanner)
            //methodChannel!!.setMethodCallHandler(null)
        } else {
            // Handle the case where CardScannerActivity did not complete successfully
        }
    }



    companion object {
        private const val CHANNEL = "com.startActivity/testChannel"
        private const val REQUEST_CODE = 10 // You can use any integer value you like
    }
}