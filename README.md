## Blog App

This is a Flutter project for a mobile blog application that utilizes Contentful as a headless Content Management System (CMS).

### Getting Started

This project requires the following:

* Flutter v3.x or later ([https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install))
* A Contentful account ([https://www.contentful.com/](https://www.contentful.com/))

**1. Clone or fork the repository.**

**2. Install dependencies.**

```bash
flutter pub get
```

**3. Configure Contentful.**

* Create a `.env` file in the project root directory.
* Add your Contentful credentials (Space ID and Access Token) to the `.env` file using `flutter_dotenv`. The `.env` file should contain the following environment variables:
    * `CONTENTFUL_SPACE_ID` - Your Contentful Space ID.
    * `CONTENTFUL_API_KEY` - Your Contentful Delivery API Access Token.

**Note:** You should never commit the `.env` file to version control.

**4. Run the app.**

```bash
flutter run
```

### Dependencies

This project uses the following packages:

* **contentful**: Interact with the Contentful API for fetching and managing blog posts.
* **contentful_rich_text**: Renders rich text content from Contentful within the app.
* **cupertino_icons**: Provides access to Cupertino icons for a consistent iOS look and feel.
* **equatable**: Simplifies value object comparison for state management.
* **flutter_dotenv**: Loads environment variables from a `.env` file.
* **infinite_scroll_pagination**: Enables infinite scrolling functionality for efficient post loading.
* **json_annotation**: Generates code for serialization and deserialization of JSON data.
* **moment_dart**: Provides functions for date and time manipulation.
* **share_plus**: Allows users to share blog posts on various platforms.
* **shared_preferences**: Stores user preferences locally on the device.

**Note:** These are just the base dependencies. Additional packages may be required depending on the specific features implemented in the app.