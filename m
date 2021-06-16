Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52A0C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 08:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DDE61159
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 08:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DDE61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmmYcAkJrRY5Xb5rAeIa7BDk7lsQMFf2QafoaZ3jwD4=; b=jlvB/1tqXmNKO/
	aC1IS/lIZRILsnvApI3/HCULxuI24m6fmUBLMKeH7lz4AGXg1FdBtTMk48But8lA3mBiLx2pzasj8
	kW1S4cc01DoQl4oMPdUDTBJJrBnxBmZDxxFU6yfH7Kp0TdZ8D3DcWyIJRBn+G7C/hFQN0vVC5eVxB
	jlXGmkHe0e4Txf7QCcF0Q4jFFzZmEOHfrJGj+RSaDR1YlcfNcrHcra6ahNN3UyQTUJFKQdBMaL73R
	vk7AEFHPCj+/+B2mrzfzMCbqZuq6jsBa6gzSVE+F3tfh+2QQtcWMx8wQUroV2bEojzQTh+oXP6FyG
	Bt9oxq1MR2x4C2h+0Jzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQV8-005JKz-8q; Wed, 16 Jun 2021 08:02:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQUu-005JHp-U3
 for linux-mediatek@lists.infradead.org; Wed, 16 Jun 2021 08:02:06 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so3102732pjb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Jun 2021 01:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yOnR+mvHvq0XbGYNaQzXS/E8NUV0fIrwWByQjDfQPHQ=;
 b=ogJdzjZlsAKA4Ejn4ortTl8wrFGVAgL3sehcV4cQWN7YHIf+RZHdXy6bxzWiJDpcmL
 V1dtrQ3b4aOb4SO31cyALXckzBMafRJYGsNpqySCJxefgwNM6MitYkGznpk6cDWlEKc2
 MXVfxJAQcKN3G8XpB2Syl2RXG2F/pIAeS7xOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yOnR+mvHvq0XbGYNaQzXS/E8NUV0fIrwWByQjDfQPHQ=;
 b=RkBgfHIO2v6he+X6h5Jwqwn5iSK2PArnBIT08QbM2vY4q1KZEAnS04iTf8QaAWHws/
 iOtgr3LUkJLpbbxsDI6JcjoVbrP/8feZXu9dZD+okVNcw6NxtpEUp43abffY9oXsa3Pb
 VZJo+XLrNWAnj9mYFciwHBFdnF8oSjaUPHJ2uwrkNIqxGFRf7ZS3a4Z4Lap/f3g5d57B
 Sr3qmk0uON2TOEfodZcbp3k+qZJBvlM1mhEbvfQfBbi1F2tarGldKQWY2PgLIf+dGZzu
 tODbGDzbbFzbJc6TzPZUKFT5ZnnCqFedia1wP6O0B7DiHv4ISAeydCF4RahlC+o1Fxpe
 ie4g==
X-Gm-Message-State: AOAM532tBk0a2/oRwkYbhOkrZFQqCzzYwJZoc6tzzfAommZUTEWO7ogH
 LQGkh4Bl/TPTUhoSnl0DybYuzw==
X-Google-Smtp-Source: ABdhPJzobEDwQGUJ4kTYd2EtdaboX/M1rgIePs8vk+Af7VafwTKClGnUPRFRDOQ789Va1PHbWluGcg==
X-Received: by 2002:a17:90a:4216:: with SMTP id
 o22mr9487241pjg.3.1623830523139; 
 Wed, 16 Jun 2021 01:02:03 -0700 (PDT)
Received: from google.com
 (2001-b011-0003-1f79-f0b4-87ad-2804-77d3.dynamic-ip6.hinet.net.
 [2001:b011:3:1f79:f0b4:87ad:2804:77d3])
 by smtp.gmail.com with ESMTPSA id h8sm1392639pjf.7.2021.06.16.01.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:02:02 -0700 (PDT)
Date: Wed, 16 Jun 2021 16:01:58 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [PATCH 01/27] arm64: dts: mt8195: add infracfg_rst node
Message-ID: <YMmv9ih/JPRLd7o0@google.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
 <20210615173233.26682-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615173233.26682-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_010205_098249_89F87C13 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, Jun 16, 2021 at 01:32:08AM +0800, Tinghan Shen wrote:
> From: Crystal Guo <crystal.guo@mediatek.com>
> 
> add infracfg_rst node which is for MT8195 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 629cd883facf..8cda62f736b3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -8,6 +8,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/reset/ti-syscon.h>
>  
>  / {
>  	compatible = "mediatek,mt8195";
> @@ -273,6 +274,20 @@
>  			};
>  		};
>  
> +		infracfg: syscon@10001000 {
> +			compatible = "mediatek,mt8195-infracfg", "syscon", "simple-mfd";

This block is named infracfg_ao in the datasheet. You seem to rename it
in the clock patch. Maybe you squashed the change into the wrong commit?

> +			reg = <0 0x10001000 0 0x1000>;

The address range matches the datasheet.

> +			#clock-cells = <1>;
> +
> +			infracfg_rst: reset-controller {
> +				compatible = "ti,syscon-reset";
> +				#reset-cells = <1>;
> +				ti,reset-bits = <
> +					0x140 26 0x144 26 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> +				>;
> +			};

This node doesn't seem to be used anywhere. Is it really needed?


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
