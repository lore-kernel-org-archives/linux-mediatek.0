Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 04:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIG+5IDOwQA7F6MJezLrBTW+kOijOwQpQ8mK+sp/cww=; b=qubd8IVsouQJ1CbUYoXIsc0y3m
	jFYif6oInO9VehRyfNvo/5mHS/Vow25ReYD0zlqM/GWQkkX3Mawh/bK0y/FGbTci6B+pPDd7HZRJH
	n6Iq1H9+TqcOwev+Y6n2zdtpRPS9eScz4KXaLhspiUNv4EHO38NqHylkkz27WyM01Jb9TVmaYAfMO
	rF4A3qsjoBkeDvNwoHl4ifedNGPD+dQZkRB0pEVHMcHiAP3M/DmSAojBGAgm37YXw0lii1DLhJZGO
	WZ6ht3fexPTJJ3VLkdRgqm+aDtlu1HxWV+shfdTJNAYaWhDGwp5673pTOOfyD5G3XbG3cMqxl1Cvk
	H5nmZC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Zmi-00ELbI-Fw; Tue, 05 Jul 2022 04:03:36 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ZmX-00ELVo-3B
	for linux-mediatek@lists.infradead.org; Tue, 05 Jul 2022 04:03:26 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 76so4136701ybd.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 21:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZIG+5IDOwQA7F6MJezLrBTW+kOijOwQpQ8mK+sp/cww=;
        b=SiqMzBFKpQ15lSMMZ+ieDlDHxl6ynGs457Jzqwd7ECBfx/FcQEsWWxLJ+HspHMIvdj
         87R8nG6AsAxKMonlKHYkeT4VNDtJk+29uj8uqFXSRTbuN+d5Xa6ViDpLuOn9ZzjwfrJG
         dE1o5C5hq6jfEFgLYl5SO13WOFvkcxnA5Ehf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZIG+5IDOwQA7F6MJezLrBTW+kOijOwQpQ8mK+sp/cww=;
        b=h4uG0u7448Gw10D37VWNExC9DaNQsZ36QCZ4ToPAs5JGpTajtY21ZhFmyH8MnYto9V
         6BQ00bRpknOlBhZUN/dSR+A5zJGx7t5wtQG+taLYqlplVAb5gSwW5ni2xosBx9u8fPiq
         MdccWKhU9XtWdtGe7+HLcnM9L+a68p8S2WM0g0z6GQgTO2pmAvIUfOLAzNPJxrAFfYh+
         oVt0RdNOMeSBv9T+eX1t3ksgTCxazt1YabPYkjcw9eUVCQlBJSQSp02hv1S61mll8TLS
         xcRnxJBzoWo7qQbc7MXAcM9XatG+68+5onq6Q+x7GZ60FR2WBPjIFoCgZpqzMBscW99N
         Wqcw==
X-Gm-Message-State: AJIora9jiqcZHEOYZd2dD1t8NA0ZBXZ44vKuhTTXGydDeDDPPe8f+WuV
	/tXe/n8ZDfXR2oN6qLb8t//kA/TEoosw++6YLUSGVA==
X-Google-Smtp-Source: AGRyM1vMJ9uYD7wpYhw4rZ23WoR+YWd2CPjnGvFMLHez7dzhY8TvkFoA0lecqOFkLC4JSsNQk8xxUusxHyarAxFXrHg=
X-Received: by 2002:a25:81c5:0:b0:66d:55b5:d250 with SMTP id
 n5-20020a2581c5000000b0066d55b5d250mr34484387ybm.501.1656993799717; Mon, 04
 Jul 2022 21:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220629155956.1138955-1-nfraprado@collabora.com>
 <CAGXv+5Epmo1=DZvoFkqj57hiO8nim=cuP1v3i9b2diZwqBe3Mw@mail.gmail.com> <20220701150145.2myyk2o3vxydyhql@notapiano>
In-Reply-To: <20220701150145.2myyk2o3vxydyhql@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 5 Jul 2022 12:03:08 +0800
Message-ID: <CAGXv+5FsTNKgWG75eSKt4ngnhmSekWNT+oS1ke+P4tazHDdnzQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/19] Introduce support for MediaTek MT8192 Google Chromebooks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, 
	Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_210325_182566_82D0B04B 
X-CRM114-Status: GOOD (  32.10  )
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

