Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC867C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anfZqjEFlJbLUsfw70pSnG0fvI6PLCj7qrCUEotguvQ=; b=eSyjH7/fqcHNv/MaHCyj3ZzREP
	7hVZL9ZujoQo35Llule5An90Rl5tzFTyY+U+iNkNc730DIDGgfP9yeLKvKyGHXAxBCi4f3GLfl471
	B25xegw8hLKGfSYbbmuBfzl5S73wGVgrBIgou/ZW9LeHAlYUESy4B6khPVxUdQeP2Ez5UvqQPklaa
	4FvmALcxGQLB+kez3qmYCa7isf/uL99Ag6tFEfy9TlnJ/8jvh7PvU70cRO5Sq/EdzBhGUjh0xXOQS
	FgTkGxG1qIsODsC2wXyVkqDUMCzTUitLBMWVwYRE+y8rSe0VK3BhtplD5dmgQex6HxiVY4lzUK4d9
	7649wLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockzu-003w0v-Nj; Mon, 26 Sep 2022 10:05:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockzH-003vjN-6o; Mon, 26 Sep 2022 10:05:21 +0000
X-UUID: 5ba91b4d8386450e888c12369f6855ae-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=anfZqjEFlJbLUsfw70pSnG0fvI6PLCj7qrCUEotguvQ=;
	b=eIW6XjVaQuI3bGdbIIqcYUgt+hUCBqmLUNEQ47rj/aIkFpCa4W9fMhtRZWvo9cBlhBaBF/Xrw1I6SsgYWRbR5aOkEeob35QxaqrjQfpqX7OJyEf5/c0iaac7J/1x6u+AlGzbhnr9PycqcjVS37Z5yQRJEg3PK0s5K0xcHzmVz6I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5ad8b954-ee23-43ea-b317-0c6eaadcf9f9,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:af1b3ee4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5ba91b4d8386450e888c12369f6855ae-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1779356294; Mon, 26 Sep 2022 03:05:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 17:14:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 17:14:37 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>, kyrie wu
	<kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, irui wang
	<irui.wang@mediatek.com>, Rob Herring <robh@kernel.org>
Subject: [V15,01/15] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
Date: Mon, 26 Sep 2022 17:14:19 +0800
Message-ID: <20220926091433.18633-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926091433.18633-1-irui.wang@mediatek.com>
References: <20220926091433.18633-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_030519_441775_E4D4AF54 
X-CRM114-Status: GOOD (  14.83  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add mediatek,mt8195-jpgenc compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../media/mediatek,mt8195-jpegenc.yaml        | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
new file mode 100644
index 000000000000..b45c2afae10e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder Device Tree Bindings
+
+maintainers:
+  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description:
+  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    const: mediatek,mt8195-jpgenc
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 4
+    description:
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+# Required child node:
+patternProperties:
+  "^jpgenc@[0-9a-f]+$":
+    type: object
+    description:
+      The jpeg encoder hardware device node which should be added as subnodes to
+      the main jpeg node.
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgenc-hw
+
+      reg:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description:
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: jpgenc
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - iommus
+      - interrupts
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - power-domains
+  - iommus
+  - dma-ranges
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8195-memory-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        jpgenc-master {
+                compatible = "mediatek,mt8195-jpgenc";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+                iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+                <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+                <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+                <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+                dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                jpgenc@1a030000 {
+                        compatible = "mediatek,mt8195-jpgenc-hw";
+                        reg = <0 0x1a030000 0 0x10000>;
+                        iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
+                        <&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
+                        <&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
+                        <&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
+                        interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+                        clocks = <&vencsys CLK_VENC_JPGENC>;
+                        clock-names = "jpgenc";
+                        power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+                };
+
+                jpgenc@1b030000 {
+                        compatible = "mediatek,mt8195-jpgenc-hw";
+                        reg = <0 0x1b030000 0 0x10000>;
+                        iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+                        <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+                        <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+                        <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+                        interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
+                        clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGENC>;
+                        clock-names = "jpgenc";
+                        power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+                };
+        };
+    };
-- 
2.18.0


