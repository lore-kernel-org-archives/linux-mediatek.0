Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF07C2D0F6
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:17:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81412075A
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0YgBFeE7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L6KYApo9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81412075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oaBx7MEiOs1EtCtHQECfIKK/JE0uaBfYhkNKnmoM3jE=; b=0YgBFeE7yFDKqidMFYurMqQ+a4
	gRMo7ARbeQyTQQHB9QHLHdjSMlG44+mGxLOZCG/+9U9FLHSoRAwBOtTYgmTEv+SpKrHj6GxbXlTxT
	s8cuCI7lZYhk63gU0wK7eIQ2KUCmr+EHbyceZMClbY3zvS5AUt30z8tkanSvMN1hr1V8l9SQUaZVg
	oz55GM6JodDHbm7Koq9Gdt2W1PvhD0Tu6pOaG4hMfW0yG/VPD7AMGqLCJe+yY8Varb2M7xcVGqp41
	bCbmbCwxKaZ75v9au+0ubxEp01ZIyJBJxzg3owh0MlctpoCe40M5SzMQTrWC1gZs/nZj9PgSoFNZr
	rfiaeBAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFG5h-0007C6-OR; Mon, 07 Sep 2020 12:17:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFG5J-0006xo-7U; Mon, 07 Sep 2020 12:17:23 +0000
X-UUID: 7d8ac6d11ace4de0b3a4bf228d499bf4-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jhDPNB9+vtJ6LoKzs9IKtElOMJeIUaNjylq+XlEhZ+Y=; 
 b=L6KYApo9BQJ2A7h1Cdl+KpotloHx26oZBgbAWlA5qms7YftNgobmqWENp8Gj0NEZrIxVoSKlOSy5VmZX0JMwXmv+QE0XQnLqgqCJyYQEJbQ67/2DkEAli2EfJkkaym62aAYKeFzBwPgru/+5googyPWK3XbGF/oqurBenrU7nK0=;
X-UUID: 7d8ac6d11ace4de0b3a4bf228d499bf4-20200907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1675374717; Mon, 07 Sep 2020 04:11:06 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 05:04:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 20:04:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Sep 2020 20:04:23 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: Add YAML schemas for Gen3 PCIe controller
Date: Mon, 7 Sep 2020 20:01:16 +0800
Message-ID: <20200907120118.11667-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_081721_533434_1AAB029F 
X-CRM114-Status: GOOD (  15.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Sj
 Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add YAML schemas documentation for Gen3 PCIe controller on
MediaTek SoCs.

Change-Id: I2a022c7291c7e7e161b3a7e8bce28781e0f09b90
Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
new file mode 100644
index 000000000000..108d29259c05
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -0,0 +1,158 @@
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
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,gen3-pcie
+      - const: mediatek,mt8192-pcie
+
+  device_type:
+    const: pci
+
+  "#address-cells":
+    const: 3
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    items:
+      - description: Controller control and status registers.
+
+  reg-names:
+    items:
+      - const: pcie-mac
+
+  interrupts:
+    maxItems: 1
+
+  bus-range:
+    description: Range of bus numbers associated with this controller.
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
+    anyOf:
+      - const: mac-rst
+      - const: phy-rst
+
+  clocks:
+    maxItems: 5
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
+  phy-names:
+    const: pcie-phy
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-map-mask:
+    description: Standard PCI IRQ mapping properties.
+
+  interrupt-map:
+    description: Standard PCI IRQ mapping properties.
+
+  legacy-interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+    properties:
+      "#address-cells":
+        const: 0
+      "#interrupt-cells":
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - "#address-cells"
+      - "#interrupt-cells"
+      - interrupt-controller
+
+required:
+  - compatible
+  - device_type
+  - "#address-cells"
+  - "#size-cells"
+  - reg
+  - reg-names
+  - bus-range
+  - interrupts
+  - ranges
+  - clocks
+  - '#interrupt-cells'
+  - interrupt-map
+  - interrupt-map-mask
+  - legacy-interrupt-controller
+
+additionalProperties: false
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
+            ranges = <0x82000000 0x00 0x12000000 0x00 0x12000000 0x00 0x1000000>;
+            clocks = <&infracfg 40>,
+                     <&infracfg 43>,
+                     <&infracfg 97>,
+                     <&infracfg 99>,
+                     <&infracfg 111>;
+            assigned-clocks = <&topckgen 50>;
+            assigned-clock-parents = <&topckgen 91>;
+
+            phys = <&pciephy>;
+            phy-names = "pcie-phy";
+            resets = <&infracfg_rst 0>;
+            reset-names = "phy-rst";
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &pcie_intc 0>,
+                            <0 0 0 2 &pcie_intc 1>,
+                            <0 0 0 3 &pcie_intc 2>,
+                            <0 0 0 4 &pcie_intc 3>;
+            pcie_intc: legacy-interrupt-controller {
+                      #address-cells = <0>;
+                      #interrupt-cells = <1>;
+                      interrupt-controller;
+            };
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
