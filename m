Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A4AD4A609
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKurUME4YS2BVszRjYYC0NWUzeV6+9di6peqfi0lzbc=; b=AadXy7FQXuPBWz80q6bLIvqCeI
	F3LRg6tRLZgy4eUhLnemCWrUm1bN91TrfTTe0YmNyLVSlTC8Cn34TAys9JgF82ifHFKBNYsficEcz
	FTuGCrv+87sU9mrp2u6xq56YrdE/oY8ZtBCYLp21qh6J40m8+OTeiia6aeZdXTtiJ+6iRtzXedDyu
	WVa5C3nYHmtOrZmhWBVR1cuSbUb9pQSvvqiZOb+4S7Y2Flsp5pVdsHUMVvv5NndBVUTHbVyfNObuw
	FTruJJDQp7FbiGNohl0owtqX3PeTfEgIkBgd/6IeuAe6DO7mouuZzClPf/2HxNNIz2CQbE+WteUSX
	zpwOZJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfrJ-0000000DpaZ-196v;
	Fri, 16 Jan 2026 09:11:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfr9-0000000DpYd-0QCn;
	Fri, 16 Jan 2026 09:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 499F543764;
	Fri, 16 Jan 2026 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A132AC116C6;
	Fri, 16 Jan 2026 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554658;
	bh=stl7/CP6JCG8jmbUK6mwEvwFy7pTD9LimJyd3DE5WK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKmdBb+xW2DBTd1gCyEX7u7xUcH5iyamHBGpxfFcrRWccPBBsfy034lA7Flp4bBOb
	 wDSVYwcAyyFxuFPj45/yQNZst5ASyYLQL+SKXvt1NWn0LV/GROec4Fj/t6tEZnJFBK
	 0CEfZJJmYCavgDaQ/bNZGXNKsL6u4oW80rq6XXHLfJcZwgvT2m2zDg93RG65h5p/1L
	 ELBSm1zkXf0C9opNnVV28BrPrIALB9WVR6YsJ0eXBLBCf88euyRXFa1l70tvbr6d9i
	 pNPwqjTI67n5FIO36k3dlW9AfvHIC6u4JIMnvgMKJ3EZFPSxCadIJdw+6svPBKjE0v
	 KNPEeQ1DNHaKQ==
Date: Fri, 16 Jan 2026 10:10:55 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
Message-ID: <aWoAnwF4JhMshN1H@lore-desk>
References: <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
 <aWfdY53PQPcqTpYv@lore-desk>
 <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
 <aWgaHqXylN2eyS5R@lore-desk>
 <13947d52-b50d-425e-b06d-772242c75153@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GrcIY/mecD2UcAwp"
Content-Disposition: inline
In-Reply-To: <13947d52-b50d-425e-b06d-772242c75153@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_011059_191192_C27A6E52 
X-CRM114-Status: GOOD (  24.52  )
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


--GrcIY/mecD2UcAwp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Jan 14, 2026 at 11:35:10PM +0100, Lorenzo Bianconi wrote:
> > > > In the current codebase the NPU driver does not need to access the =
WiFi PCIe
> > > > slot (or any other external device) since the offloading (wired and=
 wireless)
> > > > is fully managed by the NPU chip (hw + firmware binaries).
> > >=20
> > > Are you saying the NPU itself enumerates the PCI busses and finds the
> > > WiFi device?  If it can do that, why not ask it which PCI device it is
> > > using?
> >=20
> > nope, we do not need any PCI enumeration in the NPU driver at the moment
> > (please see below).
> >=20
> > >=20
> > > Or this the PCI slot to use somehow embedded within the firmware?
> >=20
> > in the current implementation the NPU driver does not need any referenc=
e to
> > WiFi or Ethernet devices. The NPU exports offloading APIs to consumer d=
evices
> > (e.g. WiFi or Ethernet devices). In particular,
> > 1- during NPU module probe, the NPU driver configures NPU hw registers =
and
> >    loads the NPU firmware binaries.
> > 2- NPU consumers (ethernet and/or wifi devices) get a reference to the =
NPU
> >    device via device-tree in order to consume NPU APIs for offloading.
> > 3- netfilter flowtable offloads traffic to the selected ethernet and/or=
 WiFi
> >    device that runs the NPU APIs accessible via the NPU reference obtai=
ned via
> >    dts.
> >=20
> > The issue here is the NPU firmware binaries for EN7581, loaded by the N=
PU
> > driver during NPU probe and used for offloading, depend on the WiFi chi=
pset
> > (e.g. MT7996 or MT7992) available on the EN7581 board (we have two diff=
erent
> > NPU binaries for MT7996 offloading and for MT7992 offloading).
>=20
> Maybe i'm getting the NPU wrong, but i assumed it was directly talking
> to the Ethernet and WiFi device on the PCIe bus, bypassing the host?

correct

> If so, it most somehow know what PCIe slots these devices use?

I have low visibility on the NPU hw internals but I do not think there are
any registers in NPU mmio memory where we can read this info, but I will
confirm it (please remember the fw binaries are not load yet).

Regards,
Lorenzo

>=20
>    Andrew

--GrcIY/mecD2UcAwp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWoAnwAKCRA6cBh0uS2t
rAv4AQDILUAs5QRGF9kT+2W49Tk8wLiz1kdJI3O1IJdVlVFzPAEAuUAKHZtMDk/P
Gu6U2I5rbMpy7HAsiTWVDUCCX5uN3wQ=
=UTz0
-----END PGP SIGNATURE-----

--GrcIY/mecD2UcAwp--

