Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21375C04FF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zM9V769eS1fWVoXXPMvQauIKJKTc4BWAJXhkeyQgWas=; b=sBIOCXCl1kr/0GE83cyZtHWlmD
	wLJSRCwiKYwcBkNOWVomwD1v4OTsCpZxBMWiqoBiHYgoSlxeB8FHW+zdqBoNinthBiUrd+PUYSDE2
	wa2VNUh5K4uRnoZTb0i55I5uY2DlKYNp46/hmbeiVdz/siArOfyYlxxHXoongaQHHA23+sEMzHv1i
	ExA3u5ths/4DOeicCooYSCrxKhBTnaF7yFEPcBvPNWHdQK1jtdRwzMnM/2oFFBIceA+/86eJikEai
	Kt72xtZLgHmyIjZCip+WZvIr50yzwsNxAlVc+w/k7JeG60qBBRPIfXYccGtSgpSZ2oZp1zUHL6zC0
	bh15YCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2WF-0000000FbYh-2IzM;
	Wed, 17 Apr 2024 10:27:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2WC-0000000FbXF-1UCV;
	Wed, 17 Apr 2024 10:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713349674;
	bh=igKb1+9ORijlEOAngHwdjRu6XCuUhCp5tx6ifK5ZhJ8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tPS1FpQidS4mEjupwQSkrvh2Y6jR4RzXxnuepn5ZYhPUzrkfgh745SW8jSLZOpipc
	 LE9QeKfi+Lo9+GTROFU3kPxkj8Zfwb88avWezJd53YL2GPyhLZuj2DdxtA81SNb6Tc
	 EZqBPLN3V7uORWjUGhaMUBunnYpjHTiggdyNwGASrDPosz/oI/gKB9pVXbglAbrhJ6
	 YGLkBRi49WHgYgbImowDqeO2rQnCHgFLIAz1hm+JDX4S5ldmA62HUxSaYQOQJl3ARX
	 vooHjnOmZjlJ8wD0ViSg+FvddinMn3KMKxHLPASKMxD8SLIY/5/knuxXtSA2U5pTYC
	 Jb1WTtJWHNJpw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7E9D37820F1;
	Wed, 17 Apr 2024 10:27:52 +0000 (UTC)
Message-ID: <37ffdb00-8d7a-4305-8814-6794c755c190@collabora.com>
Date: Wed, 17 Apr 2024 12:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-17-33ce8864b227@baylibre.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-17-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_032756_583432_2943E9F6 
X-CRM114-Status: GOOD (  16.13  )
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

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> - Add aliases for each display components to help display drivers.
> - Add the Display Pulse Width Modulation (DISP_PWM) to provide PWM signals
>    for the LED driver of mobile LCM.
> - Add the MIPI Display Serial Interface (DSI) PHY support. (up to 4-lane
>    output)
> - Add the display mutex support.
> - Add the following display component support:
>    - OVL0 (Overlay)
>    - RDMA0 (Data Path Read DMA)
>    - Color0
>    - CCorr0 (Color Correction)
>    - AAL0 (Adaptive Ambient Light)
>    - GAMMA0
>    - Dither0
>    - DSI0 (Display Serial Interface)
>    - RDMA1 (Data Path Read DMA)
>    - DPI0 (Display Parallel Interface)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 146 +++++++++++++++++++++++++++++++
>   1 file changed, 146 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 24581f7410aa..a95f90da4491 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mediatek,mt8365-power.h>
>   
> @@ -17,6 +18,19 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	aliases {
> +		aal0 = &aal0;
> +		ccorr0 = &ccorr0;
> +		color0 = &color0;
> +		dither0 = &dither0;
> +		dpi0 = &dpi0;
> +		dsi0 = &dsi0;
> +		gamma0 = &gamma0;
> +		ovl0 = &ovl0;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -607,6 +621,17 @@ spi: spi@1100a000 {
>   			status = "disabled";
>   		};
>   
> +		disp_pwm: pwm@1100e000 {
> +			compatible = "mediatek,mt8365-disp-pwm",
> +				     "mediatek,mt8183-disp-pwm";

Fits in a single line

> +			reg = <0 0x1100e000 0 0x1000>;
> +			clock-names = "main", "mm";
> +			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
> +				 <&infracfg CLK_IFR_DISP_PWM>;

same

> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +			#pwm-cells = <2>;
> +		};
> +
>   		i2c3: i2c@1100f000 {
>   			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
>   			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
> @@ -703,6 +728,15 @@ ethernet: ethernet@112a0000 {
>   			status = "disabled";
>   		};
>   
> +		mipi_tx0: dsi-phy@11c00000 {
> +			compatible = "mediatek,mt8365-mipi-tx", "mediatek,mt8183-mipi-tx";
> +			reg = <0 0x11c00000 0 0x800>;
> +			clock-output-names = "mipi_tx0_pll";
> +			clocks = <&clk26m>;
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +		};
> +
>   		u3phy: t-phy@11cc0000 {
>   			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
>   			#address-cells = <1>;
> @@ -732,6 +766,13 @@ mmsys: syscon@14000000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		mutex: mutex@14001000 {
> +			compatible =  "mediatek,mt8365-disp-mutex";
> +			reg = <0 0x14001000 0 0x1000>;
> +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +		};
> +
>   		smi_common: smi@14002000 {
>   			compatible = "mediatek,mt8365-smi-common";
>   			reg = <0 0x14002000 0 0x1000>;
> @@ -755,6 +796,111 @@ larb0: larb@14003000 {
>   			mediatek,larb-id = <0>;
>   		};
>   
> +		ovl0: ovl@1400b000 {
> +			compatible = "mediatek,mt8365-disp-ovl",
> +				     "mediatek,mt8192-disp-ovl";

single line

> +			reg = <0 0x1400b000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MM_DISP_OVL0>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_DISP_OVL0>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +		};
> +
> +		rdma0: rdma@1400d000 {
> +			compatible = "mediatek,mt8365-disp-rdma",
> +				     "mediatek,mt8183-disp-rdma";

ditto

> +			reg = <0 0x1400d000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MM_DISP_RDMA0>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
> +			mediatek,rdma-fifo-size = <5120>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +		};
> +
> +		color0: color@1400f000 {
> +			compatible = "mediatek,mt8365-disp-color",
> +				     "mediatek,mt8173-disp-color";

...and all the others too (maybe not all, it's fine until 100 cols anyway)


Cheers,
Angelo


