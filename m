Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C223C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4f1BwNyRNwr3lrVI76VY2ASsIbxL0aVA8T7EMuCR3A=; b=jQLrHMAfVH0cbNooFfPVZTsiXs
	tcBSFtj3CYFHTMdkLaJj39qmu15vBNCrMgkHeJWCO+CPusE1iYfrhCZsj/aHBCioGBtdcATLY6Nj6
	nRnze97mw2kdJKSW4mcxK3QMXzMFIKaSAJTBVFD6uvcqdUJ0/F5Y35glzfk8IR7XSuZAOwqKRZuXC
	qz/1xw5mFLIWG7W58Jt+zeFYYu7Q9LyLRsZb9oaZuUsAaFcjqYDZcHVeEFjtrOHEI4/dxdjBsonZq
	WhXaqz2QCDnekJy4OxShGMQ5YIihr7LuQL7NaFfm2GL1oN/dqXr7RAz7ctPLY+SFRV/sNmlPJcmo4
	cVhZjsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa5X-00000006T8g-04lr;
	Fri, 03 Jul 2026 09:21:35 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa5U-00000006T7l-0bff
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 09:21:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 59DD72026A6;
	Fri, 03 Jul 2026 11:21:30 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfa5S-005t3H-0u;
	Fri, 03 Jul 2026 11:21:30 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfa5S-0000000056z-0nUT;
	Fri, 03 Jul 2026 11:21:30 +0200
Message-ID: <0fad41a4d09d5d6e5709e66662fbc39b5a75fee9.camel@pengutronix.de>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?=
	 <peter.wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Cc: Alice Chao =?UTF-8?Q?=28=E8=B6=99=E7=8F=AE=E5=9D=87=29?=	
 <Alice.Chao@mediatek.com>, "krzysztof.kozlowski@linaro.org"	
 <krzysztof.kozlowski@linaro.org>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>,  wsd_upstream <wsd_upstream@mediatek.com>, Chun-Hung Wu
 =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=	 <Chun-hung.Wu@mediatek.com>,
 "linux-devicetree@vger.kernel.org"	 <linux-devicetree@vger.kernel.org>,
 Naomi Chu =?UTF-8?Q?=28=E6=9C=B1=E8=A9=A0=E7=94=B0=29?=	
 <Naomi.Chu@mediatek.com>, "linux-mediatek@lists.infradead.org"	
 <linux-mediatek@lists.infradead.org>, "conor+dt@kernel.org"	
 <conor+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Ed Tsai =?UTF-8?Q?=28=E8=94=A1=E5=AE=97=E8=BB=92=29?=	
 <Ed.Tsai@mediatek.com>
Date: Fri, 03 Jul 2026 11:21:30 +0200
In-Reply-To: <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
		 <20260626074820.2537772-2-peter.wang@mediatek.com>
		 <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
	 <d077d61fa0e22a2e602dc3c8b47512a847f1049e.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_022132_333711_7DEAB08D 
X-CRM114-Status: GOOD (  23.53  )
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

On Mi, 2026-07-01 at 06:35 +0000, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) =
wrote:
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
> across different SoC variants. MediaTek has many SoCs (mt8183, mt6985,=
=20
> mt6989, ...) where the same UFS subsystem may have different register=20
> offsets for reset lines. By describing them in DT, we can support new=20
> SoC variants by updating the DT alone, without requiring a new driver=20
> patch for every new SoC.

This makes adding new SoCs that fit the binding convenient for a while
but hurts maintainability in the long run.

These bindings seem to never be generic enough to last more than a few
SoC generations, and then something different comes along. Case in
point, your new binding is different from ti,reset-bits. So we'd just
collect more and more of them over time.

Also it would be much harder to fix things that can not be expressed by
the binding after the fact, for example when it turns out that a reset
control bit is inverted.

> This approach is also consistent with the existing 'ti,syscon-reset'=20
> binding, which uses a similar per-entry table property 'ti,reset-bits'=
=20
> to describe reset lines within a syscon block.

Note that I tried to gently pushed back against that when it was
introduced. I now think having it let through was a mistake.

The argument back then was that listing resets in arrays in the driver
would become unmaintainable, and so far I have seen no indication that
this would have become true.

Also the idea was that this was generic enough to be reused for a lot
of SoCs. That didn't happen either.

I'd prefer if you could just enumerate your resets and use the ids as
an indices into arrays in the driver.

regards
Philipp

