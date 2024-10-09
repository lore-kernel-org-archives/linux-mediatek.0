Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7965CEDD8F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfQNQQCo8K9+DzWkjIEJye5NdvsRl2yQMCwuZNkZaYk=; b=bN7SwKKEtvlLqX2jDQl1usym2o
	GY0aktTEcasUDozrWelFy6iyu7nUYe4KoXapg8gMYBnyHwVBTsQWZVjvD+iCLB6tKn+IRLujnvJX5
	2iehBRh936TLFIFUKZU5mqkUjR60RT1v/CgxAbdSiZHPqCIGRWoort7TqT14u2WfCpSMMc6+I02wl
	jGvW7NFx6U3psgekUGA6GN/fd2xTqDkVY07jelE2XKypHlCzmfK5+0QRGASPOrzR3oir0rCy7i/X4
	r8rpSKj2wiUIRNIhKqKovk4QGT3mqDJAqhypCRYrTrVueWaDufGeJaLc6OIpLoaQYLeDQuUAICKDn
	ylx1Ymzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syVq6-00000009DP0-1CgI;
	Wed, 09 Oct 2024 12:30:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUfu-000000091FD-2w3R;
	Wed, 09 Oct 2024 11:16:16 +0000
X-UUID: e0e51c8a862f11efba0aef63c0775dbf-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dfQNQQCo8K9+DzWkjIEJye5NdvsRl2yQMCwuZNkZaYk=;
	b=SPRB2oQTBNtk9itpCoovZzDifsfpW2gcXjRwtJKlWwnO6gYvYt/Df6j1+edbQAHjZFRFpCzYul4fBNe3kydNS4G6tuwDWOJMArF/Dm4tczbRUuT942Fcpy9XYeG0BhF1MlrcWa4YzPjju8WFnpe5H4tHUJ1v1Mve6LE8wO8eMAM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7307378d-44fc-43fd-b6bf-94d3276f789b,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:078a0041-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e0e51c8a862f11efba0aef63c0775dbf-20241009
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shu-hsiang.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1113697884; Wed, 09 Oct 2024 04:16:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 04:16:03 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:16:03 +0800
From: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>, <yunkec@chromium.org>, <shun-yi.wang@mediatek.com>,
	Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Subject: [PATCH v1 01/10] dt-bindings: media: mediatek: add camsys device
Date: Wed, 9 Oct 2024 19:15:42 +0800
Message-ID: <20241009111551.27052-2-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_041614_798601_0D3B9C99 
X-CRM114-Status: GOOD (  14.67  )
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

1. Add camera isp7x module device document
2. Add camera interface device document

Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
---
 .../media/mediatek/mediatek,cam-raw.yaml      | 169 ++++++++++++++++++
 .../media/mediatek/mediatek,cam-yuv.yaml      | 148 +++++++++++++++
 .../media/mediatek/mediatek,camisp.yaml       |  71 ++++++++
 .../media/mediatek/mediatek,seninf-core.yaml  | 106 +++++++++++
 .../media/mediatek/mediatek,seninf.yaml       |  88 +++++++++
 5 files changed, 582 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
