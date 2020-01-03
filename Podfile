# Internal spec repo should come first, so we can override public specs.
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

ENV["COCOAPODS_DISABLE_STATS"] = "true"

project "example"

# One of the frameworks would ideally be the only one that needs to depend on
# AppCenter/Crashes. I've found that we also need to include it in other
# frameworks that depend on Framework1, though (not the case in this sample).
# In this sample, it's just 2 frameworks that use AppCenter which are then
# used by the app target.
#
# In our actual use case, we have a framework for Logging, which includes
# crash logging, console logging, error logging; just a lot of Logging that
# is meant to be used in other frameworks. It seems like since the Logging
# framework itself is dynamic, so it's only loaded once, but each place I
# include AppCenter, it seems to statically include it in the binary of each
# framework, leading to messages like:
#
#   objc[39605]: Class MSAppCenter is implemented in both
#     /path/to/Framework1.framework/Framework1 (0x10e3dd0e8) and /path/to/Framework2.framework/Framework2 (0x10e265698).
#     One of the two will be used. Which one is undefined.
#
# I was hoping to get it set up in a way that, if there are static dependencies,
# it would do something like bundling the static dependencies only into the
# final target (in most cases the app target, unless you're building
# a framework explicitly...) and have Framework1 and Framework2 be able
# to reference the classes included in the final app binary. This might
# include having it statically link AppCenter into the frameworks and
# app binary, and then stripping away the excess ones later.
#
# Then again, this sort of build setting thing is not an area I have a
# whole lot of experience in, so I might be completely wrong about
# a lot of things here.


target "Framework1" do
  pod "AppCenter/Crashes", "2.5.0"
end

target "Framework2" do
  pod "AppCenter/Crashes", "2.5.0"
end

target "example" do
  pod "AppCenter/Crashes", "2.5.0"
end


# I have also tried a few different iterations of using inherited search paths,
# but it often leads to at least one of the targets not being able to find the
# AppCenter module
# abstract_target "HasCrashes" do
#   pod "AppCenter/Crashes", "2.5.0"
#
#   target "example"
#
#   target "Framework1" do
#     inherit! :search_paths
#   end
#
#   target "Framework2" do
#     inherit! :search_paths
#   end
# end

