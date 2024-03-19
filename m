Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B003C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 11:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEAO9D1mihLRKmViUn6RsN+qUETg8LPVkLXBdC8ItQ8=; b=Pxw6pgg5M0J81a4XouOQAiy8ab
	r4MOkVUl7SBzSR51WX75Bxu4aY8cvcrk/idYc3x9LjAz3MdfaeqgV+WNGGOvdCUHeR//P48yLZ+cA
	IJo+i3dVqsBJnU8IEGvmlk6xKegAhYLJvLidbs84Lfx8XbeUwicYqdnV2OgRtQBcZJNnWOYrko5eg
	cjKBhntsb53BQZoKFZaCtJG/tvWG7Wsic4kr40zYwZe4fu2y0wQqILusG6g9uNoZPBLSy38dZ0K1/
	zyfxbraP8nBX97JAsoH1x0BL+4I1RAt9DAxuUAbfdMP4kqOUAm1tRfxuLKsmV9Xd5Lqe8/RRGBUZe
	8P5iRLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmY0U-0000000CX3s-1FtX;
	Tue, 19 Mar 2024 11:51:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmY0R-0000000CX3J-172l
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Mar 2024 11:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710849105;
	bh=Df4vHxdh+4U1Qaa3doL7VH2D+wCYvn+z/z5WgDx5Mxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ezTBku7RM0wYyNfhIG/FwOjUHX+6RTtQDvga3J5wxpV6T9gGOwaubkIUaQuxBdt5d
	 m9bnqGm0A4KXLwgblKYWhR4LocvTkXOvrzVKHHQcVpBwMBdL4YTgqRDLKcPwoRVbPV
	 uv0/XJB/bFf2NlGPbmE2zQIByViTYYKo4ON03JPYH3I1CV0g6/cJriA80ynb9LbgIZ
	 PfxFB17vJ/nLdpq1tfvdPT2YwkdGt/PgnOjlWVF3SPQYHR63z9k1Y0dKgWD/Eui20f
	 rEiSxjjqA7e7IK45ahf8BV3out9O/JgoIjlWy8fEEWi1b7Jm/6Ml9KVKvpLpdgYzsr
	 V0WgK8mzTC3qQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E532378203E;
	Tue, 19 Mar 2024 11:51:45 +0000 (UTC)
Message-ID: <b5ef97d6-083d-41ac-8781-662e4c862a15@collabora.com>
Date: Tue, 19 Mar 2024 12:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] thermal/drivers/mediatek/lvts_thermal: add
 MT8188 support
Content-Language: en-US
To: Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240318212428.3843952-1-nico@fluxnic.net>
 <20240318212428.3843952-13-nico@fluxnic.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240318212428.3843952-13-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_045147_493535_16D75B9A 
X-CRM114-Status: GOOD (  15.23  )
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