new file mode 100644
index 000000000000..c709e4bf0a18
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The cam-raw unit of MediaTek ISP system
+
+maintainers:
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek cam-raw is the camera RAW processing unit in MediaTek SoC.
+
+properties:
+  compatible:
+    const: mediatek,cam-raw
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    items:
+      minItems: 2
+      maxItems: 4
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
+  mediatek,cam-id:
+    description:
+      Describes the index of MediaTek cam-raw unit for ISP
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+  mediatek,larbs:
+    description:
+      Describes MediaTek bus infrastructure unit for ISP system.
+      List of phandle to the local arbiters in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  interrupts:
+    minItems: 1
+
+  dma-ranges:
+    description:
+      Describes the address information of IOMMU mapping to memory.
+      Defines six fields for the MediaTek IOMMU extended iova, pa, and size.
+    minItems: 1
+
+  power-domains:
+    minItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 16
+
+  clock-names:
+    minItems: 4
+    maxItems: 16
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  iommus:
+    description:
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      cam_raw_a@16030000 {
+        compatible = "mediatek,cam-raw";
+        reg = <0 0x16030000 0 0x8000>,
+              <0 0x16038000 0 0x8000>;
+        reg-names = "base", "inner_base";
+        mediatek,cam-id = <0>;
+        mediatek,larbs = <&larb16a>;
+        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_SUBA>;
+        clocks = <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
+            <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
+            <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>,
+            <&camsys CLK_CAM_MAIN_CAM>,
+            <&camsys CLK_CAM_MAIN_CAMTG>,
+            <&camsys_rawa CLK_CAM_RAWA_LARBX>,
+            <&camsys_rawa CLK_CAM_RAWA_CAM>,
+            <&camsys_rawa CLK_CAM_RAWA_CAMTG>,
+            <&topckgen CLK_TOP_CAM>,
+            <&topckgen CLK_TOP_CAMTG>,
+            <&topckgen CLK_TOP_CAMTM>;
+        clock-names = "camsys_cam2mm0_cgpdn",
+            "camsys_cam2mm1_cgpdn",
+            "camsys_cam2sys_cgpdn",
+            "camsys_cam_cgpdn",
+            "camsys_camtg_cgpdn",
+            "camsys_rawa_larbx_cgpdn",
+            "camsys_rawa_cam_cgpdn",
+            "camsys_rawa_camtg_cgpdn",
+            "topckgen_top_cam",
+            "topckgen_top_camtg",
+            "topckgen_top_camtm";
+        assigned-clocks = <&topckgen CLK_TOP_CAM>;
+        assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5>;
+        iommus = <&vpp_iommu M4U_PORT_L16A_IMGO_R1>,
+            <&vpp_iommu M4U_PORT_L16A_CQI_R1>,
+            <&vpp_iommu M4U_PORT_L16A_CQI_R2>,
+            <&vpp_iommu M4U_PORT_L16A_BPCI_R1>,
+            <&vpp_iommu M4U_PORT_L16A_LSCI_R1>,
+            <&vpp_iommu M4U_PORT_L16A_RAWI_R2>,
+            <&vpp_iommu M4U_PORT_L16A_RAWI_R3>,
+            <&vpp_iommu M4U_PORT_L16A_UFDI_R2>,
+            <&vpp_iommu M4U_PORT_L16A_UFDI_R3>,
+            <&vpp_iommu M4U_PORT_L16A_RAWI_R4>,
+            <&vpp_iommu M4U_PORT_L16A_RAWI_R5>,
+            <&vpp_iommu M4U_PORT_L16A_AAI_R1>,
+            <&vpp_iommu M4U_PORT_L16A_UFDI_R5>,
+            <&vpp_iommu M4U_PORT_L16A_FHO_R1>,
+            <&vpp_iommu M4U_PORT_L16A_AAO_R1>,
+            <&vpp_iommu M4U_PORT_L16A_TSFSO_R1>,
+            <&vpp_iommu M4U_PORT_L16A_FLKO_R1>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
new file mode 100644
index 000000000000..30dfd5e5ecb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The cam-yuv unit of MediaTek ISP system
+
+maintainers:
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek cam-yuv is the camera YUV processing unit in MediaTek SoC.
+
+properties:
+  compatible:
+    const: mediatek,cam-yuv
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    items:
+      minItems: 2
+      maxItems: 4
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
+  mediatek,cam-id:
+    description:
+      Describes the index of MediaTek cam-yuv unit for ISP
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+  mediatek,larbs:
+    description:
+      Describes MediaTek bus infrastructure unit for ISP system.
+      List of phandle to the local arbiters in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  interrupts:
+    minItems: 1
+
+  dma-ranges:
+    description:
+      Describes the address information of IOMMU mapping to memory.
+      Defines six fields for the MediaTek IOMMU extended iova, pa, and size.
+    minItems: 1
+
+  power-domains:
+    minItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 16
+
+  clock-names:
+    minItems: 4
+    maxItems: 16
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  iommus:
+    description:
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      cam_yuv_b@16090000 {
+        compatible = "mediatek,cam-yuv";
+        reg = <0 0x16090000 0 0x8000>;
+        reg-names = "base";
+        mediatek,cam-id = <1>;
+        mediatek,larbs = <&larb17b>;
+        interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_SUBB>;
+        clocks = <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
+            <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
+            <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>,
+            <&camsys_yuvb CLK_CAM_YUVB_LARBX>,
+            <&camsys_yuvb CLK_CAM_YUVB_CAM>,
+            <&camsys_yuvb CLK_CAM_YUVB_CAMTG>;
+        clock-names = "camsys_cam2mm0_cgpdn",
+            "camsys_cam2mm1_cgpdn",
+            "camsys_cam2sys_cgpdn",
+            "camsys_yuvb_larbx_cgpdn",
+            "camsys_yuvb_cam_cgpdn",
+            "camsys_yuvb_camtg_cgpdn";
+        assigned-clocks = <&topckgen CLK_TOP_CAM>;
+        assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5>;
+        iommus = <&vdo_iommu M4U_PORT_L17B_YUVO_R1>,
+            <&vdo_iommu M4U_PORT_L17B_YUVO_R3>,
+            <&vdo_iommu M4U_PORT_L17B_YUVCO_R1>,
+            <&vdo_iommu M4U_PORT_L17B_YUVO_R2>,
+            <&vdo_iommu M4U_PORT_L17B_RZH1N2TO_R1>,
+            <&vdo_iommu M4U_PORT_L17B_DRZS4NO_R1>,
+            <&vdo_iommu M4U_PORT_L17B_TNCSO_R1>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
new file mode 100644
index 000000000000..ce378ddbd5bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,camisp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The camisp unit of MediaTek ISP system
+
+maintainers:
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek camisp is the ISP auxiliary unit for camera system in MediaTek SoC.
+
+properties:
+  compatible:
+    const: mediatek,camisp
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    items:
+      minItems: 2
+      maxItems: 4
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,scp:
+    description: MediaTek co-process unit for ISP system
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      camisp: camisp@16000000 {
+        compatible = "mediatek,camisp";
+        reg = <0 0x16000000 0 0x1000>;
+        reg-names = "base";
+        mediatek,scp = <&scp_dual>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_MAIN>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
new file mode 100644
index 000000000000..bc509976a79e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,seninf-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The seninf-core top unit of MediaTek ISP system
+
+maintainers:
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek seninf-core is the ISP sensor interface unit in MediaTek SoC.
+  The sensor interface serves as the MIPI-CSI2 top RX controller.
+
+properties:
+  compatible:
+    const: mediatek,seninf-core
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    items:
+      minItems: 2
+      maxItems: 4
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 2
+    maxItems: 2
+
+  mtk_csi_phy_ver:
+    description:
+      Describes MediaTek camera Rx controller version
+    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    minItems: 3
+    maxItems: 8
+
+  clock-names:
+    minItems: 3
+    maxItems: 8
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      seninf_top: seninf_top@16010000 {
+        compatible = "mediatek,seninf-core";
+        reg = <0 0x16010000 0 0x8000>,
+              <0 0x11ed0000 0 0xc000>;
+        reg-names = "base", "ana-rx";
+        mtk_csi_phy_ver = "mtk_csi_phy_2_0";
+        interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CSIRX_TOP>,
+                        <&spm MT8188_POWER_DOMAIN_CAM_VCORE>,
+                        <&spm MT8188_POWER_DOMAIN_CAM_MAIN>;
+        clocks = <&camsys CLK_CAM_MAIN_SENINF>,
+                <&topckgen CLK_TOP_SENINF>,
+                <&topckgen CLK_TOP_SENINF1>,
+                <&topckgen CLK_TOP_CAMTM>;
+        clock-names = "clk_cam_seninf",
+                      "clk_top_seninf",
+                      "clk_top_seninf1",
+                      "clk_top_camtm";
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
new file mode 100644
index 000000000000..37d94138c558
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,seninf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The seninf unit of MediaTek ISP system
+
+maintainers:
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek seninf is the MIPI-CSI2 port for seninf-core in MediaTek SoC.
+  These ports provide the optional capability to define endpoints and set RX
+  controller for camera sensors.
+
+properties:
+  compatible:
+    const: mediatek,seninf
+
+  csi-port:
+    description: MediaTek CSI Rx port name
+    $ref: /schemas/types.yaml#/definitions/string
+
+  port:
+    description:
+      MediaTek sensor interface endpoints for one sensor bus.
+    $ref: /schemas/graph.yaml#/$defs/port-base
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^endpoint(@[0-9]+)?$":
+        description:
+          CSI port for one sensor endpoint configuration.
+          Consider one sensor bus can support differet links for MIPI PHY.
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        properties:
+          data-lanes:
+            items:
+              enum: [1, 2, 3, 4]
+            maxItems: 4
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - csi-port
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    seninf_top {
+      seninf_csi_port_0: seninf_csi_port_0 {
+        compatible = "mediatek,seninf";
+        csi-port = "0A";
+        port {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          seninf_csi_port_0_in_1: endpoint {
+            data-lanes = <1 2>;
+            link-frequencies = /bits/ 64 <1440000000 624000000>;
+            remote-endpoint = <&sensor0_out_1>;
+          };
+
+          seninf_csi_port_0_in_2: endpoint@2 {
+            reg = <2>;
+            data-lanes = <1 2>;
+            link-frequencies = /bits/ 64 <336000000 207000000>;
+            remote-endpoint = <&sensor0_out_2>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.18.0


