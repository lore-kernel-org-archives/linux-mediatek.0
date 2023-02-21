Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C99C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 11:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtIh26Bfx+WN1iVlMoSDxVRrehf2vD3BElumabhwKhI=; b=BEzsnhtlMuHKTVruiYyf4Y1eBR
	Ly1umP7YdSPJBBQSg198FzN584LUKD8IrmMK7sQttiS2Xgz5Obo1MHMaCi3Ww4y9LuLezawiBnOe6
	ZnwPzEclmL1/fFFta6vpJBnA7XmxSo7v3DwO8fjh5dyodPhI92/t7i73j3cFACVzj4RNHnMI2jvsq
	OkBdl8TDyjmnzPBEyJnqXHwvOK2zEHrZgD3Ei91lF6h1cJJ9ls7O6FYsXJ/FVFGFywyF+zJmjQ2Or
	1jmZwJVhchE8iIu5E5NUfhmB9SsGw8FzGaNwBg9WYJY/PrDakas25f20NsUXS7xbl8H475VoZDzsw
	UiDgjQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUR1X-007dCQ-NY; Tue, 21 Feb 2023 11:41:31 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUR1U-007d9a-PO; Tue, 21 Feb 2023 11:41:30 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pUR1P-0001OO-0B;
	Tue, 21 Feb 2023 12:41:23 +0100
Date: Tue, 21 Feb 2023 11:41:18 +0000
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
Subject: [PATCH net-next v10 03/12] dt-bindings: arm: mediatek: sgmiisys:
 Convert to DT schema
Message-ID: <3a600ac728f0ef62651f396a193239912f8b07c2.1676933805.git.daniel@makrotopia.org>
References: <cover.1676933805.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1676933805.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_034128_865027_5BCF6400 
X-CRM114-Status: GOOD (  17.49  )
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
Move the file to Documentation/devicetree/bindings/pcs/ which seems more
appropriate given that the great majority of registers are related to
SGMII PCS functionality and only one register represents clock bits.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../arm/mediatek/mediatek,sgmiisys.txt        | 25 ----------
 .../bindings/net/pcs/mediatek,sgmiisys.yaml   | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
 create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
deleted file mode 100644
index 29ca7a10b3156..0000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
+++ /dev/null
@@ -1,25 +0,0 @@
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
diff --git a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
new file mode 100644
index 0000000000000..7ce597011a321
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SGMIISYS Controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The MediaTek SGMIISYS controller provides a SGMII PCS and some clocks
+  to the ethernet subsystem to which it is attached.
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
2.39.2


