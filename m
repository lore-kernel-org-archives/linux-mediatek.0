Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C14C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:19:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B799722D2C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jb7Pcu8Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P1qAzQ5W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B799722D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8brFAVrb4EVuO5CoovXSXBH8lLrkAXxjBywo8tLVKzQ=; b=jb7Pcu8ZgLkcOf5JI90dI0FTv
	1i5EcxYRqX7pIaf9zUTgB6DnmhBl0iDY2i8GFj0QdMgaac568+gdjWzZpZ8oWX7em5qEpBs0qnaWg
	khQMWmgaqV/lU+9C/NGjT/LO80fdy8Us3zBo1SdYDwac2oyzdaPbaqhTqre9QK5efo58P1FpMYPBK
	GVb3mw/vHLNtHVCC5l+sW7b91VWS7rpLpF9vVL3XoXSdaEP2qAWRti5bm5/kSCyuW5K4i8Pg5EdDr
	qHWQ/FqK+HsxJSCLxQ7XPCw8WTBUxf3zVQkPFXRRl0oD0ecoPmGnRwnniGsdghOZ6urfj/X3qCbYS
	AhTkw7ipg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3c6L-0005K7-Gn; Thu, 06 Aug 2020 09:22:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3c6I-0005HS-Cl; Thu, 06 Aug 2020 09:22:16 +0000
X-UUID: 7afbb13633424ad8bbf637e63ff7426e-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vyt/5VZetwvfAg/d0ebCsFaxhaPADW7wXGw7LIYUkgE=; 
 b=P1qAzQ5Wu6+H8jyj4UgYYacvM4nDEEV7KJM4/K3CSeYYQjNXT0ZXI4eyDP1Z+BZR/VyVRx7rAnfXCAyzAEx0WJiiaFLz3P9fR1rTaFHyfx+UhjifJmOciITPGTTH0cNedmiP3hbuUmY01mmyTTAyIRZzHKRYNZyvmOb2iWD4tBs=;
X-UUID: 7afbb13633424ad8bbf637e63ff7426e-20200806
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1576117713; Thu, 06 Aug 2020 01:22:05 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 02:22:04 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 17:22:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 17:22:00 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v17 11/12] arm64: dts: Add power controller device node of
 MT8183
Date: Thu, 6 Aug 2020 17:21:54 +0800
Message-ID: <1596705715-15320-12-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_052214_646091_F64F22DE 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power controller node and smi-common node for MT8183
In scpsys node, it contains clocks and regmapping of
infracfg and smi-common for bus protection.
And list all the power domains of MT8183 under scpsys node
to show the dependency between each other through hierarchical
structure.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 123 +++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 1e03c84..4940bda 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/mt8183-power.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include "mt8183-pinfunc.h"
 
@@ -309,6 +310,123 @@
 			#interrupt-cells = <2>;
 		};
 