Il 18/03/24 22:22, Nicolas Pitre ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Various values extracted from the vendor's kernel driver.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi |  35 ++++++++
>   drivers/thermal/mediatek/lvts_thermal.c  | 102 +++++++++++++++++++++++
>   2 files changed, 137 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index b4315c9214..5a3c58a77c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
>   #include <dt-bindings/power/mediatek,mt8188-power.h>
> +#include <dt-bindings/reset/mt8188-resets.h>
>   
>   / {
>   	compatible = "mediatek,mt8188";
> @@ -357,6 +358,7 @@ infracfg_ao: syscon@10001000 {
>   			compatible = "mediatek,mt8188-infracfg-ao", "syscon";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
>   		};
>   
>   		pericfg: syscon@10003000 {
> @@ -491,6 +493,17 @@ spi0: spi@1100a000 {
>   			status = "disabled";
>   		};
>   
> +		lvts_ap: thermal-sensor@1100b000 {
> +			compatible = "mediatek,mt8188-lvts-ap";
> +			reg = <0 0x1100b000 0 0x1000>;

iospace clashing with SVS. NAK.

> +			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_CTRL_RST>;
> +			nvmem-cells = <&lvts_efuse_data1>;
> +			nvmem-cell-names = "lvts_calib_data1";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>   		spi1: spi@11010000 {
>   			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
>   			#address-cells = <1>;
> @@ -604,6 +617,17 @@ mmc1: mmc@11240000 {
>   			status = "disabled";
>   		};
>   
> +		lvts_mcu: thermal-sensor@11278000 {
> +			compatible = "mediatek,mt8188-lvts-mcu";
> +			reg = <0 0x11278000 0 0x1000>;
> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_MCU_RST>;
> +			nvmem-cells = <&lvts_efuse_data1>;
> +			nvmem-cell-names = "lvts_calib_data1";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>   		i2c0: i2c@11280000 {
>   			compatible = "mediatek,mt8188-i2c";
>   			reg = <0 0x11280000 0 0x1000>,
> @@ -827,6 +851,17 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		efuse: efuse@11f20000 {
> +			compatible = "mediatek,mt8188-efuse", "mediatek,efuse";
> +			reg = <0 0x11f20000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			lvts_efuse_data1: lvts1-calib@1ac {
> +				reg = <0x1ac 0x40>;
> +			};
> +		};
> +
>   		mfgcfg: clock-controller@13fbf000 {
>   			compatible = "mediatek,mt8188-mfgcfg";
>   			reg = <0 0x13fbf000 0 0x1000>;
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index a23a93fc82..46882df640 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1448,6 +1448,90 @@ static const struct lvts_ctrl_data mt8186_lvts_data_ctrl[] = {
>   	}
>   };
>   
> +static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] = {
> +	{
> +		.lvts_sensor = {
> +			{ .dt_id = MT8188_MCU_TS1_0,
> +			  .cal_offsets = { 22, 23, 24 } },
> +			{ .dt_id = MT8188_MCU_TS1_1,
> +			  .cal_offsets = { 25, 26, 27 } },
> +			{ .dt_id = MT8188_MCU_TS1_2,
> +			  .cal_offsets = { 28, 29, 30 } },
> +			{ .dt_id = MT8188_MCU_TS1_3,
> +			  .cal_offsets = { 31, 32, 33 } },
> +		},
> +		VALID_SENSOR_MAP(1, 1, 1, 1),
> +		.offset = 0x0,
> +		.hw_tshut_temp = 117000,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	},
> +	{
> +		.lvts_sensor = {
> +			{ .dt_id = MT8188_MCU_TS2_0,
> +			  .cal_offsets = { 34, 35, 36 } },
> +			{ .dt_id = MT8188_MCU_TS2_1,
> +			  .cal_offsets = { 37, 38, 39 } },
> +		},
> +		VALID_SENSOR_MAP(1, 1, 0, 0),
> +		.offset = 0x100,
> +		.hw_tshut_temp = 117000,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	}
> +};
> +
> +static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
> +	{
> +		.lvts_sensor = {
> +
> +			{ /* unused */ },
> +			{ .dt_id = MT8188_AP_TS3_1,
> +			  .cal_offsets = { 40, 41, 42 } },
> +		},
> +		VALID_SENSOR_MAP(0, 1, 0, 0),
> +		.offset = 0x0,
> +		.hw_tshut_temp = 117000,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	},
> +	{
> +		.lvts_sensor = {
> +			{ .dt_id = MT8188_AP_TS4_0,
> +			  .cal_offsets = { 43, 44, 45 } },
> +			{ .dt_id = MT8188_AP_TS4_1,
> +			  .cal_offsets = { 46, 47, 48 } },
> +			{ .dt_id = MT8188_AP_TS4_2,
> +			  .cal_offsets = { 49, 50, 51 } },
> +		},
> +		VALID_SENSOR_MAP(1, 1, 1, 0),
> +		.offset = 0x100,
> +		.hw_tshut_temp = 117000,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	},
> +	{
> +		.lvts_sensor = {
> +			{ .dt_id = MT8188_AP_TS5_0,
> +			  .cal_offsets = { 52, 53, 54 } },
> +			{ .dt_id = MT8188_AP_TS5_1,
> +			  .cal_offsets = { 55, 56, 57 } },
> +		},
> +		VALID_SENSOR_MAP(1, 1, 0, 0),
> +		.offset = 0x200,
> +		.hw_tshut_temp = 117000,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	},
> +	{
> +		.lvts_sensor = {
> +			{ .dt_id = MT8188_AP_TS6_0,
> +			  .cal_offsets = { 58, 59, 60 } },
> +			{ .dt_id = MT8188_AP_TS6_1,
> +			  .cal_offsets = { 61, 62, 63 } },
> +		},
> +		VALID_SENSOR_MAP(1, 1, 0, 0),
> +		.offset = 0x300,
> +		.hw_tshut_temp = 117000,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	}
> +};
> +
>   static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
>   	{
>   		.lvts_sensor = {
> @@ -1645,6 +1729,22 @@ static const struct lvts_data mt8186_lvts_data = {
>   	.gt_calib_bit_offset = 24,
>   };
>   
> +static const struct lvts_data mt8188_lvts_mcu_data = {
> +	.lvts_ctrl	= mt8188_lvts_mcu_data_ctrl,
> +	.num_lvts_ctrl	= ARRAY_SIZE(mt8188_lvts_mcu_data_ctrl),
> +	.temp_factor	= -250460,
> +	.temp_offset	= 250460,

This is LVTS_COEFF_{A,B}_MT8195: please use the definitions that are already there.

Regards,
Angelo

> +	.gt_calib_bit_offset = 20,
> +};
> +
> +static const struct lvts_data mt8188_lvts_ap_data = {
> +	.lvts_ctrl	= mt8188_lvts_ap_data_ctrl,
> +	.num_lvts_ctrl	= ARRAY_SIZE(mt8188_lvts_ap_data_ctrl),
> +	.temp_factor	= -250460,
> +	.temp_offset	= 250460,
> +	.gt_calib_bit_offset = 20,
> +};
> +
>   static const struct lvts_data mt8192_lvts_mcu_data = {
>   	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
>   	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
> @@ -1676,6 +1776,8 @@ static const struct lvts_data mt8195_lvts_ap_data = {
>   static const struct of_device_id lvts_of_match[] = {
>   	{ .compatible = "mediatek,mt7988-lvts-ap", .data = &mt7988_lvts_ap_data },
>   	{ .compatible = "mediatek,mt8186-lvts", .data = &mt8186_lvts_data },
> +	{ .compatible = "mediatek,mt8188-lvts-mcu", .data = &mt8188_lvts_mcu_data },
> +	{ .compatible = "mediatek,mt8188-lvts-ap", .data = &mt8188_lvts_ap_data },
>   	{ .compatible = "mediatek,mt8192-lvts-mcu", .data = &mt8192_lvts_mcu_data },
>   	{ .compatible = "mediatek,mt8192-lvts-ap", .data = &mt8192_lvts_ap_data },
>   	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },



