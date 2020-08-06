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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7E3C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:27:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E0922DFA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O6UXI0nn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b/NDqJ2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02E0922DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QZmnSwMY0gO6caxL1J6KMflCPFbcz4tzM7rRJvGwj9M=; b=O6UXI0nn4g4c+j8WtOPK4vj+4
	SoGuoFuLWO2EhSiCvW+7eAP+ejXBWAteCNbSKnLbLUTeXHzOTP06DkU0KV5Ke9/UBjMnt2uMZVw3V
	uAtTTqix/D6uAnG/iSUcBe76ooSi7IqXqvHXvOaQ9fh71p9F6j+idrQzD8Hvmhf5+eU/+LZo/pE4O
	vUl3WTQE2b0/5yyFq6myQukbaGYlL/BmFsF2IGYDaTJZOuVW/z5sYCfwcijx2RM5bMa46Dvq+8RYv
	5T+hD0qeAh/CXHcPQDXRKym3XQzUfmgQg6HyX8o0VN/jnR0PD2syhOnU2fGH2puPwcAGQ7ZFUsNoL
	9kKUh7X2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3cAp-0007Iq-UC; Thu, 06 Aug 2020 09:26:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3cAh-0007FH-Ll; Thu, 06 Aug 2020 09:26:49 +0000
X-UUID: 2fbc15bd891045bfb3e1f4ed03325551-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CS/Le7cAUQ56oWlindS5L/YWg5qHDp+7IaPFk65rgCU=; 
 b=b/NDqJ2cTFEcQoRc3TD2DBFWVPvI2cRj+RnHKi0XL9O2ovAbdHI9cgPUy5XQxRmbLTYZKf25n6S+qKpACFfSee0GcIRQKLYIdfUSVjKuYUIlaat+ah8pN0rZKbFEcsFh7N6ZOVQtspddXd/V/AP1qiJKSM2+Nlh7G3yAFXZFcok=;
X-UUID: 2fbc15bd891045bfb3e1f4ed03325551-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1134274426; Thu, 06 Aug 2020 01:26:43 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 02:22:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 17:21:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 17:21:59 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v17 05/12] dt-bindings: soc: Add MT8183 power dt-bindings
Date: Thu, 6 Aug 2020 17:21:48 +0800
Message-ID: <1596705715-15320-6-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_052647_866523_30326396 
X-CRM114-Status: GOOD (  18.06  )
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

Add power dt-bindings of MT8183.
Add an optional "mediatek,smi" property for phandle to smi-common
node for power controller.
Introduce properties for power domain sub nodes.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    | 81 ++++++++++++++++++++--
 include/dt-bindings/power/mt8183-power.h           | 26 +++++++
 2 files changed, 102 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/power/mt8183-power.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index 2bc3677..efe2025 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -15,8 +15,9 @@ power/power-domain.yaml. It provides the power domains defined in
 - include/dt-bindings/power/mt2701-power.h
 - include/dt-bindings/power/mt2712-power.h
 - include/dt-bindings/power/mt7622-power.h
+- include/dt-bindings/power/mt8183-power.h
 
-Required properties:
+Required properties for power controller:
 - compatible: Should be one of:
 	- "mediatek,mt2701-scpsys"
 	- "mediatek,mt2712-scpsys"
@@ -27,12 +28,15 @@ Required properties:
 	- "mediatek,mt7623a-scpsys": For MT7623A SoC
 	- "mediatek,mt7629-scpsys", "mediatek,mt7622-scpsys": For MT7629 SoC
 	- "mediatek,mt8173-scpsys"
+	- "mediatek,mt8183-scpsys"
 - #power-domain-cells: Must be 1
+- #address-cells: Should be 1
+- #size-cells: Should be 0
 - reg: Address range of the SCPSYS unit
 - infracfg: must contain a phandle to the infracfg controller
-- clock, clock-names: clocks according to the common clock binding.
-                      These are clocks which hardware needs to be
-                      enabled before enabling certain power domains.
+- clocks, clock-names: clocks according to the common clock binding.
+                       These are clocks which hardware needs to be
+                       enabled before enabling certain power domains.
 	Required clocks for MT2701 or MT7623: "mm", "mfg", "ethif"
 	Required clocks for MT2712: "mm", "mfg", "venc", "jpgdec", "audio", "vdec"
 	Required clocks for MT6765: MUX: "mm", "mfg"
@@ -43,8 +47,11 @@ Required properties:
 	Required clocks for MT7622 or MT7629: "hif_sel"
 	Required clocks for MT7623A: "ethif"
 	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
+	Required clocks for MT8183: "audio", "audio1", "audio2", "mfg", "mm",
+				    "cam", "isp", "vpu", "vpu1", "vpu2",
+				    "vpu3";
 
-Optional properties:
+Optional properties for power controller:
 - vdec-supply: Power supply for the vdec power domain
 - venc-supply: Power supply for the venc power domain
 - isp-supply: Power supply for the isp power domain
