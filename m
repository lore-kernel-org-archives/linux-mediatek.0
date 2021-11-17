Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC10C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB4161BD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CB4161BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1o7tTYpXAVxn8zXJcSBh2Q22St/5wrVkKuNtGpL9eU=; b=gdavXaQuWqOCht
	52R5HCfdU/zCi3P0sxQ/1z0lpdoSlsaM9s58NrOeExKjnHK4QxTmgr9LqUvEubgRk5p6AR3mQkmPm
	VWqtEP4uTTTs3L2UEgUtufZnlKLaaIs1lMru7GkgCH7FmnfbdbbjdEc3JqYoExdVFciUWXzORsUDD
	aHWtJDM/ATVaNA0a9EXE1ypFEGe965kl5AVJx/Gg6AvDJopg3SZLWm0FI1OmOtUo8hgBNMGSt/cqv
	Zu4SxrNc2QoDSvsHojPerLN5Il9n0Eh9NpnHg3gMl2xzNzzeWE8NSgnmCKcRMgGDjTC4uLU01TAd1
	0XZUMeVN2D04MMxASv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnPYq-0065dj-2b; Wed, 17 Nov 2021 18:21:32 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnPYn-0065by-9f
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 18:21:31 +0000
Received: by mail-io1-xd36.google.com with SMTP id v23so4432314iom.12
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/514pVJuhGBgB+naKDe4+5FaP9UvAeZZSiSl87FUgn4=;
 b=eL0dwCK6ziyZzcwuQXHzmpinmO5UjdRB7IoboPXUGZ8Xc9C0Ec3kQX8T5xGEcyMxeB
 XO8SGF/30sobsodc1SC3AoTN+IV5JfnE9D0a3FeRkvNWh1vFSFjmt8zLVywbbl3OjNFf
 TlrRCfgFSb4tieNHEOHO2sHe5iAVChQjEnK78shF8WzIaF2jEdrWGk7Iddh/hFRkR+i5
 Gg7pGTNqkKQjl/DqMRo8MiyrlrkTPH5TWrfI9pS3wfQIKd26rm5+e4oN/apNDejgHqCG
 KD3pNiZW3v9lGalUPk8kKP2t12bbCc9+AD0M8LmOV0x8e/TfsIHZxUU1HRxH2VxwtPqs
 iDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/514pVJuhGBgB+naKDe4+5FaP9UvAeZZSiSl87FUgn4=;
 b=2xkUqvB0ngicUGs5vw0JbJLOk6GuUmp5dQdivaRmarAkPNGogtpyFdsFsLzVdWAYK7
 AKz5JlgiCc64u6DHzbm3ForSdIgmI5CHbandnUqZkmVrhtPtfwJDPZSjwqN2nXvwVHGE
 J/RaQjLqoOaof07o8C1Wb9jPLOmJhleSHf6RMzD8cv5AB0lo66T5DAIczelV7/NZzkoX
 Oxh+8hFrU0paxQTsTeTf29bDaW+dhR7hq+9C9BoOcV+7iPFt9XbwB5MIt4+lex1M4vL5
 doDgTWDnZEZoKrW+duXqNu2iTOskCxk5ivJc14+b7/53EjnKkhlnwPk4wK7jIVUyQI/W
 RMIg==
X-Gm-Message-State: AOAM531UMNMGhCLb0cBUQ4ZbQhd15vuRt4EvG33nN6scknZfHkJeCDKU
 arUFP2AlaX8BKZ/yqP8MZnp4gwzuCa4uP5W4Nkx2SQ==
X-Google-Smtp-Source: ABdhPJysqh5Di5WFqKQVOoC48CzH0iNkcxGKDYyaq6sVkIrW4Qsn7B9RB7B60DlLNZXUcm5UKxq7B87l830Tyw+lzag=
X-Received: by 2002:a05:6602:164a:: with SMTP id
 y10mr12459615iow.123.1637173285060; 
 Wed, 17 Nov 2021 10:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20211110192417.4177741-1-fparent@baylibre.com>
 <03de9880-1f1a-b07b-6ec3-279945e08cea@gmail.com>
In-Reply-To: <03de9880-1f1a-b07b-6ec3-279945e08cea@gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 17 Nov 2021 19:21:14 +0100
Message-ID: <CAOwMV_wmyFiSxdU7BZ-u+OLfStp+4jrwmmo-QaNvZn0HBH7Q1g@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mt8183: add dpi node to mt8183
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>, 
 Jitao Shi <jitao.shi@mediatek.com>, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_102129_364161_B1D8239E 
X-CRM114-Status: GOOD (  15.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,


On Wed, Nov 17, 2021 at 6:33 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 10/11/2021 20:24, Fabien Parent wrote:
> > From: Pi-Hsun Shih <pihsun@chromium.org>
> >
> > Add dpi node to mt8183.
> >
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index ba4584faca5a..7c283c0b68b5 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1443,6 +1443,17 @@ dsi0: dsi@14014000 {
> >                       phy-names = "dphy";
> >               };
> >
> > +             dpi0: dpi@14015000 {
> > +                     compatible = "mediatek,mt8183-dpi";
> > +                     reg = <0 0x14015000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> > +                     power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +                     clocks = <&mmsys CLK_MM_DPI_IF>,
> > +                              <&mmsys CLK_MM_DPI_MM>,
> > +                              <&apmixedsys CLK_APMIXED_TVDPLL>;
> > +                     clock-names = "pixel", "engine", "pll";
>
>
> We are missing the output port node, don't we?

The output port node is defined in: [PATCH 2/3] arm64: dts: mediatek:
mt8183-pumpkin: add HDMI support
Unlike MT8173, there is no HDMI IP in the MT8183 SoC.

>
> Regards,
> Matthias
>
> > +             };
> > +
> >               mutex: mutex@14016000 {
> >                       compatible = "mediatek,mt8183-disp-mutex";
> >                       reg = <0 0x14016000 0 0x1000>;
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
