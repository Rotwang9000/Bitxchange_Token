{

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_bytes32(value) -> cleaned {
        cleaned := value
    }

    function validator_revert_t_bytes32(value) {
        if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
    }

    function abi_decode_t_bytes32(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_bytes32(value)
    }

    function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
        revert(0, 0)
    }

    function revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() {
        revert(0, 0)
    }

    function round_up_to_mul_of_32(value) -> result {
        result := and(add(value, 31), not(31))
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

    function array_allocation_size_t_bytes_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

        size := round_up_to_mul_of_32(length)

        // add length slot
        size := add(size, 0x20)

    }

    function copy_calldata_to_memory_with_cleanup(src, dst, length) {
        calldatacopy(dst, src, length)
        mstore(add(dst, length), 0)
    }

    function abi_decode_available_length_t_bytes_memory_ptr(src, length, end) -> array {
        array := allocate_memory(array_allocation_size_t_bytes_memory_ptr(length))
        mstore(array, length)
        let dst := add(array, 0x20)
        if gt(add(src, length), end) { revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() }
        copy_calldata_to_memory_with_cleanup(src, dst, length)
    }

    // bytes
    function abi_decode_t_bytes_memory_ptr(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        let length := calldataload(offset)
        array := abi_decode_available_length_t_bytes_memory_ptr(add(offset, 0x20), length, end)
    }

    function abi_decode_tuple_t_bytes32t_bytes_memory_ptr(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
        }

        {

            let offset := calldataload(add(headStart, 32))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value1 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_tuple_t_address__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_addresst_uint256t_uint256(headStart, dataEnd) -> value0, value1, value2 {
        if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_uint256t_uint256t_bytes_memory_ptrt_uint256(headStart, dataEnd) -> value0, value1, value2, value3, value4 {
        if slt(sub(dataEnd, headStart), 160) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := calldataload(add(headStart, 96))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value3 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
        }

        {

            let offset := 128

            value4 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function identity(value) -> ret {
        ret := value
    }

    function convert_t_uint160_to_t_uint160(value) -> converted {
        converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
    }

    function convert_t_uint160_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_uint160(value)
    }

    function convert_t_contract$_IUniswapV2Router02_$643_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_address(value)
    }

    function abi_encode_t_contract$_IUniswapV2Router02_$643_to_t_address_fromStack(value, pos) {
        mstore(pos, convert_t_contract$_IUniswapV2Router02_$643_to_t_address(value))
    }

    function abi_encode_tuple_t_contract$_IUniswapV2Router02_$643__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_contract$_IUniswapV2Router02_$643_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function convert_t_contract$_IRewardPot_$654_to_t_address(value) -> converted {
        converted := convert_t_uint160_to_t_address(value)
    }

    function abi_encode_t_contract$_IRewardPot_$654_to_t_address_fromStack(value, pos) {
        mstore(pos, convert_t_contract$_IRewardPot_$654_to_t_address(value))
    }

    function abi_encode_tuple_t_contract$_IRewardPot_$654__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_contract$_IRewardPot_$654_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_uint256t_uint256t_uint256(headStart, dataEnd) -> value0, value1, value2, value3 {
        if slt(sub(dataEnd, headStart), 128) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 96

            value3 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_uint256_t_uint256_t_bool__to_t_uint256_t_uint256_t_bool__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

        abi_encode_t_bool_to_t_bool_fromStack(value2,  add(headStart, 64))

    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
        updated_pos := pos
    }

    function store_literal_in_memory_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73(memPtr) {

        mstore(add(memPtr, 0), 0x19457468657265756d205369676e6564204d6573736167653a0a333200000000)

    }

    function abi_encode_t_stringliteral_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73_to_t_string_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, 28)
        store_literal_in_memory_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73(pos)
        end := add(pos, 28)
    }

    function leftAlign_t_bytes32(value) -> aligned {
        aligned := value
    }

    function abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value, pos) {
        mstore(pos, leftAlign_t_bytes32(cleanup_t_bytes32(value)))
    }

    function abi_encode_tuple_packed_t_stringliteral_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73_t_bytes32__to_t_string_memory_ptr_t_bytes32__nonPadded_inplace_fromStack_reversed(pos , value0) -> end {

        pos := abi_encode_t_stringliteral_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73_to_t_string_memory_ptr_nonPadded_inplace_fromStack( pos)

        abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value0,  pos)
        pos := add(pos, 32)

        end := pos
    }

    function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
        mstore(pos, cleanup_t_bytes32(value))
    }

    function cleanup_t_uint8(value) -> cleaned {
        cleaned := and(value, 0xff)
    }

    function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint8(value))
    }

    function abi_encode_tuple_t_bytes32_t_uint8_t_bytes32_t_bytes32__to_t_bytes32_t_uint8_t_bytes32_t_bytes32__fromStack_reversed(headStart , value3, value2, value1, value0) -> tail {
        tail := add(headStart, 128)

        abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint8_to_t_uint8_fromStack(value1,  add(headStart, 32))

        abi_encode_t_bytes32_to_t_bytes32_fromStack(value2,  add(headStart, 64))

        abi_encode_t_bytes32_to_t_bytes32_fromStack(value3,  add(headStart, 96))

    }

    function abi_encode_tuple_t_address_t_address_t_uint256__to_t_address_t_address_t_uint256__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

    }

    function validator_revert_t_bool(value) {
        if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
    }

    function abi_decode_t_bool_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_bool(value)
    }

    function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

    }

    function panic_error_0x32() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x32)
        revert(0, 0x24)
    }

    function abi_decode_t_address_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_address(value)
    }

    function abi_decode_tuple_t_address_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function array_length_t_array$_t_address_$dyn_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_dataslot_t_array$_t_address_$dyn_memory_ptr(ptr) -> data {
        data := ptr

        data := add(ptr, 0x20)

    }

    function abi_encode_t_address_to_t_address(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encodeUpdatedPos_t_address_to_t_address(value0, pos) -> updatedPos {
        abi_encode_t_address_to_t_address(value0, pos)
        updatedPos := add(pos, 0x20)
    }

    function array_nextElement_t_array$_t_address_$dyn_memory_ptr(ptr) -> next {
        next := add(ptr, 0x20)
    }

    // address[] -> address[]
    function abi_encode_t_array$_t_address_$dyn_memory_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value, pos)  -> end  {
        let length := array_length_t_array$_t_address_$dyn_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr_fromStack(pos, length)
        let baseRef := array_dataslot_t_array$_t_address_$dyn_memory_ptr(value)
        let srcPtr := baseRef
        for { let i := 0 } lt(i, length) { i := add(i, 1) }
        {
            let elementValue0 := mload(srcPtr)
            pos := abi_encodeUpdatedPos_t_address_to_t_address(elementValue0, pos)
            srcPtr := array_nextElement_t_array$_t_address_$dyn_memory_ptr(srcPtr)
        }
        end := pos
    }

    function abi_encode_tuple_t_uint256_t_uint256_t_array$_t_address_$dyn_memory_ptr_t_address_t_uint256__to_t_uint256_t_uint256_t_array$_t_address_$dyn_memory_ptr_t_address_t_uint256__fromStack_reversed(headStart , value4, value3, value2, value1, value0) -> tail {
        tail := add(headStart, 160)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

        mstore(add(headStart, 64), sub(tail, headStart))
        tail := abi_encode_t_array$_t_address_$dyn_memory_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value2,  tail)

        abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

        abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

    }

    function array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

        size := mul(length, 0x20)

        // add length slot
        size := add(size, 0x20)

    }

    function revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() {
        revert(0, 0)
    }

    function abi_decode_t_uint256_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_uint256(value)
    }

    // uint256[]
    function abi_decode_available_length_t_array$_t_uint256_$dyn_memory_ptr_fromMemory(offset, length, end) -> array {
        array := allocate_memory(array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length))
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

            mstore(dst, abi_decode_t_uint256_fromMemory(elementPos, end))
            dst := add(dst, 0x20)
        }
    }

    // uint256[]
    function abi_decode_t_array$_t_uint256_$dyn_memory_ptr_fromMemory(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        let length := mload(offset)
        array := abi_decode_available_length_t_array$_t_uint256_$dyn_memory_ptr_fromMemory(add(offset, 0x20), length, end)
    }

    function abi_decode_tuple_t_array$_t_uint256_$dyn_memory_ptr_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := mload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value0 := abi_decode_t_array$_t_uint256_$dyn_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
        }

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

    function checked_sub_t_uint256(x, y) -> diff {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        diff := sub(x, y)

        if gt(diff, x) { panic_error_0x11() }

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function store_literal_in_memory_b3d0852849d5c6fe24c378efa3d08939237320caaf2dbdb15cdd35797549e3db(memPtr) {

        mstore(add(memPtr, 0), "Estimated gas cost exceeds minAm")

        mstore(add(memPtr, 32), "ountOut")

    }

    function abi_encode_t_stringliteral_b3d0852849d5c6fe24c378efa3d08939237320caaf2dbdb15cdd35797549e3db_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 39)
        store_literal_in_memory_b3d0852849d5c6fe24c378efa3d08939237320caaf2dbdb15cdd35797549e3db(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_b3d0852849d5c6fe24c378efa3d08939237320caaf2dbdb15cdd35797549e3db__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_b3d0852849d5c6fe24c378efa3d08939237320caaf2dbdb15cdd35797549e3db_to_t_string_memory_ptr_fromStack( tail)

    }

    function shift_left_96(value) -> newValue {
        newValue :=

        shl(96, value)

    }

    function leftAlign_t_uint160(value) -> aligned {
        aligned := shift_left_96(value)
    }

    function leftAlign_t_address(value) -> aligned {
        aligned := leftAlign_t_uint160(value)
    }

    function abi_encode_t_address_to_t_address_nonPadded_inplace_fromStack(value, pos) {
        mstore(pos, leftAlign_t_address(cleanup_t_address(value)))
    }

    function leftAlign_t_uint256(value) -> aligned {
        aligned := value
    }

    function abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value, pos) {
        mstore(pos, leftAlign_t_uint256(cleanup_t_uint256(value)))
    }

    function abi_encode_tuple_packed_t_address_t_uint256_t_uint256_t_uint256__to_t_address_t_uint256_t_uint256_t_uint256__nonPadded_inplace_fromStack_reversed(pos , value3, value2, value1, value0) -> end {

        abi_encode_t_address_to_t_address_nonPadded_inplace_fromStack(value0,  pos)
        pos := add(pos, 20)

        abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value1,  pos)
        pos := add(pos, 32)

        abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value2,  pos)
        pos := add(pos, 32)

        abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value3,  pos)
        pos := add(pos, 32)

        end := pos
    }

    function store_literal_in_memory_4f2d7dfcb27c0aafa13ae8c400de482c7832204d194018b6e45bd2bf244c74e7(memPtr) {

        mstore(add(memPtr, 0), "Invalid signature")

    }

    function abi_encode_t_stringliteral_4f2d7dfcb27c0aafa13ae8c400de482c7832204d194018b6e45bd2bf244c74e7_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 17)
        store_literal_in_memory_4f2d7dfcb27c0aafa13ae8c400de482c7832204d194018b6e45bd2bf244c74e7(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_4f2d7dfcb27c0aafa13ae8c400de482c7832204d194018b6e45bd2bf244c74e7__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_4f2d7dfcb27c0aafa13ae8c400de482c7832204d194018b6e45bd2bf244c74e7_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_c7569ce4344c81be8922b3ca8692c3fe19811af881d35ca5ec750b071a506bc0(memPtr) {

        mstore(add(memPtr, 0), "Swap Expected to fail")

    }

    function abi_encode_t_stringliteral_c7569ce4344c81be8922b3ca8692c3fe19811af881d35ca5ec750b071a506bc0_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 21)
        store_literal_in_memory_c7569ce4344c81be8922b3ca8692c3fe19811af881d35ca5ec750b071a506bc0(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_c7569ce4344c81be8922b3ca8692c3fe19811af881d35ca5ec750b071a506bc0__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_c7569ce4344c81be8922b3ca8692c3fe19811af881d35ca5ec750b071a506bc0_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_87947c3e5bfb11031a16d6426cee09f7de6342533563cada4890fb38147a024b(memPtr) {

        mstore(add(memPtr, 0), "Expected gas more than return")

    }

    function abi_encode_t_stringliteral_87947c3e5bfb11031a16d6426cee09f7de6342533563cada4890fb38147a024b_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 29)
        store_literal_in_memory_87947c3e5bfb11031a16d6426cee09f7de6342533563cada4890fb38147a024b(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_87947c3e5bfb11031a16d6426cee09f7de6342533563cada4890fb38147a024b__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_87947c3e5bfb11031a16d6426cee09f7de6342533563cada4890fb38147a024b_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_99d03bbca29953384fbf5a2a7999b8ff081ffee2952f8e5537f33cef2e1e53cc(memPtr) {

        mstore(add(memPtr, 0), "Expected amount less than minimu")

        mstore(add(memPtr, 32), "m required")

    }

    function abi_encode_t_stringliteral_99d03bbca29953384fbf5a2a7999b8ff081ffee2952f8e5537f33cef2e1e53cc_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 42)
        store_literal_in_memory_99d03bbca29953384fbf5a2a7999b8ff081ffee2952f8e5537f33cef2e1e53cc(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_99d03bbca29953384fbf5a2a7999b8ff081ffee2952f8e5537f33cef2e1e53cc__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_99d03bbca29953384fbf5a2a7999b8ff081ffee2952f8e5537f33cef2e1e53cc_to_t_string_memory_ptr_fromStack( tail)

    }

    function checked_add_t_uint256(x, y) -> sum {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        sum := add(x, y)

        if gt(x, sum) { panic_error_0x11() }

    }

    function store_literal_in_memory_1462473b7a4b33d32b109b815fd2324d00c9e5839b707ecf16d0ab5744f99226(memPtr) {

        mstore(add(memPtr, 0), "Invalid address")

    }

    function abi_encode_t_stringliteral_1462473b7a4b33d32b109b815fd2324d00c9e5839b707ecf16d0ab5744f99226_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 15)
        store_literal_in_memory_1462473b7a4b33d32b109b815fd2324d00c9e5839b707ecf16d0ab5744f99226(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_1462473b7a4b33d32b109b815fd2324d00c9e5839b707ecf16d0ab5744f99226__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_1462473b7a4b33d32b109b815fd2324d00c9e5839b707ecf16d0ab5744f99226_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_fb3a3d8f75cdae1168f9b132ca03ea6770dcdbfb3d869b48d61145d3176f908f(memPtr) {

        mstore(add(memPtr, 0), "No liquidity for this token")

    }

    function abi_encode_t_stringliteral_fb3a3d8f75cdae1168f9b132ca03ea6770dcdbfb3d869b48d61145d3176f908f_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 27)
        store_literal_in_memory_fb3a3d8f75cdae1168f9b132ca03ea6770dcdbfb3d869b48d61145d3176f908f(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_fb3a3d8f75cdae1168f9b132ca03ea6770dcdbfb3d869b48d61145d3176f908f__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_fb3a3d8f75cdae1168f9b132ca03ea6770dcdbfb3d869b48d61145d3176f908f_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_uint256_t_array$_t_address_$dyn_memory_ptr__to_t_uint256_t_array$_t_address_$dyn_memory_ptr__fromStack_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        mstore(add(headStart, 32), sub(tail, headStart))
        tail := abi_encode_t_array$_t_address_$dyn_memory_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value1,  tail)

    }

}
