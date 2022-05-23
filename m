Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A892C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MB2EyeBdJjUfApvmInWEQZb40EP725HZIdNGww00ueU=; b=ekKfygl9OfpzKeIbx8pLHGHMUQ
	5uvif8ALZwIVsGdNiZqbTy7guXiUNSXaJEz4XF+9Plk9mqJqnfayrOjkx9jJN81e5ZWKfKWh7J2dH
	b1JjyS5xk+K0z+ZBjaX4neLcVyKVvShLJZVFTmZfo3VP3GlUM0I51iPdG5vafRYOgStd3lBYY+WJM
	i9HSzMDCuksNKoQXTNWPer6OSEFGVoQQvOSwgDoCfZ2PoJNACGnfQxHy/VstKc05Uh2pebmWpNVD/
	yhrnLe52JN6XwN0cL/lVZiUo5Y1p1TQ+ksIAqVXl0S8bPnYV9KCOLj7hQrKkYJHcubdTCl56/ENfs
	UyY+N5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7g3-004JA0-Fx; Mon, 23 May 2022 13:00:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt7fs-004J7q-N3; Mon, 23 May 2022 13:00:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB7C061344;
 Mon, 23 May 2022 13:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9BDC385A9;
 Mon, 23 May 2022 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653310839;
 bh=0gJAhDWK23rUCBEAT34CY4awugOC65Cdzpv/yAHbc7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kvm3v85Z6Fv+WogPmdKKfh3PQ36Ep86EwiFoAJsMmlPnVDmEKSnbaoVXbD+mjuCbR
 7pVZ+OD+zZ6r2qmQ/jY+r4AOsPjfvQ/YJUWrKfxKSX52Wd/FG0clmH1Ew0vASF0kYj
 zR90qdJyWkxltZQqCpOmgNgpWn9qxiEfIOb04TjwXYVQJJv80Ah0KkmSGSD26cjw7L
 iKrBXWjokUFPC4ZvISgEpvBp0NZKXeftsNMe7eXtqzoD++yvvrtyLwDyfNTSDq7L93
 SrZRxRQIbU6BELoDxcDp9N+IPb3T3iQU94Cmyv/++EDAFtRubC8Wolmh+A4ZFKSkxd
 pkICzjHhbkFpA==
Date: Mon, 23 May 2022 14:00:33 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] regulator: Add driver for MT6331 PMIC regulators
Message-ID: <YouFcSapkVC7ZfuP@sirena.org.uk>
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
 <20220520133305.265310-3-angelogioacchino.delregno@collabora.com>
 <YoepiTUfdhkYByo7@sirena.org.uk>
 <6cc68be9-e509-eae4-801d-997fdc01dcf2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <6cc68be9-e509-eae4-801d-997fdc01dcf2@collabora.com>
X-Cookie: Sales tax applies.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_060040_884100_C8F33AA0 
X-CRM114-Status: GOOD (  22.84  )
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
Content-Type: multipart/mixed; boundary="===============8749281317481485731=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8749281317481485731==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zrq/BafcBysX3uNy"
Content-Disposition: inline


--zrq/BafcBysX3uNy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 02:49:19PM +0200, AngeloGioacchino Del Regno wrote:
> Il 20/05/22 16:45, Mark Brown ha scritto:
> > On Fri, May 20, 2022 at 03:33:03PM +0200, AngeloGioacchino Del Regno wr=
ote:

> > > +static const unsigned int ldo_volt_table10[] =3D {
> > > +	1200000, 1300000, 1500000, 1800000,
> > > +	1200000, 1300000, 1500000, 1800000,
> > > +	1200000, 1300000, 1500000, 1800000,
> > > +	1200000, 1300000, 1500000, 1800000,
> > > +};

> > So the top bits of the voltate selection field just get ignored?  Might
> > be easier to just write the code to not include the top bits.
> >=20

> No, they're all valid values for real... but I guess that I can simplify
> this voltage table by simply modifying the bitmask that we use for the
> regulators that are using this table....

Right, my point here is that it looks awfully like the documentation
(this came from documentation I guess?) is including some extra bits
that get ignored in the voltage selection field here.  That seems like a
weird choice somewhere along the line.

> > > +	if (info->qi > 0) {
> > > +		reg =3D info->desc.enable_reg;
> > > +		en_mask =3D info->qi;

> > If the regulator doesn't have status readback it shouldn't provide a
> > get_status() operation.

> What I've understood is that when there's no "QI" flag, the enable regist=
er
> will provide the regulator status (EN/DIS) acting like QI, that's why I've
> added that if branch...

> Anyway, I'll recheck this part before sending the next version!

That would be fairly unusual, often a regulator won't even detect when
it's gone out of regulation.

--zrq/BafcBysX3uNy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKLhXEACgkQJNaLcl1U
h9A4gAf/S2iKtIJE+f3lzVnAs3dpnbYYgTd2ZdrDVFtyW/cH6sKeRTKVzvHefnRc
t3SVVtMNVJ2TZNiO+p1WAm9qU/X1Z1QCsnD+8fqRl5GdVHLLcZCbajSb661dRKYg
mg9WRUMZ66mk6o8F3mU1v1Ov5oitF2ng4hT9GLseXXyaLKd/72OwO/yhzLItjUWN
IQmSkytWOrEJIUjDQcvzBkCIREMjOKASkpwfkVN0h08n5GoedQ/DrQL/hQ/vojrh
Jc3FdWtaYWIxa9bUCOPWMAkJPvxS8BE1xkOxrS+I/BnD66WTigrlJRdnsIEy1XzJ
51w8eBJpVpXGsRyh2h3SzY0hPouSHg==
=YULk
-----END PGP SIGNATURE-----

--zrq/BafcBysX3uNy--


--===============8749281317481485731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8749281317481485731==--

