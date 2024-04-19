let currentUser = '';

const genreCheckboxes = {};
const ageRatingCheckboxes = {};

fetch('/api/games')
  .then(response => response.json())
  .then(data => {
    const gameData = data;
    populateGameCatalog(gameData);
    populateFilterOptions(gameData);
  })
  .catch(error => {
    console.error('Error fetching game data:', error);
    alert('Error fetching game data. Please try again later.');
  });

function populateFilterOptions(gameData) {
  const genreFilter = document.getElementById('genre-filter');
  const ageRatingFilter = document.getElementById('age-rating-filter');

  // Populate genre checkboxes
  gameData.forEach(game => {
    game.genres.forEach(genre => {
      if (!genreCheckboxes[genre]) {
        const genreCheckbox = document.createElement('input');
        genreCheckbox.type = 'checkbox';
        genreCheckbox.id = `genre-${genre}`;
        genreCheckbox.name = 'genre';
        genreCheckbox.value = genre;
        genreCheckboxes[genre] = genreCheckbox;

        const genreLabel = document.createElement('label');
        genreLabel.htmlFor = `genre-${genre}`;
        genreLabel.textContent = genre;

        genreFilter.appendChild(genreCheckbox);
        genreFilter.appendChild(genreLabel);
        genreFilter.appendChild(document.createElement('br'));
      }
    });
  });

  // Populate age rating checkboxes
  const ageRatings = ['E', 'E10+', 'T', 'M'];
  ageRatings.forEach(rating => {
    const ratingCheckbox = document.createElement('input');
    ratingCheckbox.type = 'checkbox';
    ratingCheckbox.id = `rating-${rating}`;
    ratingCheckbox.name = 'age-rating';
    ratingCheckbox.value = rating;
    ageRatingCheckboxes[rating] = ratingCheckbox;

    const ratingLabel = document.createElement('label');
    ratingLabel.htmlFor = `rating-${rating}`;
    ratingLabel.textContent = rating;

    ageRatingFilter.appendChild(ratingCheckbox);
    ageRatingFilter.appendChild(ratingLabel);
    ageRatingFilter.appendChild(document.createElement('br'));
  });
}

function populateGameCatalog(gameData) {
  const gameCatalogGrid = document.querySelector('#game-catalog .game-grid');
  const searchInput = document.getElementById('game-search');
  const searchButton = document.getElementById('search-btn');
  const genreFilter = document.querySelectorAll('#genre-filter input[name="genre"]');
  const ageRatingFilter = document.querySelectorAll('#age-rating-filter input[name="age-rating"]');

  searchInput.addEventListener('input', () => {
    filterAndDisplayGames(gameData);
  });

  searchButton.addEventListener('click', () => {
    filterAndDisplayGames(gameData);
  });

  genreFilter.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
      filterAndDisplayGames(gameData);
    });
  });

  ageRatingFilter.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
      filterAndDisplayGames(gameData);
    });
  });

  filterAndDisplayGames(gameData);
}

function filterAndDisplayGames(gameData) {
  const gameCatalogGrid = document.querySelector('#game-catalog .game-grid');
  const searchTerm = document.getElementById('game-search').value.toLowerCase();
  const genreFilter = document.querySelectorAll('#genre-filter input[name="genre"]:checked');
  const ageRatingFilter = document.querySelectorAll('#age-rating-filter input[name="age-rating"]:checked');

  let filteredGames = gameData.filter(game =>
    game.title.toLowerCase().includes(searchTerm)
  );

  if (genreFilter.length > 0) {
    filteredGames = filteredGames.filter(game =>
      game.genres.some(genre => {
        return Array.from(genreFilter).some(checkbox => checkbox.value === genre);
      })
    );
  }

  if (ageRatingFilter.length > 0) {
    filteredGames = filteredGames.filter(game =>
      Array.from(ageRatingFilter).some(checkbox => checkbox.value === game.ageRating)
    );
  }

  gameCatalogGrid.innerHTML = '';
  filteredGames.sort((a, b) => a.title.localeCompare(b.title)).forEach(game => {
    const gameCard = createGameCard(game);
    gameCatalogGrid.appendChild(gameCard);
  });
}

function createGameCard(game) {
  const gameCard = document.createElement('div');
  gameCard.classList.add('game-card');

  const gameContent = document.createElement('div');
  gameContent.classList.add('game-card-content');

  const gameTitle = document.createElement('h3');
  gameTitle.textContent = game.title;

  const gamePublisher = document.createElement('p');
  gamePublisher.textContent = game.publisher;

  const gameRating = document.createElement('p');
  gameRating.textContent = `Rating: ${game.rating}`;

  const addButton = document.createElement('button');
  addButton.textContent = '+';
  addButton.addEventListener('click', () => {
    addGameToWishlist(game);
  });

  gameContent.appendChild(gameTitle);
  gameContent.appendChild(gamePublisher);
  gameContent.appendChild(gameRating);
  gameContent.appendChild(addButton);

  gameCard.appendChild(gameContent);

  return gameCard;
}


