{

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function array_length_t_string_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function copy_memory_to_memory_with_cleanup(src, dst, length) {
        let i := 0
        for { } lt(i, length) { i := add(i, 32) }
        {
            mstore(add(dst, i), mload(add(src, i)))
        }
        mstore(add(dst, length), 0)
    }

    function round_up_to_mul_of_32(value) -> result {
        result := and(add(value, 31), not(31))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

    }

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
        if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint8(value) -> cleaned {
        cleaned := and(value, 0xff)
    }

    function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint8(value))
    }

    function abi_encode_tuple_t_uint8__to_t_uint8__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

    }

    function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
        revert(0, 0)
    }

    function panic_error_0x41() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x41)
        revert(0, 0x24)
    }

    function finalize_allocation(memPtr, size) {
        let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
        // protect against overflow
        if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
        mstore(64, newFreePtr)
    }

    function allocate_memory(size) -> memPtr {
        memPtr := allocate_unbounded()
        finalize_allocation(memPtr, size)
    }

    function array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

        size := mul(length, 0x20)

        // add length slot
        size := add(size, 0x20)

    }

    function revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() {
        revert(0, 0)
    }

    // address[]
    function abi_decode_available_length_t_array$_t_address_$dyn_memory_ptr(offset, length, end) -> array {
        array := allocate_memory(array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length))
        let dst := array

        mstore(array, length)
        dst := add(array, 0x20)

        let srcEnd := add(offset, mul(length, 0x20))
        if gt(srcEnd, end) {
            revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
        }
        for { let src := offset } lt(src, srcEnd) { src := add(src, 0x20) }
        {

            let elementPos := src

            mstore(dst, abi_decode_t_address(elementPos, end))
            dst := add(dst, 0x20)
        }
    }

    // address[]
    function abi_decode_t_array$_t_address_$dyn_memory_ptr(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        let length := calldataload(offset)
        array := abi_decode_available_length_t_array$_t_address_$dyn_memory_ptr(add(offset, 0x20), length, end)
    }

    function array_allocation_size_t_array$_t_uint16_$dyn_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

        size := mul(length, 0x20)

        // add length slot
        size := add(size, 0x20)

    }

    function cleanup_t_uint16(value) -> cleaned {
        cleaned := and(value, 0xffff)
    }

    function validator_revert_t_uint16(value) {
        if iszero(eq(value, cleanup_t_uint16(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint16(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint16(value)
    }

    // uint16[]
    function abi_decode_available_length_t_array$_t_uint16_$dyn_memory_ptr(offset, length, end) -> array {
        array := allocate_memory(array_allocation_size_t_array$_t_uint16_$dyn_memory_ptr(length))
        let dst := array

        mstore(array, length)
        dst := add(array, 0x20)

        let srcEnd := add(offset, mul(length, 0x20))
        if gt(srcEnd, end) {
            revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
        }
        for { let src := offset } lt(src, srcEnd) { src := add(src, 0x20) }
        {

            let elementPos := src

            mstore(dst, abi_decode_t_uint16(elementPos, end))
            dst := add(dst, 0x20)
        }
    }

    // uint16[]
    function abi_decode_t_array$_t_uint16_$dyn_memory_ptr(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        let length := calldataload(offset)
        array := abi_decode_available_length_t_array$_t_uint16_$dyn_memory_ptr(add(offset, 0x20), length, end)
    }

    function abi_decode_tuple_t_array$_t_address_$dyn_memory_ptrt_array$_t_uint16_$dyn_memory_ptr(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value0 := abi_decode_t_array$_t_address_$dyn_memory_ptr(add(headStart, offset), dataEnd)
        }

        {

            let offset := calldataload(add(headStart, 32))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value1 := abi_decode_t_array$_t_uint16_$dyn_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_tuple_t_address__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_array$_t_address_$dyn_memory_ptr(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value0 := abi_decode_t_array$_t_address_$dyn_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_t_uint16_to_t_uint16_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint16(value))
    }

    function abi_encode_tuple_t_uint16__to_t_uint16__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint16_to_t_uint16_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function panic_error_0x22() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x22)
        revert(0, 0x24)
    }

    function extract_byte_array_length(data) -> length {
        length := div(data, 2)
        let outOfPlaceEncoding := and(data, 1)
        if iszero(outOfPlaceEncoding) {
            length := and(length, 0x7f)
        }

        if eq(outOfPlaceEncoding, lt(length, 32)) {
            panic_error_0x22()
        }
    }

    function store_literal_in_memory_2367837c6c1a51e02ae626e1503009c2c2e75775fb1a56da50f47795b5aeb0c7(memPtr) {

        mstore(add(memPtr, 0), "Cannot distribute rewards when t")

        mstore(add(memPtr, 32), "here are no stakers")

    }

    function abi_encode_t_stringliteral_2367837c6c1a51e02ae626e1503009c2c2e75775fb1a56da50f47795b5aeb0c7_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 51)
        store_literal_in_memory_2367837c6c1a51e02ae626e1503009c2c2e75775fb1a56da50f47795b5aeb0c7(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_2367837c6c1a51e02ae626e1503009c2c2e75775fb1a56da50f47795b5aeb0c7__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_2367837c6c1a51e02ae626e1503009c2c2e75775fb1a56da50f47795b5aeb0c7_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x11() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x11)
        revert(0, 0x24)
    }

    function checked_mul_t_uint256(x, y) -> product {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        let product_raw := mul(x, y)
        product := cleanup_t_uint256(product_raw)

        // overflow, if x != 0 and y != product/x
        if iszero(
            or(
                iszero(x),
                eq(y, div(product, x))
            )
        ) { panic_error_0x11() }

    }

    function panic_error_0x12() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x12)
        revert(0, 0x24)
    }

    function checked_div_t_uint256(x, y) -> r {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        if iszero(y) { panic_error_0x12() }

        r := div(x, y)
    }

    function checked_add_t_uint256(x, y) -> sum {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        sum := add(x, y)

        if gt(x, sum) { panic_error_0x11() }

    }

    function store_literal_in_memory_72dc2a71c7e1de2c7b012d07a11f8199d268b42d946f22dcef81102d123f1ba2(memPtr) {

        mstore(add(memPtr, 0), "Price cannot be zero")

    }

    function abi_encode_t_stringliteral_72dc2a71c7e1de2c7b012d07a11f8199d268b42d946f22dcef81102d123f1ba2_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 20)
        store_literal_in_memory_72dc2a71c7e1de2c7b012d07a11f8199d268b42d946f22dcef81102d123f1ba2(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_72dc2a71c7e1de2c7b012d07a11f8199d268b42d946f22dcef81102d123f1ba2__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_72dc2a71c7e1de2c7b012d07a11f8199d268b42d946f22dcef81102d123f1ba2_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_c8761e20fe54bdea2ef2a8cda31796d2d206893d8b94417e6c83be811f6bebc2(memPtr) {

        mstore(add(memPtr, 0), "No staked amount found")

    }

    function abi_encode_t_stringliteral_c8761e20fe54bdea2ef2a8cda31796d2d206893d8b94417e6c83be811f6bebc2_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 22)
        store_literal_in_memory_c8761e20fe54bdea2ef2a8cda31796d2d206893d8b94417e6c83be811f6bebc2(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_c8761e20fe54bdea2ef2a8cda31796d2d206893d8b94417e6c83be811f6bebc2__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_c8761e20fe54bdea2ef2a8cda31796d2d206893d8b94417e6c83be811f6bebc2_to_t_string_memory_ptr_fromStack( tail)

    }

    function checked_sub_t_uint256(x, y) -> diff {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        diff := sub(x, y)

        if gt(diff, x) { panic_error_0x11() }

    }

    function store_literal_in_memory_893728d0e71b0800df2adedc4ebc96c8ebb7f6a47f5b7d4635aabadfc4a61040(memPtr) {

        mstore(add(memPtr, 0), "No rewards available")

    }

    function abi_encode_t_stringliteral_893728d0e71b0800df2adedc4ebc96c8ebb7f6a47f5b7d4635aabadfc4a61040_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 20)
        store_literal_in_memory_893728d0e71b0800df2adedc4ebc96c8ebb7f6a47f5b7d4635aabadfc4a61040(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_893728d0e71b0800df2adedc4ebc96c8ebb7f6a47f5b7d4635aabadfc4a61040__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_893728d0e71b0800df2adedc4ebc96c8ebb7f6a47f5b7d4635aabadfc4a61040_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_620905ede78f76941f3838a755837911fbdbe7a5f219a8773c72b00657914410(memPtr) {

        mstore(add(memPtr, 0), "Contract doesn't have enough Eth")

        mstore(add(memPtr, 32), "er to reward")

    }

    function abi_encode_t_stringliteral_620905ede78f76941f3838a755837911fbdbe7a5f219a8773c72b00657914410_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 44)
        store_literal_in_memory_620905ede78f76941f3838a755837911fbdbe7a5f219a8773c72b00657914410(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_620905ede78f76941f3838a755837911fbdbe7a5f219a8773c72b00657914410__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_620905ede78f76941f3838a755837911fbdbe7a5f219a8773c72b00657914410_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x01() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x01)
        revert(0, 0x24)
    }

    function store_literal_in_memory_b2e1917355891956d3925c66d4c0851014e200425a9749e667f7d964ef2e7ad7(memPtr) {

        mstore(add(memPtr, 0), "Arrays must be of equal length")

    }

    function abi_encode_t_stringliteral_b2e1917355891956d3925c66d4c0851014e200425a9749e667f7d964ef2e7ad7_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 30)
        store_literal_in_memory_b2e1917355891956d3925c66d4c0851014e200425a9749e667f7d964ef2e7ad7(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_b2e1917355891956d3925c66d4c0851014e200425a9749e667f7d964ef2e7ad7__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_b2e1917355891956d3925c66d4c0851014e200425a9749e667f7d964ef2e7ad7_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_1e44b2471d5e08a8b46da74d9f942a5019a3c65d509c2e2bd726e97559c2ad0a(memPtr) {

        mstore(add(memPtr, 0), "Too many recipients added at onc")

        mstore(add(memPtr, 32), "e")

    }

    function abi_encode_t_stringliteral_1e44b2471d5e08a8b46da74d9f942a5019a3c65d509c2e2bd726e97559c2ad0a_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 33)
        store_literal_in_memory_1e44b2471d5e08a8b46da74d9f942a5019a3c65d509c2e2bd726e97559c2ad0a(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_1e44b2471d5e08a8b46da74d9f942a5019a3c65d509c2e2bd726e97559c2ad0a__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_1e44b2471d5e08a8b46da74d9f942a5019a3c65d509c2e2bd726e97559c2ad0a_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x32() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x32)
        revert(0, 0x24)
    }

    function store_literal_in_memory_bfcda6dfcceccd68306cd6588383c0ab14d8ec1a62d6939a25ccac644bd7e4e5(memPtr) {

        mstore(add(memPtr, 0), "Airdrop amount too large for a r")

        mstore(add(memPtr, 32), "ecipient")

    }

    function abi_encode_t_stringliteral_bfcda6dfcceccd68306cd6588383c0ab14d8ec1a62d6939a25ccac644bd7e4e5_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 40)
        store_literal_in_memory_bfcda6dfcceccd68306cd6588383c0ab14d8ec1a62d6939a25ccac644bd7e4e5(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_bfcda6dfcceccd68306cd6588383c0ab14d8ec1a62d6939a25ccac644bd7e4e5__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_bfcda6dfcceccd68306cd6588383c0ab14d8ec1a62d6939a25ccac644bd7e4e5_to_t_string_memory_ptr_fromStack( tail)

    }

    function increment_t_uint256(value) -> ret {
        value := cleanup_t_uint256(value)
        if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
        ret := add(value, 1)
    }

    function shift_right_1_unsigned(value) -> newValue {
        newValue :=

        shr(1, value)

    }

    function checked_exp_helper(_power, _base, exponent, max) -> power, base {
        power := _power
        base  := _base
        for { } gt(exponent, 1) {}
        {
            // overflow check for base * base
            if gt(base, div(max, base)) { panic_error_0x11() }
            if and(exponent, 1)
            {
                // No checks for power := mul(power, base) needed, because the check
                // for base * base above is sufficient, since:
                // |power| <= base (proof by induction) and thus:
                // |power * base| <= base * base <= max <= |min| (for signed)
                // (this is equally true for signed and unsigned exp)
                power := mul(power, base)
            }
            base := mul(base, base)
            exponent := shift_right_1_unsigned(exponent)
        }
    }

    function checked_exp_unsigned(base, exponent, max) -> power {
        // This function currently cannot be inlined because of the
        // "leave" statements. We have to improve the optimizer.

        // Note that 0**0 == 1
        if iszero(exponent) { power := 1 leave }
        if iszero(base) { power := 0 leave }

        // Specializations for small bases
        switch base
        // 0 is handled above
        case 1 { power := 1 leave }
        case 2
        {
            if gt(exponent, 255) { panic_error_0x11() }
            power := exp(2, exponent)
            if gt(power, max) { panic_error_0x11() }
            leave
        }
        if or(
            and(lt(base, 11), lt(exponent, 78)),
            and(lt(base, 307), lt(exponent, 32))
        )
        {
            power := exp(base, exponent)
            if gt(power, max) { panic_error_0x11() }
            leave
        }

        power, base := checked_exp_helper(1, base, exponent, max)

        if gt(power, div(max, base)) { panic_error_0x11() }
        power := mul(power, base)
    }

    function checked_exp_t_uint256_t_uint8(base, exponent) -> power {
        base := cleanup_t_uint256(base)
        exponent := cleanup_t_uint8(exponent)

        power := checked_exp_unsigned(base, exponent, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)

    }

    function store_literal_in_memory_9665e2320f03a9748bcc1f8ae7f173528196404a822cdd8dd6262cbe1733e632(memPtr) {

        mstore(add(memPtr, 0), "Not enough tokens in contract to")

        mstore(add(memPtr, 32), " airdrop")

    }

    function abi_encode_t_stringliteral_9665e2320f03a9748bcc1f8ae7f173528196404a822cdd8dd6262cbe1733e632_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 40)
        store_literal_in_memory_9665e2320f03a9748bcc1f8ae7f173528196404a822cdd8dd6262cbe1733e632(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_9665e2320f03a9748bcc1f8ae7f173528196404a822cdd8dd6262cbe1733e632__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_9665e2320f03a9748bcc1f8ae7f173528196404a822cdd8dd6262cbe1733e632_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_b7f836860b3581574517ce41ee0415fee825593a2d439bddd5b700e1bd865e9a(memPtr) {

        mstore(add(memPtr, 0), "Airdrop already claimed")

    }

    function abi_encode_t_stringliteral_b7f836860b3581574517ce41ee0415fee825593a2d439bddd5b700e1bd865e9a_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 23)
        store_literal_in_memory_b7f836860b3581574517ce41ee0415fee825593a2d439bddd5b700e1bd865e9a(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_b7f836860b3581574517ce41ee0415fee825593a2d439bddd5b700e1bd865e9a__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_b7f836860b3581574517ce41ee0415fee825593a2d439bddd5b700e1bd865e9a_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_8f677c1ea5fc8f90fded9edad2bd37ca56407217d5542af952119f236948f4cb(memPtr) {

        mstore(add(memPtr, 0), "No airdrop amount set for caller")

    }

    function abi_encode_t_stringliteral_8f677c1ea5fc8f90fded9edad2bd37ca56407217d5542af952119f236948f4cb_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 32)
        store_literal_in_memory_8f677c1ea5fc8f90fded9edad2bd37ca56407217d5542af952119f236948f4cb(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_8f677c1ea5fc8f90fded9edad2bd37ca56407217d5542af952119f236948f4cb__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_8f677c1ea5fc8f90fded9edad2bd37ca56407217d5542af952119f236948f4cb_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_4114d143427a0c6a60a907e902b636b4f4e84058a36a1f776b6d8102abbbcdb6(memPtr) {

        mstore(add(memPtr, 0), "Price per token should not be ze")

        mstore(add(memPtr, 32), "ro")

    }

    function abi_encode_t_stringliteral_4114d143427a0c6a60a907e902b636b4f4e84058a36a1f776b6d8102abbbcdb6_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 34)
        store_literal_in_memory_4114d143427a0c6a60a907e902b636b4f4e84058a36a1f776b6d8102abbbcdb6(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_4114d143427a0c6a60a907e902b636b4f4e84058a36a1f776b6d8102abbbcdb6__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_4114d143427a0c6a60a907e902b636b4f4e84058a36a1f776b6d8102abbbcdb6_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_267223299bdba4757154ebeb57371046728f4e74fbfbc7dd7d4c50071cc98a03(memPtr) {

        mstore(add(memPtr, 0), "Purchase exceeds 50% of total su")

        mstore(add(memPtr, 32), "pply")

    }

    function abi_encode_t_stringliteral_267223299bdba4757154ebeb57371046728f4e74fbfbc7dd7d4c50071cc98a03_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 36)
        store_literal_in_memory_267223299bdba4757154ebeb57371046728f4e74fbfbc7dd7d4c50071cc98a03(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_267223299bdba4757154ebeb57371046728f4e74fbfbc7dd7d4c50071cc98a03__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_267223299bdba4757154ebeb57371046728f4e74fbfbc7dd7d4c50071cc98a03_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8(memPtr) {

        mstore(add(memPtr, 0), "ERC20: decreased allowance below")

        mstore(add(memPtr, 32), " zero")

    }

    function abi_encode_t_stringliteral_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 37)
        store_literal_in_memory_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_3e76f273c719bb7d23db533a2dc9a822ae7d899fcd42eb8910272e24764e8296(memPtr) {

        mstore(add(memPtr, 0), "Amount must be greater than 0")

    }

    function abi_encode_t_stringliteral_3e76f273c719bb7d23db533a2dc9a822ae7d899fcd42eb8910272e24764e8296_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 29)
        store_literal_in_memory_3e76f273c719bb7d23db533a2dc9a822ae7d899fcd42eb8910272e24764e8296(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_3e76f273c719bb7d23db533a2dc9a822ae7d899fcd42eb8910272e24764e8296__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_3e76f273c719bb7d23db533a2dc9a822ae7d899fcd42eb8910272e24764e8296_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_47533c3652efd02135ecc34b3fac8efc7b14bf0618b9392fd6e044a3d8a6eef5(memPtr) {

        mstore(add(memPtr, 0), "Insufficient balance")

    }

    function abi_encode_t_stringliteral_47533c3652efd02135ecc34b3fac8efc7b14bf0618b9392fd6e044a3d8a6eef5_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 20)
        store_literal_in_memory_47533c3652efd02135ecc34b3fac8efc7b14bf0618b9392fd6e044a3d8a6eef5(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_47533c3652efd02135ecc34b3fac8efc7b14bf0618b9392fd6e044a3d8a6eef5__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_47533c3652efd02135ecc34b3fac8efc7b14bf0618b9392fd6e044a3d8a6eef5_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_ddc048a7b1254fa8c085a1875b4e86c4fd0becc6878ffdfe39f12fcda6bf37af(memPtr) {

        mstore(add(memPtr, 0), "Tokens are still locked")

    }

    function abi_encode_t_stringliteral_ddc048a7b1254fa8c085a1875b4e86c4fd0becc6878ffdfe39f12fcda6bf37af_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 23)
        store_literal_in_memory_ddc048a7b1254fa8c085a1875b4e86c4fd0becc6878ffdfe39f12fcda6bf37af(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_ddc048a7b1254fa8c085a1875b4e86c4fd0becc6878ffdfe39f12fcda6bf37af__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_ddc048a7b1254fa8c085a1875b4e86c4fd0becc6878ffdfe39f12fcda6bf37af_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_0d68aef58d8673bc391c6eaf9e4e93313ea2078a28063728f5b24f9bac16ca2a(memPtr) {

        mstore(add(memPtr, 0), "Bonus rate should not be more th")

        mstore(add(memPtr, 32), "an 100%")

    }

    function abi_encode_t_stringliteral_0d68aef58d8673bc391c6eaf9e4e93313ea2078a28063728f5b24f9bac16ca2a_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 39)
        store_literal_in_memory_0d68aef58d8673bc391c6eaf9e4e93313ea2078a28063728f5b24f9bac16ca2a(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_0d68aef58d8673bc391c6eaf9e4e93313ea2078a28063728f5b24f9bac16ca2a__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_0d68aef58d8673bc391c6eaf9e4e93313ea2078a28063728f5b24f9bac16ca2a_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_245f15ff17f551913a7a18385165551503906a406f905ac1c2437281a7cd0cfe(memPtr) {

        mstore(add(memPtr, 0), "Ownable: new owner is the zero a")

        mstore(add(memPtr, 32), "ddress")

    }

    function abi_encode_t_stringliteral_245f15ff17f551913a7a18385165551503906a406f905ac1c2437281a7cd0cfe_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 38)
        store_literal_in_memory_245f15ff17f551913a7a18385165551503906a406f905ac1c2437281a7cd0cfe(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_245f15ff17f551913a7a18385165551503906a406f905ac1c2437281a7cd0cfe__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_245f15ff17f551913a7a18385165551503906a406f905ac1c2437281a7cd0cfe_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208(memPtr) {

        mstore(add(memPtr, 0), "ERC20: approve from the zero add")

        mstore(add(memPtr, 32), "ress")

    }

    function abi_encode_t_stringliteral_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 36)
        store_literal_in_memory_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029(memPtr) {

        mstore(add(memPtr, 0), "ERC20: approve to the zero addre")

        mstore(add(memPtr, 32), "ss")

    }

    function abi_encode_t_stringliteral_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 34)
        store_literal_in_memory_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe(memPtr) {

        mstore(add(memPtr, 0), "ERC20: insufficient allowance")

    }

    function abi_encode_t_stringliteral_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 29)
        store_literal_in_memory_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea(memPtr) {

        mstore(add(memPtr, 0), "ERC20: transfer from the zero ad")

        mstore(add(memPtr, 32), "dress")

    }

    function abi_encode_t_stringliteral_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 37)
        store_literal_in_memory_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f(memPtr) {

        mstore(add(memPtr, 0), "ERC20: transfer to the zero addr")

        mstore(add(memPtr, 32), "ess")

    }

    function abi_encode_t_stringliteral_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 35)
        store_literal_in_memory_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6(memPtr) {

        mstore(add(memPtr, 0), "ERC20: transfer amount exceeds b")

        mstore(add(memPtr, 32), "alance")

    }

    function abi_encode_t_stringliteral_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 38)
        store_literal_in_memory_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_9924ebdf1add33d25d4ef888e16131f0a5687b0580a36c21b5c301a6c462effe(memPtr) {

        mstore(add(memPtr, 0), "Ownable: caller is not the owner")

    }

    function abi_encode_t_stringliteral_9924ebdf1add33d25d4ef888e16131f0a5687b0580a36c21b5c301a6c462effe_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 32)
        store_literal_in_memory_9924ebdf1add33d25d4ef888e16131f0a5687b0580a36c21b5c301a6c462effe(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_9924ebdf1add33d25d4ef888e16131f0a5687b0580a36c21b5c301a6c462effe__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_9924ebdf1add33d25d4ef888e16131f0a5687b0580a36c21b5c301a6c462effe_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_ebf73bba305590e4764d5cb53b69bffd6d4d092d1a67551cb346f8cfcdab8619(memPtr) {

        mstore(add(memPtr, 0), "ReentrancyGuard: reentrant call")

    }

    function abi_encode_t_stringliteral_ebf73bba305590e4764d5cb53b69bffd6d4d092d1a67551cb346f8cfcdab8619_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 31)
        store_literal_in_memory_ebf73bba305590e4764d5cb53b69bffd6d4d092d1a67551cb346f8cfcdab8619(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_ebf73bba305590e4764d5cb53b69bffd6d4d092d1a67551cb346f8cfcdab8619__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_ebf73bba305590e4764d5cb53b69bffd6d4d092d1a67551cb346f8cfcdab8619_to_t_string_memory_ptr_fromStack( tail)

    }

}
