Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 08:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D31604DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 08:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64D31604DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6bPmSw7RQt0jpkR33kSWTJR/1asQMN2KlIUtF3Xnxg=; b=vTwb5ikJRRAtYG
	J+6iMWFkShaybqcBFHS54ojN4pYMQuH1JG4x0iV/k0rx0Iv1I5FN+JJgC7eFLtMWf/dQ/8WonZ7Hv
	qu5ofgyljmQ4/9jj5u2IpC+ulCxttBfIahynzKjQUyoMFcCB2oBdrfidTZDUmGZP+LbvkNn8X1SsI
	txL92K4tEwsupTdLHmjxsKL6g7AXiORROpERxocHoKsDrR2mLmuk1gN18DA/HaOmfjiVIMMINXj3P
	VDkuflRgmE5EVBGLF23wlO8k+Xl3OD6AaC5548LcX4RBtSDoAhwApXI4IPzcKILWiTJp6JPhFsj3L
	/DADxV38Lm+pnEoR7wOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mavma-0026BJ-NA; Thu, 14 Oct 2021 08:08:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavl9-0025Zg-Kt; Thu, 14 Oct 2021 08:06:41 +0000
X-UUID: 9673c8a5ee814851afab8fa7bf5204cc-20211014
X-UUID: 9673c8a5ee814851afab8fa7bf5204cc-20211014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 693427514; Thu, 14 Oct 2021 01:06:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 00:56:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Oct 2021 15:56:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Oct 2021 15:56:32 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, "Weiyi
 Lu" <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>, Miles Chen <miles.chen@mediatek.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-clk@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v4 5/5] arm64: dts: mediatek: add clock support for mt7986b
Date: Thu, 14 Oct 2021 15:56:20 +0800
Message-ID: <20211014075620.17563-6-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211014075620.17563-1-sam.shih@mediatek.com>
References: <20211014075620.17563-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_010639_725878_8E1698A0 
X-CRM114-Status: GOOD (  11.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add clock controller nodes, include 40M clock source, topckgen,
infracfg, apmixedsys and ethernet subsystem.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi | 68 +++++++++++++++++++++--
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
index 2b8e0a382398..9cc27020901a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mt7986-clk.h>
 
 / {
 	compatible = "mediatek,mt7986b";
@@ -13,9 +14,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	system_clk: dummy40m {
+	clk40m: oscillator@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <40000000>;
+		clock-output-names = "clkxtal";
 		#clock-cells = <0>;
 	};
 
@@ -99,6 +101,18 @@ gic: interrupt-controller@c000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		infracfg: infracfg@10001000 {
+			compatible = "mediatek,mt7986-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		topckgen: topckgen@1001b000 {
+			compatible = "mediatek,mt7986-topckgen", "syscon";
+			reg = <0 0x1001B000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		watchdog: watchdog@1001c000 {
 			compatible = "mediatek,mt7986-wdt",
 				     "mediatek,mt6589-wdt";
@@ -108,11 +122,31 @@ watchdog: watchdog@1001c000 {
 			status = "disabled";
 		};
 
+		apmixedsys: apmixedsys@1001e000 {
+			compatible = "mediatek,mt7986-apmixedsys";
+			reg = <0 0x1001E000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		sgmiisys0: syscon@10060000 {
+			compatible = "mediatek,mt7986-sgmiisys_0",
+				     "syscon";
+			reg = <0 0x10060000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		sgmiisys1: syscon@10070000 {
+			compatible = "mediatek,mt7986-sgmiisys_1",
+				     "syscon";
+			reg = <0 0x10070000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		trng: trng@1020f000 {
 			compatible = "mediatek,mt7986-rng",
 				     "mediatek,mt7623-rng";
 			reg = <0 0x1020f000 0 0x100>;
-			clocks = <&system_clk>;
+			clocks = <&infracfg CLK_INFRA_TRNG_CK>;
 			clock-names = "rng";
 			status = "disabled";
 		};
@@ -122,7 +156,13 @@ uart0: serial@11002000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x400>;
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&system_clk>;
+			clocks = <&infracfg CLK_INFRA_UART0_SEL>,
+				 <&infracfg CLK_INFRA_UART0_CK>;
+			clock-names = "baud", "bus";
+			assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
+					  <&infracfg CLK_INFRA_UART0_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
+						 <&topckgen CLK_TOP_UART_SEL>;
 			status = "disabled";
 		};
 
@@ -131,7 +171,11 @@ uart1: serial@11003000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x400>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&system_clk>;
+			clocks = <&infracfg CLK_INFRA_UART1_SEL>,
+				 <&infracfg CLK_INFRA_UART1_CK>;
+			clock-names = "baud", "bus";
+			assigned-clocks = <&infracfg CLK_INFRA_UART1_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
 			status = "disabled";
 		};
 
@@ -140,10 +184,24 @@ uart2: serial@11004000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x400>;
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&system_clk>;
+			clocks = <&infracfg CLK_INFRA_UART2_SEL>,
+				 <&infracfg CLK_INFRA_UART2_CK>;
+			clock-names = "baud", "bus";
+			assigned-clocks = <&infracfg CLK_INFRA_UART2_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
 			status = "disabled";
 		};
 
+		ethsys: syscon@15000000 {
+			 #address-cells = <1>;
+			 #size-cells = <1>;
+			 compatible = "mediatek,mt7986-ethsys",
+				      "syscon";
+			 reg = <0 0x15000000 0 0x1000>;
+			 #clock-cells = <1>;
+			 #reset-cells = <1>;
+		};
+
 	};
 
 };
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
