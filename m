Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501CFC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csyGXKCt25QslFSS7u3GiXe77LgTGKf/e7AHelk6okc=; b=SOcR/wv9WT8PekEDhYPhl+1mhb
	IAxKrFPK2hgIvz/qd9tjLmx6Om0WAsREReT1m+vNs6KRCg8ET5hl4gOVaoV60IQawH4i68DETOiS9
	cvAVFtJ7IkK8080O5DZBKvGquNuTQ4QXTd3dvhUc1031otPHkWcYV6SNkwo1yx6mk1FtoRIZj2My/
	t1oEfw1CDDJNtEbyTbUFUk5PbbSdWcZyfWu3kC6e3qgsaFrywxWn5P8vPHge8SoTF05WrG4VInRXR
	z4Wjs7VVV57yvjf045JI6H8AlAmsM4TbPhQoUACw/mURLQq/Ks7uoLNiiTwiNOKFwvJ7zHhlXNgG4
	eC54b6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkt8-0000000CmtD-3QDI;
	Tue, 16 Apr 2024 15:38:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwksu-0000000CmlE-2G0f;
	Tue, 16 Apr 2024 15:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713281891;
	bh=uVSrmbTrrTvx18AEnTce99nuhXlfyhC3Uf5p8Q689dA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=odbc4Lb1Xbd0lFOH8i49YwZeFfJuirm8es2OkFD9COYVv18IpfPvNAJ4ahxZjiVvb
	 /i7CX9erbDdpNgMqDLGFrLpfUeOghT/3eWoVG3ThizwSBfV5OXfSmivKT0L7IyPX8o
	 ZhKxYIAxfpJioyNv6+9Qo3jsmX2unukhNR/yjhuo/FIfy6ndqZxT1+P/cYY55xhfKl
	 gZH5ey9rmHXc+k3i4AzQ4onCL2SbvQsUTquHff8SK79g/ez5mmS5h9DzBwBYauMQTc
	 5gRzRVrkkvZ5QcVRAhX9Vo1xdX311aowo5ZRE9Z7ibnvwBpM7+kIrITWuIN1H1bKe8
	 prwGTJuBmURCA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1A86B3782140;
	Tue, 16 Apr 2024 15:38:10 +0000 (UTC)
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
Subject: [PATCH v1 2/6] dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
Date: Tue, 16 Apr 2024 17:38:01 +0200
Message-ID: <20240416153805.431118-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_083812_730877_07E9B250 
X-CRM114-Status: GOOD (  13.42  )
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
index 000000000000..e6e0db71209b
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
+        dvfsrc@10012000 {
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


