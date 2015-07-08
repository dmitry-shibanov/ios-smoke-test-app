Feature: Calling Arbitrary Selectors
  In order to speed up testing and gain insights about my app
  As a developer and tester
  Want a way of calling arbitrary selectors on UIViews

  # Calabash can call arbitrary selectors on UIView and UIView subclasses.
  #
  # The classic example is setting the text of a UITextField.
  #
  # query("UITextField marked:'username'", [{setText:'launisch'}])
  #
  # In this case, 'setText' is the Objective-C selector.
  #
  # Consider this use case.  You are testing a UIView with an image view
  # and a label. During a test you want to change the image and the caption.
  #
  # @interface MyView : UIView
  #
  # @property(...) UIImageView *imageView;
  # @property(...) UILabel *caption;
  #
  # @end
  #
  # @implementation MyView
  #
  # - (void) setImageWithURL:(NSString *) url caption:(NSString *) caption {
  #   UIImage *image = // Fetch the image from URL
  #   self.imageView.image = image;
  #   self.label.text = caption;
  # }
  #
  # @end
  #
  # In the view's Controller or in the Interface Builder, you set the the
  # accessibilityIdentifier to 'my view'.
  #
  # You can call this method from Calabash like this:
  #
  # query("view marked:'my view', [{setImageWithURL:'https://some/url.png',
  #                                         caption:'Funny Cat!'}])
  #
  # Another way to add a selector to a view is to use an Objective-C category.
  #
  # In your View Controller .m file
  #
  # // Google Map View
  # @interface GMSMapView (CalabashAdditions)
  #
  # - (NSString *) JSONRepresentationOfPins;
  #
  # @end
  #
  # @implementation GMSMapView (CalabashAdditions)
  #
  # - (NSString *) JSONRepresentationOfPins {
  #  // Google Map Views are OpenGL based so they are opaque to Calabash queries.
  #  // However, you can manage the pins on the map manually and return the list
  #  // of visible pins as a JSON string.
  # }
  #
  # @end
  #
  # query('GSMapView', :JSONRepresentationOfPins)

  Background: Get me to the first tab
    Given I see the first tab

  @wip
  Scenario: Unknown selector
    When I call an unknown selector on a view
    Then I expect to receive back "*****"

  Scenario: Selector arguments
    Then I call selector with pointer argument
    Then I call selector with int argument
    Then I call selector with unsigned int argument
    Then I call selector with short argument
    Then I call selector with unsigned short argument
    Then I call selector with float argument
    Then I call selector with double argument
    Then I call selector with long double argument
    Then I call selector with c string argument
    Then I call selector with char argument
    Then I call selector with unsigned char argument
    Then I call selector with BOOL argument
    Then I call selector with long argument
    Then I call selector with unsigned long argument
    Then I call selector with long long argument
    Then I call selector with unsigned long long argument
    Then I call selector with point argument
    Then I call selector with rect argument

