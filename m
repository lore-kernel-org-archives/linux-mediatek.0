Return-Path: <SRS0=p0H4=GU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3540AC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 05:43:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBD823107
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 05:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBD823107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pg4RDZmX9GbMzCYIOln9xHQP29T33VF2jQVRIkyl32g=; b=1WlQMC59fnsKWJUsyiNgQhxin
	BUn0bHo/kZ0gDfCDuFy+iHtQjkPmEg1usWXZv2XVY1g6cpSdVX1d2rkTr3Y1ViTND1q8w3MxgDKbX
	AnXot9SgkLnGnRsgQO/D9jV2gyGppAPbDaN+1yqjmNEuVHNsvnzgF+/G4wkrblDIOsHAc6a45l1mG
	IB4Le3L9TI3W4dm/7MJSvxcOmtO32ZGooyF3yRMw37EbgGoULaqcT4hcfPeOzksd4bDhpSrC4b5aN
	qIqQR/iPoJvr58fIQKgu2HRwO0a79f3OWL0t4PQP2azOhRmDtqyvuxqaNxg66WClnY8YpQ/c+59Mz
	gIYc9f2mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l10q0-0002dB-Ry; Sun, 17 Jan 2021 05:42:56 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l10py-0002c7-9E
 for linux-mediatek@lists.infradead.org; Sun, 17 Jan 2021 05:42:55 +0000
Received: by mail-ua1-x92a.google.com with SMTP id k47so4417405uad.1
 for <linux-mediatek@lists.infradead.org>; Sat, 16 Jan 2021 21:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Olt2YOxfNlY0a+PB/Ct3vvAUbttTgv/DLZUtCACcw8A=;
 b=EQI2syrqKXMoRfyWu1KSfQ7T474G8zDMmq/hd9N2q/GIm5i59uLyxltnLhA4QudIcD
 QnuQn+XWFa+E/LL5fsm9LIPowQjdwgtihyIm6O17SPOQIbOaJOLNhY/aWn1AYZf557Ow
 JEFQGLCjLgLFQUQvIikIs7LkZJX7lKNAqDI3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Olt2YOxfNlY0a+PB/Ct3vvAUbttTgv/DLZUtCACcw8A=;
 b=kH7NDlvcg7GfltdbRB67gfU53PB+gtxyJVAk4cibIe4MwAwn83x/N369MDPBueHEdA
 MwvYVxQrZWnuFQBe45RgnGyUZjsrKzzuhI/NWR9+hR8nLCQTjkPJwc8Rl0aThJ//deH5
 fVMyVHCFhrw9lbrkLbL0018TNLn4pvv4/1gNvQ9zdpPba0tMnnxF0oRloUpRX66SyxhQ
 mwqeivPhp41x6D4XpWI+EzpdPU5Eynl4qPPwJU3u4rpLOjybLrT/qF+pkJyAM+oVp2Mp
 wXU0hpLFeO8b5cB6WTUycaNqg1IsBe5R4ckMJ5mpw1kXgqpcFrezyT6Y9YGRnF9TjTKl
 5AVQ==
X-Gm-Message-State: AOAM532lbBMjVr0P8fLJGhVeSz1yom1eOUMaBabAacT0Q2rzb4neC93h
 JYynxTpRK1yzcO9eEVx1D2HKZpBifALuchn8bOndTQ==
X-Google-Smtp-Source: ABdhPJwXwI0RYPLjRggAllyTjh/EEvwkgVxdYKDanZi5mBCStwwyCakvkuOuYkJ0GyG4FSWpv7KhZ7m0RG1NXRl+P+w=
X-Received: by 2002:ab0:3894:: with SMTP id z20mr13880263uav.82.1610862171854; 
 Sat, 16 Jan 2021 21:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-12-chunfeng.yun@mediatek.com>
 <CANMq1KA63Lcifv0G80AyF9-JAdojtsnR18QtfytTMuKw7pTkPA@mail.gmail.com>
In-Reply-To: <CANMq1KA63Lcifv0G80AyF9-JAdojtsnR18QtfytTMuKw7pTkPA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sun, 17 Jan 2021 13:42:40 +0800
Message-ID: <CANMq1KDkEL1Uh3yCG_-D=Kcm2Nob+mLNiA87syoaiuBFrrsnvg@mail.gmail.com>
Subject: Re: [PATCH next 12/15] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_004254_406981_670B3431 
X-CRM114-Status: GOOD (  17.97  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 17, 2021 at 9:58 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Sat, Jan 16, 2021 at 5:07 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > Harmonize node names, compatibles and properties.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 5b782a4769e7..a69a033a68ac 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -865,7 +865,7 @@
> >                         ranges;
> >                         status = "disabled";
> >
> > -                       usb_host: xhci@11200000 {
> > +                       usb_host: usb@11200000 {
> >                                 compatible = "mediatek,mt8183-xhci",
> >                                              "mediatek,mtk-xhci";
> >                                 reg = <0 0x11200000 0 0x1000>;
> > @@ -908,11 +908,11 @@
> >                         status = "disabled";
> >                 };
> >
> > -               mipi_tx0: mipi-dphy@11e50000 {
> > +               mipi_tx0: dsi-phy@11e50000 {
> >                         compatible = "mediatek,mt8183-mipi-tx";
> >                         reg = <0 0x11e50000 0 0x1000>;
> >                         clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
> > -                       clock-names = "ref_clk";
> > +                       clock-names = "ref";
> >                         #clock-cells = <0>;
> >                         #phy-cells = <0>;
> >                         clock-output-names = "mipi_tx0_pll";
>
> This is unrelated to USB, so this should probably be a separate patch.

Actually, after looking again at the complete stack of patches, I
think this might be ok as part of this overall cleanup (I'll let the
maintainer speak up).

>
> > @@ -931,11 +931,10 @@
> >                         };
> >                 };
> >
> > -               u3phy: usb-phy@11f40000 {
> > +               u3phy: t-phy@11f40000 {
> >                         compatible = "mediatek,mt8183-tphy",
> >                                      "mediatek,generic-tphy-v2";
> >                         #address-cells = <1>;
> > -                       #phy-cells = <1>;
> >                         #size-cells = <1>;
> >                         ranges = <0 0 0x11f40000 0x1000>;
> >                         status = "okay";
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
