Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C714CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1Vynfqz9XoHluFr9EGIDBT7SKtjqrM00aEoBJzvVmI=; b=b3C7VrbTThfgvz
	6vt0tTEtXu5zmItrbNZEBaumso1JzXqBsU7nvBthPE81wsq0nRLH34IcrN5MeOqHQ27a9Xv6RpDKK
	qQWDnrX82zU+LStClWQVqeG9Uz7H09md/TB60rlI1nHUsEeud2qAdLhoE5A2bZVh2yRmjICnUOaX8
	aljqB2ky8+QXU/l4Bs1XLr9mdlpuvvmSzIBoEKD81sTa7118cydwoHeHd5NEUTL4Xxv52z3fxnBn5
	MLK0nOA/+RnE0xGajr4I/XytsMDkk9eve6eFtHrqlPb/kR2oIEL5DXpXsEalAO7/ZpqIgWHC5YKc7
	AuortStIGE795xSa6ZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUlZM-00FKky-AS; Thu, 17 Mar 2022 08:33:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUlYx-00FKd0-JE; Thu, 17 Mar 2022 08:32:53 +0000
X-UUID: dd42e74ef56143fba8ce51fabb591075-20220317
X-UUID: dd42e74ef56143fba8ce51fabb591075-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1261190006; Thu, 17 Mar 2022 01:32:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 01:23:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 17 Mar 2022 16:23:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 16:23:04 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot
 <acourbot@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,
 03/10] dt-bindings: media: mtk-vcodec: Adds encoder cores dt-bindings
 for mt8195
Date: Thu, 17 Mar 2022 16:22:23 +0800
Message-ID: <20220317082230.23622-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317082230.23622-1-irui.wang@mediatek.com>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_013251_657633_6A0C8A9F 
X-CRM114-Status: GOOD (  16.18  )
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

Adds encoder cores dt-bindings for mt8195.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/mediatek,vcodec-encoder-core.yaml   | 181 ++++++++++++++++++
 .../media/mediatek,vcodec-encoder.yaml        |   1 -
 2 files changed, 181 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
new file mode 100644
index 000000000000..fcfb48900c76
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
@@ -0,0 +1,181 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/mediatek,vcodec-encoder-core.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek Video Encoder Accelerator With Multi Core
+
+maintainers:
+  - Irui Wang <irui.wang@mediatek.com>
+
+description: |
+  Mediatek Video Encode is the video encode hardware present in Mediatek
+  SoCs which supports high resolution encoding functionalities. Required
+  parent and child device node.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8195-vcodec-enc
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The node of system control processor (SCP), using
+      the remoteproc & rpmsg framework.
+
+  mediatek,venc-multi-core:
+    type: boolean
+    description: |
+      Indicates whether the encoder has multiple cores or not.
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
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
+  "^venc-core@[0-9a-f]+$":
+    type: object
+    description: |
+      The video encoder core device node which should be added as subnodes to
+      the main venc node.
+
+    properties:
+      compatible:
+        items:
+         - const: mediatek,mtk-venc-core
+
+      reg:
+        maxItems: 1
+
+      mediatek,core-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Current encoder core id.
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
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - mediatek,core-id
+      - iommus
+      - interrupts
+      - clocks
+      - clock-names
+      - assigned-clocks
+      - assigned-clock-parents
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,scp
+  - iommus
+  - dma-ranges
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
+        venc {
+            compatible = "mediatek,mt8195-vcodec-enc";
+            mediatek,scp = <&scp>;
+            mediatek,venc-multi-core;
+            iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+
+            venc-core@1a020000 {
+                compatible = "mediatek,mtk-venc-core";
+                reg = <0 0x1a020000 0 0x10000>;
+                mediatek,core-id = <0>;
+                iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_REC>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
+                         <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
+                interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys CLK_VENC_VENC>;
+                clock-names = "clk_venc";
+                assigned-clocks = <&topckgen CLK_TOP_VENC>;
+                assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+                power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+            };
+
+            venc-core@1b020000 {
+                compatible = "mediatek,mtk-venc-core";
+                reg = <0 0x1b020000 0 0x10000>;
+                mediatek,core-id = <1>;
+                iommus = <&iommu_vpp M4U_PORT_L20_VENC_RCPU>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_REC>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_BSDMA>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_SV_COMV>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_RD_COMV>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_CUR_LUMA>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_CUR_CHROMA>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_REF_LUMA>,
+                         <&iommu_vpp M4U_PORT_L20_VENC_REF_CHROMA>;
+                interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys_core1 CLK_VENC_CORE1_VENC>;
+                clock-names = "clk_venc_core1";
+                assigned-clocks = <&topckgen CLK_TOP_VENC>;
+                assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+                power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index e7b65a91c92c..0530a694bcbe 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -21,7 +21,6 @@ properties:
       - mediatek,mt8173-vcodec-enc
       - mediatek,mt8183-vcodec-enc
       - mediatek,mt8192-vcodec-enc
-      - mediatek,mt8195-vcodec-enc
 
   reg:
     maxItems: 1
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
