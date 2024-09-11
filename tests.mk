all-tests:gnostr-sha256 cargo-test-sync cargo-test-async cargo-test-sync-nightly cargo-test-async-nightly
gnostr-sha256:
	type -P gnostr-sha256 || cargo install gnostr-sha256 || cargo install gnostr-bins || cargo install --git https://github.com/gnostr-org/gnostr-sha256.git
	#gnostr-sha256
cargo-test-sync: gnostr-sha256
	SECRET_KEY=$(shell gnostr-sha256) PUBLIC_KEY=a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd RELAY_URL=wss://e.nos.lol  cargo test --features=speedy -- --nocapture
cargo-test-async: gnostr-sha256
	SECRET_KEY=$(shell gnostr-sha256) PUBLIC_KEY=a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd RELAY_URL=wss://e.nos.lol  cargo test --features=speedy test_speedy_encoded_direct_field_access -- --nocapture
cargo-test-sync-nightly: gnostr-sha256
	SECRET_KEY=$(shell gnostr-sha256) PUBLIC_KEY=a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd RELAY_URL=wss://e.nos.lol  cargo +nightly test --features=speedy -- --nocapture
cargo-test-async-nightly: gnostr-sha256
	SECRET_KEY=$(shell gnostr-sha256) PUBLIC_KEY=a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd RELAY_URL=wss://e.nos.lol  cargo +nightly test --features=speedy test_speedy_encoded_direct_field_access -- --nocapture