+		scpsys: power-controller@10006000 {
+			compatible = "mediatek,mt8183-scpsys", "syscon";
+			reg = <0 0x10006000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+				 <&infracfg CLK_INFRA_AUDIO>,
+				 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
+				 <&topckgen CLK_TOP_MUX_MFG>,
+				 <&topckgen CLK_TOP_MUX_MM>,
+				 <&topckgen CLK_TOP_MUX_CAM>,
+				 <&topckgen CLK_TOP_MUX_IMG>,
+				 <&topckgen CLK_TOP_MUX_IPU_IF>,
+				 <&topckgen CLK_TOP_MUX_DSP>,
+				 <&topckgen CLK_TOP_MUX_DSP1>,
+				 <&topckgen CLK_TOP_MUX_DSP2>;
+			clock-names = "audio", "audio1", "audio2", "mfg", "mm",
+				      "cam", "isp", "vpu", "vpu1", "vpu2",
+				      "vpu3";
+			infracfg = <&infracfg>;
+			mediatek,smi = <&smi_common>;
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			audio@MT8183_POWER_DOMAIN_AUDIO {
+				reg = <MT8183_POWER_DOMAIN_AUDIO>;
+			};
+
+			conn@MT8183_POWER_DOMAIN_CONN {
+				reg = <MT8183_POWER_DOMAIN_CONN>;
+			};
+
+			mfg_async@MT8183_POWER_DOMAIN_MFG_ASYNC {
+				reg = <MT8183_POWER_DOMAIN_MFG_ASYNC>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mfg@MT8183_POWER_DOMAIN_MFG {
+					reg = <MT8183_POWER_DOMAIN_MFG>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mfg_core0@MT8183_POWER_DOMAIN_MFG_CORE0 {
+						reg = <MT8183_POWER_DOMAIN_MFG_CORE0>;
+					};
+
+					mfg_core1@MT8183_POWER_DOMAIN_MFG_CORE1 {
+						reg = <MT8183_POWER_DOMAIN_MFG_CORE1>;
+					};
+
+					mfg_2d@MT8183_POWER_DOMAIN_MFG_2D {
+						reg = <MT8183_POWER_DOMAIN_MFG_2D>;
+					};
+				};
+			};
+
+			disp@MT8183_POWER_DOMAIN_DISP {
+				reg = <MT8183_POWER_DOMAIN_DISP>;
+				clocks = <&mmsys CLK_MM_SMI_COMMON>,
+					 <&mmsys CLK_MM_SMI_LARB0>,
+					 <&mmsys CLK_MM_SMI_LARB1>,
+					 <&mmsys CLK_MM_GALS_COMM0>,
+					 <&mmsys CLK_MM_GALS_COMM1>,
+					 <&mmsys CLK_MM_GALS_CCU2MM>,
+					 <&mmsys CLK_MM_GALS_IPU12MM>,
+					 <&mmsys CLK_MM_GALS_IMG2MM>,
+					 <&mmsys CLK_MM_GALS_CAM2MM>,
+					 <&mmsys CLK_MM_GALS_IPU2MM>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				cam@MT8183_POWER_DOMAIN_CAM {
+					reg = <MT8183_POWER_DOMAIN_CAM>;
+					clocks = <&camsys CLK_CAM_LARB6>,
+						 <&camsys CLK_CAM_LARB3>,
+						 <&camsys CLK_CAM_SENINF>,
+						 <&camsys CLK_CAM_CAMSV0>,
+						 <&camsys CLK_CAM_CAMSV1>,
+						 <&camsys CLK_CAM_CAMSV2>,
+						 <&camsys CLK_CAM_CCU>;
+				};
+
+				isp@MT8183_POWER_DOMAIN_ISP {
+					reg = <MT8183_POWER_DOMAIN_ISP>;
+					clocks = <&imgsys CLK_IMG_LARB5>,
+						 <&imgsys CLK_IMG_LARB2>;
+				};
+
+				vdec@MT8183_POWER_DOMAIN_VDEC {
+					reg = <MT8183_POWER_DOMAIN_VDEC>;
+				};
+
+				vden@MT8183_POWER_DOMAIN_VENC {
+					reg = <MT8183_POWER_DOMAIN_VENC>;
+				};
+
+				vpu_top@MT8183_POWER_DOMAIN_VPU_TOP {
+					reg = <MT8183_POWER_DOMAIN_VPU_TOP>;
+					clocks = <&ipu_conn CLK_IPU_CONN_IPU>,
+						 <&ipu_conn CLK_IPU_CONN_AHB>,
+						 <&ipu_conn CLK_IPU_CONN_AXI>,
+						 <&ipu_conn CLK_IPU_CONN_ISP>,
+						 <&ipu_conn CLK_IPU_CONN_CAM_ADL>,
+						 <&ipu_conn CLK_IPU_CONN_IMG_ADL>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					vpu_core0@MT8183_POWER_DOMAIN_VPU_CORE0 {
+						reg = <MT8183_POWER_DOMAIN_VPU_CORE0>;
+					};
+
+					vpu_core1@MT8183_POWER_DOMAIN_VPU_CORE1 {
+						reg = <MT8183_POWER_DOMAIN_VPU_CORE1>;
+					};
+				};
+			};
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8183-wdt",
 				     "mediatek,mt6589-wdt";
@@ -690,6 +808,11 @@
 			#clock-cells = <1>;
 		};
 
+		smi_common: smi@14019000 {
+			compatible = "mediatek,mt8183-smi-common", "syscon";
+			reg = <0 0x14019000 0 0x1000>;
+		};
+
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
