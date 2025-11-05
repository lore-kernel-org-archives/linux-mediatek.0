Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35620CCFA0D
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+ChTRXGn7buG/woWgFjm5DpqV9f4IODaQ/Tn68Bn8Y=; b=fsOnsoA+zAmDbJRISvgmDBXUhe
	U2YU58oongtWV4mU0fOzMCvV1zwIXw/s/TBfbHXxY0usSOY1bpK+OA5bAO4XJvgr2sH/RDPKr/oSy
	wIn1KJQvVnl2jRHFYPTlRFgWohHtycadDECQINJzlrc6DCuGzb5mbicaoLydwghM41CdMbnVUg0wv
	mfiolMDnmjt/cIYufBhTFyqwexlB6/CxCLaNmZg+mNSEBK7q8L6tRBlOR5zmQzCv6Su6A1whRi9T4
	UkxO9E5NoCNip40EP/RzioxbLfL+hVPnEAnicC2CXuy8UiG7lE9OANciYwBCFkK466XLjLwUCk27g
	+91pUsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaXl-0000000DSMA-3rpV;
	Wed, 05 Nov 2025 10:15:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaXj-0000000DSLV-04Jd
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 10:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F47743227;
	Wed,  5 Nov 2025 10:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C097C4CEFB;
	Wed,  5 Nov 2025 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762337706;
	bh=eJLJW2lFSOIlMRJyBNTFsuHhvlrpBvyGpayql7faRpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFufbgauSv2Xg7+Y36A2bMYwjpAJ2rmpLk19C/M/GDCXeh0pv6vIiNHlm2h9fs4dz
	 YV0dkWHzsw6T89TX6hsdbuDtXOwblQTHZaeNB6gTrxK37TPe2l9zrKIWdD+JYhKZFY
	 4zQdmNfj6bbyW3ZT4r8bRxV6aupKbEMdEe7wWqrh7kcZZcn0Rqiso92GaL8JEkL+hh
	 hAzIbftt84gMpZTX008meXyz3h24Tfz7ZXpmh+tGo0JbpwTEbdsjWNK93seEO1uyjO
	 lNsTJCJUnoKtfiSjHrmcs0AEIrUZlZt9b+MCqQETH9LlTofm1nGRVXhKaSJODlQz25
	 CFpjA20KOgdlw==
Date: Wed, 5 Nov 2025 11:15:04 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH mt76 07/12] wifi: mt76: mt7996: set link_valid field when
 initializing wcid
Message-ID: <aQsjqEkRRkNvYuua@lore-desk>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
 <20251105093100.541408-7-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b841FnmXDNlkKh5U"
Content-Disposition: inline
In-Reply-To: <20251105093100.541408-7-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_021507_071010_0BFCCBD7 
X-CRM114-Status: GOOD (  11.38  )
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


--b841FnmXDNlkKh5U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This ensures the upper layer uses the correct link ID during packet
> processing.
>=20
> Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_=
add/sta_remove callbacks")
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index 685be98b9f27..c26f8f49ce44 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -343,6 +343,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct=
 ieee80211_vif *vif,
>  	INIT_LIST_HEAD(&msta_link->rc_list);
>  	msta_link->wcid.idx =3D idx;
>  	msta_link->wcid.link_id =3D link_conf->link_id;
> +	msta_link->wcid.link_valid =3D ieee80211_vif_is_mld(vif);
>  	msta_link->wcid.tx_info |=3D MT_WCID_TX_INFO_SET;
>  	mt76_wcid_init(&msta_link->wcid, band_idx);
> =20
> @@ -984,6 +985,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
>  	msta_link->wcid.sta =3D 1;
>  	msta_link->wcid.idx =3D idx;
>  	msta_link->wcid.link_id =3D link_id;
> +	msta_link->wcid.link_valid =3D !!sta->valid_links;
>  	msta_link->wcid.def_wcid =3D &msta->deflink.wcid;
> =20
>  	ewma_avg_signal_init(&msta_link->avg_ack_signal);
> --=20
> 2.51.0
>=20

--b841FnmXDNlkKh5U
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQsjpwAKCRA6cBh0uS2t
rJ6nAP9q8oJl5eRH8fIUDlJxCf30l0iHrklHGnsCCk4RCMwALwEA31eWJ7DDCqFu
BWeWDZPxzQD+9MhogPfBUaxNt/dK0gM=
=yQM9
-----END PGP SIGNATURE-----

--b841FnmXDNlkKh5U--

