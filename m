Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9AFC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 14:34:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D13F52072C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 14:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQ6hXPxX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQv6Lq5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D13F52072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riCFzZvZHj6LigKhOJbrMZmspEaZl9QKCkQfQR8K8o8=; b=eQ6hXPxXSt4gXV
	9iSynX/5JYEk+gnL069a2ObceHFaaSbUqQy9u3BfjW2VgJf3Qm0ou3Ta+yfgh34JejN4l6Lq4VAxY
	EdjMhrnh6sJxL/e8w8a8lQHsVag8oPN1ZbEZfNQuSQwSjisaWhpZTIoS34vAx2e2rSqysgYh+t3qB
	x8cuJcKtTAdeqVHMW3GrAZZIJ2iCD1lPaj00thAODNTYuJ8PcBEcaxfidPBkMTUBwOsmaaPaFpNek
	CC6NpR+0e0Q2+H7a7+oEQsCcpH5LgZwYxzcBL+iBAoH1uQafJVIb9LLygDsN8Rf7EYJPl0lCd+tFc
	1WZ2p5ybyw9iDpVubwgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbmHO-0003q8-2U; Thu, 21 May 2020 14:34:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbmHK-0003pK-FN
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 14:34:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id f13so5744196wmc.5;
 Thu, 21 May 2020 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tGKKjFMFC+sKVknptE7avSq6dI51LoeJ7RfKG7AjW6c=;
 b=uQv6Lq5coSn4/zosnKstvXy2IF6rJa4HzZfK7QuvIpPJbOeSgT9jdkfwVntAtm/JXJ
 TUQBb5PUXBhJILJScCwlqr7VnVca5oVJgWRUivc9n5c19wWnWEzgZd8kNIx8eBdZNaSn
 TpOh11MBdVTvJbt7RSIyk1GOC3GWq4u5UFdDwMLuoexW8TgoO3LkoDZ6Z3/CMWC/Bxyl
 tI53uBvKnzUnd1pY12BGz0nVo3u7yOAKD1034kmLHYjbCpzgrBmnyh0waaKFERrtGwBN
 TrC+bxL2p9K3LJi/g4FR5hvH8yKMaDxX+xcRG08KKwq4SsBIUxuhrC4DNA3E/DeWQFBf
 KkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tGKKjFMFC+sKVknptE7avSq6dI51LoeJ7RfKG7AjW6c=;
 b=O34opMmEgJinGqBB6I9ew10dVW6fVaqIJddPwtbZEHcdfSNhBu4Pvn4oVFAr6oK+sx
 YTrmDTHOBBXLTTvo04tNLvwcJh+/DyHqwmePsPYUtsl4i39Qa6N0LaoXJjgWI/nNCP64
 EdNNlvRUgGeUWwIV/uPF/5fIewT2qgB4P9mQwasrE0t4IN8qwJK82ig6ilL9BwufAeLA
 B2sDJ/EZK/knj13YIjRbu9lZeOsacE/zZ/tNrj+pFYvBEDiShIC0Zz+6HnFxw+AOFIPb
 zgbCbnPZRMuJCDJ3IaLx83CpyhgoIyVetiW9eqwoBph8PZhC+nMaGBUV3GTkFUsIBUsd
 xgEw==
X-Gm-Message-State: AOAM533vkcHTATWKcceEavkT85CsiPsXSxQHVY7cuFcVIpL+nRvSsVaR
 bcHrmayqNOYz3KUdZOmRA5c=
X-Google-Smtp-Source: ABdhPJw+wktKRIU8cY5UYoDcI7dM1Rqx9qTh+82Va77h33m0BmvccjxP1lXTr8+CN9t5+mDpBU+4Vg==
X-Received: by 2002:a1c:46c1:: with SMTP id t184mr9938825wma.185.1590071669014; 
 Thu, 21 May 2020 07:34:29 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id h137sm12843428wme.0.2020.05.21.07.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:34:28 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8183: add mmc node
To: Jjian Zhou <jjian.zhou@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <1554888341-5249-1-git-send-email-jjian.zhou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <87b4bf7f-8504-3d01-c7d9-63ed1856c02f@gmail.com>
Date: Thu, 21 May 2020 16:34:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1554888341-5249-1-git-send-email-jjian.zhou@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_073435_566002_ED6892CF 
X-CRM114-Status: GOOD (  18.91  )
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
Cc: =linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/04/2019 11:25, Jjian Zhou wrote:
> From: jjian zhou <jjian.zhou@mediatek.com>
> 
> Add mmc DTS node to the mt8183 and mt8183-evb.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
> This patch is based on v5.1-rc1 and these patches:
> http://lists.infradead.org/pipermail/linux-mediatek/2019-March/017963.html
> https://patchwork.kernel.org/patch/10856987/
> https://patchwork.kernel.org/cover/10879001/
> https://patchwork.kernel.org/cover/10846677/

