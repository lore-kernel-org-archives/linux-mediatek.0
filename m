Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B8CC46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a8BajnmKd5vO4JpWZnHi17/Pz2CkPF5PPd18PEM9HY=; b=tRgNfhP453Ng4GIoaGyYRbyCJO
	QO9QM1SX32Uw1tYXIhtAVR9Bi8YcFkPjUyOMD7xKhQ/vpVaanS2ooxXEIoN0Z3zIq81Vil86mBLdh
	4tORwRCuTe8ZaXTWyJjfx2NvR0T7gWjORZd88p6IH0Rwdfdb11CKA5Zim02+1f3vetOOyG42HdxQa
	wL+zy/XT9YLvu0sozN4E4RhaQPWeh6rB+X6LNMXgYCj3sGlDgYijtkNtiV4ratLny0B85gZlM2zWA
	kCsyPrmp8iJ41A/dSGiFOfDwGDT3X0nFhhFOHLCNzeI6whYxkcwd4x80yilNNacRSOoz5Y8PdI991
	BK4XqCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUOq-004soD-45; Thu, 19 Jan 2023 12:52:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMP-004rja-Lj; Thu, 19 Jan 2023 12:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8a8BajnmKd5vO4JpWZnHi17/Pz2CkPF5PPd18PEM9HY=; b=QhSDQ1ksd8ADIhVV0Tt/XOXMWd
	otbg86pQTuSARTsW8iaQ6b8hESMJa721Feoujs+QjG6PcPSwINurZYjHnEajeOjhOe9AqU1d7Qjon
	OIRuaH1/J4rlB/3czJ8cCyuZpy9aLuyDt3rhnRJo/bKFJknC3tmqT5zV2GE2fL1+YB6dIypZvuc5U
	2bZVD+l7JNA7b+N4zs4ylU6G59BYXYZOmHlANcotKviNwz062n3CLMd4DHoDXTMBTcvmfcSy8nmge
	jutwJi7Z3ETbIlg5MfZuNzVVQno2Nh03fgevhmYMFxsyCyXNCrWG4x/xrl2RDqxTVfA5CA8riZbqv
	j/IMCMOg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULk-000IPE-1I;
	Thu, 19 Jan 2023 12:49:12 +0000
X-UUID: a3dec45897f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8a8BajnmKd5vO4JpWZnHi17/Pz2CkPF5PPd18PEM9HY=;
	b=nVP16RIjSzkK7EcukTKfF7pdKlTPuVfYknYMSaz10ansOuZhpmtWn8lH0J5m7ZQH65eFoabsfyjdO4iG9k/Jcnae78h0+Wbp4YDlGpIYi4sM9/c1Jrrgl1ikG2eJvWkRz3BoVouzPDow53MNb5Va3LktezonCLyI939zWDR+7fY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:263087bc-d666-4d41-b733-77f1a51b328b,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:3ca2d6b,CLOUDID:c28249f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: a3dec45897f711edbbe3f76fe852e059-20230119
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1026071685; Thu, 19 Jan 2023 05:48:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 19 Jan 2023 20:48:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 20:48:54 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v5 01/19] dt-bindings: clock: mediatek: Add new MT8188 clock
Date: Thu, 19 Jan 2023 20:48:30 +0800
Message-ID: <20230119124848.26364-2-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124903_835718_21BEF7F2 
X-CRM114-Status: GOOD (  14.98  )
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

Add the new binding documentation for system clock
and functional clock on MediaTek MT8188.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 .../bindings/clock/mediatek,mt8188-clock.yaml |  71 ++
 .../clock/mediatek,mt8188-sys-clock.yaml      |  55 ++
 .../dt-bindings/clock/mediatek,mt8188-clk.h   | 733 ++++++++++++++++++
 3 files changed, 859 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
 create mode 100644 include/dt-bindings/clock/mediatek,mt8188-clk.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
