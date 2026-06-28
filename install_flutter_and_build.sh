#!/bin/bash

# 1. Install Flutter SDK
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable
fi

# 2. Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Verify setup
flutter doctor

# 4. Enable web (just in case)
flutter config --enable-web

# 5. Build the web app
# Vercel will provide SUPABASE_URL and SUPABASE_ANON_KEY from its Environment Variables
flutter build web --release --dart-define=SUPABASE_URL=$SUPABASE_URL --dart-define=SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY
