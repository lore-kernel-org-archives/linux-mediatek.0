Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2227C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 06:28:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA2360FE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 06:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAA2360FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9pzRJ4FZmrZskW9h9Xdwzhv+q9xaJcz+19bxTWbH2Bw=; b=g+mK2/utoLgF64AFsUI3G/cmn
	uqNqM6jhgRExBdJOXjsvY825MjRQA4w+eVRhH/HhhWvdAQzUxyZ4gfIcZV3nc3ZzjFLwtQm0yAR54
	CgvpJCNKHBh7bGn8pZZJBzXKnVTfMvXSl8fN38iOwJ9F+DwBD1d0Mt16X093Mi20bnBz7cEFQwest
	O6ukYNyhdDW6Q/OcMP+PkVnfbfU/kChWTw0zWEj8RSJaW0OP+J3JRzCpsV/jqKaBL1b3EGFeRRqDi
	X9/Zsg8X0mNy2ibK+3+Dvl/SScDM1doH5/k2s//n1d1yrYFbNjkqb++Ki3FP0q0xwBWTSns4j9R4G
	kvN2XsMsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYjri-00BLbu-PO; Tue, 20 Apr 2021 06:28:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjrX-00BLZE-ML; Tue, 20 Apr 2021 06:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Z6nt8ENh/H9M5EyRImVgc5keRKZ/uVR/ONGWllSfyKM=; b=YsvHX/9m/2Ig3KuX2ZULWwljh9
 Y0Kv1n+WXRA0z5EvY0GWBaibK9+mvQkBagTR6TacikgS6Qy1cMtbGpQqeGLXmX6glAIehMroNtzS/
 XT8x7sIczuNplm1HLsRtbC9Gwj7mVO5QTHg1IN0lcPWK8U76grINE9bukh+Wqx56VLjCNd/U3tGQc
 z0295Vy9nji0EzQPefKQwDxLGOc57UtaLiGOc7GIq2lcEOVArRfieqYAvXLH3y6S2OBkDWiQr9UTX
 JJW8T5OEjfdBAjBuvoJyONMt8J5hzcDEohZPKVHhCdjcRxlDd/G3Mhqgj7ab/uJtUjGsedQSCmzwj
 GBtXoshg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjrS-00BqZS-Rg; Tue, 20 Apr 2021 06:27:54 +0000
X-UUID: e8dc89cc56ed487b8943a136aaf6ea5a-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Z6nt8ENh/H9M5EyRImVgc5keRKZ/uVR/ONGWllSfyKM=; 
 b=A5GjALEgcnIfqfByEO/3hwe6JkebfAsQetWCpGpnrAiVDv7WLfGill3u8azhN34Q6lRtzotaKUnDaVK8Fc7exhtr0rgxc8iZoTUy/2QP2e8FwJe1wB3KFsOch3mDmkOS2FmbmFSk27z/4Khn6bXjGm+azVIpQPGEpRRz8tp0npo=;
X-UUID: e8dc89cc56ed487b8943a136aaf6ea5a-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2056277910; Mon, 19 Apr 2021 23:27:45 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 23:17:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 14:17:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Apr 2021 14:17:39 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ryder Lee <ryder.lee@mediatek.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v10 1/7] dt-bindings: PCI: mediatek-gen3: Add YAML schema
Date: Tue, 20 Apr 2021 14:17:17 +0800
Message-ID: <20210420061723.989-2-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210420061723.989-1-jianjun.wang@mediatek.com>
References: <20210420061723.989-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7EFF32C5B26547AC7174EEF9D9BCC61A9E7B0B854FB2BC2E676178368908215F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_232750_930998_BD5BDB92 
X-CRM114-Status: GOOD (  14.79  )
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

Add YAML schemas documentation for Gen3 PCIe controller on
MediaTek SoCs.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 181 ++++++++++++++++++
 1 file changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
new file mode 100644
index 000000000000..e7b1f9892da4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -0,0 +1,181 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gen3 PCIe controller on MediaTek SoCs
+
+maintainers:
+  - Jianjun Wang <jianjun.wang@mediatek.com>
+
+description: |+
+  PCIe Gen3 MAC controller for MediaTek SoCs, it supports Gen3 speed
+  and compatible with Gen2, Gen1 speed.
+
+  This PCIe controller supports up to 256 MSI vectors, the MSI hardware
+  block diagram is as follows:
+
+                    +-----+
+                    | GIC |
+                    +-----+
+                       ^
+                       |
+                   port->irq
+                       |
+               +-+-+-+-+-+-+-+-+
+               |0|1|2|3|4|5|6|7| (PCIe intc)
+               +-+-+-+-+-+-+-+-+
+                ^ ^           ^
+                | |    ...    |
+        +-------+ +------+    +-----------+
+        |                |                |
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+  |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+   ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
+   | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
+   | |      |  |    | |      |  |    | |      |  |
+
+    (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
+
+  With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
+  each set has its own address for MSI message, and supports 32 MSI vectors
+  to generate interrupt.
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt8192-pcie
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: pcie-mac
+
+  interrupts:
+    maxItems: 1
+
+  ranges:
+    minItems: 1
+    maxItems: 8
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: phy
+      - const: mac
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: pl_250m
+      - const: tl_26m
+      - const: tl_96m
+      - const: tl_32k
+      - const: peri_26m
+      - const: top_133m
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ranges
+  - clocks
+  - '#interrupt-cells'
+  - interrupt-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie: pcie@11230000 {
+            compatible = "mediatek,mt8192-pcie";
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            reg = <0x00 0x11230000 0x00 0x4000>;
+            reg-names = "pcie-mac";
+            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0x00 0x12000000 0x00
+                      0x12000000 0x00 0x1000000>;
+            clocks = <&infracfg 44>,
+                     <&infracfg 40>,
+                     <&infracfg 43>,
+                     <&infracfg 97>,
+                     <&infracfg 99>,
+                     <&infracfg 111>;
+            clock-names = "pl_250m", "tl_26m", "tl_96m",
+                          "tl_32k", "peri_26m", "top_133m";
+            assigned-clocks = <&topckgen 50>;
+            assigned-clock-parents = <&topckgen 91>;
+
+            phys = <&pciephy>;
+            phy-names = "pcie-phy";
+
+            resets = <&infracfg_rst 2>,
+                     <&infracfg_rst 3>;
+            reset-names = "phy", "mac";
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &pcie_intc 0>,
+                            <0 0 0 2 &pcie_intc 1>,
+                            <0 0 0 3 &pcie_intc 2>,
+                            <0 0 0 4 &pcie_intc 3>;
+            pcie_intc: interrupt-controller {
+                      #address-cells = <0>;
+                      #interrupt-cells = <1>;
+                      interrupt-controller;
+            };
+        };
+    };
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
