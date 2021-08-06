Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B238CC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 15:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621ED61158
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 15:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 621ED61158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vri/XhzXnSH9i51dj2I7jeDORLzrH1eZfVxvSxHPy5Q=; b=1ig3wJfwjZ53L8GXfYpNFeOCRu
	4W1k1I+zhIhjbXy3d3NcXi6sSFb55WCNlGbKjqtR3AI/X8ugsP5/XRmr9sZdoxsEoGCzEyOdtlij5
	clxZrUxHyL2zzsR+L/bwj6Mdq3h08cXVOpDZPGeX1/lPN/z9XXPrx1HZcS1USoQ73kOcU3uE5C0m/
	otmvWpzhHxYhHZeBn2YYkETBS5ls6XA3xG7EQ019cb7bcRdDqDIF9TLpk+aWwMww1lm2RukqlrsYZ
	+3T5sWmABS/rtL3UsI9ffagd79OZ1lc3w7yDWO3pV3Km+qM5AnZ91kax8AUds4P8yPfAMoXO1ybUg
	Q/rVKfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC1b1-00Co7C-TV; Fri, 06 Aug 2021 15:17:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC1ay-00Co6a-8v; Fri, 06 Aug 2021 15:17:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso7465031wms.1; 
 Fri, 06 Aug 2021 08:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j/xa8qZshCFoVyKlVsIewNJFCDwxE/FrxKwLU0KiPE4=;
 b=WPrLOCzNvhv8KNqSShRQUBN2qwuptA051kIsiir7ru9+zj2d49CdZObiE6GgQ8NpM2
 DxKYyKwCo55SxjGm1k581sD7oj6BSRrxXaybPR5LvRW+47WoqzQXdmJaXH/+yLnYjXD7
 dnSgl076wT0+pRoPHqO0N+NzokNv9fOtrm1L6FfJHWZNpHlGpUGs51LptXDpvHE4gEhJ
 KR7hyRQIDYS86NUksGq1ASINqG7QKs6LePp+XEkzG6n8xbwju4LHBXHZipC9Dn7MfciD
 MCa/GA/5abNUpxBJyorJdmZrDwp5w4/cmskzlZPIWcnq8gzFx7vSS1EUlq53JpKa8klv
 UwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/xa8qZshCFoVyKlVsIewNJFCDwxE/FrxKwLU0KiPE4=;
 b=T/6uBgGAl+KLYyqyiCyqo8G8FwOv1h+gZ7Q1t/Gcodsp/Z/8wyL+newTWxfLc3pumn
 I4QVehYyO5fTqG96u4/ieFfJTcZxYEFp587yGEzt71D+H4GGnp835lWEGWdl5gYf64ZH
 07fiZm4iaT8svpRpBa9fRRkAE5TN44KUJuZfyA0EeHL0H9SBUJOx0/+n2opr3ENEC1pQ
 CT9bHqugOIJPunxykEiOsKENNpOCRNo9vGtdwoAO9vJ3EVxryanJ64LWTnO5AN+FI1MX
 MrXOYAvpa3YtqiwWpzLYu2KFBsvhUBn3DTRL4x0Ua4r+EOOQdgG227SatLQZbkwnfCNV
 2/3A==
X-Gm-Message-State: AOAM5320/F06dyVIE1SwKXjTRJmudeErq0gRVbXoMdeMYWoYwNcIR3L8
 2QF3iQjaQ1/pCUmefKZdw1AG9RVui8uRgA==
X-Google-Smtp-Source: ABdhPJxFTP9E5ZhcnGK/Dd1vsXBwE3Hk/wGttb3x40ysCdrU5NSJYankQRiDNvXfZesQtqW57+WGow==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr3823549wmi.70.1628263030758;
 Fri, 06 Aug 2021 08:17:10 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id l41sm9573096wmp.23.2021.08.06.08.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 08:17:10 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] arm64: dts: mediatek: add MT6779 spi master dts
 node
To: Mason Zhang <mason.zhang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
References: <20210624021137.11513-1-mason.zhang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <358eca25-34b5-bf12-67aa-98491bbcc9d2@gmail.com>
Date: Fri, 6 Aug 2021 17:17:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210624021137.11513-1-mason.zhang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_081712_387769_DC414B59 
X-CRM114-Status: GOOD (  17.29  )
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



On 24/06/2021 04:11, Mason Zhang wrote:
> From: Mason Zhang <Mason.Zhang@mediatek.com>
> 
> This patch add spi master dts node for MT6779 SOC.
> 
> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi | 112 +++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index 370f309d32de..c81e76865d1b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -219,6 +219,118 @@
>  			status = "disabled";
>  		};
>  
> +		spi0: spi0@1100a000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;

pad-select should be part of board DTS.

> +			reg = <0 0x1100a000 0 0x1000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				<&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI0>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";

Should be disabled by default and enabled in board DTS.

> +		};

This gives me the following warning:
arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi0@1100a000:#interrupt-cells: size is (16),
expected multiple of 12

arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi1@11010000:#interrupt-cells: size is (16),
expected multiple of 12

arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi2@11012000:#interrupt-cells: size is (16),
expected multiple of 12

arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi3@11013000:#interrupt-cells: size is (16),
expected multiple of 12

arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi4@11018000:#interrupt-cells: size is (16),
expected multiple of 12

arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi5@11019000:#interrupt-cells: size is (16),
expected multiple of 12

arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi6@1101d000:#interrupt-cells: size is (16),
expected multiple of 12

arch/arm64/boot/dts/mediatek/mt6779.dtsi:145.4-27: Warning
(interrupts_property): /soc/spi7@1101e000:#interrupt-cells: size is (16),
expected multiple of 12


Regards,
Matthias

> +
> +		spi1: spi1@11010000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11010000 0 0x1000>;
> +			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				<&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI1>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi2: spi2@11012000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11012000 0 0x1000>;
> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI2>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi3: spi3@11013000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11013000 0 0x1000>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI3>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi4: spi4@11018000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11018000 0 0x1000>;
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI4>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi5: spi5@11019000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x11019000 0 0x1000>;
> +			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				<&topckgen CLK_TOP_SPI>,
> +				<&infracfg_ao CLK_INFRA_SPI5>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi6: spi6@1101d000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x1101d000 0 0x1000>;
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI6>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
> +		spi7: spi7@1101e000 {
> +			compatible = "mediatek,mt6779-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mediatek,pad-select = <0>;
> +			reg = <0 0x1101e000 0 0x1000>;
> +			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW 0>;
> +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_SPI7>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +		};
> +
>  		audio: clock-controller@11210000 {
>  			compatible = "mediatek,mt6779-audio", "syscon";
>  			reg = <0 0x11210000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
