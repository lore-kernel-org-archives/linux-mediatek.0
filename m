Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B9BC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pi3s7FjTwOaeFjr5L0Or2OLF7loc0sVnM7YXbCc3HeY=; b=VgoouZP7t5P+/fY67nVc+Px8ZE
	coDTCL+pxNTKgqLBZFqTlleFzl/rpNrOUHnic13kfHA2bCTka0n8ei3yyQ25icIf+yoAYGBcaryqE
	/gqro4/9kfkBpAXsSeIrzNs1zzB77yCH83ElFtdQiAWffH5u6c593CHN/+XPFZCg9+fIpCP96vkT9
	DIXpigR9Kk61owLiJUSfWcfLpf8ves9oIr+0Xsc6xxfCvlWEGPNrRQoklvbD7+jRXnu/zOeazIpDN
	hp8VsTtoWLPmL4WiggrXhIXLNby/Y/gWCaFyjW2DVzLWmTCNIEEC7TN7lBqzWigYTnKoUaL9U1wbz
	Sozd8PUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1Nd-0000000FMfV-2qLW;
	Wed, 17 Apr 2024 09:15:01 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1NS-0000000FMZ2-0m1f;
	Wed, 17 Apr 2024 09:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713345289;
	bh=kvgFdBH/flhzfDU/O6aFEKn4BKsXKoLAD7si5NX6IcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t4apCt/ZPYz0lCOeoDD7tCAx5Tb2yTRLzgmlof5zS+tmQLn8h890VKf8IMabwfWVd
	 LHDdGCdxDN+i/qYnryi8uuYvUwmmd211GrOtaILNJl3bTgeAEdVvpfuoIZRACBEVTT
	 L6Tfj4Q3+BKc/xmHz6NAJtX+xloZhgTr7LMeuV+xYN43zoCz+hHH5giFqD/TxdJOzl
	 Djpg7fA5HtQHVjKFvm0uLo7/3EEWSXesQ+TLHexcewWtMxW3hUxEr2+WJtSb2Wgn5v
	 Ngtga+z5oz6qjxxRXrVFb1jch7i1bWTimCVFxSu8H1FsG52w0sfGUfJB9A7SaoGbNE
	 PPcHfMVdP3ayA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DFDF03782143;
	Wed, 17 Apr 2024 09:14:47 +0000 (UTC)
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
Subject: [PATCH v2 2/7] dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
Date: Wed, 17 Apr 2024 11:14:37 +0200
Message-ID: <20240417091442.170505-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_021450_376991_4C85FADA 
X-CRM114-Status: GOOD (  13.52  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../interconnect/mediatek,mt8183-emi.yaml     | 76 +++++++++++++++++++
 .../interconnect/mediatek,mt8183.h            | 23 ++++++
 .../interconnect/mediatek,mt8195.h            | 44 +++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
 create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
 create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
new file mode 100644
index 000000000000..3ad60fd21f83
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
@@ -0,0 +1,76 @@
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
+  reg:
+    maxItems: 1
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#interconnect-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/mediatek,mt8195.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        system-controller@10012000 {
+            compatible = "mediatek,mt8195-dvfsrc";
+            reg = <0 0x10012000 0 0x1000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            emi_icc: interconnect@1 {
+                compatible = "mediatek,mt8195-emi";
+                reg = <1>;
+                #interconnect-cells = <1>;
+            };
+        };
+    };
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
2.44.0


