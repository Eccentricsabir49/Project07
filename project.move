module MyModule::RentableNFTs {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::vector;

    /// Struct representing a rentable NFT.
    struct RentableNFT has store, key {
        owner: address,         // Owner of the NFT
        rent_price: u64,        // Rent price for one rental period
        rented_until: u64,      // Time until the NFT is rented
    }

    /// Function to list an NFT for rent by the owner.
    public fun list_nft_for_rent(owner: &signer, rent_price: u64, nft_id: u64) {
        let nft = RentableNFT {
            owner: signer::address_of(owner),
            rent_price,
            rented_until: 0,  // Initially, it's not rented
        };
        move_to(owner, nft);
    }


}
