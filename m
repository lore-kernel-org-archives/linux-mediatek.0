Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35967C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 08:28:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0201320866
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 08:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VophSQMu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="CkrTLh5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0201320866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/sUn++kNZmLY/HoATeNXcZTVhG7kvT3lCu/eGlGogyo=; b=VophSQMuUgWZUGOSPXxYJgS3m
	1xQnE9C7oENgk5z99uvmEiF8L+uYNgyvmHmzKjIafeA1wkNiXFEAsTxIAI6aNk2dmwJhiujV/MVI3
	Uce1IxGFrSfRz6AMI+heOCO+AwP5WCo+26xUAdvAQ2NQ2IffOyoaPpSZeA3tlPwO2i8651J2PXQ4p
	DiGnzwnI9PUhT3ypHDlC9MGahYfX7p23eA2MBrWCkYNYG+K5mgeUfk5KMc2YVEWK7B/0L28KEKWni
	YG8VWFzM7PVQ1oJsx765vUZnxTq6BdGvHJ1KXVWsC7L3A1aOr/0ML73OMYwUcrhBhHHBqer3gg+bD
	9c/wH+swQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3xk8-0004Tn-0F; Fri, 07 Aug 2020 08:28:48 +0000
Received: from mxwww.masterlogin.de ([2a03:2900:1:1::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3xjx-0004Po-MH; Fri, 07 Aug 2020 08:28:39 +0000
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 33507962D5;
 Fri,  7 Aug 2020 08:28:25 +0000 (UTC)
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout1.routing.net (Postfix) with ESMTP id 094C540118;
 Fri,  7 Aug 2020 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596788905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nWPayKsCIQcmixUKDuEmF/he+X5xSVTlAUFKbJ8mW0=;
 b=CkrTLh5h04i7Le5rTWBBxhc1acReVqrrXQ2qvguWyaEVawgkG/ingM382Ko1xFEn7YSoce
 +VwscJ8+nm7JI0rEugwdQWYE/SPHt66W/vXqBPmw0l76AEMRVIwpaOFeXpsI+NHLpDFDsO
 kZHV22jPTil5/jjGr2UM18pC7Z06lrE=
Received: from localhost.localdomain (fttx-pool-37.60.0.190.bambit.de
 [37.60.0.190])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 6DE5C8031C;
 Fri,  7 Aug 2020 08:28:24 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
Date: Fri,  7 Aug 2020 10:27:53 +0200
Message-Id: <20200807082754.6790-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807082754.6790-1-linux@fw-web.de>
References: <20200807082754.6790-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_042837_997534_05B02096 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7623a has no graphics support so move nodes
from generic mt7623.dtsi to mt7623n.dtsi

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm/boot/dts/mt7623.dtsi  | 99 ----------------------------------
 arch/arm/boot/dts/mt7623n.dtsi | 99 ++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index d94f24eb7f43..d09b5671c91b 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -14,7 +14,6 @@
 #include <dt-bindings/power/mt2701-power.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/phy/phy.h>
-#include <dt-bindings/memory/mt2701-larb-port.h>
 #include <dt-bindings/reset/mt2701-resets.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -297,17 +296,6 @@ timer: timer@10008000 {
 		clock-names = "system-clk", "rtc-clk";
 	};
 
-	smi_common: smi@1000c000 {
-		compatible = "mediatek,mt7623-smi-common",
-			     "mediatek,mt2701-smi-common";
-		reg = <0 0x1000c000 0 0x1000>;
-		clocks = <&infracfg CLK_INFRA_SMI>,
-			 <&mmsys CLK_MM_SMI_COMMON>,
-			 <&infracfg CLK_INFRA_SMI>;
-		clock-names = "apb", "smi", "async";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
-	};
-
 	pwrap: pwrap@1000d000 {
 		compatible = "mediatek,mt7623-pwrap",
 			     "mediatek,mt2701-pwrap";
@@ -339,17 +327,6 @@ sysirq: interrupt-controller@10200100 {
 		reg = <0 0x10200100 0 0x1c>;
 	};
 
-	iommu: mmsys_iommu@10205000 {
-		compatible = "mediatek,mt7623-m4u",
-			     "mediatek,mt2701-m4u";
-		reg = <0 0x10205000 0 0x1000>;
-		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&infracfg CLK_INFRA_M4U>;
-		clock-names = "bclk";
-		mediatek,larbs = <&larb0 &larb1 &larb2>;
-		#iommu-cells = <1>;
-	};
-
 	efuse: efuse@10206000 {
 		compatible = "mediatek,mt7623-efuse",
 			     "mediatek,mt8173-efuse";
@@ -725,70 +702,6 @@ mmc0: mmc@11230000 {
 		status = "disabled";
 	};
 
-	g3dsys: syscon@13000000 {
-		compatible = "mediatek,mt7623-g3dsys",
-			     "mediatek,mt2701-g3dsys",
-			     "syscon";
-		reg = <0 0x13000000 0 0x200>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-	mmsys: syscon@14000000 {
-		compatible = "mediatek,mt7623-mmsys",
-			     "mediatek,mt2701-mmsys",
-			     "syscon";
-		reg = <0 0x14000000 0 0x1000>;
-		#clock-cells = <1>;
-	};
-
-	larb0: larb@14010000 {
-		compatible = "mediatek,mt7623-smi-larb",
-			     "mediatek,mt2701-smi-larb";
-		reg = <0 0x14010000 0 0x1000>;
-		mediatek,smi = <&smi_common>;
-		mediatek,larb-id = <0>;
-		clocks = <&mmsys CLK_MM_SMI_LARB0>,
-			 <&mmsys CLK_MM_SMI_LARB0>;
-		clock-names = "apb", "smi";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
-	};
-
-	imgsys: syscon@15000000 {
-		compatible = "mediatek,mt7623-imgsys",
-			     "mediatek,mt2701-imgsys",
-			     "syscon";
-		reg = <0 0x15000000 0 0x1000>;
-		#clock-cells = <1>;
-	};
-
-	larb2: larb@15001000 {
-		compatible = "mediatek,mt7623-smi-larb",
-			     "mediatek,mt2701-smi-larb";
-		reg = <0 0x15001000 0 0x1000>;
-		mediatek,smi = <&smi_common>;
-		mediatek,larb-id = <2>;
-		clocks = <&imgsys CLK_IMG_SMI_COMM>,
-			 <&imgsys CLK_IMG_SMI_COMM>;
-		clock-names = "apb", "smi";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-	};
-
-	jpegdec: jpegdec@15004000 {
-		compatible = "mediatek,mt7623-jpgdec",
-			     "mediatek,mt2701-jpgdec";
-		reg = <0 0x15004000 0 0x1000>;
-		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
-			  <&imgsys CLK_IMG_JPGDEC>;
-		clock-names = "jpgdec-smi",
-			      "jpgdec";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
-		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
-			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
-	};
-
 	vdecsys: syscon@16000000 {
 		compatible = "mediatek,mt7623-vdecsys",
 			     "mediatek,mt2701-vdecsys",
@@ -797,18 +710,6 @@ vdecsys: syscon@16000000 {
 		#clock-cells = <1>;
 	};
 
-	larb1: larb@16010000 {
-		compatible = "mediatek,mt7623-smi-larb",
-			     "mediatek,mt2701-smi-larb";
-		reg = <0 0x16010000 0 0x1000>;
-		mediatek,smi = <&smi_common>;
-		mediatek,larb-id = <1>;
-		clocks = <&vdecsys CLK_VDEC_CKGEN>,
-			 <&vdecsys CLK_VDEC_LARB>;
-		clock-names = "apb", "smi";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_VDEC>;
-	};
-
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
 			     "mediatek,mt2701-hifsys",
diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
index 7724a4d05b89..a47e82468895 100644
--- a/arch/arm/boot/dts/mt7623n.dtsi
+++ b/arch/arm/boot/dts/mt7623n.dtsi
@@ -7,8 +7,18 @@
  */
 
 #include "mt7623.dtsi"
+#include <dt-bindings/memory/mt2701-larb-port.h>
 
 / {
+	g3dsys: syscon@13000000 {
+		compatible = "mediatek,mt7623-g3dsys",
+			     "mediatek,mt2701-g3dsys",
+			     "syscon";
+		reg = <0 0x13000000 0 0x200>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
 	mali: gpu@13040000 {
 		compatible = "mediatek,mt7623-mali", "arm,mali-450";
 		reg = <0 0x13040000 0 0x30000>;
@@ -32,4 +42,93 @@ mali: gpu@13040000 {
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_MFG>;
 		resets = <&g3dsys MT2701_G3DSYS_CORE_RST>;
 	};
+
+	mmsys: syscon@14000000 {
+		compatible = "mediatek,mt7623-mmsys",
+			     "mediatek,mt2701-mmsys",
+			     "syscon";
+		reg = <0 0x14000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	larb0: larb@14010000 {
+		compatible = "mediatek,mt7623-smi-larb",
+			     "mediatek,mt2701-smi-larb";
+		reg = <0 0x14010000 0 0x1000>;
+		mediatek,smi = <&smi_common>;
+		mediatek,larb-id = <0>;
+		clocks = <&mmsys CLK_MM_SMI_LARB0>,
+			 <&mmsys CLK_MM_SMI_LARB0>;
+		clock-names = "apb", "smi";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
+
+	larb1: larb@16010000 {
+		compatible = "mediatek,mt7623-smi-larb",
+			     "mediatek,mt2701-smi-larb";
+		reg = <0 0x16010000 0 0x1000>;
+		mediatek,smi = <&smi_common>;
+		mediatek,larb-id = <1>;
+		clocks = <&vdecsys CLK_VDEC_CKGEN>,
+			 <&vdecsys CLK_VDEC_LARB>;
+		clock-names = "apb", "smi";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_VDEC>;
+	};
+
+	larb2: larb@15001000 {
+		compatible = "mediatek,mt7623-smi-larb",
+			     "mediatek,mt2701-smi-larb";
+		reg = <0 0x15001000 0 0x1000>;
+		mediatek,smi = <&smi_common>;
+		mediatek,larb-id = <2>;
+		clocks = <&imgsys CLK_IMG_SMI_COMM>,
+			 <&imgsys CLK_IMG_SMI_COMM>;
+		clock-names = "apb", "smi";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+	};
+
+	imgsys: syscon@15000000 {
+		compatible = "mediatek,mt7623-imgsys",
+			     "mediatek,mt2701-imgsys",
+			     "syscon";
+		reg = <0 0x15000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	iommu: mmsys_iommu@10205000 {
+		compatible = "mediatek,mt7623-m4u",
+			     "mediatek,mt2701-m4u";
+		reg = <0 0x10205000 0 0x1000>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_M4U>;
+		clock-names = "bclk";
+		mediatek,larbs = <&larb0 &larb1 &larb2>;
+		#iommu-cells = <1>;
+	};
+
+	jpegdec: jpegdec@15004000 {
+		compatible = "mediatek,mt7623-jpgdec",
+			     "mediatek,mt2701-jpgdec";
+		reg = <0 0x15004000 0 0x1000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
+		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
+			  <&imgsys CLK_IMG_JPGDEC>;
+		clock-names = "jpgdec-smi",
+			      "jpgdec";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+		mediatek,larb = <&larb2>;
+		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
+			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
+	};
+
+	smi_common: smi@1000c000 {
+		compatible = "mediatek,mt7623-smi-common",
+			     "mediatek,mt2701-smi-common";
+		reg = <0 0x1000c000 0 0x1000>;
+		clocks = <&infracfg CLK_INFRA_SMI>,
+			 <&mmsys CLK_MM_SMI_COMMON>,
+			 <&infracfg CLK_INFRA_SMI>;
+		clock-names = "apb", "smi", "async";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
