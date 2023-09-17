Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49769CD37B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAozQf5veG9fcNRrq+yazpmSWFWK3c8BmsCcPtHQ9n8=; b=KwvkmUqPTWLHvPO1z3I3n4HHJg
	lt2JNMJez+Ul5IbRLlhzoBGYPvisBu/kz6H+9eeXXJKMVUegHC5pPbchFyT1eGAWB8wYsvg3y8Mwj
	kJ2Pt2LraMnKLqzX5t7OF1yF1XJ9Xt/bs7xp0PquiYXO2PvmG9T+Igoxk5TtolG5/YJ8VvlgmJpCi
	l6WNQU1vtm63F0LhZ2hpsDwiufoKhr6XFcL7YeI1F66rAe4Js/2GKW0lG4N0v//lYZriCym1/3nTF
	OoXRR5dAllSqKCQ9c1IHKTpN1sg+Q5PFvpeiKFzm6yUdb+o3qbonxSXoYAakii+QQEBBiZpyZ1Y+S
	ml5NoGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhrCC-00Df15-0l;
	Sun, 17 Sep 2023 12:48:16 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhrC8-00DezU-10;
	Sun, 17 Sep 2023 12:48:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CAA4C0002;
	Sun, 17 Sep 2023 12:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694954889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAozQf5veG9fcNRrq+yazpmSWFWK3c8BmsCcPtHQ9n8=;
	b=aqoyFajfqCCla3hh1RxRwP5PcE9fy9aHZJE+JpUZ7sksitMubsP93Qeh602LvI1QYeN2DZ
	xekhyIyxJHykKbeT+Udfu6Jl+T4UUgdWc+M5fNYVrcfdEkS52xDCPy3TRAXBu77GZTcoJC
	Va7kFC6lu1wTP7wIZpiM+0z1qk+7nEohD+9moSLnv2/MAsM18sVwdwmjc6oTTCEit8HPdJ
	Kb6CrP8kLzUvG3+H8cZe3F0ufLEbxcNDMsIrCPIPl122Y9ghUP45FmFV3KWNU3GrBmM3YQ
	rrfo45y4X4yaXHTdbDo+24Bd7rdUCTvW4b9oPjmQfAueZrmxIqcW6x+oaK9uMA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 2/2] dt-bindings: net: mediatek,net: move mediatek,mt7621-eth to another schema
Date: Sun, 17 Sep 2023 15:47:23 +0300
Message-Id: <20230917124723.143202-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230917124723.143202-1-arinc.unal@arinc9.com>
References: <20230917124723.143202-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_054812_620969_EA2BA9BE 
X-CRM114-Status: GOOD (  16.43  )
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

The bindings for mediatek,mt7621-eth contradict with some of the rules on
the top level schema of mediatek,net.yaml:
- resets must be two items. resets with "maxItems: 3" at the top level
  implies "minItems: 3" and cannot be overriden under a subschema.
- reset-names items must be "fe" and "eth". reset-names items defined on
  the top level schema cannot be overridden under a subschema.

Therefore, move mediatek,mt7621-eth to another schema. Fix the order of
clock-names items. Do not define the properties that don't apply to this
hardware. Require more properties. Add an example.

Fixes: 1cbf487d7d3a ("dt-bindings: net: mediatek,net: add missing mediatek,mt7621-eth")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/mediatek,mt7621-eth.yaml     | 143 ++++++++++++++++++
 .../devicetree/bindings/net/mediatek,net.yaml |  27 ----
 2 files changed, 143 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml

diff --git a/Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml b/Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml
new file mode 100644
index 000000000000..4f39d7124693
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/mediatek,mt7621-eth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7621 Frame Engine Ethernet controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+
+description:
+  The frame engine ethernet controller can be found on MediaTek MT7621 SoC. This
+  SoC has got dual GMAC ports.
+
+properties:
+  compatible:
+    const: mediatek,mt7621-eth
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: fe
+      - const: ethif
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: fe
+      - const: eth
+
+  mediatek,ethsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon node that handles the port setup.
+
+  mdio-bus:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^mac@[0-1]$":
+    type: object
+    unevaluatedProperties: false
+    allOf:
+      - $ref: ethernet-controller.yaml#
+    description:
+      Ethernet MAC node
+    properties:
+      compatible:
+        const: mediatek,eth-mac
+
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - mediatek,ethsys
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/clock/mt7621-clk.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ethernet: ethernet@1e100000 {
+            compatible = "mediatek,mt7621-eth";
+            reg = <0x1e100000 0x10000>;
+
+            clocks = <&sysc MT7621_CLK_FE>, <&sysc MT7621_CLK_ETH>;
+            clock-names = "fe", "ethif";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            resets = <&sysc MT7621_RST_FE>, <&sysc MT7621_RST_ETH>;
+            reset-names = "fe", "eth";
+
+            interrupt-parent = <&gic>;
+            interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
+
+            mediatek,ethsys = <&sysc>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>, <&rgmii2_pins>;
+
+            gmac0: mac@0 {
+                compatible = "mediatek,eth-mac";
+                reg = <0>;
+                phy-mode = "rgmii";
+
+                fixed-link {
+                    speed = <1000>;
+                    full-duplex;
+                    pause;
+                };
+            };
+
+            gmac1: mac@1 {
+                compatible = "mediatek,eth-mac";
+                reg = <1>;
+                phy-mode = "rgmii";
+
+                fixed-link {
+                    speed = <1000>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 0b2cb1897310..dc6f2424002e 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -19,7 +19,6 @@ properties:
     enum:
       - mediatek,mt2701-eth
       - mediatek,mt7623-eth
-      - mediatek,mt7621-eth
       - mediatek,mt7622-eth
       - mediatek,mt7629-eth
       - mediatek,mt7981-eth
@@ -140,32 +139,6 @@ allOf:
 
         mediatek,wed-pcie: false
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - mediatek,mt7621-eth
-    then:
-      properties:
-        interrupts:
-          maxItems: 1
-
-        clocks:
-          minItems: 2
-          maxItems: 2
-
-        clock-names:
-          items:
-            - const: ethif
-            - const: fe
-
-        mediatek,infracfg: false
-
-        mediatek,wed: false
-
-        mediatek,wed-pcie: false
-
   - if:
       properties:
         compatible:
-- 
2.39.2


