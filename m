Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4734AC27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arOShR5wdpJwBLTlJZ9FRGgoAoUPluQ95U5+KlCmueY=; b=W3aWRAa/K2JCP3AtsXSqQonSQz
	WV10yvjyJAQ95M5GEV6XmQmFHXW5OyEwpu0fUVqAy2qG9yoh46s2YnmNWgk6/CjcC5gkpVeXQ3RUY
	T4Ll/Dqt6UcOshaj1OJkNmzSlJYZEBOC6b4BfZtNf6WudJx1bc1jSipsOuPGEjJrZaw7Yaks//z0v
	gnOH6Hj8ggFEJMxWOxG8fBoOno14j5W4fHdaIvQfIAZSM3xvzIuHFNFT9u4PeGwVmz4WfghC6UKKc
	2r4qnUfhVOP1Fp2wFWB9r5jRClkG4e9uDTgsA7cuAgzW1diMP6VeYpa90gD8NzNSGYEv6m51X15SY
	0AWIsayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaqh-00000004KUU-2Jgr;
	Mon, 10 Jun 2024 08:57:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaqW-00000004KNC-1MDC;
	Mon, 10 Jun 2024 08:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718009863;
	bh=7OS11wbq8MY3bIA1rbCVTN3wvT0Qcm+ozW8EEVCbUok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwK7wi/zsUYOHZag34vI2JvKF16v/TilP0hDq9IKyEgZKAl7NcETmiTIy+YPbvqnt
	 ZXt3HXFpjd3DmMipjczidS6QOyG2crNHRY1TvL24CjxW55suBmQ1go8VFIIpjI1Gxw
	 VjKyCRSFpvk2sgctRRRVsaQNG0rJQasqcYZuT6MxwwHCdiLDnp6zMS1kRFH+Enzi6Q
	 ISxmuOdCZ2UE/uxsFNH47cNm5/TzGKKx701XksFYtUiU7KvDWut2qjn9S/Q/YjyZdU
	 1BxbcDwgV3NEzxDXCbMyPhxvKjimTnPgt4R7CBpYeAAbAm86gOSvPzfRr+QFpisl6K
	 bUsiyZQUo/cCg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DFF913782172;
	Mon, 10 Jun 2024 08:57:41 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: djakov@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	keescook@chromium.org,
	gustavoars@kernel.org,
	henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	amergnat@baylibre.com
Subject: [PATCH v6 2/7] dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
Date: Mon, 10 Jun 2024 10:57:30 +0200
Message-ID: <20240610085735.147134-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015744_525292_75637A23 
X-CRM114-Status: GOOD (  14.58  )
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

Add bindings for the MediaTek External Memory Interface Interconnect,
which providers support system bandwidth requirements through Dynamic
Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.

This adds bindings for MediaTek MT8183 and MT8195 SoCs.

Note that this is modeled as a subnode of DVFSRC for multiple reasons:
 - Some SoCs have more than one interconnect on the DVFSRC (and two
   different kinds of EMI interconnect, and also a SMI interconnect);

 - Some boards will want to not enable the interconnect driver because
   some of those are not battery powered (so they just keep the knobs
   at full thrust from the bootloader and never care scaling busses);

 - Some DVFSRC interconnect features may depend on firmware.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../interconnect/mediatek,mt8183-emi.yaml     | 51 +++++++++++++++++++
 .../interconnect/mediatek,mt8183.h            | 23 +++++++++
 .../interconnect/mediatek,mt8195.h            | 44 ++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
 create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
 create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
new file mode 100644
index 000000000000..017c8478b2a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/mediatek,mt8183-emi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek External Memory Interface (EMI) Interconnect
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  EMI interconnect providers support system bandwidth requirements through
+  Dynamic Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
+  The provider is able to communicate with the DVFSRC through Secure Monitor
+  Call (SMC).
+
+             ICC provider         ICC Nodes
+                              ----          ----
+             _________       |CPU |   |--- |VPU |
+    _____   |         |-----  ----    |     ----
+   |     |->|  DRAM   |       ----    |     ----
+   |DRAM |->|scheduler|----- |GPU |   |--- |DISP|
+   |     |->|  (EMI)  |       ----    |     ----
+   |_____|->|_________|---.   -----   |     ----
+               /|\         `-|MMSYS|--|--- |VDEC|
+                |             -----   |     ----
+                |                     |     ----
+                | change DRAM freq    |--- |VENC|
+             --------                 |     ----
+    SMC --> | DVFSRC |                |     ----
+             --------                 |--- |IMG |
+                                      |     ----
+                                      |     ----
+                                      |--- |CAM |
+                                            ----
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-emi
+      - mediatek,mt8195-emi
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#interconnect-cells'
+
+unevaluatedProperties: false
diff --git a/include/dt-bindings/interconnect/mediatek,mt8183.h b/include/dt-bindings/interconnect/mediatek,mt8183.h
new file mode 100644
index 000000000000..1088c350258d
--- /dev/null
+++ b/include/dt-bindings/interconnect/mediatek,mt8183.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MEDIATEK_MT8183_H
+#define __DT_BINDINGS_INTERCONNECT_MEDIATEK_MT8183_H
+
+#define SLAVE_DDR_EMI		0
+#define MASTER_MCUSYS		1
+#define MASTER_MFG		2
+#define MASTER_MMSYS		3
+#define MASTER_MM_VPU		4
+#define MASTER_MM_DISP		5
+#define MASTER_MM_VDEC		6
+#define MASTER_MM_VENC		7
+#define MASTER_MM_CAM		8
+#define MASTER_MM_IMG		9
+#define MASTER_MM_MDP		10
+
+#endif
diff --git a/include/dt-bindings/interconnect/mediatek,mt8195.h b/include/dt-bindings/interconnect/mediatek,mt8195.h
new file mode 100644
index 000000000000..33e0e6cde732
--- /dev/null
+++ b/include/dt-bindings/interconnect/mediatek,mt8195.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MEDIATEK_MT8195_H
+#define __DT_BINDINGS_INTERCONNECT_MEDIATEK_MT8195_H
+
+#define SLAVE_DDR_EMI		0
+#define MASTER_MCUSYS		1
+#define MASTER_GPUSYS		2
+#define MASTER_MMSYS		3
+#define MASTER_MM_VPU		4
+#define MASTER_MM_DISP		5
+#define MASTER_MM_VDEC		6
+#define MASTER_MM_VENC		7
+#define MASTER_MM_CAM		8
+#define MASTER_MM_IMG		9
+#define MASTER_MM_MDP		10
+#define MASTER_VPUSYS		11
+#define MASTER_VPU_0		12
+#define MASTER_VPU_1		13
+#define MASTER_MDLASYS		14
+#define MASTER_MDLA_0		15
+#define MASTER_UFS		16
+#define MASTER_PCIE_0		17
+#define MASTER_PCIE_1		18
+#define MASTER_USB		19
+#define MASTER_DBGIF		20
+#define SLAVE_HRT_DDR_EMI	21
+#define MASTER_HRT_MMSYS	22
+#define MASTER_HRT_MM_DISP	23
+#define MASTER_HRT_MM_VDEC	24
+#define MASTER_HRT_MM_VENC	25
+#define MASTER_HRT_MM_CAM	26
+#define MASTER_HRT_MM_IMG	27
+#define MASTER_HRT_MM_MDP	28
+#define MASTER_HRT_DBGIF	29
+#define MASTER_WIFI		30
+#define MASTER_BT		31
+#define MASTER_NETSYS		32
+#endif
-- 
2.45.2