@@ -55,6 +62,16 @@ Optional properties:
 - mfg_async-supply: Power supply for the mfg_async power domain
 - mfg_2d-supply: Power supply for the mfg_2d power domain
 - mfg-supply: Power supply for the mfg power domain
+- mediatek,smi : A phandle to the smi_common node
+
+Required properties for power domain sub nodes:
+- reg: index of the power domain, should use macros in:
+	"include/dt-bindings/power/mt8192-power.h" - for power domain of MT8192.
+
+Optional properties for power domain sub nodes:
+- clocks: clocks according to the common clock binding.
+          These are clocks which hardware needs to be enabled before
+          releasing the bus protection.
 
 Example:
 
@@ -70,6 +87,60 @@ Example:
 		clock-names = "mfg", "mm", "venc", "venc_lt";
 	};
 
+Example(power domain sub node within power controller):
+
+	scpsys: power-controller@10006000 {
+		compatible = "mediatek,mt8183-scpsys", "syscon";
+		reg = <0 0x10006000 0 0x1000>;
+		clocks = <&topckgen CLK_TOP_MUX_MM>,
+			 <&topckgen CLK_TOP_MUX_IPU_IF>,
+			 <&topckgen CLK_TOP_MUX_DSP>,
+			 <&topckgen CLK_TOP_MUX_DSP1>,
+			 <&topckgen CLK_TOP_MUX_DSP2>;
+		clock-names = "mm", "vpu", "vpu1", "vpu2", "vpu3";
+		infracfg = <&infracfg>;
+		mediatek,smi = <&smi_common>;
+		#power-domain-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		conn@MT8183_POWER_DOMAIN_CONN {
+			reg = <MT8183_POWER_DOMAIN_CONN>;
+		};
+
+		disp@MT8183_POWER_DOMAIN_DISP {
+			reg = <MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB1>,
+				 <&mmsys CLK_MM_GALS_COMM0>,
+				 <&mmsys CLK_MM_GALS_COMM1>,
+				 <&mmsys CLK_MM_GALS_CCU2MM>,
+				 <&mmsys CLK_MM_GALS_IPU12MM>,
+				 <&mmsys CLK_MM_GALS_IMG2MM>,
+				 <&mmsys CLK_MM_GALS_CAM2MM>,
+				 <&mmsys CLK_MM_GALS_IPU2MM>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vpu_top@MT8183_POWER_DOMAIN_VPU_TOP {
+				reg = <MT8183_POWER_DOMAIN_VPU_TOP>;
+				clocks = <&ipu_conn CLK_IPU_CONN_IPU>,
+					 <&ipu_conn CLK_IPU_CONN_AHB>,
+					 <&ipu_conn CLK_IPU_CONN_AXI>,
+					 <&ipu_conn CLK_IPU_CONN_ISP>,
+					 <&ipu_conn CLK_IPU_CONN_CAM_ADL>,
+					 <&ipu_conn CLK_IPU_CONN_IMG_ADL>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				vpu_core0@MT8183_POWER_DOMAIN_VPU_CORE0 {
+					reg = <MT8183_POWER_DOMAIN_VPU_CORE0>;
+				};
+			};
+		};
+	};
+
 Example consumer:
 
 	afe: mt8173-afe-pcm@11220000 {
diff --git a/include/dt-bindings/power/mt8183-power.h b/include/dt-bindings/power/mt8183-power.h
new file mode 100644
index 0000000..d1ab387
--- /dev/null
+++ b/include/dt-bindings/power/mt8183-power.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Weiyi Lu <weiyi.lu@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8183_POWER_H
+#define _DT_BINDINGS_POWER_MT8183_POWER_H
+
+#define MT8183_POWER_DOMAIN_AUDIO	0
+#define MT8183_POWER_DOMAIN_CONN	1
+#define MT8183_POWER_DOMAIN_MFG_ASYNC	2
+#define MT8183_POWER_DOMAIN_MFG		3
+#define MT8183_POWER_DOMAIN_MFG_CORE0	4
+#define MT8183_POWER_DOMAIN_MFG_CORE1	5
+#define MT8183_POWER_DOMAIN_MFG_2D	6
+#define MT8183_POWER_DOMAIN_DISP	7
+#define MT8183_POWER_DOMAIN_CAM		8
+#define MT8183_POWER_DOMAIN_ISP		9
+#define MT8183_POWER_DOMAIN_VDEC	10
+#define MT8183_POWER_DOMAIN_VENC	11
+#define MT8183_POWER_DOMAIN_VPU_TOP	12
+#define MT8183_POWER_DOMAIN_VPU_CORE0	13
+#define MT8183_POWER_DOMAIN_VPU_CORE1	14
+
+#endif /* _DT_BINDINGS_POWER_MT8183_POWER_H */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
