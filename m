Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF1D103E17D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKZtThfu+xP8VScV3B61rLF6lLhIMshHE/+UDu3+QG0=; b=ETPcYVpBfYZYzt
	NjQ9g5njjaLvycW2XHt98vqTiO66yA+rzbxQgEg2EHtSOhMCCpdhxAmcsb89eMTjdY+v6qjcCMEFi
	LATsl79BXjwpa2stVqNTgG81FY7jWD7IH/q6cCKZA5Bnd/sC7W/rEuywG0cV5jclpP/YFyVzUIzMi
	VorUKCqPWnIGTSIILKpKznFK1qe/+gPPx59H2C1XZhA4E0qNpQQmqOa+c/yGBS6A2tXIF5xVu8Il0
	ZzwSDbSIm3Udw9AcvUGyMxdMOrBVg4J6UXFpcUcXj2QCJs5kXZyj9ykHtGuREf21+BOKLIq4wVegx
	aNIIuYfxONcef5Hl4cnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rMN-00000008XAE-2EOQ;
	Wed, 18 Mar 2026 13:54:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rMM-00000008X9p-3EZa
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 13:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC08060054
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 13:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903C6C2BCAF
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773842093;
	bh=UvzEZ/uLgrl9NDF/Qan/mdqTQ9JfJbGQ1y0WmfWlBig=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=VzEev1sThSUMRGSlL1RFOBEWGNrm7NnPLi5tGILenp2Fn3BxkYPJiINj76qWdEM8k
	 x1dF2tO3humnvFdJ4vT/eALxostC7uiji7IuMZAXQmIMR/UDxEM+yfTEv17c0gzZky
	 +2gi2HrLJ/HYn/rrbeHNyzS8giq4vBZtxE42N8+Z1RTRhYMeELMP+wnmuiF6rqRVtm
	 NGcpC2OHfJafDWJzCJ/sYahPKfS1NnUy29f9H0jIfd/pl++2n7aUgT+U6WbARuIaKT
	 m24QaDoUiDDztf17W/dCJlsLhdj5IuwW3MWd7XABOA/pIevgGT8AjvXafOhVAea8Zn
	 LCgk+Prmy+RXQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a27bfadca9so561404e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 06:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZlsj/cpDF1PKDwrhEFdGBnYrzLGeevJj8qiLOAp0kU2MPAni7zLWZ1qJo8ecH7HZoNHHXe7KkCjVjA/c9iA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuRT0I2PXxgNEqZlvKAvxZCo73gGW1VkbVldy0nWAqmZLuQE+E
	zKXxf79nGbkmZcEquTssEQswjycV57KPXg7dbcxjnYqqBzymaxA+cj9sz6gG36x1wuTzhJdvfyN
	3G89G3ZybV0YMdQ9dfpdszMU73RmSNzk=
X-Received: by 2002:ac2:50b9:0:b0:5a1:3485:1c29 with SMTP id
 2adb3069b0e04-5a279597e2emr1044745e87.6.1773842091908; Wed, 18 Mar 2026
 06:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-10-l.scorcia@gmail.com>
 <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
In-Reply-To: <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Mar 2026 21:54:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
X-Gm-Features: AaiRm50qgpWw6pso0fmDKuVqzybTij2WNFJYFTn7FlTu4OnRbnNdG68B7V1oZ0w
Message-ID: <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-mediatek@lists.infradead.org, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2026 at 8:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> > From: Val Packett <val@packett.cool>
> >
> > Add the dts to be included by all boards using the MT6392 PMIC.
> >
> > Signed-off-by: Val Packett <val@packett.cool>
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 ++++++++++++++++++++++=
+
> >   1 file changed, 141 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot=
/dts/mediatek/mt6392.dtsi
> > new file mode 100644
> > index 000000000000..fbf6f671524c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > @@ -0,0 +1,141 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Copyright (c) 2024 Val Packett <val@packett.cool>
> > + */
> > +
> > +#include <dt-bindings/input/input.h>
> > +
> > +&pwrap {
> > +     pmic: pmic {
> > +             compatible =3D "mediatek,mt6392", "mediatek,mt6323";
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <2>;
> > +
> > +             keys {
> > +                     compatible =3D "mediatek,mt6392-keys";
> > +
> > +                     key-power {
> > +                             linux,keycodes =3D <KEY_POWER>;
> > +                             wakeup-source;
> > +                     };
> > +
> > +                     key-home {
> > +                             linux,keycodes =3D <KEY_HOME>;
> > +                             wakeup-source;
> > +                     };
> > +             };
> > +
> > +             pio6392: pinctrl {
> > +                     compatible =3D "mediatek,mt6392-pinctrl";
> > +
> > +                     gpio-controller;
> > +                     #gpio-cells =3D <2>;
> > +             };
> > +
> > +             rtc {
> > +                     compatible =3D "mediatek,mt6392-rtc",
> > +                             "mediatek,mt6323-rtc";
> > +             };
> > +
> > +             regulators {
> > +                     compatible =3D "mediatek,mt6392-regulator";
> > +
> > +                     mt6392_vproc_reg: buck_vproc {
>
> s/buck//g
>
> Also, no min/max voltages?!

We really shouldn't set min/max voltages in the PMIC dtsi file.

The min/max voltages are supposed to be the intersection of the
consumers acceptable operating ranges. The min/max of the regulator
itself is already implied by the model / compatible.


ChenYu