These requirements are now fulfilled.
Applied now to v5.7-next/dts64

Thanks!

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 149 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi    |  24 +++++
>  2 files changed, 173 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 9b52559..465cdab 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -7,6 +7,7 @@
> 
>  /dts-v1/;
>  #include "mt8183.dtsi"
> +#include "mt6358.dtsi"
> 
>  / {
>  	model = "MediaTek MT8183 evaluation board";
> @@ -26,6 +27,154 @@
>  	};
>  };
> 
> +&mmc0 {
> +	status = "okay";
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	cap-mmc-hw-reset;
> +	no-sdio;
> +	no-sd;
> +	hs400-ds-delay = <0x12814>;
> +	vmmc-supply = <&mt6358_vemc_reg>;
> +	vqmmc-supply = <&mt6358_vio18_reg>;
> +	assigned-clocks = <&topckgen CLK_TOP_MUX_MSDC50_0>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_CK>;
> +	non-removable;
> +};
> +
> +&mmc1 {
> +	status = "okay";
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc1_pins_default>;
> +	pinctrl-1 = <&mmc1_pins_uhs>;
> +	bus-width = <4>;
> +	max-frequency = <200000000>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	vmmc-supply = <&mt6358_vmch_reg>;
> +	vqmmc-supply = <&mt6358_vmc_reg>;
> +	keep-power-in-suspend;
> +	enable-sdio-wakeup;
> +	non-removable;
> +};
> +
> +&pio {
> +	mmc0_pins_default: mmc0default {
> +		pins_cmd_dat {
> +			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO125__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO132__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO126__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO129__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO127__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO130__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		pins_clk {
> +			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
> +			bias-pull-down;
> +		};
> +
> +		pins_rst {
> +			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	mmc0_pins_uhs: mmc0@0{
> +		pins_cmd_dat {
> +			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO125__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO132__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO126__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO129__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO127__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO130__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO122__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins_clk {
> +			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins_ds {
> +			pinmux = <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins_rst {
> +			pinmux = <PINMUX_GPIO133__FUNC_MSDC0_RSTB>;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	mmc1_pins_default: mmc1default {
> +		pins_cmd_dat {
> +			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
> +				   <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> +				   <PINMUX_GPIO34__FUNC_MSDC1_DAT1>,
> +				   <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
> +				   <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		pins_clk {
> +			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
> +			input-enable;
> +			bias-pull-down;
> +		};
> +
> +		pins_pmu {
> +			pinmux = <PINMUX_GPIO178__FUNC_GPIO178>,
> +				   <PINMUX_GPIO166__FUNC_GPIO166>;
> +			output-high;
> +		};
> +	};
> +
> +	mmc1_pins_uhs: mmc1@0{
> +		pins_cmd_dat {
> +			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
> +				   <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> +				   <PINMUX_GPIO34__FUNC_MSDC1_DAT1>,
> +				   <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
> +				   <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			input-enable;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins_clk {
> +			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +			input-enable;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 482e451..38cec41 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -273,6 +273,30 @@
>  			#clock-cells = <1>;
>  		};
> 
> +		mmc0: mmc@11230000 {
> +			compatible = "mediatek,mt8183-mmc";
> +			reg = <0 0x11230000 0 0x1000>,
> +			      <0 0x11f50000 0 0x1000>;
> +			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&topckgen CLK_TOP_MUX_MSDC50_0>,
> +				 <&infracfg CLK_INFRA_MSDC0>,
> +				 <&infracfg CLK_INFRA_MSDC0_SCK>;
> +			clock-names = "source", "hclk", "source_cg";
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@11240000 {
> +			compatible = "mediatek,mt8183-mmc";
> +			reg = <0 0x11240000 0 0x1000>,
> +			      <0 0x11e10000 0 0x1000>;
> +			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&topckgen CLK_TOP_MUX_MSDC30_1>,
> +				 <&infracfg CLK_INFRA_MSDC1>,
> +				 <&infracfg CLK_INFRA_MSDC1_SCK>;
> +			clock-names = "source", "hclk", "source_cg";
> +			status = "disabled";
> +		};
> +
>  		mfgcfg: syscon@13000000 {
>  			compatible = "mediatek,mt8183-mfgcfg", "syscon";
>  			reg = <0 0x13000000 0 0x1000>;
> --
> 1.9.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
