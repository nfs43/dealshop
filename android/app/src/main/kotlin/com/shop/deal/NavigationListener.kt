package com.shop.deal

import com.stripe.stripeterminal.external.models.PaymentIntentStatus

/**
 * An `Activity` that should be notified when various navigation activities have been triggered
 */
interface NavigationListener {
    /**
     * Notify the `Activity` that the user has requested to connect to the reader.
     */
    fun onConnectReader()

    fun onCollectPayment(
        amount: Long,
        currency: String,
        skipTipping: Boolean,
        extendedAuth: Boolean,
        incrementalAuth: Boolean
    )

    fun onNavigateToPaymentDetails()

    fun onCancel()

    fun onSendResponsetoFlutter(status: PaymentIntentStatus?)

    fun onSendErrortoFlutter(error: String?)

}
