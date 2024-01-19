Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEB3C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rgpj/WyGxjbz8QxyiyWSdyIEmUlrrjtX5pv/jBfu/cE=; b=WdFxAJmfMTYGn2mwjnmvNwdNuK
	VRFJIM/BX6ubzoCPVPL/Se60sMqN9pyWAKWe1sMQBzjVOXptxSkkdHSwjP6R/4Wbe2CLbbdlMSkBu
	RZ4z9Q5HwY8ftkTbc+zJKSDBUpYJ4vmTW1DaBPu5NQ1v5BMUOv4EfNx1FxsPoACGAWyCKMluAiSvL
	BICrFWD/6+CJs8jckjUEZNWnSzOCH9K5rlInY/XyZEDfUEvIXkqJUrCPiTa1dRWRTI/hlOvcWTJrP
	S/GKcKwpDfbPwMLKemGu5DM0QIrRGyzDz279KC+FeR6LMXZcz6LUcYzHeJvCG7fpXpw2jXnQyayL2
	5V1q0oFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsIu-006Cqv-2e;
	Fri, 19 Jan 2024 17:05:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsIq-006Coy-3C;
	Fri, 19 Jan 2024 17:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E895619F1;
	Fri, 19 Jan 2024 17:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F17C433C7;
	Fri, 19 Jan 2024 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705683882;
	bh=tvfI8kzKELJg8x51eYsi4QeGQs90pS6wbtnENBmug60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSXISuze5qHDFLd+8VIc670Qh4sfOq0Q9HsJU09eHWdo6qBL7KyIFvRN2hMPNHC9e
	 nzytI2kZ3IeSWiAJ5mOsLjDjIrb+/C9B6vdVWUBGoiLP/M4Irl7kQpf5QmGvM/N3uJ
	 n5HJ/AXMY+SxfLpeBQHGjk8ljy23nTkpZDvTxjYWggOytjqPJJnw+UREkmID1xhhAb
	 UdsCtNvnu7laUhbyDOU8nJKxaN4vm3Rx5FET/e8eIj0RcUgt2p1djP+DUI2Pva1Bpb
	 KYJ9Pp0e8//x5vSyoCLH0qCmBEGJl7HcQPzvqzUKwPIx5DQNMxZvhNaYLqeqqUsKCi
	 aKCikeAxBareA==
Date: Fri, 19 Jan 2024 17:04:36 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: Aw: Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add MT7988
 reset IDs
Message-ID: <20240119-dupe-obligate-707b3a01b356@spud>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
 <20240118-calcium-krypton-3c787b8d1912@spud>
 <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21>
 <43f946cc-07e1-48c5-9b31-40fc9bc93037@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hqUNFAuri8IfMYKy"
Content-Disposition: inline
In-Reply-To: <43f946cc-07e1-48c5-9b31-40fc9bc93037@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_090513_125563_3DA000B5 
X-CRM114-Status: GOOD (  34.95  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--hqUNFAuri8IfMYKy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 10:28:30AM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/01/24 23:00, Frank Wunderlich ha scritto:
> > > Gesendet: Donnerstag, 18. Januar 2024 um 17:49 Uhr
> > > Von: "Conor Dooley" <conor@kernel.org>
> > > On Wed, Jan 17, 2024 at 07:41:10PM +0100, Frank Wunderlich wrote:
> > > > From: Frank Wunderlich <frank-w@public-files.de>
> > > >=20
> > > > Add reset constants for using as index in driver and dts.
> > > >=20
> > > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > > ---
> > > > v3:
> > > > - add pcie reset id as suggested by angelo
> > > >=20
> > > > v2:
> > > >   - add missing commit message and SoB
> > > >   - change value of infrareset to 0
> > > > ---
> > > >   include/dt-bindings/reset/mediatek,mt7988-resets.h | 6 ++++++
> > > >   1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/i=
nclude/dt-bindings/reset/mediatek,mt7988-resets.h
> > > > index 493301971367..0eb152889a89 100644
> > > > --- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
> > > > +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> > > > @@ -10,4 +10,10 @@
> > > >   /* ETHWARP resets */
> > > >   #define MT7988_ETHWARP_RST_SWITCH		0
> > > >=20
> > > > +/* INFRA resets */
> > > > +#define MT7988_INFRA_RST0_PEXTP_MAC_SWRST	0
> > > > +#define MT7988_INFRA_RST1_THERM_CTRL_SWRST	1
> > >=20
> > > These are just "random" numbers, why not continue the numbering from =
the
> > > ETHWARP?
> >=20
> > i can do...basicly these consts are used in DTS and driver only as inde=
x.
> >=20
> > @angelo what do you think? I though also in leaving some space to allow=
 grouping RST0 and RST1
> > when more consts are added, else the numbers are mixed up.
> >=20
> > so e.g. let RST0 start at 20 and RST1 at 40 (or even higher, because RS=
T0 and RST1 can have up to 32 resets).
> > That will allow adding more reset constants between my values and havin=
g raising numbers.
>=20
> The resets are organized on a per-reset-controller basis, so, the ETHWARP
> reset controller's first reset is RST_SWITCH, the second one is RST_somet=
hing_else,
> etc. while the first reset of the INFRA reset controller is PEXTP_MAC_SWR=
ST.
>=20
> That's why ETHWARP has a reset index 0 and INFRA also starts at 0.
> I think that the numbering is good as it is, and having one driver start =
at index 5
> while the other starts at index 12 would only overcomplicate registering =
the resets
> in each driver, or waste bytes by making unnecessarily large arrays, for =
(imo) no
> good reason.
>=20
> This is one header, but it should "in theory" be more than one... so we w=
ould have
> one for each hardware block - but that'd make the reset directory over-cr=
owded, as
> other MediaTek SoCs have got even more resets in even more hardware block=
s than the
> MT7988. That'd be something like ~4 reset headers per SoC (and will incre=
ase with
> newer ones)...
> ...and this is why we have one binding header for resets.

That's okay. The commit message leaves me, who clearly isn't a mediatek
guy, with no information as to why these are not one contiguous set.
IMO being for different reset controllers entirely is fine.

> On the topic of leaving space to allow grouping RST0/RST1: -> No. <-
> The indices have to start from zero and have to be sequential, with no ho=
les.

Agreed.

--hqUNFAuri8IfMYKy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqrpAAKCRB4tDGHoIJi
0kpNAP0fXJ5CKQv/dcdDfDwM6QxpaHDnXco2vvD9zatS35PP3QEAyXeJjQ1mosMC
HzNIVUEk3x7CKsrxFYlJvszPHJz8fAs=
=leay
-----END PGP SIGNATURE-----

--hqUNFAuri8IfMYKy--