const catalogTab = document.getElementById('catalog-tab');
const wishlistTab = document.getElementById('library-tab');
const userInfoTab = document.getElementById('user-info-tab');
const accountTab = document.getElementById('account-tab');

const gameCatalog = document.getElementById('game-catalog');
const userWishlist1 = document.getElementById('user-library');
const userInfo = document.getElementById('user-info');
const accountSection = document.getElementById('account');

catalogTab.addEventListener('click', () => {
  updateActiveTab(catalogTab);
  gameCatalog.style.display = 'block';
  userWishlist.style.display = 'none';
  userInfo.style.display = 'none';
  accountSection.style.display = 'none';
});

wishlistTab.addEventListener('click', () => {
  updateActiveTab(wishlistTab);
  gameCatalog.style.display = 'none';
  userWishlist.style.display = 'block';
  userInfo.style.display = 'none';
  accountSection.style.display = 'none';
  populateUserWishlist();
});

userInfoTab.addEventListener('click', () => {
  updateActiveTab(userInfoTab);
  gameCatalog.style.display = 'none';
  userWishlist.style.display = 'none';
  userInfo.style.display = 'block';
  accountSection.style.display = 'none';
  updateUserInfo();
});

accountTab.addEventListener('click', () => {
  updateActiveTab(accountTab);
  gameCatalog.style.display = 'none';
  userWishlist.style.display = 'none';
  userInfo.style.display = 'none';
  accountSection.style.display = 'block';
});

function updateActiveTab(activeTab) {
  const tabs = [catalogTab, wishlistTab, userInfoTab, accountTab];
  tabs.forEach(tab => {
    tab.classList.remove('active-tab');
  });
  activeTab.classList.add('active-tab');
}

let userWishlist = [];
const userWishlistGrid = document.querySelector('#user-library .game-grid');

function addGameToWishlist(game) {
  fetch('/api/wishlist', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      userId: currentUser,
      gameId: game.id
    })
  })
  .then(response => response.json())
  .then(data => {
    console.log(data.message);
    // Update the UI or perform other actions
  })
  .catch(error => {
    console.error('Error adding game to wishlist:', error);
    alert('Error adding game to wishlist. Please try again later.');
  });
}

function createWishlistGameCard(game) {
  const wishlistGameCard = document.createElement('div');
  wishlistGameCard.classList.add('library-game-card');

  const gameTitle = document.createElement('h3');
  gameTitle.textContent = game.title;

  const gamePublisher = document.createElement('p');
  gamePublisher.textContent = game.publisher;

  const gameRating = document.createElement('p');
  gameRating.textContent = `Rating: ${game.rating}`;

  const removeButton = document.createElement('button');
  removeButton.textContent = '-';
  removeButton.addEventListener('click', () => {
    removeGameFromWishlist(wishlistGameCard, game);
  });

  wishlistGameCard.appendChild(gameTitle);
  wishlistGameCard.appendChild(gamePublisher);
  wishlistGameCard.appendChild(gameRating);
  wishlistGameCard.appendChild(removeButton);

  return wishlistGameCard;
}

function removeGameFromWishlist(gameCard, game) {
  userWishlistGrid.removeChild(gameCard);
  userWishlist = userWishlist.filter(g => g.title !== game.title);
}

const userInfoForm = document.getElementById('user-info-form');
const firstNameInput = document.getElementById('first-name');
const lastNameInput = document.getElementById('last-name');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirm-password');
const usernameInput = document.getElementById('username');

const deleteAccountButton = document.getElementById('delete-account');

deleteAccountButton.addEventListener('click', () => {
  if (currentUser) {
    if (confirm('Are you sure you want to delete your account?')) {
      fetch(`/api/users/${currentUser}`, {
        method: 'DELETE'
      })
        .then(response => {
          if (response.ok) {
            alert('Your account has been deleted.');
            // Redirect the user or perform any other necessary actions
          } else {
            alert('Error deleting your account. Please try again later.');
          }
        })
        .catch(error => {
          console.error('Error deleting account:', error);
          alert('Error deleting your account. Please try again later.');
        });
    }
  } else {
    alert('You must be logged in to delete your account.');
  }
});

