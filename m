Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B784BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbfU+X4+K1wEz4abkh5C2LZLNvZBEDKL88t5hqcTL/Y=; b=YNk+WvjQODUIAQ
	w6Br+4L7VZyU+Uv+TCjOjrdWnFrEBsmJ3MrQJjWDzziAoEhm0uwqEOCxQ5WFihE5KK1Z0Ffvd9zuE
	DOb5me55RaeHeWemcL3MuhA+kKtlWjVyMKSo3jPw1T+vgu1K5kVGukFYyRtA/AzRUuk0pLSFeSdmF
	Zpv3rXgrLu0CX9qBvgKUjuK9Tx3bagPe0hUPTajf2EGyXg32hM+Bn07W4CT7r+77RqZ0eZTTOyiDc
	3/cBRqNvFV/oTEnil9OnIFzJCihD4FkPlUlsWLxO0skOygP9sTuJbfzIVhLFqb8yNLO6fTLGuvJP5
	c2ZLsyn7OtI25zifBYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV765-000c84-Nn; Fri, 18 Mar 2022 07:32:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV75C-000bki-OW; Fri, 18 Mar 2022 07:31:36 +0000
X-UUID: 888bc8615b8f4e9fa1e4c36eee44e823-20220318
X-UUID: 888bc8615b8f4e9fa1e4c36eee44e823-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 81741942; Fri, 18 Mar 2022 00:31:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 00:27:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 15:27:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 15:27:51 +0800
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
Subject: [V2, 1/7] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgdec compatible
Date: Fri, 18 Mar 2022 15:27:40 +0800
Message-ID: <1647588466-761-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1647588466-761-1-git-send-email-kyrie.wu@mediatek.com>
References: <1647588466-761-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_003134_816223_0A31423D 
X-CRM114-Status: GOOD (  14.70  )
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

Add mediatek,mt8195-jpgdec compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
new file mode 100644
index 000000000000..0f086e3e990e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder Device Tree Bindings
+
+maintainers:
+  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description: |-
+  MediaTek JPEG Decoder is the JPEG decode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-jpgdec
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 6
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
+  "^jpgdec@[0-9a-f]+$":
+    type: object
+    description: |
+      The jpeg decoder hardware device node which should be added as subnodes to
+      the main jpeg node.
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgdec
+
+      reg:
+        maxItems: 1
+
+      mediatek,hw-id:
+        minItems: 0
+        maxItems: 2
+        description: |
+          Current jpegdec hw id.
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
+          - const: jpgdec
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
+      - power-domains
+
+    additionalProperties: false
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
+    jpgdec_master {
+            compatible = "mediatek,mt8195-jpgdec";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+            iommus = <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA0>,
+                 <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA0>,
+                 <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA1>,
+                 <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
+                 <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                 <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            jpgdec@1a040000 {
+                compatible = "mediatek,mt8195-jpgdec";
+                reg = <0x1a040000 0x10000>;/* JPGDEC_C0 */
+                mediatek,hw-id = <0>;
+                iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys CLK_VENC_JPGDEC>;
+                clock-names = "jpgdec";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+            };
+
+            jpgdec@1a050000 {
+                compatible = "mediatek,mt8195-jpgdec";
+                reg = <0x1a050000 0x10000>;/* JPGDEC_C1 */
+                mediatek,hw-id = <1>;
+                iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                    <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys CLK_VENC_JPGDEC_C1>;
+                clock-names = "jpgdec";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+            };
+
+            jpgdec@1b040000 {
+                compatible = "mediatek,mt8195-jpgdec";
+                reg = <0x1b040000 0x10000>;/* JPGDEC_C2 */
+                mediatek,hw-id = <2>;
+                iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
+                    <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
+                    <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
+                    <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA1>,
+                    <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET1>,
+                    <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
+                interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGDEC>;
+                clock-names = "jpgdec";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC2>;
+            };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
