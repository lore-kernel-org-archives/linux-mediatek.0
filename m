Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2496ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/Wtn0DfWDH6os61F61lE2PATvdUKDlqCe6UeEHKGZE=; b=QsbjvMqJsgADk7LD480tlntl6M
	Apc89dx7MiIdYGzcW5HPjifp0tmEg52t/aAHRjEnJBHMCvSOgPKH7DtU69lSeRa72Nz19sJVdlaYr
	XjpdDnrk+St7DrKE4QO0/KHq6Xsbx9l2YU4rTQjP7MW0Q010mnQOzazfTQSD3v2HsAYQIzhxTv029
	xPn6D1CZTWG38tKieJ7wmxRyvxlTQXr+roWW6L/xB89Ge8qlt+SZgXX/fWAW62rLim9njGh9DxZK6
	n+CrU6/HvBxRHoELVXQm8upaii5MfRXD5FdTb8rwd+20oe6Hrj5wPp9w07qm0TIJhfVcDttUrwRwI
	QsiX0BhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRSk-00HJH9-0y; Wed, 14 Sep 2022 12:25:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRST-00HIjr-M3; Wed, 14 Sep 2022 12:25:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9678660201C;
	Wed, 14 Sep 2022 13:25:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663158336;
	bh=chHX2jLIhcmbg+DDld/yuFaSQbRv4/mc7ZJbewN4Trc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K2dzTtfRPSBVPtyL0U9eeZa0r9AtGR11cm87zqE1lSzRrlhp0+UQ+BOLr65VugiFk
	 HA8CmyhxcMnK6cRMkzSXtze/ytfjFwpVWmQSa0WXVmTxnnCj3lAJ846MRs2dXJAYqa
	 +z9aJiqLPurmG/BB0qSu4KprXROi8tIOQbWIhmrQJpU0DrgSVBHAaOBxghbeKjpzAN
	 7R+TsxiuWZoqEgwKt6E0KrNOJzOvGc+nKfvT7RpH+GKlwR+uQAEw8odZGdtseyz9oc
	 RSqkb5r6jxXFjddrZbLYIZW/Go2UVgWRAxNkKt8rGKE/1Ka5ocpsl3hjYShaGxf/n8
	 Fr2JRoKFkMqkQ==
Message-ID: <57039109-bf86-bd91-3b71-531e45fcb68f@collabora.com>
Date: Wed, 14 Sep 2022 14:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,6/7] arm64: dts: mt8195: Add thermal zones and thermal
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
 <20220817080757.352021-7-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220817080757.352021-7-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_052537_904234_D586B411 
X-CRM114-Status: GOOD (  14.18  )
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
> From: Tinghan Shen <tinghan.shen@mediatek.com>
> 
> Add thermal zones and thermal nodes for the mt8195.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Co-developed-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Co-developed-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 111 +++++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 95967a0196d8..aafbbe83e6ba 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +#include <dt-bindings/reset/mt8195-resets.h>
>   
>   / {
>   	compatible = "mediatek,mt8195";
> @@ -452,6 +453,28 @@ spi0: spi@1100a000 {
>   			status = "disabled";
>   		};
>   
> +		lvts_ap: thermal-sensor@1100b000 {
> +			compatible = "mediatek,mt8195-lvts-ap";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
> +			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> +			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
> +		};
> +
> +		lvts_mcu: thermal-sensor@11278000 {

Please keep the devicetree nodes ordered by address.
This one must be moved between mmc@1125000 and usb@11290000.

Regards,
Angelo

> +			compatible = "mediatek,mt8195-lvts-mcu";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x11278000 0 0x1000>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> +			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> +			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
> +		};
> +
>   		spi1: spi@11010000 {
>   			compatible = "mediatek,mt8195-spi",
>   				     "mediatek,mt6765-spi";


