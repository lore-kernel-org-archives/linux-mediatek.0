Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71318C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c43VHi95UXs4P2UXWevu2PAmgfr0NQoWYxYVTNBlZhc=; b=mQqJngKaJ70J0w5NBnhvRzeYkx
	iPqrt3HZAzTOqLWncKq7GzJMgOqwCxzwECXCIJ+FVlcwQ2nMpwSzvaO0nxEd47hrGQM+AUIKJkCfV
	PkOswaMx3Xiac2HzSBL3yW1rTaDP5lVgaASSbaiZ2ujj2767bxqf90gqz/gQWiJmPsQGA3zSj8ep6
	CR9zj6gqMDKoa/ttpN70SWTJcd8W/mVi//ERGDdfgmSHmlUW8w2h0beXkhn02Ud6sA7INzKf+7Gyk
	2QB1eRQMFScw5bn0ScIADFau+Jwmmb72VaqmPQiHgFWhvZubAxBz3PwteCrO65ljh9XQrJ3ScB63/
	ePoo5IWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeLL-0000000FHZE-03hF;
	Fri, 05 Jul 2024 08:30:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeL6-0000000FHYE-04SQ;
	Fri, 05 Jul 2024 08:30:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BC6862A91;
	Fri,  5 Jul 2024 08:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FA6C116B1;
	Fri,  5 Jul 2024 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720168242;
	bh=9hcUZs/A+MJEANUcuyHjoQ2lOAGFVvVsvuftLkazFuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtoBmJAgZle8hB/hOKsIGYYoOP97hqjfxkLz+qZjM76ygraVyo/3qJQqPasr+PaGS
	 vTSiJIUl6/SmV35RD0qK2MwVnCMA43p8kHwjJyYZUhATcSgaWYFE6cOMwBAVtk7Dmt
	 WbJL1/B2YUakB5jtSjf7TwO1/HNr2IQreb3zDYexqc+qyTPpJxfaFll5WZViRBtPk5
	 6Znte+ZGGzWO5gWWAFT9aGpWspvFk1S6RRSI9z86OlAU2fSr4+JG4tFarSuNFZQ24i
	 hwfbb1OfWYTw8LZY4yW9jpprrlOo7bsXRz4ljVr1qVWkZ0aHxkvrI4vc2YsrkFN5Oy
	 fRf0s6ho6fO9w==
Date: Fri, 5 Jul 2024 10:30:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i2c@vger.kernel.org, sr@denx.de, andi.shyti@kernel.org,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	upstream@airoha.com, benjamin.larsson@genexis.eu
Subject: Re: [PATCH 2/2] i2c: mt7621: make device_reset optional
Message-ID: <ZoevL9XaIWn2AvFm@lore-desk>
References: <cover.1720130844.git.lorenzo@kernel.org>
 <3ea697be239c450cbc622f3e2e9dff8bf17515c0.1720130844.git.lorenzo@kernel.org>
 <b402896c-6b91-4973-9e4f-8d1f7128afdc@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qWGuLQzavc0AqsjT"
Content-Disposition: inline
In-Reply-To: <b402896c-6b91-4973-9e4f-8d1f7128afdc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_013044_212767_F0F7DD47 
X-CRM114-Status: GOOD (  27.03  )
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


--qWGuLQzavc0AqsjT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 05/07/24 00:16, Lorenzo Bianconi ha scritto:
> > Rely on device_reset_optional() instead of device_reset() in
> > mtk_i2c_reset routine since Airoha EN7581 reset controller does not
> > implement the reset callback and device reset is not mandatory on this
>=20
> Not mandatory means that the reset line for I2C exists, but you don't want
> to use it? If so, that's not right.

ack, it was not so clear, sorry for that. What I mean with "not mandatory" =
is
the mt7621 i2c controller works on EN7581 SoC even w/o this reset configura=
tion.

>=20
> On the other hand, if there is an issue with using that reset line and you
> want to avoid using it for a good reason, please describe it into the com=
mit
> description and - in that case, you'll have to add a EN7581 compatible and
> code to avoid calling device_reset() on that SoC.

what I mean is device_reset() will call .reset() callback of reset APIs. EN=
7581
reset driver does not implemetn this callback, just .assert() and .deassert=
()
(I think the hw does not support the reset line automatic re-arm) so the ca=
ll to
device_reset() will always fails. Maybe a possible approach would be adding
in the reset driver something like:

en7581_reset() {
    en7581_assert();
    msleep(x);
    en7581_deassert();
    msleep(x);
}

What do you think? It seems a bit hacky to me and I am not sure what would =
be the
right delay in this case.

Regards,
Lorenzo

>=20
> What you're doing here is removing an error log on SoCs that do *need* th=
at
> reset line to be in place, so, hiding a problem that could be causing oth=
er
> issues on peripherals connected to the I2C bus of those other SoCs.
>=20
> Cheers,
> Angelo
>=20
> > SoC. This will remove the following log:
> >=20
> > i2c-mt7621 1fbf8000.i2c0: I2C reset failed!
> >=20
> > Tested-by: Ray Liu <ray.liu@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/i2c/busses/i2c-mt7621.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-m=
t7621.c
> > index 81d46169bc1f..8cd89a2f59df 100644
> > --- a/drivers/i2c/busses/i2c-mt7621.c
> > +++ b/drivers/i2c/busses/i2c-mt7621.c
> > @@ -85,7 +85,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
> >   {
> >   	int ret;
> > -	ret =3D device_reset(i2c->adap.dev.parent);
> > +	ret =3D device_reset_optional(i2c->adap.dev.parent);
> >   	if (ret)
> >   		dev_err(i2c->dev, "I2C reset failed!\n");
>=20
>=20

--qWGuLQzavc0AqsjT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZoevLwAKCRA6cBh0uS2t
rFLKAPoCcGjfQ2AxTtEEvP+EYpVE0hRg/zDrFjdXREan8uuMTgD/UCpZqMHpwHLg
KjnmRGoc2Y1UOrlEbDiGtHzrLQY2yAA=
=xgRt
-----END PGP SIGNATURE-----

--qWGuLQzavc0AqsjT--

