Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4913DC38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a7gPiG8FFgLvCnSNSaMmiJpOA8+f0Jg5tthAV6Kjb8g=; b=I2Pl+FPsQ3uzHEq7VNQu7kQDRh
	8NgSK+AlL7gpwFN5drLfhgq8d8Qu8MTOtrypBqIdHGDVtTLR6JznNzYkCreWc3OAtIz/rk//o76J/
	byU8svb3GM21wB0ZVWRROWOL/PCMc1/WI9en/Vbbuk+UQyc+OvgzkFOjaVX84+ufYjcyDzh1uUtBP
	vQxLw5O+FceSLt0b4pWL7FTL7AMc0x9yZM0wu/1AZ6b699gO+q8OFD1GvTqOOHiUYuMuztzNSQL7V
	0U8KJTNnXliYw8qMU8NCN4HLHtzze9pse2JdprkSWI2w+R2TQ1ZT1hYDQ3esdHYEIDz/krcfRiegG
	uvbpQs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDue-002Qko-W5; Wed, 18 Jan 2023 19:15:57 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDuR-002QiZ-GI; Wed, 18 Jan 2023 19:15:47 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 653CB83E5D;
	Wed, 18 Jan 2023 20:15:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1674069339;
	bh=a7gPiG8FFgLvCnSNSaMmiJpOA8+f0Jg5tthAV6Kjb8g=;
	h=From:To:Cc:Subject:Date:From;
	b=P66KFyM/lT9Ifd6F+NCBv5hLtZtQZYRzyvRfS/mJUu8I1U5Jv0NMbroak3jv865uP
	 wE2qTJkzWXTUKbcv+yB87UkHx/wqyx0Pvm9VdY5igf+BRnIh/VyG7qwlQMWalNRSlW
	 AICN5Xv2/aDS+OrRv4GInhkpPnUd6lziYnc9WGwTfKDgvguk9az3fU8Md7DEYhKgKr
	 OS/aTVdeHiwdiBnCrSUU0nWalQbi8lMj90WL4O6QKYQHEh1igt6Nkf35xYh6l0qL0+
	 +Dc6w41wHNPkLvtSlXLcZknuDqPXlTVkar1fdM24vsAlKioCYalqgt3sOb+SawFmZ1
	 aZBNV2c2J58CQ==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v3 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx I2C PCIe clock generators
Date: Wed, 18 Jan 2023 20:15:20 +0100
Message-Id: <20230118191521.15544-1-marex@denx.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_111543_943703_9E1D7525 
X-CRM114-Status: GOOD (  14.66  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
V3: - Replace i2c@0 with plain i2c
    - Drop reg property from the i2c node
    - Add RB from Krzysztof
---
 .../bindings/clock/skyworks,si521xx.yaml      | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml

diff --git a/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
new file mode 100644
index 0000000000000..9e35e0e51ce8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
@@ -0,0 +1,59 @@
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
+    i2c {
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


