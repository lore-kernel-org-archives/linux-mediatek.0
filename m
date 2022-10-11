Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD36C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB7wc/lANnBH8WfIu5nhkBF/YTZweySvyqAxfObUao0=; b=cPFrdW/7jFlcoVAiOV0Qgw4YN7
	/aoI4Ak/PJVi9sexDuSLxGkQ2uOU41UK5q6vW5WOymkPL1geROzPPB9z31yQ37ejXyGgfUo7uB9uM
	dNnxBvYiAo+tYP7rX8T7zUEZJQqKEcOo2occTmr/6Yu5HFHRngHMw2RClD8jEF3b1sXJLyBpAfMBe
	8T5dO4oxagyXA6vA2JuFvlYNqIWIt5nhE92jOHdMexEJkTsYd2q+kqJfP/cApsyOycGLZWlAMMxdu
	jJ+RHKd4Z7nhTOQ03ADub/dAH7KFbevqlgJHR3mYa6Bod7gUgyTzdMcRNhFS1wj2adAcvdO1Jlg+9
	bKEOCNHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9nk-003be0-V2; Tue, 11 Oct 2022 07:35:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9ni-003bdK-8P
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 07:35:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 281CDB811FC;
	Tue, 11 Oct 2022 07:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E17AC433D6;
	Tue, 11 Oct 2022 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665473738;
	bh=61stQUncIy2Z/Nuy/+OMABu7UzdyW4hgl587LgJfF+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nURWmBIwOzR5m71vyVJwzAHaTirrermB4ZTcQENZvRYidsbPjuQfMau4VpXQC5F3Y
	 mvES2wVRwdp5sZWEOfFb4p+ojoCRPPbKMLG8WLa5mOTJsifU2BqjXogAXXMBIKFoIu
	 PpHlnX3XygWYI8qogUi4m8PHSH82DGy6LI7HU7/LqFbepgIOioSpmgKwh2/E7+29rf
	 xSokH28P53ENEHdc5CQdVdnt0wcHIuCSoNFaN9HDiw3YBiSpk5ZYHbhto5372+RVDB
	 oOTSzv+9Rnte6tZzBxfMK3h4OmokiWCrgeaDoQfgVaa5xzpM3EsyIaflPuuHmlM9Co
	 8kR9M0xainekw==
Date: Tue, 11 Oct 2022 09:35:35 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7915: prevent unexpected nss setting from
 eeprom
Message-ID: <Y0Ucx6+6TjEfPV17@lore-desk>
References: <efa6ba9cd8ad5124f58e05155cc05008b14c5edf.1665453585.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cDg6v/7QPvTVC2k7"
Content-Disposition: inline
In-Reply-To: <efa6ba9cd8ad5124f58e05155cc05008b14c5edf.1665453585.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_003542_478680_68B44DE5 
X-CRM114-Status: GOOD (  17.25  )
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


--cDg6v/7QPvTVC2k7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add a check to prevent unexpected nss configuration from eeprom.

I am wondering why we need to add a check for this particular field. Is it a
well-known problem?

Regards,
Lorenzo

>=20
> Fixes: 4d8053df67c5 ("wifi: mt76: mt7915: rework eeprom tx paths and stre=
ams init")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers=
/net/wireless/mediatek/mt76/mt7915/eeprom.c
> index e2482c65d639..6c5155223087 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> @@ -191,7 +191,6 @@ void mt7915_eeprom_parse_hw_cap(struct mt7915_dev *de=
v,
>  		path =3D 4;
> =20
>  	/* read tx/rx stream */
> -	nss =3D path;
>  	if (dev->dbdc_support) {
>  		if (is_mt7915(&dev->mt76)) {
>  			nss =3D FIELD_GET(MT_EE_WIFI_CONF3_TX_PATH_B0,
> @@ -206,6 +205,11 @@ void mt7915_eeprom_parse_hw_cap(struct mt7915_dev *d=
ev,
> =20
>  		if (!is_mt7986(&dev->mt76))
>  			nss_max =3D 2;
> +
> +		if (!nss)
> +			nss =3D nss_max;
> +	} else {
> +		nss =3D path;
>  	}
> =20
>  	nss =3D min_t(u8, min_t(u8, nss_max, nss), path);
> --=20
> 2.36.1
>=20

--cDg6v/7QPvTVC2k7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY0UcxgAKCRA6cBh0uS2t
rOPdAQCKrWYAct/uSUQzcbTdRqLtPFS6mew43S2Gq0GX5hn+bwEA1rgunDydicfs
G582C7THc97apLzQ8h7NeUOJoNUheQE=
=23rp
-----END PGP SIGNATURE-----

--cDg6v/7QPvTVC2k7--

