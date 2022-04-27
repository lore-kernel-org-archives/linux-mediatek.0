Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75Ji8eNR9Kv+3m1vXTC6TpuGUQgwtI9ZRWq/xujFB58=; b=fk3Bbcj6mWf40/
	GP1Dfy0zU0FKudi1CVLOTg3lak+/Hx84TUp9CJp1zESezs3nrgeRP3+Wltlq9GniNjvbj6Zz0hX/Z
	DeK+J1S8jemfq0PkcXxoXRi9A5gZRNJvL01s76PH2vcpgJm9PRZhXFg8rz/3yi6nddE6a+vobeF3N
	obG1C3CPIdGfTh8EutpiXZuFxI7mINKhh3hicnlg6quk3IU3cw7dK3VffbXerOLPQo2LC4UES7F27
	L7k/lltmF4raLxFyAecBzDL19NqK/0ONsyJjHJZH0mGY55EFX4sddHxHn8jucTUJh/7PhGBJj6I62
	X5s38VIluT9hKsmRqXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nji7k-001gGq-EQ; Wed, 27 Apr 2022 13:54:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nji7V-001g9a-1Q; Wed, 27 Apr 2022 13:54:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 6F40D1F44800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651067650;
 bh=bti1EdzC6WGQOpy3EhTaJntgvmOLWjzLid7YZh3R18U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZPMe9lhK77QoJalyS6cqCntKPDuSJtht+9pXHYF8jNb+Fm/jrQxt11+7ECe+kAVws
 7Q1djtafBwzDzuCu3Eby+gbF483OhYDVojG/lc5WwI8MRcXnN7HdXR8zQ6M9pDlypN
 na7Eu20Wwjpv/4P0GKb1tr58G4QTnzp4fbBjbq+d5IqmNp6RglbdzEEfcpmOFV5GiE
 trbvQnIiu8X82hAn6rayZwhczfMCPtaQxtfroSeu64fYXfKSySrR8Xp0icofv/Ago7
 8czX7fmeFd8iisdowAVFzbbMimCf3OeOJ5rWf1KoyqbK4c/yyGwv432ulrEMgp6J2b
 hOeWo0e123UZQ==
Date: Wed, 27 Apr 2022 09:54:04 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 01/10] arm64: dts: mediatek: Introduce MT8192-based
 Asurada board family
Message-ID: <20220427135404.a4xxp3rvvzrgqfqs@notapiano>
References: <20220316151327.564214-1-nfraprado@collabora.com>
 <20220316151327.564214-2-nfraprado@collabora.com>
 <CAGXv+5Gv2pjPXynz6HCdgux+giPDC5qRk+KW1aFduVz82rM=+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXv+5Gv2pjPXynz6HCdgux+giPDC5qRk+KW1aFduVz82rM=+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_065417_252974_0F697246 
X-CRM114-Status: GOOD (  26.62  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chen-Yu,

thank you for the review.

On Wed, Apr 27, 2022 at 04:43:50PM +0800, Chen-Yu Tsai wrote:
> Hi,
> =

> On Wed, Mar 16, 2022 at 11:17 PM N=EDcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Introduce the MT8192 Asurada Chromebook platform, including the Asurada
> > Spherion and Asurada Hayato boards.
> >
> > This is enough configuration to get serial output working on Spherion
> > and Hayato.
> >
> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/Makefile         |  2 ++
> >  .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 11 ++++++++
> >  .../mediatek/mt8192-asurada-spherion-r0.dts   | 13 ++++++++++
> >  .../boot/dts/mediatek/mt8192-asurada.dtsi     | 26 +++++++++++++++++++
> >  4 files changed, 52 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-=
r1.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherio=
n-r0.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index 8c1e18032f9f..034cba17276b 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -37,5 +37,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-kodama-=
sku32.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku0.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku176.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-pumpkin.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r1.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-spherion-r0.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8516-pumpkin.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts =
b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> > new file mode 100644
> > index 000000000000..e18e14b13d61
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2020 Google LLC
> > + */
> > +/dts-v1/;
> > +#include "mt8192-asurada.dtsi"
> > +
> > +/ {
> > +       model =3D "MediaTek Hayato rev1";
> =

> I think this should be "Google Hayato ...", and the one in spherion should
> read "Google Spherion" as well?
> =

> These are project code names used in Google. Both devices use the common
> "Asurada" hardware design, also done by Google.

These were the names downstream so I didn't want to change them. But I agree
with you, and will take this as authorization do change them so for the next
version.

> =

> > +       compatible =3D "google,hayato-rev1", "google,hayato", "mediatek=
,mt8192";
> =

> You should add a patch adding this to the DT binding doc
> Documentation/devicetree/bindings/arm/mediatek.yaml
> =

> Same for Spherion.

Okay.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
