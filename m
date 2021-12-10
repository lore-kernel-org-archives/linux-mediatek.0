Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF56C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4A0MtYtrQmEw3oRKLqf26lzNJ7O3q0/4T9Y9ypPQ7zQ=; b=Ux/0gg37J8H0n9
	Z558576iQC9N2/A2Lo8sM0Y3/2OHppjhWylubWU4DT5Sd6cpo3LJw4szzP+UphL7J81lOiSs7/uBV
	QHE+ojBx/1Xilrn8TJ4pvamQv/G5p7auYNrtmE2Sj2+1wrqHZIodTaBcQNwYu5JDHhGgTVZCDG7s+
	0vxj+yTSoe+MaZTyAt1TBA3cxQ63yeebBM75mQCJVb1pdm3b5fzSKfOpyc0g5poEYJIXv/vh5jvS5
	GVaQotx4Xx2X2HgRkuvbbMN7qoPYqtAJ/cBXqf88j2OiXyS6qcuXlQdB5AAOHdOC/DtxL0CcVzAWJ
	qHoxManvGJq2hf0ryUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjIL-002hcW-Tj; Fri, 10 Dec 2021 17:02:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjHH-002hEC-RC; Fri, 10 Dec 2021 17:01:50 +0000
X-UUID: e6b8ef95d10b42cc826211387ca11f69-20211210
X-UUID: e6b8ef95d10b42cc826211387ca11f69-20211210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1357007694; Fri, 10 Dec 2021 10:01:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:01:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:01:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:01:40 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "Yong
 Wu" <yong.wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 4/8] dt-bindings: soc: mediatek: apusys: Add new document
 for APU power domain
Date: Sat, 11 Dec 2021 01:01:09 +0800
Message-ID: <20211210170113.30063-5-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210170113.30063-1-flora.fu@mediatek.com>
References: <20211210170113.30063-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_090147_957889_D957CD8F 
X-CRM114-Status: GOOD (  13.94  )
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

Document the bindings for APU power domain on MediaTek SoC.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
 .../soc/mediatek/mediatek,apu-pm.yaml         | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
new file mode 100644
index 000000000000..e1b7d4030dc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2021 (C) MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,apu-pm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APU Power Domains
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+description: |
+  MediaTek AI Process Unit (APU) include support for power domains which can be
+  powered up/down by software.
+  APU subsys belonging to a power domain should contain a 'power-domains'
+  property that is a phandle for apuspm node representing the domain.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-apu-pm
+      - const: syscon
+
+  reg:
+    description: Address range of the APU power domain controller.
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#power-domain-cells':
+    const: 1
+
+  vsram-supply:
+    description: apu sram regulator supply.
+
+  mediatek,scpsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys register range.
+
+  mediatek,apu-conn:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys apu conn register range.
+
+  mediatek,apu-conn1:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys apu conn1 register range.
+
+  mediatek,apu-vcore:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the device containing the scpsys apu vcore register range.
+
+patternProperties:
+  "^power-domain@[0-9a-f]+$":
+    type: object
+    description: |
+      Represents the power domains within the power controller node as
+      documented in Documentation/devicetree/bindings/power/power-domain.yaml.
+
+    properties:
+      reg:
+        description: Power domain index.
+        maxItems: 1
+
+      '#power-domain-cells':
+        description: |
+          Must be 0 for nodes representing a single PM domain and 1 for nodes
+          providing multiple PM.
+
+      clocks:
+        description: |
+          List of phandles of clocks list. Specify by order according to
+          power-up sequence.
+
+      clock-names:
+        description: |
+          List of names of clocks. Specify by order according to power-up
+          sequence.
+
+      assigned-clocks:
+        maxItems: 2
+
+      assigned-clock-parents:
+        maxItems: 2
+
+      domain-supply:
+        description: domain regulator supply.
+
+    required:
+      - reg
+      - '#power-domain-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#power-domain-cells'
+  - vsram-supply
+  - mediatek,scpsys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    apuspm: power-domain@190f0000 {
+        compatible = "mediatek,mt8192-apu-pm", "syscon";
+        reg = <0x190f0000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #power-domain-cells = <1>;
+        vsram-supply = <&mt6359_vsram_md_ldo_reg>;
+        mediatek,scpsys = <&scpsys>;
+        mediatek,apu-conn = <&apu_conn>;
+        mediatek,apu-vcore = <&apu_vcore>;
+
+        apu_top: power-domain@0 {
+            reg = <0>;
+            #power-domain-cells = <0>;
+            clocks = <&topckgen CLK_TOP_DSP_SEL>,
+                     <&topckgen CLK_TOP_IPU_IF_SEL>,
+                     <&clk26m>,
+                     <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
+            clock-names = "clk_top_conn",
+                          "clk_top_ipu_if",
+                          "clk_off",
+                          "clk_on_default";
+            assigned-clocks = <&topckgen CLK_TOP_DSP_SEL>,
+                              <&topckgen CLK_TOP_IPU_IF_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+                                     <&topckgen CLK_TOP_UNIVPLL_D6_D2>;
+            domain-supply = <&mt6359_vproc1_buck_reg>;
+        };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
