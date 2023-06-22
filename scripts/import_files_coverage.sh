flutter pub get
flutter test --coverage
#lcov -remove coverage/lcov.info \
#  'lib/main.dart' \
#  'lib/*/*.freezed.dart' \
#  'lib/*/*.g.dart' \
#  'lib/*/*.part.dart' \
#  '**/generated/*.dart' \
#  '**/generated/*/*.dart' \
#  '**/gen/*.dart' \
#  '**/gen/*/*.dart' \
#  -o coverage/lcov.info
#genhtml coverage/lcov.info -o coverage
coverageRate=$(lcov -summary "coverage/lcov.info" | grep "lines......" | cut -d ' ' -f 4 | cut -d '%' -f 1)
REQUIRED_COVERAGE_PERC=100
if [ "$(echo "${coverageRate} < $REQUIRED_COVERAGE_PERC" | bc)" -eq 1 ]; then
    printf "coverage is too low, We required ${REQUIRED_COVERAGE_PERC} % and have ${coverageRate}%"
    exit 1
else
    printf "Coverage rate is up to mark.\n"
fi