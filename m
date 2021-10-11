Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6397C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A33560E78
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A33560E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CpeWcPeFveAUnxvdBFKs8sf3yHqP7wyFeZ1W3ti8ew=; b=xG4x+cu0Y/g28Q
	66vfU/JYIp450OobqmWP7lw1WhNx488qe5X1SiJ4qTShFrytRQuxvuIt5egjLH2xxrPLtokA7vU2g
	vTVF2njDem//9l3no51WaQVwpZWRj7UMvoS2xINyz8q8yug+pubUYwIMTTPhPSRFN9uU6kg2vIfiR
	d9vkt4ZXuLCjxHtPonGnw/xOyO6oF/e485oFFvoymPHEsxFgvsAfsG13Pqgv1dF7pTlfgeKhLOQlZ
	wxzLNM3fcxswBTuPIjGYC7BeU0JGVs8Y3+JuJIzoRYC+UdvjqMOqtAJwuLt3p8FliOgfRY9eGSurT
	MHL3A4i9sxlc/TUjbz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvdz-009cGd-AE; Mon, 11 Oct 2021 13:47:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZva4-009adn-Ei
 for linux-mediatek@lists.infradead.org; Mon, 11 Oct 2021 13:43:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id e12so56413991wra.4
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Oct 2021 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LBQ/RlcHRgsJhWdGxR74k8U+6xJLDTMUXocquzJPiJU=;
 b=OSRKb1tR/iscBaaH4Vkfq89LYiA99Wg2MWozP0+JxU5cFEwSuakTotaA5qfjuf0tcn
 wc8nkgQg3BjtGpo6QvjpvCeiE2dxFpXWDKG+QHquCxCgQ8iNDFTXqXnX5kH/W/QPAYy2
 rzpNcqTeyuRiAm9LFnaNn4jJGXEk0bih1SG5sjlcHk5EA27WggxzscALmljLyvSRdbSB
 K7z2/2m6MDDOgDaO2Kv7kH8Xn61JYrZatd20Aqm7yx/oaHGhqdz4vKRaSEFpV8qT+qs3
 b8SSGrk/nx+lG3UB+fe2jCF8KMujidu8X6WCwzFd9uMckL7SXKwR1604Dn7orqrDzoQp
 cOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LBQ/RlcHRgsJhWdGxR74k8U+6xJLDTMUXocquzJPiJU=;
 b=55YIe77Kl1o7utxxV9iN1avlnLGx0hsZG2HqnsnUt2HHt+O2KyYWvO9iPird1iLOcd
 z2J+dkuQKmVFtTC8pm+lrZCLl85+Ki46ggt80buqDoC8i+oZOdF7FTKx6fCMjFGH5UAF
 1GBmlNnA0ODe5LjZPUVusnf1RzM1KgzAtR/ZOsjRo3MnsfkCyQAT8dYiIZJBu0dSmHtM
 vW03EHttBN9iQG+CyuTD2YFa26Qgt3cUvF/Man+ej3DYoEhiw6BNvGmj2glA8csJrnJW
 5pgYE2CHegk/s0lBlYe+ICYKdAygU0sXgUDFf+r3CUayAro1PwcoY1JhRIMnQPxzcnoV
 /olw==
X-Gm-Message-State: AOAM53106xuRaxu8UF1cB/ngm8z+tuL4FP/7YEgcoebrAOW2gRVPlbTO
 0AUVeOvYlswXtDG9Vc4TgkS5Kw==
X-Google-Smtp-Source: ABdhPJw80tNA1CtEMAR2DIAqo6RWlGOsP3zsfqN+AHn9A3bpiH1G4WPtqy3EvbLa45r88Y0l+rikmg==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr25056733wra.125.1633959782842; 
 Mon, 11 Oct 2021 06:43:02 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id f3sm19666735wmb.12.2021.10.11.06.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:43:02 -0700 (PDT)
Date: Mon, 11 Oct 2021 15:43:01 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Message-ID: <20211011134301.rkkblnj4bfowghu7@blmsp>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
 <1633959378.242329.504943.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1633959378.242329.504943.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_064304_584165_C6361687 
X-CRM114-Status: GOOD (  23.21  )
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

Hi,

On Mon, Oct 11, 2021 at 08:36:18AM -0500, Rob Herring wrote:
> On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> > DP_INTF is a similar functional block to mediatek,dpi but is different
> > in that it serves the DisplayPort controller on mediatek SoCs and uses
> > different clocks. Therefore this patch creates a new binding file for
> > this functional block.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes v3 -> v4:
> >     - Fixed clock names in the example as the clock patch series is merged into
> >       next now
> >     - Add missing ports decleration to the example
> > 
> >     Changes v1 -> v2:
> >     - Move the devicetree binding from mediatek,dpi into its own binding file.
> > 
> >  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dts:21:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
>    21 |         #include <dt-bindings/clock/mt8195-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The mt8195 clock series was already merged and is available in
linux-next. I checked with make dt_binding_check before sending.

Thanks,
Markus

> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1539196
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
