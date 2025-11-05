Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FD0CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ihH85zWl4n+Iql9D3WM0KZfSlCZZyrMxU8bMiw5ixs=; b=aydX8usGCNqOXjYh95YAK//xtT
	UZ4OXqhiT2+IXZcrO3LPU8ducGMGfBTN5EHFoEjtAmHBgVDD9V3q93vAP7elrrvPZCikAIL7Ptzoa
	/x/5nOnC8CB/yBEnid9sTCg1RPNQSNd1cmjqZ4AFyjHcSzgCrMD2pTmsyHY49nqb4Rhmq19XL9Pl5
	UeMzngRy9fS/ryC5k0pT5oj6xjLul8VC7N3l4vqNEWO4oEPQPHEDXrchw+Q1Fy+CaSSk9cuyGWC/s
	o6Qo6302rhvSpQ523eeTVx2K+TkTRWhRyqOIs5apU6NQdEAV6Uex78jZPxEDEp0XowtpKPEvvLIMI
	4YrZ3dSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaqg-0000000DU0T-0P6v;
	Wed, 05 Nov 2025 10:34:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaqe-0000000DTys-1wdv
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Nov 2025 10:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1ihH85zWl4n+Iql9D3WM0KZfSlCZZyrMxU8bMiw5ixs=; b=ChN78u+aNVf3r+rCDFDGOQJjnR
	WsTqcLyDXgY/576PKIYLZTvirI2De7Otxmll8bn2fAAiCOXZ9tHBWEb5HFoist72dbs5SoGuCwMDv
	+SSvEV7Z/pQ7tfhoz/l6qJMgNCwHWrvg6DOK3jFzpo0+z0W+M9Cb9xd2DmrPGqT0HqBQ225M2RHBw
	20IHtcdM4f3TXpRB3pVNY+2+6h1C5vlS4ld+5igl5su+wvOv8E0OOPsYo9Ab7ayYRPc6Vlqe0IxYW
	9HXEI4Tv2jQ/ZEU6zpEu3JsOcXIy1BgVZCJFrjMxZU+HKUwNKwm9/JI0BDEcssiuzEVFJpfzVbFr2
	pO5FIsyA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZyt-00000001rZW-3Rjs
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 09:39:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C25040AC3;
	Wed,  5 Nov 2025 10:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CCAC4CEF8;
	Wed,  5 Nov 2025 10:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762338873;
	bh=7M6VcrEqiYPtG2L5zPKT6mpfPr0tZ/1taK7lowEDtEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gC8KeN5hDazoYpznjOthchMpRshLm33GI+zmO4TntJth3YRRAv1y2Dw+H3Mk6hDRA
	 vfl0Q1arZY85HveBOdzyznAogg+9EkJPenS2BrvUznJsRisH7RpNMUYr9HHMO3O7Lq
	 56w75Nu8vOY9NweEmuqMoESe4p8FN1xwSrKdiuDCRsVFCz1tZ1Q03EZP4Ea/F1QTkg
	 paHkiqmME9MdAdecdVcrdFzAQgB0TuwlQa04Cj8HzfujCvO++9UvvCjI3fUnybMD9q
	 AaD7u1zjBJXi/mmfW8Mud6yGtYoMSoPUvVaonyTUBbFrFblfk0rBi1j377+W2QoarL
	 CI3j6EsctYpVA==
Date: Wed, 5 Nov 2025 11:34:30 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH mt76 08/12] wifi: mt76: mt7996: use correct link_id when
 filling TXD and TXP
Message-ID: <aQsoNrzQuUAusnn0@lore-desk>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
 <20251105093100.541408-8-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xsnqatjje22dZK4d"
Content-Disposition: inline
In-Reply-To: <20251105093100.541408-8-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_093908_317411_BD304969 
X-CRM114-Status: GOOD (  21.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--Xsnqatjje22dZK4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Obtain the correct link ID and, if needed, switch to the corresponding
> wcid before populating the TX descriptor and TX payload.
>=20
> Rules for link id:
> - For QoS data from MLD peers (excluding EAPOL), select the primary or
>   secondary wcid based on whether the TID is odd or even to meet FW/HW
>   requirements
> - For other packets, use IEEE80211_TX_CTRL_MLO_LINK if specified
>   (such as multicast and broadcast packets)

Hi Shayne,

thx for the fix. I guess it is mostly fine, just few comments inline. Fixing
them:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Regards,
Lorenzo

>=20
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7996/mac.c   | 34 ++++++++++++++++---
>  .../net/wireless/mediatek/mt76/mt7996/main.c  |  6 ++++
>  .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  4 +--
>  .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
>  4 files changed, 39 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 7d5f9d9b3b62..579084cbb30f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -1035,15 +1035,20 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, =
void *txwi_ptr,
>  			  struct ieee80211_sta *sta,
>  			  struct mt76_tx_info *tx_info)
>  {

[...]

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index c26f8f49ce44..3958688d622b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -963,6 +963,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
> =20
>  		msta_link =3D &msta->deflink;
>  		msta->deflink_id =3D link_id;
> +		msta->seclink_id =3D msta->deflink_id;
> =20
>  		for (i =3D 0; i < ARRAY_SIZE(sta->txq); i++) {
>  			struct mt76_txq *mtxq;
> @@ -977,6 +978,11 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
>  		msta_link =3D kzalloc(sizeof(*msta_link), GFP_KERNEL);
>  		if (!msta_link)
>  			return -ENOMEM;
> +
> +		if (msta->seclink_id =3D=3D msta->deflink_id &&
> +		    (sta->valid_links & ~(BIT(msta->deflink_id))))
> +			msta->seclink_id =3D __ffs(sta->valid_links &
> +						 ~(BIT(msta->deflink_id)));
nit: you do need brackets around BIT().

I think we are missing seclink_id management when the corresponding link is
removed, right?

>  	}
> =20
>  	INIT_LIST_HEAD(&msta_link->rc_list);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index f1892aaf6a91..2bb98df317a6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -2394,8 +2394,8 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev=
, struct sk_buff *skb,
>  	mld_setup->primary_id =3D cpu_to_le16(msta_link->wcid.idx);
> =20
>  	if (nlinks > 1) {
> -		link_id =3D __ffs(sta->valid_links & ~BIT(msta->deflink_id));
> -		msta_link =3D mt76_dereference(msta->link[link_id], &dev->mt76);
> +		msta_link =3D mt76_dereference(msta->link[msta->seclink_id],
> +					     &dev->mt76);
>  		if (!msta_link)
>  			return;
>  	}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers=
/net/wireless/mediatek/mt76/mt7996/mt7996.h
> index 65eeb37ab8c7..c47820699ec8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> @@ -243,6 +243,7 @@ struct mt7996_sta {
>  	struct mt7996_sta_link deflink; /* must be first */
>  	struct mt7996_sta_link __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
>  	u8 deflink_id;
> +	u8 seclink_id;
> =20
>  	struct mt7996_vif *vif;
>  };
> --=20
> 2.51.0
>=20

--Xsnqatjje22dZK4d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQsoNgAKCRA6cBh0uS2t
rGmqAP9hT1ZDbyMLdtgldzY4u5+1U6ruTWkWGxXZCBFbH5kMhwD9G9mjNORiXKzt
fs9pc2dVo5hESQFz2NOFgcj1khsxWwI=
=4v+c
-----END PGP SIGNATURE-----

--Xsnqatjje22dZK4d--

