Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36C2C636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQEDU9Q8DWXRGjnHZqJ5t2GF0NEEC7I6zwau5dzlPmM=; b=pbzSenQ63w2si2xOSh+4/kXnnW
	3HRlsQkTVk4e047ki4HnIgaHSo8n9QZNYTIhvbs61U8n4T8el3/uxUUOzC9FzHPbu4VXM0qNKiBrr
	lowJRLubkrt1pHohu85bo69CQDlvtoiM0P0rFmioILcerAcawtcKRDFTEeKSdFC/Ytcr7ORYZS5Nb
	wlxZOcpul7+Zy3aNZrrMoPrEyB2BbqUD761O4+IRbUqRDUge6TpWme5yZSmI4fKd2yCQeJMfEac4A
	NNWQXxgXzdSEI8TB6xV5+tpQjGO3so5/cOUnGccfVYfDFlpjYKDS1rvLPHirctg+3wxZlV6pTRalf
	41VFVUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRgUt-00GN8i-08; Mon, 13 Feb 2023 21:36:27 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRgUp-00GN5i-Q0; Mon, 13 Feb 2023 21:36:25 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pRgUl-0006fs-0W;
	Mon, 13 Feb 2023 22:36:19 +0100
Date: Mon, 13 Feb 2023 21:34:43 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: [PATCH v6 03/12] dt-bindings: arm: mediatek: sgmiisys: Convert to DT
 schema
Message-ID: <f4b378f4b19064df85d529973ed6c73ae7aa9f2d.1676323692.git.daniel@makrotopia.org>
References: <cover.1676323692.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1676323692.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_133623_944780_2A2A22A6 
X-CRM114-Status: GOOD (  16.41  )
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

Convert mediatek,sgmiiisys bindings to DT schema format.
Add maintainer Matthias Brugger, no maintainers were listed in the
original documentation.
As this node is also referenced by the Ethernet controller and used
as SGMII PCS add this fact to the description.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../arm/mediatek/mediatek,sgmiisys.txt        | 27 ----------
 .../arm/mediatek/mediatek,sgmiisys.yaml       | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
deleted file mode 100644
index d2c24c277514..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-MediaTek SGMIISYS controller
-============================
-
-The MediaTek SGMIISYS controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt7622-sgmiisys", "syscon"
-	- "mediatek,mt7629-sgmiisys", "syscon"
-	- "mediatek,mt7981-sgmiisys_0", "syscon"
-	- "mediatek,mt7981-sgmiisys_1", "syscon"
-	- "mediatek,mt7986-sgmiisys_0", "syscon"
-	- "mediatek,mt7986-sgmiisys_1", "syscon"
-- #clock-cells: Must be 1
-
-The SGMIISYS controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-sgmiisys: sgmiisys@1b128000 {
-	compatible = "mediatek,mt7622-sgmiisys", "syscon";
-	reg = <0 0x1b128000 0 0x1000>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
new file mode 100644
index 000000000000..6bb84fe23de4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,sgmiisys.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek SGMIISYS Controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The MediaTek SGMIISYS controller provides SGMII related clocks to the system
+  and is used by the Ethernet controller as SGMII PCS.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7622-sgmiisys
+          - mediatek,mt7629-sgmiisys
+          - mediatek,mt7986-sgmiisys_0
+          - mediatek,mt7986-sgmiisys_1
+      - const: syscon
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
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      sgmiisys: syscon@1b128000 {
+        compatible = "mediatek,mt7622-sgmiisys", "syscon";
+        reg = <0 0x1b128000 0 0x1000>;
+        #clock-cells = <1>;
+      };
+    };
-- 
2.39.1


