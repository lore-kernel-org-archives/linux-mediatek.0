Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B975DC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xyfGc0aEnzCD0axHpZLu+fHs6gA6mnDR9wtio8Vzobg=; b=M4rj9vea9LbEoRJ+t+V3IL05Kp
	2Ye8m21TNt68giw0mEvlwc5N9yRR/1mf9ktTOYTP32Uup6wTkET/OetR5IWRSJC0w4ZwX48/KW5ZY
	HnEvEZkyM8zNhqDCeVMHRXCOPFold87/lhExWay58ztKCjBlGnVMVcJlE9RfF31BWNVFt5xUpUMcH
	BJHu9XfHm9mzUPZrAMcgJC0wcGe0qgq5e+etU/KL7e4DFqL+6b+p/I9Xxq2gmMPt43I2+d2Tn7H98
	meMsU/E9wVcBt/i2o5UZgDLmt38D2Nwm30WKZEUSsTvASH7L9oxxNDVXOKFNbRf1GgqwChHteyUy0
	Sw9rEjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHvCN-00GDQK-Me; Tue, 17 Jan 2023 23:16:59 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHvCC-00GDL7-UD; Tue, 17 Jan 2023 23:16:51 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CE92A855BA;
	Wed, 18 Jan 2023 00:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1673997402;
	bh=xyfGc0aEnzCD0axHpZLu+fHs6gA6mnDR9wtio8Vzobg=;
	h=From:To:Cc:Subject:Date:From;
	b=VpeXJ4pJ27FLf1QPSPfur+AjQ2cZ6qu+0CUZ+EQyygh/Tw41GQ8NqDnb5k3dX0Gjv
	 3cSySJ/ytBCzqzbfVF95h8UU8ZZ8pJ1f1hLoH+lyf/MGLRzvmxK4HsRbeiIwkPt16q
	 Sl7hY6z8slTRIRztulcQ1Ckdcf6rpRGZe743VLamscuQZknXtQUqvPrKgE2X79VDBB
	 b1qAIgpwWUWDeV6bohDfoKbt5j8gef4WthG58lVtOgRrpLShSOkbQt3rDOZFFWFrQS
	 CryFNaKVdzCQDD17IHku64BiRpRfwzrluDvJwcuFwuoHLDmnjzVWtgI/VzFu0akZ63
	 2cyEwzkraRCHw==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx I2C PCIe clock generators
Date: Wed, 18 Jan 2023 00:16:25 +0100
Message-Id: <20230117231626.134588-1-marex@denx.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_151649_798064_07998155 
X-CRM114-Status: GOOD (  14.27  )
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

Add binding for Skyworks Si521xx PCIe clock generators. This binding
is designed to support Si52144/Si52146/Si52147 series I2C PCIe clock
generators, tested model is Si52144. It should be possible to add
Si5213x series as well.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
To: linux-clk@vger.kernel.org
---
V2: - Drop 'Binding for'
    - Drop reg: description
    - Drop ref25 from example
---
 .../bindings/clock/skyworks,si521xx.yaml      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml

diff --git a/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
new file mode 100644
index 0000000000000..fb30c5fb1ddd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/skyworks,si521xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Skyworks Si521xx I2C PCIe clock generators
+
+description: |
+  The Skyworks Si521xx are I2C PCIe clock generators providing
+  from 4 to 9 output clocks.
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+properties:
+  compatible:
+    enum:
+      - skyworks,si52144
+      - skyworks,si52146
+      - skyworks,si52147
+
+  reg:
+    const: 0x6b
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: XTal input clock
+
+  skyworks,out-amplitude-microvolt:
+    enum: [ 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000 ]
+    description: Output clock signal amplitude
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c@0 {
+        reg = <0x0 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-generator@6b {
+            compatible = "skyworks,si52144";
+            reg = <0x6b>;
+            #clock-cells = <1>;
+            clocks = <&ref25m>;
+        };
+    };
+
+...
-- 
2.39.0


