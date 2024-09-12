Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745E6EEB560
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=940rzrx84UZ4uwyjQUlSj1calh9VJe1wTBINP0zmbY8=; b=ozHop8jqExlf09nvkd4SHF8ebj
	LDDR/S+kq1k21bS6F2AKpkoXDwXgT9qAzYbv5uTfM401oucwX0MUmosFX0E894itc6/BNjeyOai7q
	RPOABZX4xr/CGbSNbQ8Va2WJE8gTxv2x7F6VzI2SC7AkXdIsWGA1+pIZ8Aw0qcEUuaRQ+0q9LpfVK
	sDsfGUyXHcn5AKm4gCE189wsKJcGv0HUO7GAN0vtgAHdtXM3vQJzo2duDg3J5BmAAM6YkgHRBckbr
	nsr+TyDGmkmwsZ/6S0u6mOkTjfo9Hf2byG6l+EMYVfeTXzPK5LNWpqZ3ENoqUt8YSiyY0fNGKwLrL
	ByCC8I4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofCG-0000000CNfV-2PY2;
	Thu, 12 Sep 2024 08:29:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofC2-0000000CNcI-3mLd;
	Thu, 12 Sep 2024 08:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726129727; x=1757665727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Ddv7HUWuYQvmUZWtwWJeKEmMDUpqmgyTgmsWwrISAM=;
  b=OSHqFeotgO28xatVqat7ydlOhmMSEPMuGLO2sd/+BVXEMnDkVv5gPXqg
   In9HBgdVUiY4sdA6dYEQslBK3pJ4xd1DF54dpUREDTiwD8Uj6ajQ0dRa8
   KUsJpFOkFWXsSijXs9Kf/S1QvSnaFW0/dACcYPKDsHDa9E4kgVENlLtgF
   qz8EVbo/9rT98561yCit+4OWeOZWcGf+as+x70sHF2cLfrG1H2Bp4nRj5
   MmVNx/qcbHtgqUu6f263nVRM/ZdoCuxRBO7tRyKryT3HjmYzf5uyneFlo
   RTN/EKVpZX5Wjx1FKq1h/5LOYmMjaBhWjnLeFX8V8Z0iYkA87cay6wJ2m
   w==;
X-CSE-ConnectionGUID: T7JnfdXURN2u+9KF+BrmJA==
X-CSE-MsgGUID: /5FdtCw2ReGk+R3+EKNFcg==
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="asc'?scan'208";a="31689468"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 01:28:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 01:28:05 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 12 Sep 2024 01:28:03 -0700
Date: Thu, 12 Sep 2024 09:27:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Stop
 requiring clock-names
Message-ID: <20240912-unsaddle-rubbing-9aedc46c024b@wendy>
References: <20240911104327.123602-1-angelogioacchino.delregno@collabora.com>
 <20240911-unhappy-wifi-b0a851e261bb@spud>
 <01020191e53e7670-d04af181-0137-4f35-962e-2f1119d026df-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EYD/Iv1Qa4+YYkTp"
Content-Disposition: inline
In-Reply-To: <01020191e53e7670-d04af181-0137-4f35-962e-2f1119d026df-000000@eu-west-1.amazonses.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_012846_983181_986665CA 
X-CRM114-Status: GOOD (  20.29  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--EYD/Iv1Qa4+YYkTp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 07:59:21AM +0000, AngeloGioacchino Del Regno wrote:
> Il 11/09/24 19:51, Conor Dooley ha scritto:
> > On Wed, Sep 11, 2024 at 12:43:27PM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > There is no reason to make specifying the clock-names property
> > > mandatory, as the Global Command Engine HW needs only one clock.
> >=20
> > Have you checked to make sure that there are no users that do the lookup
> > by name?
> >=20
>=20
> It's just that I didn't want to mention any "driver" word in the commit d=
escription
> for a binding ;-)
>=20
> (Of course I did, and the driver is not doing any by_name lookup)

It's fine to mention drivers in this case, it'd save us asking. Given
your choice of article, is the gce-mailbox not used outside of the
kernel?

>=20
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > ---
> > >   .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 --------=
---
> > >   1 file changed, 11 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-m=
ailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbo=
x.yaml
> > > index cef9d7601398..ff5d010fbcf0 100644
> > > --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.=
yaml
> > > +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.=
yaml
> > > @@ -56,17 +56,6 @@ required:
> > >     - interrupts
> > >     - clocks
> > > -allOf:
> > > -  - if:
> > > -      not:
> > > -        properties:
> > > -          compatible:
> > > -            contains:
> > > -              const: mediatek,mt8195-gce
> > > -    then:
> > > -      required:
> > > -        - clock-names
> > > -
> > >   additionalProperties: false
> > >   examples:
> > > --=20
> > > 2.46.0
> > >=20
>=20
>=20

--EYD/Iv1Qa4+YYkTp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuKl4wAKCRB4tDGHoIJi
0tumAP943qZFgBuFVe+btsj1qTbWlXxCqsq4MWQNp77G2A6MbwEA1XQp6AQftUQi
i/4Z6mryf6pc/ploLFfLEnuNprWc/g4=
=ZrkD
-----END PGP SIGNATURE-----

--EYD/Iv1Qa4+YYkTp--

