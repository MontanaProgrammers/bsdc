const stripe = Stripe('pk_TiCZw9PFRtpKThQgMZGOUygdSFQt8');
const elements = stripe.elements();

// Create an instance of the card Element
const card = elements.create('card');

// Add an instance of the card Element into the `card-element`
card.mount('#card-element');

// Create a token or display an error when the form is submitted.
const form = document.getElementById('source-form');
form.addEventListener('submit', event => {
  event.preventDefault();

  stripe.createToken(card).then(function(result) {
    if (result.error) {
      // Inform the customer that there was an error
      var errorElement = document.getElementById('card-errors');
      errorElement.textContent = result.error.message;
    } else {
      // Send the token to your server
      stripeTokenHandler(result.token);
    }
  });
});

const stripeTokenHandler = (token) => {
  // Insert the token ID into the form so it gets submitted to the server
  const form = document.getElementById('source-form');
  const hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'token');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  // Submit the form
  form.submit();
}