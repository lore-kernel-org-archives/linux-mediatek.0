Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7AEC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 20:53:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797DF207C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 20:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SzKXppHI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797DF207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uUUPA+b79AstVmpVSuFNyn5wO/oB1WNvdmxZ9TLkuqw=; b=SzKXppHIJlhrrHmbajvGs1CEQ
	YCwvbPsmLYhy5C48Tnjk1hhNbgnJis0A2KrkSpsCi3tXXr6rKDse3LIJb4a2DA6jWSzXqRq1g1kjF
	iJO/749IohHs0W8EWlREkvy25xK1nX2u84CZEEx25HwKKpjctW5R9/QqOTxCjMdUD+mZQFpi6n+Gh
	OD7bqLlwpAePUiRdIqZhqoGbL9S4YTIKN/ZLw2o4+Wz+GKuwN4nqh0YwxSXXtsgNAdslxvkOfHw+Q
	YGeh1bTCgFQZgnVkHT45zHv7Ie9Iel0xUYqmIOjwT3mobIM87m5Rmhc1fsplkhsj8bGLyI2++OGFD
	p4HxThZ7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyiDt-0000gM-S0; Thu, 23 Jul 2020 20:53:49 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyiDr-0000fx-Hb
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 20:53:48 +0000
Received: by mail-io1-f66.google.com with SMTP id k23so7666518iom.10
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2020 13:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ITHgt7Rp1pUPvPasYbFEExd3q0/gLF5DZdscQLiQgEw=;
 b=dHagm3yKdCxkC6XMb1YFu1fZPe7yHpxoqQX24WV/ySHZeZ0dY78rPH8deKNUJoYzOM
 zCHJ51AzK8wDR340S/KozD7FigQX8GL9ExuWZu4kf+B8SNB0e4lNoj9sXr4TYThZJ/yI
 cPQdQTSYcs1V8YdxSy9EPw2Q6zcaXQKT1FPJZc5HbY+RLXfgm7hFzYP317DbStshNPtv
 Cyl/X7rKIZFcVPFvzIDdUp58fTAlzU2Uyupz9wUMODRlDrRNQ3bU2otbpBlmnz12EsY7
 ixCOxXppQ481vMb8GUKvcQjyCF69NGwouKEyChF6Y+COvRgdiNHi+WiD1E5KTQFpBwRs
 nrKg==
X-Gm-Message-State: AOAM5323NagOKXF/U1ZCNTDUZJpQcyJzILoPgwqKihC2aCQDbWaEJYpV
 mI+l6cLOsOx4jjrKOFb89A==
X-Google-Smtp-Source: ABdhPJwu8e69Y0kSTAIspRpvODB+BldtXHqBKiEe/jpBPO0AO31cywRDT52VomisXuK/kACvFQX/aw==
X-Received: by 2002:a05:6602:2f88:: with SMTP id
 u8mr6878032iow.120.1595537626501; 
 Thu, 23 Jul 2020 13:53:46 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d9sm2004036ios.33.2020.07.23.13.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 13:53:45 -0700 (PDT)
Received: (nullmailer pid 841658 invoked by uid 1000);
 Thu, 23 Jul 2020 20:53:43 -0000
Date: Thu, 23 Jul 2020 14:53:43 -0600
From: Rob Herring <robh@kernel.org>
To: Huihui Wang <huihui.wang@mediatek.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: dma: mediatek: mark useless items as
 decrepted
Message-ID: <20200723205343.GA839415@bogus>
References: <20200717030203.14872-1-huihui.wang@mediatek.com>
 <20200717030203.14872-2-huihui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717030203.14872-2-huihui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_165347_646489_A94F3A4A 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 11:02:03AM +0800, Huihui Wang wrote:
> From: huihui wang <huihui.wang@mediatek.com>
> 
> Because we move dma address bits config to mtk-uart-apdma.c,
> it is unnecessary to be configured in device tree.
> Update the document at the same time.
> 
> Signed-off-by: huihui wang <huihui.wang@mediatek.com>
> ---
>  .../devicetree/bindings/dma/mtk-uart-apdma.txt        | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> index 2117db0ce4f2..926c86b21e8c 100644
> --- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> +++ b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> @@ -2,8 +2,9 @@
>  
>  Required properties:
>  - compatible should contain:
> -  * "mediatek,mt2712-uart-dma" for MT2712 compatible APDMA
> -  * "mediatek,mt6577-uart-dma" for MT6577 and all of the above
> +  * "mediatek,mt2712-uart-dma" for MediaTek MT2712
> +  * "mediatek,mt6577-uart-dma" for MediaTek MT6577
> +  * "mediatek,mt6779-uart-dma" for MediaTek MT6779

This looks like an unrelated change.

>  
>  - reg: The base address of the APDMA register bank.
>  
> @@ -16,13 +17,12 @@ Required properties:
>    See ../clocks/clock-bindings.txt for details.
>  - clock-names: The APDMA clock for register accesses
>  
> -- mediatek,dma-33bits: Present if the DMA requires support
> +- mediatek,dma-33bits: Present if the DMA requires support (deprecated)
>  
>  Examples:
>  
>  	apdma: dma-controller@11000400 {
> -		compatible = "mediatek,mt2712-uart-dma",
> -			     "mediatek,mt6577-uart-dma";
> +		compatible = "mediatek,mt6779-uart-dma";
>  		reg = <0 0x11000400 0 0x80>,
>  		      <0 0x11000480 0 0x80>,
>  		      <0 0x11000500 0 0x80>,
> @@ -50,6 +50,5 @@ Examples:
>  		dma-requests = <12>;
>  		clocks = <&pericfg CLK_PERI_AP_DMA>;
>  		clock-names = "apdma";
> -		mediatek,dma-33bits;
>  		#dma-cells = <1>;
>  	};
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
