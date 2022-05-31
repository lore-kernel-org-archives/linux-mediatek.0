Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC892C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDY/VJXjA13wRPH3boJNWz8GQ/kEvggpVW3x7L4zaqo=; b=jE819bnZT4xakbsx0mGvasXhq6
	GmrwD7dqYqhfAB6O5/gEHBDYEXFPzsU84N2If5xP3cXWx4A+udf+/gzAAua/4cWBtB3XG38jSPKkT
	35xL+e9VFFYpHbECrqNDete/xjEA4llKA+HxQyyVCFmu8E4/hLo5bdMT8WZWErBXgRhnTPSfVSWgu
	6CvICce+0rvGVQKF/jgyXvRVxtGt0DnSsVJ/dRDDPHR/xbmNlBNu0K9AJ3NxKuVWk9vVfAfqEkYih
	bRGzoU/WYVqxFNQ9pNajrr/1O1mKqTGh03i8HEIAQlYysudcmh1b+eIty+G1fMyzsM4OSD+MO9S+x
	oKwJuq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Xu-00AxIJ-Qq; Tue, 31 May 2022 13:04:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Xb-00Ax9w-Fi; Tue, 31 May 2022 13:04:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07209B8111F;
	Tue, 31 May 2022 13:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60646C385A9;
	Tue, 31 May 2022 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654002243;
	bh=0Ux74kZP49E3YbCl20ju4zIzBeNZ/Ros6AInPhoDENQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZW7s/PF4yAgeLtWttmOgQCIS1YYb9dBzCiXL5APIa9J/GgRgR4AeLk9GAyZZWvnj
	 9kkYR1Ke43JwJf/XQ/PhyWemn9c/+Mkc6IMM1EZXnbigTQNTZleVX4+3sOv2J2nNJd
	 0+Vp0BYAS7x0ZbqXLnKfOpSNVNjvGuqzgE72mztTyO+d1YXP5BchrTAdfN86kjz8ix
	 I1rIR7U5bGBPclNfHRdi4yX6Mhs109UilJGAJpn9VVhfcFbJk2BbzeNkwfNXENmOEn
	 fV1WMeAVtsbyxxLHruosw9cvhTxbUFutvzbpspEE1PQU6Uz8sU+gj4Ai7K52Y0fli8
	 Qv1GxAodBiWKw==
Date: Tue, 31 May 2022 15:04:01 +0200
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/7] regulator: add mt6357 regulator
Message-ID: <YpYSQXWU1NlM4JU6@sirena.org.uk>
References: <20220531124959.202787-1-fparent@baylibre.com>
 <20220531124959.202787-7-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220531124959.202787-7-fparent@baylibre.com>
X-Cookie: May your camel be as swift as the wind.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_060407_895723_66138D48 
X-CRM114-Status: GOOD (  20.68  )
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
Content-Type: multipart/mixed; boundary="===============7761377780990839181=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7761377780990839181==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kIfQMFAkV/8CDKUj"
Content-Disposition: inline


--kIfQMFAkV/8CDKUj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 02:49:58PM +0200, Fabien Parent wrote:

> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2022 BayLibre, SAS.
> + * Author: Chen Zhong <chen.zhong@mediatek.com>
> + * Author: Fabien Parent <fparent@baylibre.com>
> + *
> + * Based on mt6397-regulator.c
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static int mt6357_set_voltage_sel(struct regulator_dev *rdev,
> +				  unsigned int selector)
> +{
> +	int idx, ret;
> +	const u32 *pvol;
> +	struct mt6357_regulator_info *info =3D rdev_get_drvdata(rdev);
> +
> +	pvol =3D info->index_table;
> +
> +	idx =3D pvol[selector];
> +	ret =3D regmap_update_bits(rdev->regmap, info->desc.vsel_reg,
> +				 info->desc.vsel_mask,
> +				 idx << 8);
> +
> +	return ret;
> +}

I don't really understand what's going on with selectors here -
the general idea with selectors is that we just pass the value
that's written to the bitfield around and have mapping functions
which convert to/from voltages.  Here we're mapping the selectors
using this index_table thing which seems like an extra layer of
mapping.  What's the story there? =20

I don't see why this can't just use the functions in helpers.c.
It looks like you can use _list_voltage_table() -EINVALs in there
for invalid selectors and _map_voltage_iterate().  Note that
n_voltages is effectively a maximum selector.

> +static int mt6357_get_buck_voltage_sel(struct regulator_dev *rdev)
> +{
> +	int ret, regval;
> +	struct mt6357_regulator_info *info =3D rdev_get_drvdata(rdev);
> +
> +	ret =3D regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
> +	if (ret !=3D 0) {
> +		dev_err(&rdev->dev,
> +			"Failed to get mt6357 Buck %s vsel reg: %d\n",
> +			info->desc.name, ret);
> +		return ret;
> +	}
> +
> +	ret =3D (regval & info->da_vsel_mask) >> info->da_vsel_shift;
> +
> +	return ret;
> +}

This looks like it should just be able to use
regulator_get_voltage_sel_regmap()?

Otherwise this looks good.

--kIfQMFAkV/8CDKUj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKWEkAACgkQJNaLcl1U
h9BZdwf/cfDz6z011Xt84Qvyn1gUqxQbUzfzZ9sYn1UGCW8nNjSG+gPxhFW4G96z
Rsf3+4t6lLUho+QjpQRkEOZE9oIFJ9Q6XTW5pGVLTyF0y9PZfPnZPlx8wN+A0az6
FTAlTeMOTRavOWXqELiHJOlgsUWRQhhF/goE3yV1fPD0wYyAwLVzsEr6VplUQTjc
C+liXmRbQ60diYmWpVat2WMXIpAG4b2ydY4Y3p16X9HkuXAKHCtBpBO4auF+JZ1h
OEs8vssSyyOL/Wiv2xLd8MDFxZ56PJtFK2DO0T4/wi51fyr5EsqSq3Ef8AvQUjqf
SWmRg28+1AkZVrxj+z+pXqKo0jH8Cg==
=zuw/
-----END PGP SIGNATURE-----

--kIfQMFAkV/8CDKUj--


--===============7761377780990839181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7761377780990839181==--