new file mode 100644
index 000000000000..d7214d97b2ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Functional Clock Controller for MT8188
+
+maintainers:
+  - Garmin Chang <garmin.chang@mediatek.com>
+
+description: |
+  The clock architecture in MediaTek like below
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The devices provide clock gate control in different IP blocks.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-adsp-audio26m
+      - mediatek,mt8188-camsys
+      - mediatek,mt8188-camsys-rawa
+      - mediatek,mt8188-camsys-rawb
+      - mediatek,mt8188-camsys-yuva
+      - mediatek,mt8188-camsys-yuvb
+      - mediatek,mt8188-ccusys
+      - mediatek,mt8188-imgsys
+      - mediatek,mt8188-imgsys-wpe1
+      - mediatek,mt8188-imgsys-wpe2
+      - mediatek,mt8188-imgsys-wpe3
+      - mediatek,mt8188-imgsys1-dip-nr
+      - mediatek,mt8188-imgsys1-dip-top
+      - mediatek,mt8188-imp-iic-wrap-c
+      - mediatek,mt8188-imp-iic-wrap-en
+      - mediatek,mt8188-imp-iic-wrap-w
+      - mediatek,mt8188-ipesys
+      - mediatek,mt8188-mfgcfg
+      - mediatek,mt8188-vdecsys
+      - mediatek,mt8188-vdecsys-soc
+      - mediatek,mt8188-vencsys
+      - mediatek,mt8188-vppsys0
+      - mediatek,mt8188-vppsys1
+      - mediatek,mt8188-wpesys
+      - mediatek,mt8188-wpesys-vpp0
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@11283000 {
+        compatible = "mediatek,mt8188-imp-iic-wrap-c";
+        reg = <0x11283000 0x1000>;
+        #clock-cells = <1>;
+    };
+
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
new file mode 100644
index 000000000000..4cf8d3af9803
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek System Clock Controller for MT8188
+
+maintainers:
+  - Garmin Chang <garmin.chang@mediatek.com>
+
+description: |
+  The clock architecture in MediaTek like below
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The apmixedsys provides most of PLLs which generated from SoC 26m.
+  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
+  The infracfg_ao provides clock gate in peripheral and infrastructure IP blocks.
+  The mcusys provides mux control to select the clock source in AP MCU.
+  The device nodes also provide the system control capacity for configuration.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8188-apmixedsys
+          - mediatek,mt8188-infracfg-ao
+          - mediatek,mt8188-pericfg-ao
+          - mediatek,mt8188-topckgen
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@10000000 {
+        compatible = "mediatek,mt8188-topckgen", "syscon";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt-bindings/clock/mediatek,mt8188-clk.h
new file mode 100644
index 000000000000..3e37373ca459
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
@@ -0,0 +1,733 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Garmin Chang <garmin.chang@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT8188_H
+#define _DT_BINDINGS_CLK_MT8188_H
+
+/* TOPCKGEN */
+#define CLK_TOP_AXI				0
+#define CLK_TOP_SPM				1
+#define CLK_TOP_SCP				2
+#define CLK_TOP_BUS_AXIMEM			3
+#define CLK_TOP_VPP				4
+#define CLK_TOP_ETHDR				5
+#define CLK_TOP_IPE				6
+#define CLK_TOP_CAM				7
+#define CLK_TOP_CCU				8
+#define CLK_TOP_CCU_AHB				9
+#define CLK_TOP_IMG				10
+#define CLK_TOP_CAMTM				11
+#define CLK_TOP_DSP				12
+#define CLK_TOP_DSP1				13
+#define CLK_TOP_DSP2				14
+#define CLK_TOP_DSP3				15
+#define CLK_TOP_DSP4				16
+#define CLK_TOP_DSP5				17
+#define CLK_TOP_DSP6				18
+#define CLK_TOP_DSP7				19
+#define CLK_TOP_MFG_CORE_TMP			20
+#define CLK_TOP_CAMTG				21
+#define CLK_TOP_CAMTG2				22
+#define CLK_TOP_CAMTG3				23
+#define CLK_TOP_UART				24
+#define CLK_TOP_SPI				25
+#define CLK_TOP_MSDC50_0_HCLK			26
+#define CLK_TOP_MSDC50_0			27
+#define CLK_TOP_MSDC30_1			28
+#define CLK_TOP_MSDC30_2			29
+#define CLK_TOP_INTDIR				30
+#define CLK_TOP_AUD_INTBUS			31
+#define CLK_TOP_AUDIO_H				32
+#define CLK_TOP_PWRAP_ULPOSC			33
+#define CLK_TOP_ATB				34
+#define CLK_TOP_SSPM				35
+#define CLK_TOP_DP				36
+#define CLK_TOP_EDP				37
+#define CLK_TOP_DPI				38
+#define CLK_TOP_DISP_PWM0			39
+#define CLK_TOP_DISP_PWM1			40
+#define CLK_TOP_USB_TOP				41
+#define CLK_TOP_SSUSB_XHCI			42
+#define CLK_TOP_USB_TOP_2P			43
+#define CLK_TOP_SSUSB_XHCI_2P			44
+#define CLK_TOP_USB_TOP_3P			45
+#define CLK_TOP_SSUSB_XHCI_3P			46
+#define CLK_TOP_I2C				47
+#define CLK_TOP_SENINF				48
+#define CLK_TOP_SENINF1				49
+#define CLK_TOP_GCPU				50
+#define CLK_TOP_VENC				51
+#define CLK_TOP_VDEC				52
+#define CLK_TOP_PWM				53
+#define CLK_TOP_MCUPM				54
+#define CLK_TOP_SPMI_P_MST			55
+#define CLK_TOP_SPMI_M_MST			56
+#define CLK_TOP_DVFSRC				57
+#define CLK_TOP_TL				58
+#define CLK_TOP_AES_MSDCFDE			59
+#define CLK_TOP_DSI_OCC				60
+#define CLK_TOP_WPE_VPP				61
+#define CLK_TOP_HDCP				62
+#define CLK_TOP_HDCP_24M			63
+#define CLK_TOP_HDMI_APB			64
+#define CLK_TOP_SNPS_ETH_250M			65
+#define CLK_TOP_SNPS_ETH_62P4M_PTP		66
+#define CLK_TOP_SNPS_ETH_50M_RMII		67
+#define CLK_TOP_ADSP				68
+#define CLK_TOP_AUDIO_LOCAL_BUS			69
+#define CLK_TOP_ASM_H				70
+#define CLK_TOP_ASM_L				71
+#define CLK_TOP_APLL1				72
+#define CLK_TOP_APLL2				73
+#define CLK_TOP_APLL3				74
+#define CLK_TOP_APLL4				75
+#define CLK_TOP_APLL5				76
+#define CLK_TOP_I2SO1				77
+#define CLK_TOP_I2SO2				78
+#define CLK_TOP_I2SI1				79
+#define CLK_TOP_I2SI2				80
+#define CLK_TOP_DPTX				81
+#define CLK_TOP_AUD_IEC				82
+#define CLK_TOP_A1SYS_HP			83
+#define CLK_TOP_A2SYS				84
+#define CLK_TOP_A3SYS				85
+#define CLK_TOP_A4SYS				86
+#define CLK_TOP_ECC				87
+#define CLK_TOP_SPINOR				88
+#define CLK_TOP_ULPOSC				89
+#define CLK_TOP_SRCK				90
+#define CLK_TOP_MFG_CK_FAST_REF			91
+#define CLK_TOP_MFGPLL				92
+#define CLK_TOP_MAINPLL				93
+#define CLK_TOP_MAINPLL_D3			94
+#define CLK_TOP_MAINPLL_D4			95
+#define CLK_TOP_MAINPLL_D4_D2			96
+#define CLK_TOP_MAINPLL_D4_D4			97
+#define CLK_TOP_MAINPLL_D4_D8			98
+#define CLK_TOP_MAINPLL_D5			99
+#define CLK_TOP_MAINPLL_D5_D2			100
+#define CLK_TOP_MAINPLL_D5_D4			101
+#define CLK_TOP_MAINPLL_D5_D8			102
+#define CLK_TOP_MAINPLL_D6			103
+#define CLK_TOP_MAINPLL_D6_D2			104
+#define CLK_TOP_MAINPLL_D6_D4			105
+#define CLK_TOP_MAINPLL_D6_D8			106
+#define CLK_TOP_MAINPLL_D7			107
+#define CLK_TOP_MAINPLL_D7_D2			108
+#define CLK_TOP_MAINPLL_D7_D4			109
+#define CLK_TOP_MAINPLL_D7_D8			110
+#define CLK_TOP_MAINPLL_D9			111
+#define CLK_TOP_UNIVPLL				112
+#define CLK_TOP_UNIVPLL_D2			113
+#define CLK_TOP_UNIVPLL_D3			114
+#define CLK_TOP_UNIVPLL_D4			115
+#define CLK_TOP_UNIVPLL_D4_D2			116
+#define CLK_TOP_UNIVPLL_D4_D4			117
+#define CLK_TOP_UNIVPLL_D4_D8			118
+#define CLK_TOP_UNIVPLL_D5			119
+#define CLK_TOP_UNIVPLL_D5_D2			120
+#define CLK_TOP_UNIVPLL_D5_D4			121
+#define CLK_TOP_UNIVPLL_D5_D8			122
+#define CLK_TOP_UNIVPLL_D6			123
+#define CLK_TOP_UNIVPLL_D6_D2			124
+#define CLK_TOP_UNIVPLL_D6_D4			125
+#define CLK_TOP_UNIVPLL_D6_D8			126
+#define CLK_TOP_UNIVPLL_D7			127
+#define CLK_TOP_UNIVPLL_192M			128
+#define CLK_TOP_UNIVPLL_192M_D4			129
+#define CLK_TOP_UNIVPLL_192M_D8			130
+#define CLK_TOP_UNIVPLL_192M_D10		131
+#define CLK_TOP_UNIVPLL_192M_D16		132
+#define CLK_TOP_UNIVPLL_192M_D32		133
+#define CLK_TOP_IMGPLL				134
+#define CLK_TOP_APLL1_D3			135
+#define CLK_TOP_APLL1_D4			136
+#define CLK_TOP_APLL2_D3			137
+#define CLK_TOP_APLL2_D4			138
+#define CLK_TOP_APLL3_D4			139
+#define CLK_TOP_APLL4_D4			140
+#define CLK_TOP_APLL5_D4			141
+#define CLK_TOP_MMPLL				142
+#define CLK_TOP_MMPLL_D4			143
+#define CLK_TOP_MMPLL_D4_D2			144
+#define CLK_TOP_MMPLL_D5			145
+#define CLK_TOP_MMPLL_D5_D2			146
+#define CLK_TOP_MMPLL_D5_D4			147
+#define CLK_TOP_MMPLL_D6			148
+#define CLK_TOP_MMPLL_D6_D2			149
+#define CLK_TOP_MMPLL_D7			150
+#define CLK_TOP_MMPLL_D9			151
+#define CLK_TOP_TVDPLL1				152
+#define CLK_TOP_TVDPLL1_D2			153
+#define CLK_TOP_TVDPLL1_D4			154
+#define CLK_TOP_TVDPLL1_D8			155
+#define CLK_TOP_TVDPLL1_D16			156
+#define CLK_TOP_TVDPLL2				157
+#define CLK_TOP_TVDPLL2_D2			158
+#define CLK_TOP_TVDPLL2_D4			159
+#define CLK_TOP_TVDPLL2_D8			160
+#define CLK_TOP_TVDPLL2_D16			161
+#define CLK_TOP_MSDCPLL				162
+#define CLK_TOP_MSDCPLL_D2			163
+#define CLK_TOP_MSDCPLL_D16			164
+#define CLK_TOP_ETHPLL				165
+#define CLK_TOP_ETHPLL_D2			166
+#define CLK_TOP_ETHPLL_D4			167
+#define CLK_TOP_ETHPLL_D8			168
+#define CLK_TOP_ETHPLL_D10			169
+#define CLK_TOP_ADSPPLL				170
+#define CLK_TOP_ADSPPLL_D2			171
+#define CLK_TOP_ADSPPLL_D4			172
+#define CLK_TOP_ADSPPLL_D8			173
+#define CLK_TOP_ULPOSC1				174
+#define CLK_TOP_ULPOSC1_D2			175
+#define CLK_TOP_ULPOSC1_D4			176
+#define CLK_TOP_ULPOSC1_D8			177
+#define CLK_TOP_ULPOSC1_D7			178
+#define CLK_TOP_ULPOSC1_D10			179
+#define CLK_TOP_ULPOSC1_D16			180
+#define CLK_TOP_MPHONE_SLAVE_BCK		181
+#define CLK_TOP_PAD_FPC				182
+#define CLK_TOP_466M_FMEM			183
+#define CLK_TOP_PEXTP_PIPE			184
+#define CLK_TOP_DSI_PHY				185
+#define CLK_TOP_APLL12_CK_DIV0			186
+#define CLK_TOP_APLL12_CK_DIV1			187
+#define CLK_TOP_APLL12_CK_DIV2			188
+#define CLK_TOP_APLL12_CK_DIV3			189
+#define CLK_TOP_APLL12_CK_DIV4			190
+#define CLK_TOP_APLL12_CK_DIV9			191
+#define CLK_TOP_CFGREG_CLOCK_EN_VPP0		192
+#define CLK_TOP_CFGREG_CLOCK_EN_VPP1		193
+#define CLK_TOP_CFGREG_CLOCK_EN_VDO0		194
+#define CLK_TOP_CFGREG_CLOCK_EN_VDO1		195
+#define CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS	196
+#define CLK_TOP_CFGREG_F26M_VPP0		197
+#define CLK_TOP_CFGREG_F26M_VPP1		198
+#define CLK_TOP_CFGREG_F26M_VDO0		199
+#define CLK_TOP_CFGREG_F26M_VDO1		200
+#define CLK_TOP_CFGREG_AUD_F26M_AUD		201
+#define CLK_TOP_CFGREG_UNIPLL_SES		202
+#define CLK_TOP_CFGREG_F_PCIE_PHY_REF		203
+#define CLK_TOP_SSUSB_TOP_REF			204
+#define CLK_TOP_SSUSB_PHY_REF			205
+#define CLK_TOP_SSUSB_TOP_P1_REF		206
+#define CLK_TOP_SSUSB_PHY_P1_REF		207
+#define CLK_TOP_SSUSB_TOP_P2_REF		208
+#define CLK_TOP_SSUSB_PHY_P2_REF		209
+#define CLK_TOP_SSUSB_TOP_P3_REF		210
+#define CLK_TOP_SSUSB_PHY_P3_REF		211
+#define CLK_TOP_NR_CLK				212
+
+/* INFRACFG_AO */
+#define CLK_INFRA_AO_PMIC_TMR			0
+#define CLK_INFRA_AO_PMIC_AP			1
+#define CLK_INFRA_AO_PMIC_MD			2
+#define CLK_INFRA_AO_PMIC_CONN			3
+#define CLK_INFRA_AO_SEJ			4
+#define CLK_INFRA_AO_APXGPT			5
+#define CLK_INFRA_AO_GCE			6
+#define CLK_INFRA_AO_GCE2			7
+#define CLK_INFRA_AO_THERM			8
+#define CLK_INFRA_AO_PWM_HCLK			9
+#define CLK_INFRA_AO_PWM1			10
+#define CLK_INFRA_AO_PWM2			11
+#define CLK_INFRA_AO_PWM3			12
+#define CLK_INFRA_AO_PWM4			13
+#define CLK_INFRA_AO_PWM			14
+#define CLK_INFRA_AO_UART0			15
+#define CLK_INFRA_AO_UART1			16
+#define CLK_INFRA_AO_UART2			17
+#define CLK_INFRA_AO_UART3			18
+#define CLK_INFRA_AO_UART4			19
+#define CLK_INFRA_AO_GCE_26M			20
+#define CLK_INFRA_AO_CQ_DMA_FPC			21
+#define CLK_INFRA_AO_UART5			22
+#define CLK_INFRA_AO_HDMI_26M			23
+#define CLK_INFRA_AO_SPI0			24
+#define CLK_INFRA_AO_MSDC0			25
+#define CLK_INFRA_AO_MSDC1			26
+#define CLK_INFRA_AO_MSDC2			27
+#define CLK_INFRA_AO_MSDC0_SRC			28
+#define CLK_INFRA_AO_DVFSRC			29
+#define CLK_INFRA_AO_TRNG			30
+#define CLK_INFRA_AO_AUXADC			31
+#define CLK_INFRA_AO_CPUM			32
+#define CLK_INFRA_AO_HDMI_32K			33
+#define CLK_INFRA_AO_CEC_66M_HCLK		34
+#define CLK_INFRA_AO_PCIE_TL_26M		35
+#define CLK_INFRA_AO_MSDC1_SRC			36
+#define CLK_INFRA_AO_CEC_66M_BCLK		37
+#define CLK_INFRA_AO_PCIE_TL_96M		38
+#define CLK_INFRA_AO_DEVICE_APC			39
+#define CLK_INFRA_AO_ECC_66M_HCLK		40
+#define CLK_INFRA_AO_DEBUGSYS			41
+#define CLK_INFRA_AO_AUDIO			42
+#define CLK_INFRA_AO_PCIE_TL_32K		43
+#define CLK_INFRA_AO_DBG_TRACE			44
+#define CLK_INFRA_AO_DRAMC_F26M			45
+#define CLK_INFRA_AO_IRTX			46
+#define CLK_INFRA_AO_DISP_PWM			47
+#define CLK_INFRA_AO_CLDMA_BCLK			48
+#define CLK_INFRA_AO_AUDIO_26M_BCLK		49
+#define CLK_INFRA_AO_SPI1			50
+#define CLK_INFRA_AO_SPI2			51
+#define CLK_INFRA_AO_SPI3			52
+#define CLK_INFRA_AO_FSSPM			53
+#define CLK_INFRA_AO_SSPM_BUS_HCLK		54
+#define CLK_INFRA_AO_APDMA_BCLK			55
+#define CLK_INFRA_AO_SPI4			56
+#define CLK_INFRA_AO_SPI5			57
+#define CLK_INFRA_AO_CQ_DMA			58
+#define CLK_INFRA_AO_MSDC0_SELF			59
+#define CLK_INFRA_AO_MSDC1_SELF			60
+#define CLK_INFRA_AO_MSDC2_SELF			61
+#define CLK_INFRA_AO_I2S_DMA			62
+#define CLK_INFRA_AO_AP_MSDC0			63
+#define CLK_INFRA_AO_MD_MSDC0			64
+#define CLK_INFRA_AO_MSDC30_2			65
+#define CLK_INFRA_AO_GCPU			66
+#define CLK_INFRA_AO_PCIE_PERI_26M		67
+#define CLK_INFRA_AO_GCPU_66M_BCLK		68
+#define CLK_INFRA_AO_GCPU_133M_BCLK		69
+#define CLK_INFRA_AO_DISP_PWM1			70
+#define CLK_INFRA_AO_FBIST2FPC			71
+#define CLK_INFRA_AO_DEVICE_APC_SYNC		72
+#define CLK_INFRA_AO_PCIE_P1_PERI_26M		73
+#define CLK_INFRA_AO_133M_MCLK_CK		74
+#define CLK_INFRA_AO_66M_MCLK_CK		75
+#define CLK_INFRA_AO_PCIE_PL_P_250M_P0		76
+#define CLK_INFRA_AO_RG_AES_MSDCFDE_CK_0P	77
+#define CLK_INFRA_AO_NR_CLK			78
+
+/* APMIXEDSYS */
+#define CLK_APMIXED_ETHPLL			0
+#define CLK_APMIXED_MSDCPLL			1
+#define CLK_APMIXED_TVDPLL1			2
+#define CLK_APMIXED_TVDPLL2			3
+#define CLK_APMIXED_MMPLL			4
+#define CLK_APMIXED_MAINPLL			5
+#define CLK_APMIXED_IMGPLL			6
+#define CLK_APMIXED_UNIVPLL			7
+#define CLK_APMIXED_ADSPPLL			8
+#define CLK_APMIXED_APLL1			9
+#define CLK_APMIXED_APLL2			10
+#define CLK_APMIXED_APLL3			11
+#define CLK_APMIXED_APLL4			12
+#define CLK_APMIXED_APLL5			13
+#define CLK_APMIXED_MFGPLL			14
+#define CLK_APMIXED_PLL_SSUSB26M_EN		15
+#define CLK_APMIXED_NR_CLK			16
+
+/* AUDIODSP */
+#define CLK_AUDIODSP_AUDIO26M			0
+#define CLK_AUDIODSP_NR_CLK			1
+
+/* PERICFG_AO */
+#define CLK_PERI_AO_ETHERNET			0
+#define CLK_PERI_AO_ETHERNET_BUS		1
+#define CLK_PERI_AO_FLASHIF_BUS			2
+#define CLK_PERI_AO_FLASHIF_26M			3
+#define CLK_PERI_AO_FLASHIFLASHCK		4
+#define CLK_PERI_AO_SSUSB_2P_BUS		5
+#define CLK_PERI_AO_SSUSB_2P_XHCI		6
+#define CLK_PERI_AO_SSUSB_3P_BUS		7
+#define CLK_PERI_AO_SSUSB_3P_XHCI		8
+#define CLK_PERI_AO_SSUSB_BUS			9
+#define CLK_PERI_AO_SSUSB_XHCI			10
+#define CLK_PERI_AO_ETHERNET_MAC		11
+#define CLK_PERI_AO_PCIE_P0_FMEM		12
+#define CLK_PERI_AO_NR_CLK			13
+
+/* IMP_IIC_WRAP_C */
+#define CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C0	0
+#define CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C2	1
+#define CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C3	2
+#define CLK_IMP_IIC_WRAP_C_NR_CLK		3
+
+/* IMP_IIC_WRAP_W */
+#define CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C1	0
+#define CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C4	1
+#define CLK_IMP_IIC_WRAP_W_NR_CLK		2
+
+/* IMP_IIC_WRAP_EN */
+#define CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C5	0
+#define CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C6	1
+#define CLK_IMP_IIC_WRAP_EN_NR_CLK		2
+
+/* MFGCFG */
+#define CLK_MFGCFG_BG3D				0
+#define CLK_MFGCFG_NR_CLK			1
+
+/* VPPSYS0 */
+#define CLK_VPP0_MDP_FG				0
+#define CLK_VPP0_STITCH				1
+#define CLK_VPP0_PADDING			2
+#define CLK_VPP0_MDP_TCC			3
+#define CLK_VPP0_WARP0_ASYNC_TX			4
+#define CLK_VPP0_WARP1_ASYNC_TX			5
+#define CLK_VPP0_MUTEX				6
+#define CLK_VPP02VPP1_RELAY			7
+#define CLK_VPP0_VPP12VPP0_ASYNC		8
+#define CLK_VPP0_MMSYSRAM_TOP			9
+#define CLK_VPP0_MDP_AAL			10
+#define CLK_VPP0_MDP_RSZ			11
+#define CLK_VPP0_SMI_COMMON_MMSRAM		12
+#define CLK_VPP0_GALS_VDO0_LARB0_MMSRAM		13
+#define CLK_VPP0_GALS_VDO0_LARB1_MMSRAM		14
+#define CLK_VPP0_GALS_VENCSYS_MMSRAM		15
+#define CLK_VPP0_GALS_VENCSYS_CORE1_MMSRAM	16
+#define CLK_VPP0_GALS_INFRA_MMSRAM		17
+#define CLK_VPP0_GALS_CAMSYS_MMSRAM		18
+#define CLK_VPP0_GALS_VPP1_LARB5_MMSRAM		19
+#define CLK_VPP0_GALS_VPP1_LARB6_MMSRAM		20
+#define CLK_VPP0_SMI_REORDER_MMSRAM		21
+#define CLK_VPP0_SMI_IOMMU			22
+#define CLK_VPP0_GALS_IMGSYS_CAMSYS		23
+#define CLK_VPP0_MDP_RDMA			24
+#define CLK_VPP0_MDP_WROT			25
+#define CLK_VPP0_GALS_EMI0_EMI1			26
+#define CLK_VPP0_SMI_SUB_COMMON_REORDER		27
+#define CLK_VPP0_SMI_RSI			28
+#define CLK_VPP0_SMI_COMMON_LARB4		29
+#define CLK_VPP0_GALS_VDEC_VDEC_CORE1		30
+#define CLK_VPP0_GALS_VPP1_WPESYS		31
+#define CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1	32
+#define CLK_VPP0_FAKE_ENG			33
+#define CLK_VPP0_MDP_HDR			34
+#define CLK_VPP0_MDP_TDSHP			35
+#define CLK_VPP0_MDP_COLOR			36
+#define CLK_VPP0_MDP_OVL			37
+#define CLK_VPP0_DSIP_RDMA			38
+#define CLK_VPP0_DISP_WDMA			39
+#define CLK_VPP0_MDP_HMS			40
+#define CLK_VPP0_WARP0_RELAY			41
+#define CLK_VPP0_WARP0_ASYNC			42
+#define CLK_VPP0_WARP1_RELAY			43
+#define CLK_VPP0_WARP1_ASYNC			44
+#define CLK_VPP0_NR_CLK				45
+
+/* WPESYS */
+#define CLK_WPE_TOP_WPE_VPP0			0
+#define CLK_WPE_TOP_SMI_LARB7			1
+#define CLK_WPE_TOP_WPESYS_EVENT_TX		2
+#define CLK_WPE_TOP_SMI_LARB7_PCLK_EN		3
+#define CLK_WPE_TOP_NR_CLK			4
+
+/* WPESYS_VPP0 */
+#define CLK_WPE_VPP0_VECI			0
+#define CLK_WPE_VPP0_VEC2I			1
+#define CLK_WPE_VPP0_VEC3I			2
+#define CLK_WPE_VPP0_WPEO			3
+#define CLK_WPE_VPP0_MSKO			4
+#define CLK_WPE_VPP0_VGEN			5
+#define CLK_WPE_VPP0_EXT			6
+#define CLK_WPE_VPP0_VFC			7
+#define CLK_WPE_VPP0_CACH0_TOP			8
+#define CLK_WPE_VPP0_CACH0_DMA			9
+#define CLK_WPE_VPP0_CACH1_TOP			10
+#define CLK_WPE_VPP0_CACH1_DMA			11
+#define CLK_WPE_VPP0_CACH2_TOP			12
+#define CLK_WPE_VPP0_CACH2_DMA			13
+#define CLK_WPE_VPP0_CACH3_TOP			14
+#define CLK_WPE_VPP0_CACH3_DMA			15
+#define CLK_WPE_VPP0_PSP			16
+#define CLK_WPE_VPP0_PSP2			17
+#define CLK_WPE_VPP0_SYNC			18
+#define CLK_WPE_VPP0_C24			19
+#define CLK_WPE_VPP0_MDP_CROP			20
+#define CLK_WPE_VPP0_ISP_CROP			21
+#define CLK_WPE_VPP0_TOP			22
+#define CLK_WPE_VPP0_NR_CLK			23
+
+/* VPPSYS1 */
+#define CLK_VPP1_SVPP1_MDP_OVL			0
+#define CLK_VPP1_SVPP1_MDP_TCC			1
+#define CLK_VPP1_SVPP1_MDP_WROT			2
+#define CLK_VPP1_SVPP1_VPP_PAD			3
+#define CLK_VPP1_SVPP2_MDP_WROT			4
+#define CLK_VPP1_SVPP2_VPP_PAD			5
+#define CLK_VPP1_SVPP3_MDP_WROT			6
+#define CLK_VPP1_SVPP3_VPP_PAD			7
+#define CLK_VPP1_SVPP1_MDP_RDMA			8
+#define CLK_VPP1_SVPP1_MDP_FG			9
+#define CLK_VPP1_SVPP2_MDP_RDMA			10
+#define CLK_VPP1_SVPP2_MDP_FG			11
+#define CLK_VPP1_SVPP3_MDP_RDMA			12
+#define CLK_VPP1_SVPP3_MDP_FG			13
+#define CLK_VPP1_VPP_SPLIT			14
+#define CLK_VPP1_SVPP2_VDO0_DL_RELAY		15
+#define CLK_VPP1_SVPP1_MDP_RSZ			16
+#define CLK_VPP1_SVPP1_MDP_TDSHP		17
+#define CLK_VPP1_SVPP1_MDP_COLOR		18
+#define CLK_VPP1_SVPP3_VDO1_DL_RELAY		19
+#define CLK_VPP1_SVPP2_MDP_RSZ			20
+#define CLK_VPP1_SVPP2_VPP_MERGE		21
+#define CLK_VPP1_SVPP2_MDP_TDSHP		22
+#define CLK_VPP1_SVPP2_MDP_COLOR		23
+#define CLK_VPP1_SVPP3_MDP_RSZ			24
+#define CLK_VPP1_SVPP3_VPP_MERGE		25
+#define CLK_VPP1_SVPP3_MDP_TDSHP		26
+#define CLK_VPP1_SVPP3_MDP_COLOR		27
+#define CLK_VPP1_GALS5				28
+#define CLK_VPP1_GALS6				29
+#define CLK_VPP1_LARB5				30
+#define CLK_VPP1_LARB6				31
+#define CLK_VPP1_SVPP1_MDP_HDR			32
+#define CLK_VPP1_SVPP1_MDP_AAL			33
+#define CLK_VPP1_SVPP2_MDP_HDR			34
+#define CLK_VPP1_SVPP2_MDP_AAL			35
+#define CLK_VPP1_SVPP3_MDP_HDR			36
+#define CLK_VPP1_SVPP3_MDP_AAL			37
+#define CLK_VPP1_DISP_MUTEX			38
+#define CLK_VPP1_SVPP2_VDO1_DL_RELAY		39
+#define CLK_VPP1_SVPP3_VDO0_DL_RELAY		40
+#define CLK_VPP1_VPP0_DL_ASYNC			41
+#define CLK_VPP1_VPP0_DL1_RELAY			42
+#define CLK_VPP1_LARB5_FAKE_ENG			43
+#define CLK_VPP1_LARB6_FAKE_ENG			44
+#define CLK_VPP1_HDMI_META			45
+#define CLK_VPP1_VPP_SPLIT_HDMI			46
+#define CLK_VPP1_DGI_IN				47
+#define CLK_VPP1_DGI_OUT			48
+#define CLK_VPP1_VPP_SPLIT_DGI			49
+#define CLK_VPP1_DL_CON_OCC			50
+#define CLK_VPP1_VPP_SPLIT_26M			51
+#define CLK_VPP1_NR_CLK				52
+
+/* IMGSYS */
+#define CLK_IMGSYS_MAIN_LARB9			0
+#define CLK_IMGSYS_MAIN_TRAW0			1
+#define CLK_IMGSYS_MAIN_TRAW1			2
+#define CLK_IMGSYS_MAIN_VCORE_GALS		3
+#define CLK_IMGSYS_MAIN_DIP0			4
+#define CLK_IMGSYS_MAIN_WPE0			5
+#define CLK_IMGSYS_MAIN_IPE			6
+#define CLK_IMGSYS_MAIN_WPE1			7
+#define CLK_IMGSYS_MAIN_WPE2			8
+#define CLK_IMGSYS_MAIN_GALS			9
+#define CLK_IMGSYS_MAIN_NR_CLK			10
+
+/* IMGSYS1_DIP_TOP */
+#define CLK_IMGSYS1_DIP_TOP_LARB10		0
+#define CLK_IMGSYS1_DIP_TOP_DIP_TOP		1
+#define CLK_IMGSYS1_DIP_TOP_NR_CLK		2
+
+/* IMGSYS1_DIP_NR */
+#define CLK_IMGSYS1_DIP_NR_LARB15		0
+#define CLK_IMGSYS1_DIP_NR_DIP_NR		1
+#define CLK_IMGSYS1_DIP_NR_NR_CLK		2
+
+/* IMGSYS_WPE1 */
+#define CLK_IMGSYS_WPE1_LARB11			0
+#define CLK_IMGSYS_WPE1				1
+#define CLK_IMGSYS_WPE1_NR_CLK			2
+
+/* IPESYS */
+#define CLK_IPE_DPE				0
+#define CLK_IPE_FDVT				1
+#define CLK_IPE_ME				2
+#define CLK_IPESYS_TOP				3
+#define CLK_IPE_SMI_LARB12			4
+#define CLK_IPE_NR_CLK				5
+
+/* IMGSYS_WPE2 */
+#define CLK_IMGSYS_WPE2_LARB11			0
+#define CLK_IMGSYS_WPE2				1
+#define CLK_IMGSYS_WPE2_NR_CLK			2
+
+/* IMGSYS_WPE3 */
+#define CLK_IMGSYS_WPE3_LARB11			0
+#define CLK_IMGSYS_WPE3				1
+#define CLK_IMGSYS_WPE3_NR_CLK			2
+
+/* CAMSYS */
+#define CLK_CAM_MAIN_LARB13			0
+#define CLK_CAM_MAIN_LARB14			1
+#define CLK_CAM_MAIN_CAM			2
+#define CLK_CAM_MAIN_CAM_SUBA			3
+#define CLK_CAM_MAIN_CAM_SUBB			4
+#define CLK_CAM_MAIN_CAMTG			5
+#define CLK_CAM_MAIN_SENINF			6
+#define CLK_CAM_MAIN_GCAMSVA			7
+#define CLK_CAM_MAIN_GCAMSVB			8
+#define CLK_CAM_MAIN_GCAMSVC			9
+#define CLK_CAM_MAIN_GCAMSVD			10
+#define CLK_CAM_MAIN_GCAMSVE			11
+#define CLK_CAM_MAIN_GCAMSVF			12
+#define CLK_CAM_MAIN_GCAMSVG			13
+#define CLK_CAM_MAIN_GCAMSVH			14
+#define CLK_CAM_MAIN_GCAMSVI			15
+#define CLK_CAM_MAIN_GCAMSVJ			16
+#define CLK_CAM_MAIN_CAMSV_TOP			17
+#define CLK_CAM_MAIN_CAMSV_CQ_A			18
+#define CLK_CAM_MAIN_CAMSV_CQ_B			19
+#define CLK_CAM_MAIN_CAMSV_CQ_C			20
+#define CLK_CAM_MAIN_FAKE_ENG			21
+#define CLK_CAM_MAIN_CAM2MM0_GALS		22
+#define CLK_CAM_MAIN_CAM2MM1_GALS		23
+#define CLK_CAM_MAIN_CAM2SYS_GALS		24
+#define CLK_CAM_MAIN_NR_CLK			25
+
+/* CAMSYS_RAWA */
+#define CLK_CAM_RAWA_LARBX			0
+#define CLK_CAM_RAWA_CAM			1
+#define CLK_CAM_RAWA_CAMTG			2
+#define CLK_CAM_RAWA_NR_CLK			3
+
+/* CAMSYS_YUVA */
+#define CLK_CAM_YUVA_LARBX			0
+#define CLK_CAM_YUVA_CAM			1
+#define CLK_CAM_YUVA_CAMTG			2
+#define CLK_CAM_YUVA_NR_CLK			3
+
+/* CAMSYS_RAWB */
+#define CLK_CAM_RAWB_LARBX			0
+#define CLK_CAM_RAWB_CAM			1
+#define CLK_CAM_RAWB_CAMTG			2
+#define CLK_CAM_RAWB_NR_CLK			3
+
+/* CAMSYS_YUVB */
+#define CLK_CAM_YUVB_LARBX			0
+#define CLK_CAM_YUVB_CAM			1
+#define CLK_CAM_YUVB_CAMTG			2
+#define CLK_CAM_YUVB_NR_CLK			3
+
+/* CCUSYS */
+#define CLK_CCU_LARB27				0
+#define CLK_CCU_AHB				1
+#define CLK_CCU_CCU0				2
+#define CLK_CCU_NR_CLK				3
+
+/* VDECSYS_SOC */
+#define CLK_VDE1_SOC_LARB1			0
+#define CLK_VDE1_SOC_LAT			1
+#define CLK_VDE1_SOC_LAT_ACTIVE			2
+#define CLK_VDE1_SOC_LAT_ENG			3
+#define CLK_VDE1_SOC_VDEC			4
+#define CLK_VDE1_SOC_VDEC_ACTIVE		5
+#define CLK_VDE1_SOC_VDEC_ENG			6
+#define CLK_VDE1_NR_CLK				7
+
+/* VDECSYS */
+#define CLK_VDE2_LARB1				0
+#define CLK_VDE2_LAT				1
+#define CLK_VDE2_VDEC				2
+#define CLK_VDE2_VDEC_ACTIVE			3
+#define CLK_VDE2_VDEC_ENG			4
+#define CLK_VDE2_NR_CLK				5
+
+/* VENCSYS */
+#define CLK_VEN1_CKE0_LARB			0
+#define CLK_VEN1_CKE1_VENC			1
+#define CLK_VEN1_CKE2_JPGENC			2
+#define CLK_VEN1_CKE3_JPGDEC			3
+#define CLK_VEN1_CKE4_JPGDEC_C1			4
+#define CLK_VEN1_CKE5_GALS			5
+#define CLK_VEN1_CKE6_GALS_SRAM			6
+#define CLK_VEN1_NR_CLK				7
+
+/* VDOSYS0 */
+#define CLK_VDO0_DISP_OVL0			0
+#define CLK_VDO0_FAKE_ENG0			1
+#define CLK_VDO0_DISP_CCORR0			2
+#define CLK_VDO0_DISP_MUTEX0			3
+#define CLK_VDO0_DISP_GAMMA0			4
+#define CLK_VDO0_DISP_DITHER0			5
+#define CLK_VDO0_DISP_WDMA0			6
+#define CLK_VDO0_DISP_RDMA0			7
+#define CLK_VDO0_DSI0				8
+#define CLK_VDO0_DSI1				9
+#define CLK_VDO0_DSC_WRAP0			10
+#define CLK_VDO0_VPP_MERGE0			11
+#define CLK_VDO0_DP_INTF0			12
+#define CLK_VDO0_DISP_AAL0			13
+#define CLK_VDO0_INLINEROT0			14
+#define CLK_VDO0_APB_BUS			15
+#define CLK_VDO0_DISP_COLOR0			16
+#define CLK_VDO0_MDP_WROT0			17
+#define CLK_VDO0_DISP_RSZ0			18
+#define CLK_VDO0_DISP_POSTMASK0			19
+#define CLK_VDO0_FAKE_ENG1			20
+#define CLK_VDO0_DL_ASYNC2			21
+#define CLK_VDO0_DL_RELAY3			22
+#define CLK_VDO0_DL_RELAY4			23
+#define CLK_VDO0_SMI_GALS			24
+#define CLK_VDO0_SMI_COMMON			25
+#define CLK_VDO0_SMI_EMI			26
+#define CLK_VDO0_SMI_IOMMU			27
+#define CLK_VDO0_SMI_LARB			28
+#define CLK_VDO0_SMI_RSI			29
+#define CLK_VDO0_DSI0_DSI			30
+#define CLK_VDO0_DSI1_DSI			31
+#define CLK_VDO0_DP_INTF0_DP_INTF		32
+#define CLK_VDO0_NR_CLK				33
+
+/* VDOSYS1 */
+#define CLK_VDO1_SMI_LARB2			0
+#define CLK_VDO1_SMI_LARB3			1
+#define CLK_VDO1_GALS				2
+#define CLK_VDO1_FAKE_ENG0			3
+#define CLK_VDO1_FAKE_ENG1			4
+#define CLK_VDO1_MDP_RDMA0			5
+#define CLK_VDO1_MDP_RDMA1			6
+#define CLK_VDO1_MDP_RDMA2			7
+#define CLK_VDO1_MDP_RDMA3			8
+#define CLK_VDO1_VPP_MERGE0			9
+#define CLK_VDO1_VPP_MERGE1			10
+#define CLK_VDO1_VPP_MERGE2			11
+#define CLK_VDO1_VPP_MERGE3			12
+#define CLK_VDO1_VPP_MERGE4			13
+#define CLK_VDO1_VPP2_TO_VDO1_DL_ASYNC		14
+#define CLK_VDO1_VPP3_TO_VDO1_DL_ASYNC		15
+#define CLK_VDO1_DISP_MUTEX			16
+#define CLK_VDO1_MDP_RDMA4			17
+#define CLK_VDO1_MDP_RDMA5			18
+#define CLK_VDO1_MDP_RDMA6			19
+#define CLK_VDO1_MDP_RDMA7			20
+#define CLK_VDO1_DP_INTF0_MMCK			21
+#define CLK_VDO1_DPI0_MM			22
+#define CLK_VDO1_DPI1_MM			23
+#define CLK_VDO1_MERGE0_DL_ASYNC		24
+#define CLK_VDO1_MERGE1_DL_ASYNC		25
+#define CLK_VDO1_MERGE2_DL_ASYNC		26
+#define CLK_VDO1_MERGE3_DL_ASYNC		27
+#define CLK_VDO1_MERGE4_DL_ASYNC		28
+#define CLK_VDO1_DSC_VDO1_DL_ASYNC		29
+#define CLK_VDO1_MERGE_VDO1_DL_ASYNC		30
+#define CLK_VDO1_PADDING0			31
+#define CLK_VDO1_PADDING1			32
+#define CLK_VDO1_PADDING2			33
+#define CLK_VDO1_PADDING3			34
+#define CLK_VDO1_PADDING4			35
+#define CLK_VDO1_PADDING5			36
+#define CLK_VDO1_PADDING6			37
+#define CLK_VDO1_PADDING7			38
+#define CLK_VDO1_DISP_RSZ0			39
+#define CLK_VDO1_DISP_RSZ1			40
+#define CLK_VDO1_DISP_RSZ2			41
+#define CLK_VDO1_DISP_RSZ3			42
+#define CLK_VDO1_HDR_VDO_FE0			43
+#define CLK_VDO1_HDR_GFX_FE0			44
+#define CLK_VDO1_HDR_VDO_BE			45
+#define CLK_VDO1_HDR_VDO_FE1			46
+#define CLK_VDO1_HDR_GFX_FE1			47
+#define CLK_VDO1_DISP_MIXER			48
+#define CLK_VDO1_HDR_VDO_FE0_DL_ASYNC		49
+#define CLK_VDO1_HDR_VDO_FE1_DL_ASYNC		50
+#define CLK_VDO1_HDR_GFX_FE0_DL_ASYNC		51
+#define CLK_VDO1_HDR_GFX_FE1_DL_ASYNC		52
+#define CLK_VDO1_HDR_VDO_BE_DL_ASYNC		53
+#define CLK_VDO1_DPI0				54
+#define CLK_VDO1_DISP_MONITOR_DPI0		55
+#define CLK_VDO1_DPI1				56
+#define CLK_VDO1_DISP_MONITOR_DPI1		57
+#define CLK_VDO1_DPINTF				58
+#define CLK_VDO1_DISP_MONITOR_DPINTF		59
+#define CLK_VDO1_26M_SLOW			60
+#define CLK_VDO1_NR_CLK				61
+
+#endif /* _DT_BINDINGS_CLK_MT8188_H */
-- 
2.18.0


