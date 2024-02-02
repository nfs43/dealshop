package com.shop.deal.fragments

import android.annotation.SuppressLint
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ProgressBar
import android.widget.TextView
import com.shop.deal.NavigationListener
import com.shop.deal.R

var btnConnectReader: Button? = null
var editPaymentDetailsButton: Button? = null
var currentReaderDetails: String? = null
var progressBar: ProgressBar? = null
var progressBarText: TextView? = null
var amount : Double = 0.0;
var amountInCents: Long = 0;

class ConnectReaderFragment : Fragment() {
    companion object {
        const val TAG = "com.shop.deal.fragments.ConnectReaderFragment"
        fun newInstance(amount: Double): ConnectReaderFragment {
            val fragment = ConnectReaderFragment()
            val args = Bundle()
            args.putDouble("amount", amount)
            fragment.arguments = args
            return fragment
        }
    }



    //    @SuppressLint("MissingInflatedId")
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_connect_reader, container, false)

        amount = arguments?.getDouble("amount", 0.0) ?: 0.0
        amountInCents=(amount * 100).toLong()

        //btnConnectReader = view?.findViewById(R.id.connect_reader_button) as Button
        //editPaymentDetailsButton = view?.findViewById(R.id.edit_payment_details_button) as Button
        progressBar = view?.findViewById(R.id.progressBar) as ProgressBar
        progressBarText = view?.findViewById(R.id.progressBarText) as TextView


        // If the user is getting to this view after having already connected a reader
        if (currentReaderDetails !== null) {
            val readerId = view?.findViewById(R.id.reader_id) as TextView
            readerId.text = currentReaderDetails

            //btnConnectReader?.visibility = View.INVISIBLE
            //editPaymentDetailsButton?.visibility = View.VISIBLE

            (activity as? NavigationListener)?.onCollectPayment(amountInCents, "usd",
                skipTipping = true,
                extendedAuth = false,
                incrementalAuth = false
            )
        } else{
            progressBarText!!.text = "Connecting..."
            //(activity as? NavigationListener)?.onConnectReader()
        }

   /*     btnConnectReader!!.setOnClickListener {
            btnConnectReader!!.text = "Connecting..."
            (activity as? NavigationListener)?.onConnectReader()
            //(activity as? NavigationListener)?.onSendResponsetoFlutter()

        }*/

       /* editPaymentDetailsButton!!.setOnClickListener {
            (activity as? NavigationListener)?.onNavigateToPaymentDetails()
        }*/

        return view
    }

    fun updateReaderId(location: String, reader_id: String) {
        val readerId = view?.findViewById(R.id.reader_id) as TextView
        readerId.text = "$location : $reader_id"

        //btnConnectReader?.visibility = View.INVISIBLE
        //editPaymentDetailsButton?.visibility = View.VISIBLE

        currentReaderDetails = readerId.text as String


        (activity as? NavigationListener)?.onCollectPayment(
            amountInCents, "usd",
            skipTipping = true,
            extendedAuth = false,
            incrementalAuth = false
        )
    }
}