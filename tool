  steps:
      - uses: actions/checkout@v2

      - uses: actions-rs/toolchain@v1
        with:
          profile: minimal
          toolchain: stable
          override: true

      - uses: Swatinem/rust-cache@v1
        with:
          key: ${{ runner.os }}-test

      - uses: actions-rs/cargo@v1
        with:
          command: test
          args: >
            --manifest-path sqlx-core/Cargo.toml
            --features json,_rt-${{ matrix.runtime }},_tls-${{ matrix.tls }}
