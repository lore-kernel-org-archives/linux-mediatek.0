Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3131C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 10:50:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64890205F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 10:50:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTXduH5d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64890205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qUwPhzfZ9Yufj8mZPG6fNEmokNDRSwxjV3oJc3VP14I=; b=jTXduH5dCOyzu9JC1NIa0pEuw
	fsWb+4VMofsl/paN9v6I/TUH0PgfiuOXLoHtZH7G9CH1fuYgnkTWhWFe1pfo6urpfDJcaL7k6wDff
	XA96L8GfEMo7iBzJc8SD34xfEx3BPGdU7lLrCB1Eu0XiZtMpeUdd+2gO4YpVyRUiD65y+G/LtmHjJ
	Y/TsF2fAY36yaL6c04YDQBUSkcvs+SbhcAp82dAdW9/Kyq0+Ww4pH+OPid4xPFWtMRnXDTxpnUCgx
	xbH0zhkrMkOR/6hvSYGutN2VRHIb27HyCmaaeYYXmZBGUjoYnvEvytinUA8jNzxm2X2eNSPJ1qDz4
	MANBaHjFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kibKB-0003Ay-Bx; Fri, 27 Nov 2020 10:49:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kibJs-00035Y-1C; Fri, 27 Nov 2020 10:49:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id D05161F461A4
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mt8183: Add iommu and larb nodes
Date: Fri, 27 Nov 2020 11:49:29 +0100
Message-Id: <20201127104930.1981497-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127104930.1981497-1-enric.balletbo@collabora.com>
References: <20201127104930.1981497-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_054940_230722_19D9763D 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add iommu and larb nodes to the MT8183.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 79 ++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index da7212e21fdf..ba9ff192cda3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mt8183-larb-port.h>
 #include <dt-bindings/power/mt8183-power.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
@@ -521,6 +522,15 @@ systimer: timer@10017000 {
 			clock-names = "clk13m";
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8183-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0 &larb1 &larb2 &larb3
+					  &larb4 &larb5 &larb6>;
+			#iommu-cells = <1>;
+		};
+
 		gce: mailbox@10238000 {
 			compatible = "mediatek,mt8183-gce";
 			reg = <0 0x10238000 0 0x4000>;
@@ -968,6 +978,16 @@ dsi0: dsi@14014000 {
 			phy-names = "dphy";
 		};
 
+		larb0: larb@14017000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x14017000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB0>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clock-names = "apb", "smi";
+		};
+
 		smi_common: smi@14019000 {
 			compatible = "mediatek,mt8183-smi-common", "syscon";
 			reg = <0 0x14019000 0 0x1000>;
@@ -984,18 +1004,57 @@ imgsys: syscon@15020000 {
 			#clock-cells = <1>;
 		};
 
+		larb5: larb@15021000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x15021000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys CLK_IMG_LARB5>, <&imgsys CLK_IMG_LARB5>,
+				 <&mmsys CLK_MM_GALS_IMG2MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&spm MT8183_POWER_DOMAIN_ISP>;
+		};
+
+		larb2: larb@1502f000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x1502f000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys CLK_IMG_LARB2>, <&imgsys CLK_IMG_LARB2>,
+				 <&mmsys CLK_MM_GALS_IPU2MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&spm MT8183_POWER_DOMAIN_ISP>;
+		};
+
 		vdecsys: syscon@16000000 {
 			compatible = "mediatek,mt8183-vdecsys", "syscon";
 			reg = <0 0x16000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb1: larb@16010000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_VDEC>, <&vdecsys CLK_VDEC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8183_POWER_DOMAIN_VDEC>;
+		};
+
 		vencsys: syscon@17000000 {
 			compatible = "mediatek,mt8183-vencsys", "syscon";
 			reg = <0 0x17000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb4: larb@17010000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC_LARB>,
+				 <&vencsys CLK_VENC_LARB>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
@@ -1025,5 +1084,25 @@ camsys: syscon@1a000000 {
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		larb6: larb@1a001000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x1a001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_LARB6>, <&camsys CLK_CAM_LARB6>,
+				 <&mmsys CLK_MM_GALS_CAM2MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&spm MT8183_POWER_DOMAIN_CAM>;
+		};
+
+		larb3: larb@1a002000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x1a002000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_LARB3>, <&camsys CLK_CAM_LARB3>,
+				 <&mmsys CLK_MM_GALS_IPU12MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&spm MT8183_POWER_DOMAIN_CAM>;
+		};
 	};
 };
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
