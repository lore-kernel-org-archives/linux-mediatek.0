Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF638C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 00:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/SdJjyw3sNV9dP/YgPnVnMAi88D289b4QaIwF2FCtE=; b=RxiRWWbPA1jNp9krbwP5uFN5i2
	PVptn2vPSQjoETyYpCyxdYOqLEH5ElPOwpfNVkDB4SbGCGMj4KWqzD7lyjuliNYxTkcvvUiitEQ3L
	WK5Mqn1Mrm0OHsvtzjfJ2MhzJwy9lBaaQ5lTrwgoQ0aoYP7hRX0qKmYFKKCqQvyg6OMYSZleWaNPZ
	+hTgjyDvQPCJ+Q5NO7LhCNhla+uc6PpUJoz0RCw1CZ+fmP1MBlV1B12Hdu93sEAMsFVy4JwEEPeHN
	W05CSnNeyEX+PvPbUFK/wwa86Z5W8xoMideUdsG8cLjEHGtiuWEqvaAhvcA7P9jRoAWh535gMfUJT
	mHYqzupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgE7-008kNS-2h;
	Wed, 06 Dec 2023 00:57:23 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgE4-008kM3-24;
	Wed, 06 Dec 2023 00:57:22 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rAgDq-0002T7-2H;
	Wed, 06 Dec 2023 00:57:07 +0000
Date: Wed, 6 Dec 2023 00:57:04 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Garmin.Chang" <Garmin.Chang@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: clock: mediatek: add clock controllers
 of MT7988
Message-ID: <def05aac79ddff872d3e56698b736cb445f14116.1701823757.git.daniel@makrotopia.org>
References: <23bc89d407e7797e97b703fa939b43bfe79296ce.1701823757.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23bc89d407e7797e97b703fa939b43bfe79296ce.1701823757.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_165720_826213_02E585FC 
X-CRM114-Status: GOOD (  16.48  )
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

Add various clock controllers found in the MT7988 SoC to existing
bindings (if applicable) and add files for the new ethwarp, mcusys
and xfi-pll clock controllers not previously present in any SoC.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3:
 * move clock bindings to clock folder
 * drop ti,syscon-reset from bindings and example
 * merge mcusys with topckgen bindings

v2:
 * dropped unused labels
 * add 'type: object' declaration for reset-controller found in new
   ethwarp controller and represented as ti,syscon-reset
 * rebase on top of
   "dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema"

 .../arm/mediatek/mediatek,infracfg.yaml       |  1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |  1 +
 .../bindings/clock/mediatek,ethsys.yaml       |  1 +
 .../clock/mediatek,mt7988-ethwarp.yaml        | 49 +++++++++++++++++++
 .../clock/mediatek,mt7988-xfi-pll.yaml        | 48 ++++++++++++++++++
 .../bindings/clock/mediatek,topckgen.yaml     |  2 +
 .../bindings/net/pcs/mediatek,sgmiisys.yaml   | 13 +++--
 7 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
index ea98043c6ba3d..230b5188a88db 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt7629-infracfg
               - mediatek,mt7981-infracfg
               - mediatek,mt7986-infracfg
+              - mediatek,mt7988-infracfg
               - mediatek,mt8135-infracfg
               - mediatek,mt8167-infracfg
               - mediatek,mt8173-infracfg
diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index 372c1d744bc27..685535846cbb7 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -22,6 +22,7 @@ properties:
           - mediatek,mt7622-apmixedsys
           - mediatek,mt7981-apmixedsys
           - mediatek,mt7986-apmixedsys
+          - mediatek,mt7988-apmixedsys
           - mediatek,mt8135-apmixedsys
           - mediatek,mt8173-apmixedsys
           - mediatek,mt8516-apmixedsys
diff --git a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
index 94d42c8647777..f9cddacc2eae1 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
@@ -22,6 +22,7 @@ properties:
               - mediatek,mt7629-ethsys
               - mediatek,mt7981-ethsys
               - mediatek,mt7986-ethsys
+              - mediatek,mt7988-ethsys
           - const: syscon
       - items:
           - const: mediatek,mt7623-ethsys
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
new file mode 100644
index 0000000000000..9b919a155eb13
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7988-ethwarp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7988 ethwarp Controller
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  The Mediatek MT7988 ethwarp controller provides clocks and resets for the
+  Ethernet related subsystems found the MT7988 SoC.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt7988-ethwarp
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/ti-syscon.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@15031000 {
+            compatible = "mediatek,mt7988-ethwarp", "syscon", "simple-mfd";
+            reg = <0 0x15031000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
new file mode 100644
index 0000000000000..fe5e3a70299fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7988-xfi-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7988 XFI PLL Clock Controller
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  The MediaTek XFI PLL controller provides the 156.25MHz clock for the
+  Ethernet SerDes PHY from the 40MHz top_xtal clock.
+
+properties:
+  compatible:
+    const: mediatek,mt7988-xfi-pll
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        clock-controller@11f40000 {
+            compatible = "mediatek,mt7988-xfi-pll";
+            reg = <0 0x11f40000 0 0x1000>;
+            resets = <&watchdog 16>;
+            #clock-cells = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
index 6d087ded7437a..bdf3b55bd56fd 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -37,6 +37,8 @@ properties:
               - mediatek,mt7629-topckgen
               - mediatek,mt7981-topckgen
               - mediatek,mt7986-topckgen
+              - mediatek,mt7988-mcusys
+              - mediatek,mt7988-topckgen
               - mediatek,mt8167-topckgen
               - mediatek,mt8183-topckgen
           - const: syscon
diff --git a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
index 66a95191bd776..68632cda334bd 100644
--- a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
@@ -15,15 +15,22 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
+    oneOf:
+      - items:
+        - enum:
           - mediatek,mt7622-sgmiisys
           - mediatek,mt7629-sgmiisys
           - mediatek,mt7981-sgmiisys_0
           - mediatek,mt7981-sgmiisys_1
           - mediatek,mt7986-sgmiisys_0
           - mediatek,mt7986-sgmiisys_1
-      - const: syscon
+        - const: syscon
+      - items:
+        - enum:
+          - mediatek,mt7988-sgmiisys_0
+          - mediatek,mt7988-sgmiisys_1
+        - const: syscon
+        - const: simple-mfd
 
   reg:
     maxItems: 1
-- 
2.43.0

