Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2ACC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:35:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89FDC61585
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89FDC61585
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SvFdIufx8ZfZOZwlxnx8uDIAXKKznMoivhhnzj+X2BU=; b=DNfVn+CWsBZVMPrRu8yhv7tGO
	/u5N55MlDGD4KYAFCgMfEA4C7WvZyiQLx1Q+24YmgjYV3xJ6wdS4TVOylnPp4cfTaoVkCElX8U2t9
	EcUPVMBRynXxKaZA5pnlP0cc/wzrjqP8mLU9jNJiol4LuAD3Sx6bru2gsKP86FizIRwPpe4TBbMMf
	ZZnU8+guOtJB1991BGkw9x+x1rlYGmdR7xXc34D2tOQPDzi/MYwY/T9eVJSY9pkntnlgDxm9s4tgw
	V2C8rEakBgFe8ee21Z7LrAigqAgyIEiS37FngbqfvRdsaFe7dwISzok5XlvUsV8ptwYZ6SSBN5rCm
	ABfSJp6Fw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0Tk-001hCF-5L; Mon, 29 Mar 2021 22:35:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsE5-000go5-SE; Mon, 29 Mar 2021 13:46:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id c8so12905906wrq.11;
 Mon, 29 Mar 2021 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fddk+qv8UJfczImeuAqflr8tlEyX+yc2b+zWaj55sgA=;
 b=BoJnjCr0tIsIlLAM3ga49aWB6PlgHKVLZXcWuCB+a9OWArIY71D1usPH0Wm+bsY8vA
 PhoMkAzBbRNkUgCLrrHXrX5Se4n89fqekjlAtvlfnvkalsY9NW9ACt0HnXl7qy4XEMnA
 KecK8uSXtYRu1nuFmYYQ4MyiW6N/atrqHebR0pBSBf8/4MCVHJp5rTvcF49eWrSirGgo
 5r8iWZcr4nqKqA/4epm5AqDAdzPFgWZwPLfPLWQy9aYj2FqA01H+XzWr32y7NYQlvR88
 SvYaoOhAtYU7qI2EGmRn/4a8Uk8pWRbRpbboYTlF1iGz481v74bBqrIO8ttrOpF8D/fx
 6hRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fddk+qv8UJfczImeuAqflr8tlEyX+yc2b+zWaj55sgA=;
 b=TEil622i6QV/epXGg8NaUOiZs448JCTAIR0MVP+tFmzzpA2247P9VdHKHa2qVksMAy
 6dOph3Vlx5T6J6pVzE94LKK0+hq/vP9ZsdfzadWjkIzGwpPonaxwCW3Iwknr571PwOUt
 LNN+iq8/qxS4ha6tlZNnS8Utulg6ATUiLSYa2dnHGG7wAuljniSBYuIpzBTomh0//5/1
 ccVmdPiIh0wjeHulY4cE/TeutPhlQb98zxa5FpvPaWZVWWucVQb4UL55hH887q0/M+VH
 oNFDKTDL29P10NdibUP+TggZPIwy6Ok9fb6MxjMntXh5Z0wNlYoXD1Ssy1IH+EsXPO+/
 eJKw==
X-Gm-Message-State: AOAM531M9Q/3TA8y6qpOUrx1FuTh0BywUOEJBTm+vr+lUKNOjZPPVgKW
 RPu76vXBVmFY9iOIfOPwQpU=
X-Google-Smtp-Source: ABdhPJzCNweHlfMu3tJ8ncNx1C9Tl3Kr3IlwwNZX3f4HHFLINKz4ouGVZzSu2PRZOBQs4iscfaMCXg==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr28666138wrr.49.1617025599382; 
 Mon, 29 Mar 2021 06:46:39 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id 81sm25642323wmc.11.2021.03.29.06.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:46:38 -0700 (PDT)
Subject: Re: [PATCH v5 06/13] arm64: dts: mediatek: mt8173: fix dtbs_check
 warning
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-6-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <56fdac32-b106-10fb-64ff-c04d67603537@gmail.com>
Date: Mon, 29 Mar 2021 15:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-6-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144642_073518_30AE747A 
X-CRM114-Status: GOOD (  15.63  )
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



On 16/03/2021 10:22, Chunfeng Yun wrote:
> Harmonize nodes names, compatibles and remove unused property.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts64

> ---
> v2~v5: no changes
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts |  4 +---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 13 +++++++------
>  2 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 6dffada2e66b..0ce81c4fe81e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -516,10 +516,8 @@
>  	extcon = <&extcon_usb>;
>  	dr_mode = "otg";
>  	wakeup-source;
> -	pinctrl-names = "default", "id_float", "id_ground";
> +	pinctrl-names = "default";
>  	pinctrl-0 = <&usb_id_pins_float>;
> -	pinctrl-1 = <&usb_id_pins_float>;
> -	pinctrl-2 = <&usb_id_pins_ground>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index ecb37a7e6870..003a5653c505 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -631,7 +631,7 @@
>  			#mbox-cells = <2>;
>  		};
>  
> -		mipi_tx0: mipi-dphy@10215000 {
> +		mipi_tx0: dsi-phy@10215000 {
>  			compatible = "mediatek,mt8173-mipi-tx";
>  			reg = <0 0x10215000 0 0x1000>;
>  			clocks = <&clk26m>;
> @@ -641,7 +641,7 @@
>  			status = "disabled";
>  		};
>  
> -		mipi_tx1: mipi-dphy@10216000 {
> +		mipi_tx1: dsi-phy@10216000 {
>  			compatible = "mediatek,mt8173-mipi-tx";
>  			reg = <0 0x10216000 0 0x1000>;
>  			clocks = <&clk26m>;
> @@ -926,7 +926,7 @@
>  		};
>  
>  		ssusb: usb@11271000 {
> -			compatible = "mediatek,mt8173-mtu3";
> +			compatible = "mediatek,mt8173-mtu3", "mediatek,mtu3";
>  			reg = <0 0x11271000 0 0x3000>,
>  			      <0 0x11280700 0 0x0100>;
>  			reg-names = "mac", "ippc";
> @@ -943,8 +943,9 @@
>  			ranges;
>  			status = "disabled";
>  
> -			usb_host: xhci@11270000 {
> -				compatible = "mediatek,mt8173-xhci";
> +			usb_host: usb@11270000 {
> +				compatible = "mediatek,mt8173-xhci",
> +					     "mediatek,mtk-xhci";
>  				reg = <0 0x11270000 0 0x1000>;
>  				reg-names = "mac";
>  				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> @@ -955,7 +956,7 @@
>  			};
>  		};
>  
> -		u3phy: usb-phy@11290000 {
> +		u3phy: t-phy@11290000 {
>  			compatible = "mediatek,mt8173-u3phy";
>  			reg = <0 0x11290000 0 0x800>;
>  			#address-cells = <2>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
