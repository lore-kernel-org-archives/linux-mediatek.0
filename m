Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87917C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xpg2K5IK583pjooUY2AUSf7emG5P/Sv4jiJFpgz2R9E=; b=am2AJfb6hh1q1D1aWkGH+tKevJ
	kc2ZPXc8QionI1SN6prqSx5PucA0eWJvxJasomKPpwlYPUSRsGvsP85s8VjJp30GREZSDi0bWqiqT
	nKAqj0LTWlvBgjV3Nu9K/KXPz4nfLk0MfAYmOTxXTmmOMIB6VRlxepZ/qH6yuoY1fq2GPG+0DOyAO
	ZVXDvvR5tMVeKZqDAPS9HEPLb0/2jch+aMvXnJP4DGE1ltacdIV9cznU/c1QeXdp1wwJ51CZIjFiK
	EUxxNSluKYSGG7FJD6eKBVpJFuA71Ljuo1drghKSZegfVJE5x9YruGotMeVt4u10AzU8duSe7Nx/A
	cyiyBEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUuw-00000009aZK-0bQ7;
	Tue, 02 Apr 2024 03:34:34 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUur-00000009aWf-2Kp4
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:31 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id E68B0250D9;
	Mon,  1 Apr 2024 23:34:28 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=rTvrEZ65j4kYINrGDrXQm7sDn
	jqIptBM8U6bohiAAs8=; b=BTfKCNnl8c+92gTye8jn+Yt9Q+N/g2ZXdc51iTcAM
	H4CJi4smAmU1jXt2QEzgiKfNaEL1KdwMqNn5AwQVP3ovj6W+Rsu+jg8ADDxOMwMj
	BOnovnyVKfo2pQxlfFfwHv/pHCN588oKMrrG6XZh3uYf721vMXWhBaACZYLKQvLQ
	8k=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id DF0E5250D8;
	Mon,  1 Apr 2024 23:34:28 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=0wToczV/1O2aHSAMhacxFcFPX/l7HUJsFN4ve25Y6XA=; b=JHxO5ghMLyrtYzUjb1IWc20lgrVqRKyiHf9KvYu4MKeJiLMhHbqlViRiATh+w02CThiC32DdTRMB8hNR5g8+IekWIjO8brHJ3HtJ8++KXBUR8I5xZbLJauM5Y31i+v+WFm1DLuPfymwBUUF0WPk6V9GdHB5BEpvDlkqpErWd2H0=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C9865250D5;
	Mon,  1 Apr 2024 23:34:24 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id ED6B8C1CED7;
	Mon,  1 Apr 2024 23:27:45 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 13/15] arm64: dts: mediatek: mt8188: add lvts definitions
Date: Mon,  1 Apr 2024 23:25:47 -0400
Message-ID: <20240402032729.2736685-14-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E6D7A668-F0A1-11EE-8378-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_203429_722111_32215C3A 
X-CRM114-Status: GOOD (  10.50  )
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
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
index b4315c9214..101c9c9f4b 100644
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
+			reg =3D <0 0x1100b000 0 0xc00>;
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
--=20
2.44.0


