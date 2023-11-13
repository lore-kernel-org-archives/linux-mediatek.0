Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC23C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnpHsSt6WcrwtXMYjQwUg2tAVXJwyeo65P6C47O1kbI=; b=NFkXvLyQz38AnFtjix3Y6N2RZV
	UNfDC6zS/6wVEhYE6U19SdcU5FBKhvESMQ/RH7RmKBhehGc7Y47hAghsPjJoTWWFswf2ECJ5DHwdu
	6fWMYjUNgtMY3mBG7qKYnVIXC3mPqx3u6dnT97B73oZ9jn/Uz56s/bgdt3yMYRjm/Hg/HVTJ+lGqA
	jc9MOWyXeNEtf+Ezb8QuARI2lZHfydUbY3y0rxXpbvnuzXp5zM65g5FOraQ+819G2Ug+BfseEB4l0
	z8fTm1WHR9uiRJSstxpIf9aHCRwO1ZQtX5ML0C0PBqOdzA111u6PwxMWNu672rAYB+nPWP0qg660n
	O93He1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2UoN-00DhFW-2a;
	Mon, 13 Nov 2023 11:08:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2UoK-00DhF4-2E
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 11:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8991CB80D4A;
	Mon, 13 Nov 2023 11:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6061AC433C9;
	Mon, 13 Nov 2023 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699873733;
	bh=KALW0XAt2W9xqmDl2Dewx6Qe5FPupyQKP9nRMmTBR2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0o+5iopELrIRLQ0runKmuVCXTFT3Ru7rxqUo7Mhj8aM0/rvA+c/oLFeBb2GSDWsI
	 XHKE5QrxENycxawwWgxwgC6GeiH+yRGq5AUQCYreoR2y/RlRMdTYEeJZLbJ6sSCGDs
	 7KRh15C5qNY7qUPRraxdOyRgz2uo7v+HeQ6Ue0R/T6FLpyvkyt0e7eLIt7bpootWka
	 lHb/LHBB4/rTCnrE9azgZ0/ZDFooFDHhtEPQD66j7i2+4zlPTvbeBcPax2GdCq23C4
	 K4FYc3BtjB1lZ6rbPhSKa+MHOXi3opeo6P6Bob4Okc3QSMziJ0xYxiKSBfn8cP5uTX
	 LMx3U3+ncL6Og==
Date: Mon, 13 Nov 2023 12:08:49 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Subject: Re: [PATCH 5/8] wifi: mt76: mt7996: support mt7992 eeprom loading
Message-ID: <ZVIDwUD8ESJIpsnM@lore-desk>
References: <20231113070619.19964-1-shayne.chen@mediatek.com>
 <20231113070619.19964-6-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MaAtsoH7HqLGRCZk"
Content-Disposition: inline
In-Reply-To: <20231113070619.19964-6-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_030857_034643_D63E5AE1 
X-CRM114-Status: GOOD (  18.91  )
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


--MaAtsoH7HqLGRCZk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
>=20
> Add the default eeprom and 0x7992 check to mt7996_check_eeprom().
> This is a preliminary patch for mt7992 chipsets support.
>=20
> Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7996/eeprom.c    | 15 ++++++++++++---
>  .../net/wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
>  2 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers=
/net/wireless/mediatek/mt76/mt7996/eeprom.c
> index 9db7e531076d..9c3735bed50c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
> @@ -12,9 +12,12 @@ static int mt7996_check_eeprom(struct mt7996_dev *dev)
>  	u8 *eeprom =3D dev->mt76.eeprom.data;
>  	u16 val =3D get_unaligned_le16(eeprom);
> =20
> +#define CHECK_EEPROM_ERR(match)	(match ? 0 : -EINVAL)

I do not see the point of using this macro here, the code is so simply you =
can
use 'open code' directly.

Regards,
Lorenzo

>  	switch (val) {
>  	case 0x7990:
> -		return 0;
> +		return CHECK_EEPROM_ERR(is_mt7996(&dev->mt76));
> +	case 0x7992:
> +		return CHECK_EEPROM_ERR(is_mt7992(&dev->mt76));
>  	default:
>  		return -EINVAL;
>  	}
> @@ -22,8 +25,14 @@ static int mt7996_check_eeprom(struct mt7996_dev *dev)
> =20
>  static char *mt7996_eeprom_name(struct mt7996_dev *dev)
>  {
> -	/* reserve for future variants */
> -	return MT7996_EEPROM_DEFAULT;
> +	switch (mt76_chip(&dev->mt76)) {
> +	case 0x7990:
> +		return MT7996_EEPROM_DEFAULT;
> +	case 0x7992:
> +		return MT7992_EEPROM_DEFAULT;
> +	default:
> +		return MT7996_EEPROM_DEFAULT;
> +	}
>  }
> =20
>  static int
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers=
/net/wireless/mediatek/mt76/mt7996/mt7996.h
> index 87822663870f..5cdde28ce83f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> @@ -39,6 +39,7 @@
>  #define MT7992_ROM_PATCH		"mediatek/mt7996/mt7992_rom_patch.bin"
> =20
>  #define MT7996_EEPROM_DEFAULT		"mediatek/mt7996/mt7996_eeprom.bin"
> +#define MT7992_EEPROM_DEFAULT		"mediatek/mt7996/mt7992_eeprom.bin"
>  #define MT7996_EEPROM_SIZE		7680
>  #define MT7996_EEPROM_BLOCK_SIZE	16
>  #define MT7996_TOKEN_SIZE		16384
> --=20
> 2.39.2
>=20

--MaAtsoH7HqLGRCZk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZVIDwQAKCRA6cBh0uS2t
rDW1AQC0xxbrwxWw+jGwPj05E9g7NJUYXMwq9tiFM5NOUkhe5QD/SUev/jPEcRow
gl6SZeJ4S0JY5Bl0qEADvCZz5znCjQE=
=xB70
-----END PGP SIGNATURE-----

--MaAtsoH7HqLGRCZk--

