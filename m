Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72959D2AB1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEn9e3Gmbg9qm+aCkqjz6Xik1WTOU1GWAXvr6sZyRfw=; b=EULL7W+2lgG7Sg
	L0ig+zHnu/kSpc6VoeuljaPeAKuMCfmYR9/J0EdFDuQWSrwaMfjvRB3xNkQfUrImu4ctr2K4iyBSv
	hUlyTraIw8A16FiaeYyQIsNzUkbM8nog1q7MMDi1I0FA86osRz5KGAKkGywurqvdb5kQwSd+YZvN6
	T10X/BtjBC7WuxnUUCZjhONDd8eKLuJc4vojE5OfBZwYzOxYJR/ynmD9uaUDFiC1qhWGJeHXAeHts
	cti4h3Ez+qmQc2aMECeBS8ygXYhv8GYkgJv4/cK++9RlapmRMCSZCRxyzdi6osAF+g794YH2pc9Kd
	CVJoD5z/QrsGYPD5UBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jq8-0000000E7BE-2Kku;
	Tue, 29 Oct 2024 10:52:44 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jdg-0000000E49O-0FAB;
	Tue, 29 Oct 2024 10:39:53 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 6089E4051F;
	Tue, 29 Oct 2024 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEn9e3Gmbg9qm+aCkqjz6Xik1WTOU1GWAXvr6sZyRfw=;
	b=rgXTN+tw5vVYbKuWd3PhDQ9ddTNeXR+wn/nFeZXjY1dUiOswiYa+quyZNCwJjJUkmdMLOP
	tPoZxDPErukR3B5bELwZW4DLxz/bddvxu+aJ2t4JUwGbVqguNQeFcLHVLEu+BsnIuuwMKq
	3fvSxMQ0tOvpVB+GbGR3axQDl24wqPs=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id BE91636037C;
	Tue, 29 Oct 2024 10:39:48 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC v1 10/14] arm64: dts: mediatek: mt7988: add lvts node
Date: Tue, 29 Oct 2024 11:39:29 +0100
Message-ID: <20241029103937.45852-11-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9cfe9d8b-db7c-4981-b57d-3a085ddbeb43
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033952_270451_DA645B42 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index ed8ce1e6f68b..de9a9ff2edd8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt65xx.h>
+#include <dt-bindings/reset/mediatek,mt7988-resets.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -103,6 +104,7 @@ infracfg: clock-controller@10001000 {
 			compatible = "mediatek,mt7988-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		topckgen: clock-controller@1001b000 {
@@ -268,6 +270,17 @@ i2c2: i2c@11005000 {
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
 		ssusb0: usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
-- 
2.43.0