userInfoForm.addEventListener('submit', (event) => {
  event.preventDefault();
  const newFirstName = firstNameInput.value;
  const newLastName = lastNameInput.value;
  const newEmail = emailInput.value;
  const newPassword = passwordInput.value;
  const newConfirmPassword = confirmPasswordInput.value;
  const newUsername = usernameInput.value;

  if (newPassword === newConfirmPassword) {
    fetch(`/api/users/${newUsername}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        firstName: newFirstName,
        lastName: newLastName,
        email: newEmail,
        password: newPassword,
        username: newUsername
      })
    })
    .then(response => response.json())
    .then(updatedUserData => {
      console.log('Updated user data:', updatedUserData);
      // Update the current user information
      currentUser = updatedUserData.username;
    })
    .catch(error => {
      console.error('Error updating user data:', error);
      alert('Error updating your information. Please try again later.');
    });
  } else {
    alert('Password and Confirm Password do not match.');
  }
});

function updateUserInfo() {
  if (currentUser) {
    fetch(`/api/users/${currentUser}`)
      .then(response => response.json())
      .then(userData => {
        const { firstName, lastName, email, password, username } = userData;
        firstNameInput.value = firstName;
        lastNameInput.value = lastName;
        emailInput.value = email;
        passwordInput.value = password;
        confirmPasswordInput.value = password;
        usernameInput.value = username;
      })
      .catch(error => {
        console.error('Error fetching user data:', error);
        alert('Error fetching user data. Please try again later.');
      });
  } else {
    firstNameInput.value = '';
    lastNameInput.value = '';
    emailInput.value = '';
    passwordInput.value = '';
    confirmPasswordInput.value = '';
    usernameInput.value = '';
  }
}

function populateUserWishlist() {
  fetch(`/api/wishlist/${currentUser}`)
    .then(response => response.json())
    .then(data => {
      userWishlist = data;
      userWishlistGrid.innerHTML = '';
      userWishlist.forEach(game => {
        const wishlistGameCard = createWishlistGameCard(game);
        userWishlistGrid.appendChild(wishlistGameCard);
      });
    })
    .catch(error => {
      console.error('Error fetching user wishlist:', error);
      alert('Error fetching user wishlist. Please try again later.');
    });
}
  // Sign-in and sign-up functionality
const loginTab = document.getElementById('login-tab');
const createAccountTab = document.getElementById('create-account-tab');
const loginSection = document.getElementById('login-section');
const createAccountSection = document.getElementById('create-account-section');
const loginForm = document.getElementById('login-form');
const createAccountForm = document.getElementById('create-account-form');

function showLoginTab() {
  loginTab.classList.add('active-sub-tab');
  createAccountTab.classList.remove('active-sub-tab');
  loginSection.style.display = 'block';
  createAccountSection.style.display = 'none';
}

function showCreateAccountTab() {
  createAccountTab.classList.add('active-sub-tab');
  loginTab.classList.remove('active-sub-tab');
  createAccountSection.style.display = 'block';
  loginSection.style.display = 'none';
}

loginTab.addEventListener('click', showLoginTab);
createAccountTab.addEventListener('click', showCreateAccountTab);

createAccountForm.addEventListener('submit', (event) => {
  event.preventDefault();
  const firstName = document.getElementById('first-name').value;
  const lastName = document.getElementById('last-name').value;
  const email = document.getElementById('email').value;
  const newUsername = document.getElementById('new-username').value;
  const newPassword = document.getElementById('new-password').value;
  const confirmPassword = document.getElementById('confirm-password').value;
  const age = document.getElementById('age').value;

  // Check if password and confirm password match
  if (newPassword !== confirmPassword) {
    alert('Password and Confirm Password do not match.');
    return;
  }

  fetch('/api/users', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      firstName,
      lastName,
      email,
      username: newUsername,
      password: newPassword,
      age: parseInt(age)
    })
  })
  .then(response => {
    if (response.ok) {
      return response.json();
    } else {
      return response.json().then(data => {
        throw new Error(data.error);
      });
    }
  })
  .then(data => {
    console.log('New user created:', data);
    // Perform any additional actions, such as logging in the user
  })
  .catch(error => {
    alert(`Error creating account: ${error.message}`);
  });
});

loginForm.addEventListener('submit', (event) => {
  event.preventDefault();
  const username = document.getElementById('login-username').value;
  const password = document.getElementById('login-password').value;

  fetch(`/api/users/${username}`)
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        return response.json().then(data => {
          throw new Error(data.error);
        });
      }
    })
    .then(userData => {
      if (userData.password === password) {
        currentUser = userData.username;
        console.log('Logged in as:', currentUser);
        // Perform any additional actions, such as updating the UI
      } else {
        throw new Error('Incorrect username or password');
      }
    })
    .catch(error => {
      alert(`Error logging in: ${error.message}`);
    });
});