Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53669C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8mzfz6GsHUDn77D06E9zn6Q5mJn8ZrdN0nYLLgtXrk=; b=QhZM/11+raK9p7
	iiJOkyXIZH5ry260edZT4E1E2dMV/iB8KQc2kuZHu8IM0PxhWiWFNEROscDfvpoF3ZASLJpYpGnzP
	NhOJOYjRRT9v/xT6S0t30jSPKruE0ISqq9ykbZQP4Kgem1p/UZ4VyulHBuDC8v+HSFtmeM9FFqmDs
	wxBJpnqozimjU7LGIEw80uHlKNO77AgWokMyc7YoR4LI+Of7A6ikJ8z7yt+pBEZCtlosuXTCQWS+y
	vTGG5ChUSupcQdlFGLHMwGOLXfFA/cC/5JzJmoAQC27RteblOXs9pOiTdf4IMrjC1m8YltTMw8wLL
	eu/6b9Fnp+qluZO9U9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAK1-0001C6-Fp; Thu, 24 Feb 2022 09:22:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNA8E-00HWN0-DA; Thu, 24 Feb 2022 09:09:53 +0000
X-UUID: a19afc29b2354190a6feac7823fa5191-20220224
X-UUID: a19afc29b2354190a6feac7823fa5191-20220224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 498211636; Thu, 24 Feb 2022 02:09:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 01:02:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 24 Feb 2022 17:02:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 17:02:20 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
 <kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [V1, 1/6] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
Date: Thu, 24 Feb 2022 17:02:08 +0800
Message-ID: <1645693333-524-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645693333-524-1-git-send-email-kyrie.wu@mediatek.com>
References: <1645693333-524-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_010950_479168_2884342C 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: kyrie wu <kyrie.wu@mediatek.com>

Add mediatek,mt8195-jpgenc compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegenc.yaml        | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
new file mode 100644
index 000000000000..efb0d843edb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -0,0 +1,174 @@
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
+description: |-
+  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-jpgenc
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 4
+    description: |
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+# Required child node:
+patternProperties:
+  "jpgenc@1a030000":
+    type: object
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgenc0
+
+      reg:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
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
+  "jpgenc@1b030000":
+    type: object
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgenc1
+
+      reg:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
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
+
+required:
+  - compatible
+  - power-domains
+  - iommus
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
+    jpgenc_master {
+            compatible = "mediatek,mt8195-jpgenc";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+            iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+            <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+            <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+            <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            jpgenc@1a030000 {
+                    compatible = "mediatek,mt8195-jpgenc0";
+                    reg = <0x1a030000 0x10000>;
+                    iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
+                    <&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
+                    <&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
+                    <&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
+                    interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys CLK_VENC_JPGENC>;
+                    clock-names = "jpgenc";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+            };
+
+            jpgenc@1b030000 {
+                    compatible = "mediatek,mt8195-jpgenc1";
+                    reg = <0x1b030000 0x10000>;
+                    iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+                    <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+                    <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+                    <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+                    interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGENC>;
+                    clock-names = "jpgenc";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+            };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
