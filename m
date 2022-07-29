Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A874C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kR3y35L2jJpF9DeBUmeO1NaqJqCDRAh/3PI0ms/90U=; b=ZY/2QbCld8yX/JIcPOwzI/YNuX
	fRqAgmD98dMp0to3geL1parQKuuTBTgF7GcWIoaX5DVKmTyHuJXg3SvFBGJ28tNyLMvYoYUZ28JJi
	vi9/2xVDh/KFQEK0RMRpAxlhKtvansHQRDQPZ4xPW1PBOLXg695lNP/zAMp98h8X4kIRzYw+Fsuap
	u7intjSTRiH5/7f9F430E7eKpJEVWGfSmLZfkBUZKNOyal9hW3g4L3JTx+1kcTgbpXVAQ7MZtRKJS
	0C0wm4Vb1X4i04f+CLZ7Qivwm6zE6460IT3KKFgsoVSAD0168n3MAlvO5wPDsxKPofbLV3//B2q2n
	9OH1vbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWVk-00C0La-Dw; Fri, 29 Jul 2022 20:23:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWVW-00C02N-5P; Fri, 29 Jul 2022 20:22:51 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CF8EB6601B8B;
	Fri, 29 Jul 2022 21:22:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659126168;
	bh=QadOD+6p23Ma82Rr7I+mSjlDaAdqbTHjSZomPmDSVYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogtnbSm7jTLj1fN9ggv0MEJ5USyPoemrelAECoe9MYc1x03aU5XSd0BiO5cAOH2bQ
	 zklBeRjA8gdtbRw2GilZp7s6102hm7sF1/LiQUEm1fACtF4hhyQdGeThjinZjSCnXi
	 /OrsfNaxawIpfmaccOS+9Ng6S/hPWdP49nKLHfJimcqflRYE/zy9+6Y7rORnVSaETD
	 uN2NIiyf49DLivkZWfL3EmApg+6cBqDozgH3cZyaQp1UZ8dbfu9D6C3t6zzWOCaxlI
	 4qrQV8FIF4ZhbPitDfSHyJ7z1sNfbyVqN7ruSbrMZg8/aQA7Nhn2z4zvG+XV3hh5uX
	 fM7MCm7KknUhg==
Date: Fri, 29 Jul 2022 16:22:41 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8 6/6] arm64: dts: mt8195: Add thermal zone
Message-ID: <20220729202241.isw3hjo3jclzxhbl@notapiano>
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-7-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726135506.485108-7-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_132250_373261_7F7FBEE9 
X-CRM114-Status: GOOD (  17.61  )
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

On Tue, Jul 26, 2022 at 03:55:06PM +0200, Balsam CHIHI wrote:
> This adds the thermal zone for the mt8195.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 115 ++++++++++++++++++++++-
>  1 file changed, 114 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 4fbf24b5d202..78017224930c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
> - * Copyright (c) 2021 MediaTek Inc.
> + * Copyright (c) 2022 MediaTek Inc.
>   * Author: Seiya Wang <seiya.wang@mediatek.com>
>   */
>  
> @@ -11,6 +11,9 @@
>  #include <dt-bindings/memory/mt8195-memory-port.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +#include <dt-bindings/power/mt8195-power.h>
> +#include <dt-bindings/reset/mt8195-resets.h>
> +#include <dt-bindings/thermal/thermal.h>

You're not actually using the mt8195-power and thermal includes.

>  
>  / {
>  	compatible = "mediatek,mt8195";
> @@ -810,6 +813,28 @@ spi0: spi@1100a000 {
>  			status = "disabled";
>  		};
>  
> +		lvtsap: thermal-sensor@1100b000 {

Can you name this label lvts_ap, and the one below lvts_mcu, please? Makes it
much more readable.

> +			compatible = "mediatek,mt8195-lvts-ap";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100b000 0 0x400>;

Don't you need the reg size to be 0x1000 to be able to access THERMINTST in the
soc_temp_lvts.c?

> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
> +			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> +			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
> +		};
> +
> +		lvtsmcu: thermal-sensor@11278000 {
> +			compatible = "mediatek,mt8195-lvts-mcu";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x11278000 0 0x400>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> +			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> +			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
> +		};
> +
>  		spi1: spi@11010000 {
>  			compatible = "mediatek,mt8195-spi",
>  				     "mediatek,mt6765-spi";
> @@ -1613,4 +1638,92 @@ vencsys_core1: clock-controller@1b000000 {
>  			#clock-cells = <1>;
>  		};
>  	};
> +
> +	thermal_zones: thermal-zones {
> +		cpu-big1-thermal {
> +			polling-delay = <0>; /* milliseconds */
> +			polling-delay-passive = <0>; /* milliseconds */

Please drop all these '/* milliseconds */' comments. The thermal-zones
dt-binding already defines both of these properties as being in milliseconds, so
this is just polluting the DT.

Thanks,
Nícolas

