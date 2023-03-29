Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DE4C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y9DyUtoiaRq3DOUzn2dSA9aY4A/6vDkabRbKivmt1Y=; b=AObsrOZ1+EQ/mBsu8mWazY43s3
	8YiRosTR4LVEM9nknxGv99g4/LbZb9lp61ncbEfFMQs4YxoFlWidMzMW9GGboHImK6qSZG/3mGJZj
	rFVsmsKdiG7wdV6GUfVeQLlZGjeqfuKpQ5zF7dNr1L+QEMhbn6cMVISRiD0ZyWSGUAWZx0jpUwFlS
	IZ9U2YalC7EhLxgVpTiRPpYEaRYET5NtGx7gcpu4zT6OIsqwYW4ZcehiRY82W5XL0QBGDYQmiqxdz
	HCLnreqXe8MQZIQxcBd14gSLzdG4r7UT+31l3H96pLBfuMXgJyQKrZ1GPdaKCUJNvyDTRxGWjiUQP
	7RocrJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVjx-000Lqt-0W;
	Wed, 29 Mar 2023 13:21:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVjm-000Lkr-0n;
	Wed, 29 Mar 2023 13:21:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DFC3A6603170;
	Wed, 29 Mar 2023 14:21:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096072;
	bh=yO91BroR7iHw7kVLw8m4fi1PudYWDnQ6vk8SsbYSshU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YoCN+EPxnJ2LoZ3B/sAG8QF+Lakg247Xt3coYx/2+BIt47HWOXApA2Z0N0pOA9q3G
	 ablLIG5ZlD87/gqGYVmmMc/FDgqgmnwV6cSpZ+vJjNiZx83ZoVr+aL6i767zhhKt43
	 oRSy2x09fVLjPjpvE6JbUewtTivlvUeCKv1G7R3fJT0FV2yqAbFcaNaVdCt26bfVnQ
	 glZGjmUbq7wO+nYWV2+Tztgf7DwrvZNissg8r3RlhOOyp4JwpmSDHSJ/WVQ5NqEL4V
	 SzP6nMHusdf33ymqniBrHNBME6oRCfVY39NKZrEG7oEmOiUPi4GPmhIV/ClPaS80PK
	 rdfRxYhcfXurg==
Message-ID: <c785d80f-e443-cae4-1e17-b79eb2dc385c@collabora.com>
Date: Wed, 29 Mar 2023 15:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 08/17] arm64: dts: mediatek: add mmc support for mt8365
 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-8-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-8-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062114_452407_2641D0CF 
X-CRM114-Status: GOOD (  15.40  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
> There are three ports of MSDC (MMC and SD Controller), which are:
> - MSDC0: EMMC5.1
> - MSDC1: SD3.0/SDIO3.0
> - MSDC2: SDIO3.0+
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 39 ++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 687011353f69..a67eeca28da5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -399,6 +399,45 @@ usb_host: usb@11200000 {
>   			};
>   		};
>   
> +		mmc0: mmc@11230000 {
> +			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11230000 0 0x1000>,
> +			      <0 0x11cd0000 0 0x1000>;
> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
> +				 <&infracfg CLK_IFR_MSDC0_HCLK>,
> +				 <&infracfg CLK_IFR_MSDC0_SRC>;
> +			clock-names = "source", "hclk", "source_cg";
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@11240000 {
> +			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11240000 0 0x1000>,
> +			      <0 0x11c90000 0 0x1000>;
> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
> +				 <&infracfg CLK_IFR_MSDC1_HCLK>,
> +				 <&infracfg CLK_IFR_MSDC1_SRC>;
> +			clock-names = "source", "hclk", "source_cg";
> +			status = "disabled";
> +		};
> +
> +		mmc2: mmc@11250000 {
> +			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11250000 0 0x1000>,
> +			      <0 0x11c60000 0 0x1000>;
> +			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>,
> +				 <&infracfg CLK_IFR_MSDC2_HCLK>,
> +				 <&infracfg CLK_IFR_MSDC2_SRC>,
> +				 <&infracfg CLK_IFR_MSDC2_BK>,
> +				 <&infracfg CLK_IFR_AP_MSDC0>;
> +			clock-names = "source", "hclk", "source_cg",
> +				      "bus_clk", "sys_cg";

clock-names for this do fit in one 90 columns line.

After compressing it,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



