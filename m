Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930B0C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:10:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E973207F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q68bcc19";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l05Z2XNw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E973207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mvLaPdqIVTIWflgxIOdoYyVDRYVb0FH3FcG+OGzLkxE=; b=Q68bcc195HJybSAvoXHsCb2xq
	jxL+M0w04iDGPrR2ks6nPamW/6RdeukOP6wM66hjI8m2dMohXXXHnVjZEwYjUXolMJd5drt4B22RV
	p7ZexKOiVsmZmBQig2Sbn7ibodDX2vo4ViLRxFjFI1zraJ5jNm3ylFcSyvcmtRSZP0XNUnICRX1jL
	a80Htum8lZqSeuR8BfjqX5/foj2zT+UyjinMvXIptSZNiHiY2nOo6OWcIXx40980DxF9vibHhfPqo
	ZoGYuMFCT4kcMNsEF/2XkCyC3Pnl7+6J/YyIPgZAYK2ycmpRGcDlHxUWZMeqCj3bQpAdgLpm6Xl8X
	d0wISpMoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBEra-0004dj-R9; Thu, 27 Aug 2020 10:10:34 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBErX-0004dI-46
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 10:10:31 +0000
Received: by mail-oi1-x241.google.com with SMTP id v13so4128995oiv.13
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xffebcZYdssVBz8b/QGkKBNNZIu8AR2B8ONx8ST79Rg=;
 b=l05Z2XNwo9iN0IeRxk31CvVymxJLIWzAvOT2mBoYkYYzTJymUK9sjFd12SkKSAiz38
 u4xyukMukt4+GYw0oe/HkZIXaoF182cC8VkEA3gTeGYzK3qsZWk31w38wCmo56FMGsvk
 3jdbM2vEmwhPHGW/6+wrbMhD4hzf+RrIX6lKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xffebcZYdssVBz8b/QGkKBNNZIu8AR2B8ONx8ST79Rg=;
 b=uY07CV1qqukBByIDak70Qc66ygNwZBSfEr42y0Kz4yeB9IKpzycWsz9exckfquKSnq
 szDZYAWCdinS7KLYr1MOTSjQ3MZRetXTQIf9r0GeqUB1GRuXA0R0X6XE520zA3kJbNDs
 gmmiA/I5ihgd5gWxZOBAsfuix5Lh2CyksJvkq9HwCApZ/8Y+RS7pho+kk9kgloMQChDp
 9Mz9//sM9cpLdh+p9pvg6uQib7FRqbpW2z830XtQAxtzZDa1j2XK1n6tsqjuYCnyXr5V
 1a7SGFG+cNOR8MRQP0zOz7Iwy+sJX/oyIRgUoGYFyeB7wPM97KrH9eE0srwWLMUQ0jBC
 MfTQ==
X-Gm-Message-State: AOAM533BDfLy+gtzWFmhysfKgv5EsG0hc+sDnpMvHMECcSLwDX1Lh5vz
 NoVJEvzuDAxRDjTJ5oenam5oMr37GAxkaw==
X-Google-Smtp-Source: ABdhPJyBMun71FtJYulx0ZlyFifL7uofH7YHPAVWYNiP/wpAAoH3bsdTcPJ/+JxOATA/UDNmYKFBNw==
X-Received: by 2002:aca:1103:: with SMTP id 3mr6359284oir.104.1598523026819;
 Thu, 27 Aug 2020 03:10:26 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com.
 [209.85.161.43])
 by smtp.gmail.com with ESMTPSA id 38sm356999otq.76.2020.08.27.03.10.25
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 03:10:25 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id z203so784707ooa.4
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 03:10:25 -0700 (PDT)
X-Received: by 2002:a4a:d62c:: with SMTP id n12mr13629175oon.38.1598523025055; 
 Thu, 27 Aug 2020 03:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-10-acourbot@chromium.org>
 <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
