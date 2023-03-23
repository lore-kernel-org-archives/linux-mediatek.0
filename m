Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CBAC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HsirmLZfh83ZppZd4P6agJP7HFtClqC4IIjsTD+5gg=; b=oS0FFEQ85AP8nS2tVhn5dz6MbH
	6zH+PH9lybmVQlzH+pzgTMW6KrRew66CI1Nt9cbSnYB54afDBf8yfgxWhIXeLeKb0/JW+razj62I6
	XpiF8fnJ5YI8mdk57CJmKztaA5C8UgIFQUGnL3OsJ4vwwH0DwtiGIf4bDwMJHt7fcowEh0ZXHcXWs
	LFADVn883HPt/CI9FSHjvUceicxEHRm8jNpJPt24GH538M7GrAMhlv4pMpANb9zgdOp/fxo0veLxp
	2jlw3VES6A5dbqxdj7BUxTSCTuXC4WnT940UT80xboEdhzpMTeJ4UHuL8fTcm/mVF2p9YQCod0T6j
	qmoJzzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJTX-001mfD-0T;
	Thu, 23 Mar 2023 11:51:23 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJTT-001mdv-27;
	Thu, 23 Mar 2023 11:51:20 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3CC8C1C0E52; Thu, 23 Mar 2023 12:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1679572278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9HsirmLZfh83ZppZd4P6agJP7HFtClqC4IIjsTD+5gg=;
	b=VDzP8vhLVbiM03kiwTbrtmCkM6uJshzgOpe1AVmbiSWh2TGpW/KF04GXjaOKxmIV/ltGGQ
	NCnRqpq4S0We6kpQfMhjwu1guevbQaujqgosigcbj9iHlLkzUEDL8Y63XoAmFiH7BoqoOK
	VUM46x8HhGRih5b1WCqNvhdOYPICoL0=
Date: Thu, 23 Mar 2023 12:51:17 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Liang He <windhl@126.com>
Cc: matthias.bgg@gmail.com, gene_chen@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] leds: mt6360: Add missing fwnode_handle_put()
Message-ID: <ZBw9NXkC0mgIJhBq@duo.ucw.cz>
References: <20230322034128.1856117-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aCKLs85SJyDKK/4M"
Content-Disposition: inline
In-Reply-To: <20230322034128.1856117-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_045119_842477_B4726A15 
X-CRM114-Status: GOOD (  14.13  )
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


--aCKLs85SJyDKK/4M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In mt6360_init_isnk_properties(), we should add
> fwnode_handle_put() when break out of the iteration
> fwnode_for_each_child_node() as it will automatically
> increase and decrease the refcounter.
>=20
> Fixes: 679f8652064b ("leds: Add mt6360 driver")
> Signed-off-by: Liang He <windhl@126.com>

I believe you got indentation wrong on }.

With that fixed:

Acked-by: Pavel Machek <pavel@ucw.cz>

BR,
							Pavel

> +++ b/drivers/leds/flash/leds-mt6360.c
> @@ -637,14 +637,17 @@ static int mt6360_init_isnk_properties(struct mt636=
0_led *led,
> =20
>  			ret =3D fwnode_property_read_u32(child, "reg", &reg);
>  			if (ret || reg > MT6360_LED_ISNK3 ||
> -			    priv->leds_active & BIT(reg))
> +			    priv->leds_active & BIT(reg)) {
> +				fwnode_handle_put(child);
>  				return -EINVAL;
> +				}
> =20
>  			ret =3D fwnode_property_read_u32(child, "color", &color);
>  			if (ret) {
>  				dev_err(priv->dev,
>  					"led %d, no color specified\n",
>  					led->led_no);
> +				fwnode_handle_put(child);
>  				return ret;
>  			}
> =20

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--aCKLs85SJyDKK/4M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw9NQAKCRAw5/Bqldv6
8pWjAKCMT6x5/ny7hy/V3/9d6D/s3O4S9ACePHeL63oOu34UZFaGj3bjaEcWAHo=
=/GiA
-----END PGP SIGNATURE-----

--aCKLs85SJyDKK/4M--

