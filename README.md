# iOS Task 📱

Welcome to the iOS task! 👋 We'd now like to see an example of how you build apps.

## What we'd like you to do 🛠

Your task is to create an iOS app that renders random images of a cat. 🐈

Please build an iOS app that meets the following requirements:

1. When the app starts, fetch a random cat image from the _/images/search_ CatAPI (more details below).
2. Present the _cat_ image however you like on the master view:
    - There should be a way to view more details about the breed to present the information in Step 3 below.
    - There should also be a button to fetch another random cat image. 
3. You should also be able to push a detail view of the breed currently displayed on the master view (Step 2), this view should include:
    - Display 4 images of the breed
    - Title of the breed
    - Description of the temperament of the breed
    - A button to update the random images of the breed displayed

We advise spending no longer than 2-4 hours on this task. It doesn't need to be perfect – we're more interested to see how you approach the task and what you prioritise.

If there's something you'd like to do but feel like you don't have enough time, feel free to add a list of things you would like to do next in the notes section below.

## Where do I find these cats you speak of? 😸

Please refer to the [TheCatAPI](https://thecatapi.com/) for this task. The `/images/search` endpoint should provide the necessary data.

## What should the UI look like? 🎨

There are no designs provided for this task – you have complete freedom over what the UI looks like so feel free to get creative. We understand you're not a designer, but we'd love to see what you think a good app looks like.

You are also encouraged to add any nice touches you feel showcase your abilities. However, the most important thing is that your code works, it is well structured, and meets the requirements outlined above.

## What should I use to build the app? 🧰

**What Xcode and iOS version should I use?**

- Xcode 15.0 or higher
- iOS 15

**Can I use SwiftUI?**

Yes! This is preferred as SwiftUI is our preferred UI framework. About 60% of our app is written in SwiftUI, so you'll be using it regularly. However, if you feel UIKit better demonstrates your skills, feel free to use that.

**Can I use 3rd party libraries?**

You are free to use 3rd party libraries in your app. However, please explain *why* you decided to make use of any libraries in the notes section below.

We're looking to assess your understanding of iOS itself rather than open source libraries so please consider that in your decision making. However, we do understand that using some libraries could allow you to allocate your time more effectively to show off your skills in other areas.

## How we will evaluate your code 🔍

Please note that this task isn't about writing the perfect app, but will be used as a starting point for the technical interview. When we evaluate your code we will consider:

- Code organisation
- Quality
- Readability
- Style
- UI/UX design
- Tests
- Anything that shows you've gone above and beyond ✨

## Questions 🙋

Please don't hesitate to contact us with any questions. It's better to ask for clarification up front if you're unsure of anything.

# Jorge's Palomino Solution

- All built in SwiftUI.
- Ability to fetch more than one random cat (modify limit on ```getRandomCats```)
- Image loader with cache.
- Support for cats with and without breed. 
- Support to more than one breed per cat.
- Added some Unit and UI tests.

#### Next Steps

- Custom random cat search to find breeds with different filters.
- On breed photos refresh make sure that new images are different from previous ones.
- Show more information about the breed such as Wikipedia redirect or indicators for affection level, dog friendly or stranger friendly.
- Ability to swipe right or left and save that cat on your favourites to review later.


![ScreenRecording 1](media/ScreenRecording-1.mp4 "ScreenRecording 1")

⌨️ with ♡ by [J. Palomino](https://github.com/Jorge-Palomino) 😈