In-Reply-To: <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 27 Aug 2020 19:10:13 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com>
Message-ID: <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com>
Subject: Re: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_061031_205457_6F069789 
X-CRM114-Status: GOOD (  22.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 7:03 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 21/08/2020 12:36, Alexandre Courbot wrote:
> > Now that the MT8183 encoder driver is ready, add its DT node. Also pull
> > the iommu and scp ones, which the encoder depends upon.
>
> Please don't do that. Instead of pulling in other DT nodes, it would be handy to
> get a reference of the series this is based on.
>
> Let me try to hunt them down now :)

Sorry, I'm not sure to understand - do you mean each node should come
with its own patch? Or that all the code should be merged before
sending these nodes? The rest of this series should land into the
media tree soon, if you prefer I can resend this patch separately once
that happens.

>
> Regards,
> Matthias
>
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
> >   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
> >   3 files changed, 58 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > index ae405bd8f06b..9e77b420eee8 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > @@ -25,6 +25,16 @@ memory@40000000 {
> >       chosen {
> >               stdout-path = "serial0:921600n8";
> >       };
> > +     reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +             scp_mem_reserved: scp_mem_region {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0 0x50000000 0 0x2900000>;
> > +                     no-map;
> > +             };
> > +     };
> >   };
> >
> >   &auxadc {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index f0a070535b34..3c763be658da 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
> >               regulator-max-microvolt = <3300000>;
> >       };
> >
> > +     reserved_memory: reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             scp_mem_reserved: scp_mem_region {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0 0x50000000 0 0x2900000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
> >       max98357a: codec0 {
> >               compatible = "maxim,max98357a";
> >               sdmode-gpios = <&pio 175 0>;
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 102105871db2..8f77eea6df27 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -8,6 +8,7 @@
> >   #include <dt-bindings/clock/mt8183-clk.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/memory/mt8183-larb-port.h>
> >   #include <dt-bindings/reset-controller/mt8183-resets.h>
> >   #include <dt-bindings/phy/phy.h>
> >   #include "mt8183-pinfunc.h"
> > @@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
> >                       clock-names = "spi", "wrap";
> >               };
> >
> > +             iommu: iommu@10205000 {
> > +                     compatible = "mediatek,mt8183-m4u";
> > +                     reg = <0 0x10205000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
> > +                     #iommu-cells = <1>;
> > +             };
> > +
> > +             scp: scp@10500000 {
> > +                     compatible = "mediatek,mt8183-scp";
> > +                     reg = <0 0x10500000 0 0x80000>,
> > +                           <0 0x105c0000 0 0x19080>;
> > +                     reg-names = "sram", "cfg";
> > +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&infracfg CLK_INFRA_SCPSYS>;
> > +                     clock-names = "main";
> > +                     memory-region = <&scp_mem_reserved>;
> > +                     status = "disabled";
> > +             };
> > +
> >               systimer: timer@10017000 {
> >                       compatible = "mediatek,mt8183-timer",
> >                                    "mediatek,mt6765-timer";
> > @@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
> >                       #clock-cells = <1>;
> >               };
> >
> > +             vcodec_enc: vcodec@17020000 {
> > +                     compatible = "mediatek,mt8183-vcodec-enc";
> > +                     reg = <0 0x17020000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
> > +                     iommus = <&iommu M4U_PORT_VENC_REC>,
> > +                              <&iommu M4U_PORT_VENC_BSDMA>,
> > +                              <&iommu M4U_PORT_VENC_RD_COMV>,
> > +                              <&iommu M4U_PORT_VENC_CUR_LUMA>,
> > +                              <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> > +                              <&iommu M4U_PORT_VENC_REF_LUMA>,
> > +                              <&iommu M4U_PORT_VENC_REF_CHROMA>;
> > +                     mediatek,scp = <&scp>;
> > +                     clocks = <&vencsys CLK_VENC_VENC>;
> > +                     clock-names = "MT_CG_VENC";
> > +             };
> > +
> >               ipu_conn: syscon@19000000 {
> >                       compatible = "mediatek,mt8183-ipu_conn", "syscon";
> >                       reg = <0 0x19000000 0 0x1000>;
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
