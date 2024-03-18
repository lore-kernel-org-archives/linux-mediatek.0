Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A9C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpUWXYJsBsKxHd6hPysuKQxwWz/2zh81DVd27QPXlYc=; b=LjCLQ/AYZa4HHdnqtLq0MRgAs0
	Oe4tMmCTs3L0TBCGYbTkX+w1pRNaGoLrZp91jGnyBfC1HNxy/1oJDzmzrH8EvIJb/sQFsfWVPXRBm
	bDeqfRZYaUPuD23jvkSqJt16Dgva4cUc1VBp9Mk+qyeZEcrydo557TgHETUplQH5VlJlW2MDELDWi
	3NyXZASRc1+ybzIXfHMu0Gt+5y7/im5jIgAYQYBZuo74IGU2Ghs00FmfdinG5arlNPsSAQnbmo4EA
	3nU2AogltGxxZeuQwAyzFLh5msUQr/yEtg7bvCVSLmSz1jtDLyrHcExJv3ls66r4d7f83BtCPNY7k
	9pCWjG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKd1-0000000AEds-3TOb;
	Mon, 18 Mar 2024 21:34:43 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKcy-0000000AEbl-2WhO
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:34:42 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 2B2B11D10B3;
	Mon, 18 Mar 2024 17:34:38 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=rOtLsph6Q8c5b1SVtGdeg7bNP
	I+m727ryiDtorHRqRg=; b=M6D6HzCbUMG1Xxwk9EPt7DJcVwnPFmCod21QUv3jl
	AG+cdhjrzON2IyN1QGraBWpQhpvBE3c2Jk1O5y/zeTUzjWDk6OhnAA6tOip2Ai4C
	n1eLxZhksDpSDw+zzisytsmFPGoLX6J9o3Ru+ntnuFD8hBqFFYj25b/lOq9FK9Sr
	6Q=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 118291D10B1;
	Mon, 18 Mar 2024 17:34:38 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=zzdQgQ+ujmN/+VszAJaXnWpW7T2/ksvp8o6qRRSrnTg=; b=PibOmOXzX2uZGz/Zjj/baC4zAHKNDJr8hPZXezRy5tyuOSG0hSs918O67sfV8rGBON1WZr1FLF8tf3e9OUU1AvQOxTGupFo/HugGqC/j+yYFT6IvxmwAJl49nPkQvF12h2g528mRi6dbeBFs61oirjqIIi3tCMkFvHB4D552Al0=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 5B94F1D10B0;
	Mon, 18 Mar 2024 17:34:37 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id E66CABE2BAE;
	Mon, 18 Mar 2024 17:24:50 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 12/13] thermal/drivers/mediatek/lvts_thermal: add MT8188 support
