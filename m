Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28490ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rGC0YK8UKKg10V7XIhFIonK2lfJ2+8tqa3Tl7iUqbc=; b=y2EWnofNIvPHMcWt7mQJ1WQJZk
	JQMuj0LeHrZckx7wKEyBGx3z+TmGz8x3xDJJqBF9BGcychPt2oNVAxENcWltxY2LbXVJQ7GKbJuRc
	1TUrLl7xZ7x8ul2hUHwk7lGAwy5QsG6UPdhblmQ7V9AFI8J/rUDrvIJpwu25yIz4lbLJyjpmwaduS
	00W9hbb9pKh0aNXWWdtL1kP8AMHpgBDUmuLH45mQlS298T7q7av4A7CtIMMDEIudj7FQRGkMFqbrL
	HVJaZqT8DyjcOZJWllLzfmXB4IC1IuZl6b3okXAxHtPq2FMSS39pBD/Fnu74E1G7FTZb3rp4VbK22
	Vn3E4U5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRTc-00HKVG-I6; Wed, 14 Sep 2022 12:26:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRTF-00HJz8-Tp; Wed, 14 Sep 2022 12:26:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F851660201C;
	Wed, 14 Sep 2022 13:26:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663158384;
	bh=EOvPaAPQay6+H5/vvnMCA8FXSUgtfRiBJVkGqDS8b+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B8evYpC5rHOn3wXLr1ltYq8EJ/5zjF2RvyMBqF0VMnFwt0Cj37FWOeW33+VTg/oeQ
	 Vvs7390adjB2YYZ4b6U7+xqzI48EolCfCJxJOQMYUp5CCDoVaj+9ddRKD9iYBcJVfZ
	 SB6my2f00Mjz35i4iOrgVGN2OZNHISpukps2pw1iMptIpMvdi6xE8ucwdaQylrIdbh
	 LrTP+2jSTAcjE4L0Ty0nT/pjR0raKAUPTyaIn4apX/dle0G6Cmgeb5sQ3tuV1RRuMz
	 ICRwRuoFeaUMQ4hs2+/yjDBUoFJ3YStsTmeQEOXxGVHaz9ne669YneRBQEHAjvcAaN
	 Bd/iZIY7+F/DA==
Message-ID: <c7d49663-8da1-9c49-c15d-ea3a8fe3d317@collabora.com>
Date: Wed, 14 Sep 2022 14:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,3/7] arm64: dts: mt8192: Add thermal zones and thermal
 nodes
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-4-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220817080757.352021-4-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_052626_153305_01D9F0A1 
X-CRM114-Status: GOOD (  13.82  )
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

Il 17/08/22 10:07, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add thermal zones and thermal nodes for the mt8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 111 +++++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index cbae5a5ee4a0..59ef4da06a70 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mt8192-power.h>
> +#include <dt-bindings/reset/mt8192-resets.h>
>   
>   / {
>   	compatible = "mediatek,mt8192";
> @@ -599,6 +600,28 @@ spi0: spi@1100a000 {
>   			status = "disabled";
>   		};
>   
> +		lvts_ap: thermal-sensor@1100b000 {
> +			compatible = "mediatek,mt8192-lvts-ap";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg CLK_INFRA_THERM>;
> +			resets = <&infracfg MT8192_INFRA_RST0_THERM_CTRL_SWRST>;
> +			nvmem-cells = <&lvts_e_data1>;
> +			nvmem-cell-names = "lvts_calib_data1";
> +		};
> +
> +		lvts_mcu: thermal-sensor@11278000 {

Please keep the nodes ordered by reg start.

Regards,
Angelo

> +			compatible = "mediatek,mt8192-lvts-mcu";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x11278000 0 0x1000>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg CLK_INFRA_THERM>;
> +			resets = <&infracfg MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> +			nvmem-cells = <&lvts_e_data1>;
> +			nvmem-cell-names = "lvts_calib_data1";
> +		};
> +
>   		spi1: spi@11010000 {
>   			compatible = "mediatek,mt8192-spi",
>   				     "mediatek,mt6765-spi";


