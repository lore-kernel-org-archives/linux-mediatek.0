Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D18C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8dyhIoBx2aM79WKVz+7If0G+RtNxz0htDU0hoecEfU=; b=ppOGx1NuIJV5SplXnoQimsCUPI
	NAaMt1FNYCPuk86gXmpwqXeMrxmIgXOKJO1f86Lod/pVBsrsHtQu58zeRYYTf6mgEfRY6f5T5Alap
	778UEwmEfauTvuKP5x+57du4tr/Ie8ZvoFwJNV3K12uOPZYr/IkGpVr8ijTel+GeTAJ4W9Y10rayU
	xK5934FpqTvJYunGvMWv4LuobQnIU4vZ+m1r0Ep4Fa9Lnpb9Rmr343NVh1fO6o8TRrENp4+PNpKKI
	DqX7JCQsI3OKCKDCB32mATEe3hDE4t+EeB/x1FP91UAfg+OQCJcuFM8G57huKi5f0fG6lSj2yFjVB
	WxtgVfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFH-00000002dSg-0j4F;
	Wed, 01 Jul 2026 16:57:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFG-00000002dS4-2Bhv
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 16:57:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DFC3560122;
	Wed,  1 Jul 2026 16:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D0B1F000E9;
	Wed,  1 Jul 2026 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925025;
	bh=T8dyhIoBx2aM79WKVz+7If0G+RtNxz0htDU0hoecEfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bfxbim1WIg11jZZZcTS4ZN12zcgxqp4nxJ1z00DdCwnHA2AKxKqixUhSn/pbul0yB
	 PmdRzWDzNAuSZF5bpF3Hj9dKgVLte3Mm0q+teOuteR6fsxnxUH4CIHxacK+p7V+Tgi
	 oObwlnShJ/opsw0uFXRQcwMw49uzx2jg/Z1S7vrO6Bm7q10CuEZ56II33QENwRtSa7
	 rf1jrJGuYLL0rQxSeSu4znEb86mKEudH03XVFkP0ExBInTvU8mEqGYiKtxUPsGSZre
	 mGl3lxM7s8a8t87zPOOcDrzPoIp5zoFsXzMhUUeAb73BqnsJ8ERADexqBZEiOWXYaU
	 CzUlkPC4b5n2g==
Date: Wed, 1 Jul 2026 17:57:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alice Chao =?utf-8?B?KOi2meePruWdhyk=?= <Alice.Chao@mediatek.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
	"linux-devicetree@vger.kernel.org" <linux-devicetree@vger.kernel.org>,
	Naomi Chu =?utf-8?B?KOacseipoOeUsCk=?= <Naomi.Chu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
Message-ID: <20260701-city-during-7d76a326f2f4@spud>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
 <20260626074820.2537772-2-peter.wang@mediatek.com>
 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
 <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GId5WCsW6pNoW8dq"
Content-Disposition: inline
In-Reply-To: <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
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

--GId5WCsW6pNoW8dq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 06:35:20AM +0000, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=
=8F=8B) wrote:
> On Fri, 2026-06-26 at 10:33 +0200, Philipp Zabel wrote
> >=20
> > Where is the binding doc for mediatek,mt8183-ufs0cfg_ao? Is this
> > simple-mfd just to load the reset driver?
> >=20
>=20
> Hi Philipp,
>=20
> Thanks for the review, and sorry for the late reply.
> Yes, "mediatek,mt8183-ufs0cfg_ao" should be removed.
> I will remove it in the next version.
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x16840000 0x100=
0>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ufs0cfgao_rst: reset-cont=
roller {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
ompatible =3D "mediatek,syscon-reset";
> >=20
> > It looks to me like this is just two registers inside ufs0cfg_ao, not
> > a
> > separate device. Why don't you just add #reset-cells to the parent
> > node?
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=
reset-cells =3D <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m=
ediatek,reset-bits =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 <0x48=C2=A0 3=C2=A0 0x4c=C2=A0 3=C2=A0 100>,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 <0x148 0=C2=A0 0x14c 0=C2=A0 100>,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 <0x148 1=C2=A0 0x14c 1=C2=A0 100>,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 <0x148 2=C2=A0 0x14c 2=C2=A0 0>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >=20
> > Why is this in DT? This should be a table in the reset driver.
> >=20
> > regards
> > Philipp
>=20
> Regarding the child node and reset-bits in DT,
> We chose the child node approach with 'mediatek,reset-bits' defined=20
> in DT to keep the reset line descriptions self-contained and reusable=20
> across different SoC variants. MediaTek has many SoCs (mt8183, mt6985,=20
> mt6989, ...) where the same UFS subsystem may have different register=20
> offsets for reset lines. By describing them in DT, we can support new=20
> SoC variants by updating the DT alone, without requiring a new driver=20
> patch for every new SoC.

=46rom what I recall, mediatek ufs is a mess with lots of vendor kernel
type things slipping into mainline without proper review on the DT
front.
Because of that, I at least am going to require that everything is done
completely (and perhaps excessively) by the book here, including
introducing complete bindings for syscon regions rather than partial
bits for components like this one.

> This approach is also consistent with the existing 'ti,syscon-reset'=20
> binding, which uses a similar per-entry table property 'ti,reset-bits'=20
> to describe reset lines within a syscon block.

This was done about 10 years ago, I would not consider it a guide for
what's acceptable today.

Thanks,
Conor.

--GId5WCsW6pNoW8dq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVG3AAKCRB4tDGHoIJi
0oN8AQDM3qO2i7ZlMMw+JnJETVJwlg6ATI/v6v4nFmWDqMQt0wEAj+YOzxqvq8Gj
S0GCE6Sq2uYX+59AWwWx3TInToTLWAM=
=+gFw
-----END PGP SIGNATURE-----

--GId5WCsW6pNoW8dq--