On Fri, Jul 1, 2022 at 11:01 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Jul 01, 2022 at 08:44:53PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Jun 30, 2022 at 12:00 AM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > >
> > > This series introduces Devicetrees for the MT8192-based Asurada platf=
orm
> > > as well as Asurada Spherion and Asurada Hayato boards.
> > >
> > > Support for the boards is added to the extent that is currently enabl=
ed
> > > in the mt8192.dtsi, and using only properties already merged in the
> > > dt-bindings, as to not add any dependencies to this series.
> > >
> > > This series was peer-reviewed internally before submission.
> > >
> > > Series tested on next-20220629.
> >
> > Just FYI I also got the internal display to work after some fixes to
> > the dtsi [1] and copying the stuff over from the ChromeOS kernel tree.
> >
> > It might be harder to enable the external display, given that we don't
> > have a good way of describing the weird design of using the DP bridge
> > also as a mux. See [2] for ongoing discussion.
>
> Hi ChenYu,
>
> I actually have both the internal and external display working on my loca=
l
> branch [1], but the commits there aren't final, and I'm also following th=
e
> Type-C switch discussion to update my commits whenever the binding is set=
tled
> on.

I see. I think the internal display part is more or less final. It should
be worth including it, as it is a fairly visible indication that things
are working.

ChenYu

> I noticed the lack of the mandatory display aliases in the mt8192 series =
but
> somehow missed mentioning that in the review, so thanks for adding that.
>
> Thanks,
> N=C3=ADcolas
>
> [1] https://gitlab.collabora.com/nfraprado/linux/-/commits/mt8192-asurada
>
> >
> > ChenYu
> >
> > [1] https://lore.kernel.org/linux-mediatek/CAGXv+5F_Gi_=3DvV1NSk0AGRVYC=
a3Q8+gBaE+nv3OJ1AKe2voOwg@mail.gmail.com/
> > [2] https://lore.kernel.org/dri-devel/20220622173605.1168416-1-pmalani@=
chromium.org/
> >
> > > v3: https://lore.kernel.org/all/20220512205602.158273-1-nfraprado@col=
labora.com/
> > > v2: https://lore.kernel.org/all/20220505194550.3094656-1-nfraprado@co=
llabora.com/
> > > v1: https://lore.kernel.org/all/20220316151327.564214-1-nfraprado@col=
labora.com/
> > >
> > > Changes in v4:
> > > - Added patches 17-19 enabling MMC, SCP and SPI NOR flash
> > > - Switched mediatek,drive-strength-adv for drive-strength-microamp
> > > - Switched mediatek,pull-up-adv for bias-pull-up
> > > - Updated Vgpu minimum voltage to appropriate value
> > >
> > > Changes in v3:
> > > - Renamed regulator nodes to be generic
> > > - Fixed keyboard layout for Hayato
> > >
> > > Changes in v2:
> > > - Added patches 1-2 for Mediatek board dt-bindings
> > > - Added patches 13-16 enabling hardware for Asurada that has since be=
en
> > >   enabled on mt8192.dtsi
> > >
> > > N=C3=ADcolas F. R. A. Prado (19):
> > >   dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
> > >   dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
> > >   arm64: dts: mediatek: Introduce MT8192-based Asurada board family
> > >   arm64: dts: mediatek: asurada: Document GPIO names
> > >   arm64: dts: mediatek: asurada: Add system-wide power supplies
> > >   arm64: dts: mediatek: asurada: Enable and configure I2C and SPI bus=
ses
> > >   arm64: dts: mediatek: asurada: Add ChromeOS EC
> > >   arm64: dts: mediatek: asurada: Add keyboard mapping for the top row
> > >   arm64: dts: mediatek: asurada: Add Cr50 TPM
> > >   arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
> > >   arm64: dts: mediatek: asurada: Add I2C touchscreen
> > >   arm64: dts: mediatek: spherion: Add keyboard backlight
> > >   arm64: dts: mediatek: asurada: Enable XHCI
> > >   arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
> > >   arm64: dts: mediatek: asurada: Add MT6359 PMIC
> > >   arm64: dts: mediatek: asurada: Add SPMI regulators
> > >   arm64: dts: mediatek: asurada: Enable MMC
> > >   arm64: dts: mediatek: asurada: Enable SCP
> > >   arm64: dts: mediatek: asurada: Add SPI NOR flash memory
> > >
> > >  .../devicetree/bindings/arm/mediatek.yaml     |  13 +
> > >  arch/arm64/boot/dts/mediatek/Makefile         |   2 +
> > >  .../dts/mediatek/mt8192-asurada-hayato-r1.dts |  47 +
> > >  .../mediatek/mt8192-asurada-spherion-r0.dts   |  62 ++
> > >  .../boot/dts/mediatek/mt8192-asurada.dtsi     | 959 ++++++++++++++++=
++
> > >  5 files changed, 1083 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayat=
o-r1.dts
> > >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spher=
ion-r0.dts
> > >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > >
> > > --
> > > 2.36.1
> > >

