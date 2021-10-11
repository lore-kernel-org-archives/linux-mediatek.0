Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E75C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A580060EB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A580060EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9mRyJCrusgBYSwi53JKBDqKln0OcWuXHGz3aPCrMRQ=; b=ntI7X8yhtSvwPp
	jQsL0b6nTg+XU2YFBTL6y1L3vZ/NHgynHeV798KfriEZWEZ2ea9BlxbJi/1bCLU9T1Re5FDNNQTsY
	feCdePJtBO4PV48GvmBisos4eKZBMsVylBc36NFHM0M+RCmi9Z5/VnnJAzPXJy28zhncjcs3yWhS1
	HUQhE1j8CcILo/LIn5eaY8tW9gsJlXA5MGOhZqoBiCOM6JRZSn0oXQVREe/jppwfIG2GNS5fd33Is
	H3/36N6TxE8hOCTCaq83tqqpAYla7joDBpSgi3rYNo0hPmr49TXBNPd1L9BnVifrjBUbR3CmKmJcU
	D1IyXmrtYFbBI36SxY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma0Fe-00AOsX-6M; Mon, 11 Oct 2021 18:42:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma0FR-00AOqF-SX; Mon, 11 Oct 2021 18:42:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 131DD60F4B;
 Mon, 11 Oct 2021 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633977725;
 bh=hoYSt9zJ7gblctsTD1xqU6UBG1JIdB6IhQ5HhTiGdN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=abR3MBV5MYpHe5vwlTDqZFZLxOrA2WTOaCvHYAMinYlmlOrUq4bbZ4Pv8KjX8/Alc
 E9nJ7YoXAS6ETAWB3r9E+Rf7bMamqGBF78v8Mbn+7Im9MtLbeaumwSL4bOAkwrUirC
 i1UxLEiQ1tnuHh0l/uVbdV2qBEX9qau32WrkIpDVjezzaOtmqNX8X4epmdIhSEmMo5
 S2e2K726+24VCEd4GPjglZ5CAdykmTZW8lmevGBG011SeXrHm1//PsomvCU2T2ppwa
 43Pw4FqKxm2CEpLynZ++JhbuFx2bKF3RvTc4jUgY1VDwKLCVKWmG6TX+gZndL8kRjX
 gKbR9bg0FeaKw==
Received: by mail-ed1-f49.google.com with SMTP id g8so71380804edt.7;
 Mon, 11 Oct 2021 11:42:04 -0700 (PDT)
X-Gm-Message-State: AOAM5313bYlnNpq/B/N92vX0K1Y/CG00jvgLOVBNDcwHkVd6dP+0/DyR
 PcgfkxDAIP392wScp7B2p2afPrvfG1GohgLO0w==
X-Google-Smtp-Source: ABdhPJywv8fGmhk1mf+HyQ4w9xB10/jc+wD8EAQOzSfHjr1YBOzCjjO57IbflJOw2WQ2NS6iX0NGP79Mcba9uDjgq64=
X-Received: by 2002:a05:6402:4382:: with SMTP id
 o2mr8810066edc.271.1633977723437; 
 Mon, 11 Oct 2021 11:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
 <1633959378.242329.504943.nullmailer@robh.at.kernel.org>
 <20211011134301.rkkblnj4bfowghu7@blmsp>
In-Reply-To: <20211011134301.rkkblnj4bfowghu7@blmsp>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Oct 2021 13:41:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+9YLo2hdu4jyAzfZLdUaHYWQMhc7+h0eE9Qf2KU6Vzng@mail.gmail.com>
Message-ID: <CAL_Jsq+9YLo2hdu4jyAzfZLdUaHYWQMhc7+h0eE9Qf2KU6Vzng@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-phy@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_114205_991791_BE80BAED 
X-CRM114-Status: GOOD (  21.62  )
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

On Mon, Oct 11, 2021 at 8:43 AM Markus Schneider-Pargmann
<msp@baylibre.com> wrote:
>
> Hi,
>
> On Mon, Oct 11, 2021 at 08:36:18AM -0500, Rob Herring wrote:
> > On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> > > DP_INTF is a similar functional block to mediatek,dpi but is different
> > > in that it serves the DisplayPort controller on mediatek SoCs and uses
> > > different clocks. Therefore this patch creates a new binding file for
> > > this functional block.
> > >
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > ---
> > >
> > > Notes:
> > >     Changes v3 -> v4:
> > >     - Fixed clock names in the example as the clock patch series is merged into
> > >       next now
> > >     - Add missing ports decleration to the example
> > >
> > >     Changes v1 -> v2:
> > >     - Move the devicetree binding from mediatek,dpi into its own binding file.
> > >
> > >  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
> > >  1 file changed, 86 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dts:21:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
> >    21 |         #include <dt-bindings/clock/mt8195-clk.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The mt8195 clock series was already merged and is available in
> linux-next. I checked with make dt_binding_check before sending.

The bot has no way of knowing that, and the dependency is not called
out in this patch for me to know that when reviewing the failures.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