Date: Mon, 18 Mar 2024 17:22:14 -0400
Message-ID: <20240318212428.3843952-13-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: 51F09F42-E56F-11EE-B5CD-78DCEB2EC81B-78420484!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_143440_895642_9E8662C9 
X-CRM114-Status: GOOD (  13.95  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Various values extracted from the vendor's kernel driver.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi |  35 ++++++++
 drivers/thermal/mediatek/lvts_thermal.c  | 102 +++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
index b4315c9214..5a3c58a77c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
 #include <dt-bindings/power/mediatek,mt8188-power.h>
+#include <dt-bindings/reset/mt8188-resets.h>
=20
 / {
 	compatible =3D "mediatek,mt8188";
@@ -357,6 +358,7 @@ infracfg_ao: syscon@10001000 {
 			compatible =3D "mediatek,mt8188-infracfg-ao", "syscon";
 			reg =3D <0 0x10001000 0 0x1000>;
 			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
 		};
=20
 		pericfg: syscon@10003000 {
@@ -491,6 +493,17 @@ spi0: spi@1100a000 {
 			status =3D "disabled";
 		};
=20
+		lvts_ap: thermal-sensor@1100b000 {
+			compatible =3D "mediatek,mt8188-lvts-ap";
+			reg =3D <0 0x1100b000 0 0x1000>;
+			interrupts =3D <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks =3D <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets =3D <&infracfg_ao MT8188_INFRA_RST1_THERMAL_CTRL_RST>;
+			nvmem-cells =3D <&lvts_efuse_data1>;
+			nvmem-cell-names =3D "lvts_calib_data1";
+			#thermal-sensor-cells =3D <1>;
+		};
+
 		spi1: spi@11010000 {
 			compatible =3D "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
 			#address-cells =3D <1>;
@@ -604,6 +617,17 @@ mmc1: mmc@11240000 {
 			status =3D "disabled";
 		};
=20
+		lvts_mcu: thermal-sensor@11278000 {
+			compatible =3D "mediatek,mt8188-lvts-mcu";
+			reg =3D <0 0x11278000 0 0x1000>;
+			interrupts =3D <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks =3D <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets =3D <&infracfg_ao MT8188_INFRA_RST1_THERMAL_MCU_RST>;
+			nvmem-cells =3D <&lvts_efuse_data1>;
+			nvmem-cell-names =3D "lvts_calib_data1";
+			#thermal-sensor-cells =3D <1>;
+		};
+
 		i2c0: i2c@11280000 {
 			compatible =3D "mediatek,mt8188-i2c";
 			reg =3D <0 0x11280000 0 0x1000>,
@@ -827,6 +851,17 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
 			#clock-cells =3D <1>;
 		};
=20
+		efuse: efuse@11f20000 {
+			compatible =3D "mediatek,mt8188-efuse", "mediatek,efuse";
+			reg =3D <0 0x11f20000 0 0x1000>;
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+
+			lvts_efuse_data1: lvts1-calib@1ac {
+				reg =3D <0x1ac 0x40>;
+			};
+		};
+
 		mfgcfg: clock-controller@13fbf000 {
 			compatible =3D "mediatek,mt8188-mfgcfg";
 			reg =3D <0 0x13fbf000 0 0x1000>;
diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index a23a93fc82..46882df640 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1448,6 +1448,90 @@ static const struct lvts_ctrl_data mt8186_lvts_dat=
a_ctrl[] =3D {
 	}
 };
=20
+static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] =3D {
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_MCU_TS1_0,
+			  .cal_offsets =3D { 22, 23, 24 } },
+			{ .dt_id =3D MT8188_MCU_TS1_1,
+			  .cal_offsets =3D { 25, 26, 27 } },
+			{ .dt_id =3D MT8188_MCU_TS1_2,
+			  .cal_offsets =3D { 28, 29, 30 } },
+			{ .dt_id =3D MT8188_MCU_TS1_3,
+			  .cal_offsets =3D { 31, 32, 33 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset =3D 0x0,
+		.hw_tshut_temp =3D 117000,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_MCU_TS2_0,
+			  .cal_offsets =3D { 34, 35, 36 } },
+			{ .dt_id =3D MT8188_MCU_TS2_1,
+			  .cal_offsets =3D { 37, 38, 39 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset =3D 0x100,
+		.hw_tshut_temp =3D 117000,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	}
+};
+
+static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] =3D {
+	{
+		.lvts_sensor =3D {
+
+			{ /* unused */ },
+			{ .dt_id =3D MT8188_AP_TS3_1,
+			  .cal_offsets =3D { 40, 41, 42 } },
+		},
+		VALID_SENSOR_MAP(0, 1, 0, 0),
+		.offset =3D 0x0,
+		.hw_tshut_temp =3D 117000,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_AP_TS4_0,
+			  .cal_offsets =3D { 43, 44, 45 } },
+			{ .dt_id =3D MT8188_AP_TS4_1,
+			  .cal_offsets =3D { 46, 47, 48 } },
+			{ .dt_id =3D MT8188_AP_TS4_2,
+			  .cal_offsets =3D { 49, 50, 51 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 0),
+		.offset =3D 0x100,
+		.hw_tshut_temp =3D 117000,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_AP_TS5_0,
+			  .cal_offsets =3D { 52, 53, 54 } },
+			{ .dt_id =3D MT8188_AP_TS5_1,
+			  .cal_offsets =3D { 55, 56, 57 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset =3D 0x200,
+		.hw_tshut_temp =3D 117000,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_AP_TS6_0,
+			  .cal_offsets =3D { 58, 59, 60 } },
+			{ .dt_id =3D MT8188_AP_TS6_1,
+			  .cal_offsets =3D { 61, 62, 63 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset =3D 0x300,
+		.hw_tshut_temp =3D 117000,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	}
+};
+
 static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] =3D {
 	{
 		.lvts_sensor =3D {
@@ -1645,6 +1729,22 @@ static const struct lvts_data mt8186_lvts_data =3D=
 {
 	.gt_calib_bit_offset =3D 24,
 };
=20
+static const struct lvts_data mt8188_lvts_mcu_data =3D {
+	.lvts_ctrl	=3D mt8188_lvts_mcu_data_ctrl,
+	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8188_lvts_mcu_data_ctrl),
+	.temp_factor	=3D -250460,
+	.temp_offset	=3D 250460,
+	.gt_calib_bit_offset =3D 20,
+};
+
+static const struct lvts_data mt8188_lvts_ap_data =3D {
+	.lvts_ctrl	=3D mt8188_lvts_ap_data_ctrl,
+	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8188_lvts_ap_data_ctrl),
+	.temp_factor	=3D -250460,
+	.temp_offset	=3D 250460,
+	.gt_calib_bit_offset =3D 20,
+};
+
 static const struct lvts_data mt8192_lvts_mcu_data =3D {
 	.lvts_ctrl	=3D mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
@@ -1676,6 +1776,8 @@ static const struct lvts_data mt8195_lvts_ap_data =3D=
 {
 static const struct of_device_id lvts_of_match[] =3D {
 	{ .compatible =3D "mediatek,mt7988-lvts-ap", .data =3D &mt7988_lvts_ap_=
data },
 	{ .compatible =3D "mediatek,mt8186-lvts", .data =3D &mt8186_lvts_data }=
,
+	{ .compatible =3D "mediatek,mt8188-lvts-mcu", .data =3D &mt8188_lvts_mc=
u_data },
+	{ .compatible =3D "mediatek,mt8188-lvts-ap", .data =3D &mt8188_lvts_ap_=
data },
 	{ .compatible =3D "mediatek,mt8192-lvts-mcu", .data =3D &mt8192_lvts_mc=
u_data },
 	{ .compatible =3D "mediatek,mt8192-lvts-ap", .data =3D &mt8192_lvts_ap_=
data },
 	{ .compatible =3D "mediatek,mt8195-lvts-mcu", .data =3D &mt8195_lvts_mc=
u_data },
--=20
2.44.0


