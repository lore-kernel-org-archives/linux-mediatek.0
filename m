Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCB7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 08:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+20+IVdyL8RyjftFOJx8ldEZVIVaJc6mKfQ6i5tjMk=; b=CrVxwyzG/lJcL4qc4FTS2oFqA7
	db3r2OvBbjvihFRYUr4opTgR/V8jybkymXBkTayQKdL9LPIs7lHAkYu+Ys+W9JQwcQ7y5UvW7bzWd
	w0TZ3Rr53osys0ToltEev58Rj/4TZKed7NpqkBxJhvszZcnAq2h594/DFeCnXDpJO4UUoTOzyQO4x
	yNwFE2W3YjamYEBoOYhxdmiRZMdXJYBhmZ8B1rjEqS5oeQYFFlvLjkzRTNH03fL21nbObYGYmM+5O
	oHxzz+ixBfHjdRYToq1ys22cI7y8zPeqEL34SmDCtyo4RQ4lTJwigSAdpO6cRPqrFQJ5paZaXcFzl
	GRd/CuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ejg-001Btx-1d; Fri, 24 Jun 2022 08:32:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ehx-001B8M-6M; Fri, 24 Jun 2022 08:30:32 +0000
X-UUID: e5cd1ae5f1a14c28a59f3fad4d18ddbb-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:47d89be6-197b-4fc0-9fdb-10290ad5a7f9,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:20
X-CID-META: VersionHash:b14ad71,CLOUDID:da206aea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e5cd1ae5f1a14c28a59f3fad4d18ddbb-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 326588685; Fri, 24 Jun 2022 01:30:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 01:23:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 16:23:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jun 2022 16:23:37 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4, 1/8] dt-bindings: media: mediatek: vcodec: Adds encoder cores dt-bindings for mt8195
Date: Fri, 24 Jun 2022 16:23:28 +0800
Message-ID: <20220624082335.10165-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624082335.10165-1-irui.wang@mediatek.com>
References: <20220624082335.10165-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_013029_291086_B2A6C6E9 
X-CRM114-Status: GOOD (  21.10  )
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

mt8195 has two H264 encoder hardware, which are named core0 and core1.
The two encoder cores are independent, we can just enable one core to
do encoding or enable both of them to achieve higher performance. We
pick core0 as main device and core1 as its subdevice, it just a way to
to manage the two encoder hardware, because they are two equal encoder
hardware with the same function.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/mediatek,vcodec-encoder-core.yaml   | 225 ++++++++++++++++++
 .../media/mediatek,vcodec-encoder.yaml        |   1 -
 2 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
new file mode 100644
index 000000000000..afd7d645aa80
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
@@ -0,0 +1,225 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/mediatek,vcodec-encoder-core.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Video Encoder Accelerator With Multi Core
+
+maintainers:
+  - Irui Wang <irui.wang@mediatek.com>
+
+description: |
+  MediaTek Video Encoder is the video encoder hardware present in MediaTek
+  SoCs which supports high resolution encoding functionalities. To meet higher
+  encoder performance, there will be one or more encoder hardware inside SoC,
+  which named core0, core1, etc.. For example, mt8195 has two encoder hardware,
+  the two encoder cores block diagram, can check below.
+  --------------------------------------------------------------
+  Input frame  0     1     2     3     4     5     6
+               |     |     |     |     |     |     |
+               v     |     v     |     v     |     v
+           +-------+ | +-------+ | +-------+ | +-------+
+           | core0 | | | core0 | | | core0 | | | core0 |
+           +-------+ | +-------+ | +-------+ | +-------+
+               |     |     |     |     |     |     |
+               |     v     |     v     |     v     |
+               | +-------+ | +-------+ | +-------+ |
+               | | core1 | | | core1 | | | core1 | |
+               | +-------+ | +-------+ | +-------+ |
+               |     |     |     |     |     |     |
+               v     v     v     v     v     v     v    <parent>
+  --------------------------------------------------------------
+                            core || index               <child>
+                                 \/
+       +--------------------------------------------------+
+       |                     core0/core1                  |
+       |             enable/disable power/clk/irq         |
+       +--------------------------------------------------+
+  --------------------------------------------------------------
+  As above, there are two cores child devices, they are two encoder hardware
+  which can encode input frames in order. When start encoding, input frame 0
+  will be encoded by core0, and input frame 1 can be encoded by core1 even if
+  frame 0 has not been encoded done yet, after frame 0 encoded done, frame 2
+  will be encoded by core0, even input frames are encoded by core0 and odd
+  input frames are encoded by core1, these two encoder cores encode ench input
+  frames in this overlapping manner.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8195-vcodec-enc
+
+  reg:
+    maxItems: 1
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
+      Indicates whether the encoder has multiple cores or not. We use this
+      to probe additional encoder cores device.
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
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
+      the main venc node, it represents a encoder hardware.
+
+    properties:
+      compatible:
+        items:
+          - const: mediatek,mtk-venc-hw
+
+      reg:
+        maxItems: 1
+
+      mediatek,hw-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Current encoder core id. We use it to pick which one encoder core
+          will be used to encoding current input frame.
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
+      - mediatek,hw-id
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
+  - reg
+  - mediatek,scp
+  - iommus
+  - interrupts
+  - clocks
+  - clock-names
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
+        venc: venc@1a020000 {
+            compatible = "mediatek,mt8195-vcodec-enc";
+            reg = <0 0x1a020000 0 0x10000>;
+            mediatek,scp = <&scp>;
+            mediatek,venc-multi-core;
+            iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_REC>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
+                     <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
+            interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&vencsys CLK_VENC_VENC>;
+            clock-names = "clk_venc";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            venc-core@1b020000 {
+                compatible = "mediatek,mtk-venc-hw";
+                reg = <0 0x1b020000 0 0x10000>;
+                mediatek,hw-id = <1>;
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
index d36fcca04cbc..11682659c4c4 100644
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


