$(document).ready(function() {
  var stripe = Stripe("pk_test_bOsnddxmqMV6MVnGb5SBSxNb00wGKKzagq");
  var $checkoutButton = $("#checkout-btn");
  var $token = $('meta[name="csrf-token"]').prop("content");

  $checkoutButton.on("click", function() {
    event.preventDefault();
    event.stopPropagation();

    $.ajax({
      url: "/charges",
      type: "post",
      headers: {"X-CSRF-TOKEN": $token},
      dataType: "json",
      success: function(response) {
        stripe.redirectToCheckout({
          sessionId: response.charge.id
        });
      },
      error: function(response) {
        console.log(response);
      }
    });
  });
});