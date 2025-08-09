Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6E3C87FCF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Aug 2025 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEXZsoWFcxGS/zaP6LXW8pD/lrIBaj2KM6GnUMMRYT8=; b=B78p/Sm86epoor8PnDFyDp02fA
	1h0iYSVAMGrhLQp/IfY5yVCi84xb8vn5mRvhVIOeenMMHLAkZNZmR4rVDPLbPpzHgsNzBJgyMIfLM
	oNwykdVTKyDx+c9E6yQcIN68tgatdMPKSBsGFijAkDu/+QWQVy37wUOmPVajVVHbI6MEh1Byqd+ga
	IRRdy4iShfgAPDRx5/5ohvC2K5hzM/pzRho3aDtHaeyXy0nr9gleku2Mze7zhkmSRl2IJuANOE+L+
	4LrwdtRUiIryVccs5kmb3QmyNDSNhutxMAxBmp2CYLaCALz9M1y2yIkPpoCQgGiPdsKxfwAi7Ypxw
	cCDTXsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uka2i-000000042Oz-3JqO;
	Sat, 09 Aug 2025 03:14:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uka2f-000000042Ob-47qR
	for linux-mediatek@lists.infradead.org;
	Sat, 09 Aug 2025 03:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EA43A55306;
	Sat,  9 Aug 2025 03:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8EAC4CEED;
	Sat,  9 Aug 2025 03:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754709284;
	bh=AJbLhOWXgNRDDIWHKPqqp01JZJ0f7/n0RkXmffcqdwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=skMpzBXU3jVaXXs5+TZe3Q9kitY3iEuc39vxU+AG8ZVoH6B2CkicN3MrmrERDpUhk
	 y4xA4j0Yv3hT0RIugYZFfl0Yz0YBoOaOcV3p6J/QambMTBZFIGzHopWhQ02vw+Dvxz
	 R9YtPo+FklXqYvkBHhcYE6GW80nBGIKmMDpq0Q5SlgNUNm9RwaGBf6bzx0YYkdvvTo
	 TyQDhV08l/BqiRFGo6/4FLxkS7IP7XmH84VJ7Rt2GZQgnifdyFi9s/u9G1plxbOQYs
	 811bfor+uTWkFo8e9ldVc+nAJUkULeH5ObzjSlYWwk0G/T5KPQGXYlO9vlkv45tOCX
	 KgRlkkzO+AsMQ==
Date: Sat, 9 Aug 2025 05:14:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Chad Monroe <chad@monroe.io>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: use the correct vif link for
 scanning/roc
Message-ID: <aJa9H3XkImgFlDvb@lore-rh-laptop>
References: <180fffd409aa57f535a3d2c1951e41ae398ce09e.1754659732.git.chad@monroe.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y7HUEbVQxErEPcAp"
Content-Disposition: inline
In-Reply-To: <180fffd409aa57f535a3d2c1951e41ae398ce09e.1754659732.git.chad@monroe.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_201446_086741_D3138326 
X-CRM114-Status: GOOD (  13.44  )
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


--Y7HUEbVQxErEPcAp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> restore fix which was dropped during MLO rework
>=20
> Fixes: f0b0b239b8f3 ("wifi: mt76: mt7996: rework mt7996_mac_write_txwi() =
for MLO support")
> Signed-off-by: Chad Monroe <chad@monroe.io>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 226534490792..6333a064c4f7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -903,8 +903,12 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, _=
_le32 *txwi,
>  				       IEEE80211_TX_CTRL_MLO_LINK);
> =20
>  	mvif =3D vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
> -	if (mvif)
> -		mlink =3D rcu_dereference(mvif->mt76.link[link_id]);
> +	if (mvif) {
> +		if (wcid->offchannel)
> +			mlink =3D rcu_dereference(mvif->mt76.offchannel_link);
> +		if (!mlink)
> +			mlink =3D rcu_dereference(mvif->mt76.link[link_id]);
> +	}
> =20
>  	if (mlink) {
>  		omac_idx =3D mlink->omac_idx;
> --=20
> 2.47.2
>=20
>=20
>=20

--Y7HUEbVQxErEPcAp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaJa9HAAKCRA6cBh0uS2t
rE9dAQCqsDnEFH56sDgxZbMfZbOJkzcBPKRS2FRjiH+VcB9eJQD8Cv/kh+QvXdK1
p/4z1zyFU1PLfwNm7yhNbCBpa2wh9gI=
=9CB9
-----END PGP SIGNATURE-----

--Y7HUEbVQxErEPcAp--

