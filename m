Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2BBD78311
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 12:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TWzayKwl6vTitRugS2EOw67/+C7PLCqur4K/uzJmtc=; b=Uk3i19y2yKAGrU
	YnccsAl71LndiSPsIWchzxxEtWyDJHhmB0SmibH79eUDc9BA7yEao7QXSR1bPWgM4EaE6B/oZzec4
	TZl/HRP+tQySAnid642K5in2oFIGCgD9Qr06uqkaLeubCQDCrt85aYOejr/gNMGtAqNqd4p0FnCSf
	tDxjXXtze10b5Q9dlvZ26iSDDB2+PbuC2pSsjiU7zbMyiyXaJyVlX3KUlc27Bpy2eoFKZGmA9FJLS
	v5PoGC9sd8aYJZfHtiPSSazk728uWpzkcpv+AC/I/prK1u1COOxmwfRGUBkaCjyRf3wtO6+aRZt7T
	DX+t1ocAayupqILbaY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5a6-000000065Ii-1w5q;
	Mon, 02 Dec 2024 12:31:14 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VG-0000000646r-1Y8m;
	Mon, 02 Dec 2024 12:26:15 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id C4D0260435;
	Mon,  2 Dec 2024 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5TWzayKwl6vTitRugS2EOw67/+C7PLCqur4K/uzJmtc=;
	b=G67mCFeS2W4Mp8n8AAMMRRfUWEm3Ich2UOZmYqbo8jZIxVJ/L572mlTxdgv0jilrChg5HH
	nNjixBF7XXVZVurpbER9BidyU+GWbaicIdNPZqK0/DS4WCv81I6bCVusNPLmO8qoCOOllb
	VLd0cD9xrqnb/M0MZ1oPR7cRVRuLZKc=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 3F6CE3600C0;
	Mon,  2 Dec 2024 12:26:12 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 04/18] arm64: dts: mediatek: mt7988: add lvts node
Date: Mon,  2 Dec 2024 13:25:45 +0100
Message-ID: <20241202122602.30734-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8b4c00e1-9437-4750-95d9-f1438fe1860c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042614_551291_A03AEA4E 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add Low Voltage Thermal Sensor (LVTS) node for mt7988 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes:

v2:
squash
- "arm64: dts: mediatek: mt7988: add label for efuse"
- "arm64: dts: mediatek: mt7988: extend efuse node" (drop other efuse subnodes)
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 5e40446cb7b3..f7748a840297 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt65xx.h>
+#include <dt-bindings/reset/mediatek,mt7988-resets.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -85,6 +86,7 @@ infracfg: clock-controller@10001000 {
 			compatible = "mediatek,mt7988-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		topckgen: clock-controller@1001b000 {
@@ -250,6 +252,17 @@ i2c@11005000 {
 			status = "disabled";
 		};
 
+		lvts: lvts@1100a000 {
+			compatible = "mediatek,mt7988-lvts-ap";
+			#thermal-sensor-cells = <1>;
+			reg = <0 0x1100a000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
+			nvmem-cells = <&lvts_calibration>;
+			nvmem-cell-names = "lvts-calib-data-1";
+		};
+
 		usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
@@ -307,11 +320,15 @@ clock-controller@11f40000 {
 			#clock-cells = <1>;
 		};
 
-		efuse@11f50000 {
+		efuse: efuse@11f50000 {
 			compatible = "mediatek,mt7988-efuse", "mediatek,efuse";
 			reg = <0 0x11f50000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			lvts_calibration: calib@918 {
+				reg = <0x918 0x28>;
+			};
 		};
 
 		clock-controller@15000000 {
-- 
2.43.0


