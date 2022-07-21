Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA916C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuHyOZDMgN8R/T0fG/GgdIJPeagQh7nFdb9/Jl1RsCE=; b=veKeVGSNmO5y1yIGxnR0v9fb1c
	YUU8HC38BuXLtf0CTZEdfSZ9T8/Mn90QDAxBh6htizrNtoS0t0juKlTprR9lAV3RtAGOlS9XYxVaL
	ng4GFaeMZSflhCp8XYr9MVp+vmSRcLJA0GS1lMGfD9/eBhW+09W85u+HBnVMg97Jg1y4XROP42VoX
	D15le96DdPsbo2wg0Az62k6lN0U9wt+GheH7OOBC+L6xsFlcoJrYobytmt3fDKiBUmso8PanS/ACQ
	7evEJv7FQN5FOVZVcNgEwUlvXc2hmhATanXYIKFrJdFZJq6Fm4owzxyNZktfPtWtbVnZQ9CAKslMF
	L2wLU7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWbX-007I4U-NA; Thu, 21 Jul 2022 13:52:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWRs-007CPR-A3; Thu, 21 Jul 2022 13:42:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 138A46601AB2;
	Thu, 21 Jul 2022 14:42:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658410956;
	bh=wMIiEPoxAhEiKY22jDJpVVBvPTPTcpvE8DsrxOXPpJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QiekTYt7ct2roixZMYW/tBDip+jdYZ4dfA5pHkwJqsU9TFI+kQxFNdiRy6JGdS2/A
	 crpVrzx4emlQvlmqKYw6P6JBhuUoX8XCQ0DgJ+vBuF/uz5Ut9yZ6ACTTubUEsddTzz
	 N0ihjwbCfIiTFP0Vdo+ln3COjCzfmuAGJIXjvfL8whuSEXYNkNL35lMatyW282ufIb
	 LVE2JwdLGu6V/1deaF2+yNeo0mdsf9cZlBmJabmz4UhcFEQrwwlt8mTFnhDcWZAmeC
	 qxVCKZXXIhrcl65bAVt2O/EHep1/Tm0Dc0/ahlD7sKzUJaCs5wkBpsm3UglDRXG4iy
	 gxqHYKyDDCj+w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 8/8] arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus
Date: Thu, 21 Jul 2022 15:42:28 +0200
Message-Id: <20220721134228.310178-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
References: <20220721134228.310178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_064240_653172_98DE8E52 
X-CRM114-Status: GOOD (  10.80  )
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

All machines in the Cherry platform use MT6315 over SPMI: add the
two instances, providing Vbcpu and Vgpu regulators.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         | 52 +------------------
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 42 +++++++++++++++
 2 files changed, 44 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 04597ffc4286..ede7b208c882 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -1,54 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cozmo.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku1.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku6.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku7.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14-sku2.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu-sku22.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-kingler.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-krabby.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196609.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
+
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
+
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 9086a440a995..6219544e9912 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/spmi/spmi.h>
 #include "mt8195.dtsi"
 #include "mt6359.dtsi"
 
@@ -979,6 +980,47 @@ usb_c1: connector@1 {
 	};
 };
 
+&spmi {
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	mt6315@6 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+
+		regulators {
+			mt6315_6_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vbcpu";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <6250>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+
+	mt6315@7 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x7 SPMI_USID>;
+
+		regulators {
+			mt6315_7_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vgpu";
+				regulator-min-microvolt = <625000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <6250>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 &u3phy0 {
 	status = "okay";
 };
-- 
2.35.1


