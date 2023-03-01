Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B4BC7EE30
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbpGwh/mMJ1PPg8clUW4kOyB6z79MkOMQT9wcbPNGak=; b=M7b6ssOBgQxnyFE+1lOEi0tC2n
	RNsAXgm/u3saqqPxdH/jvKLVDEOAL9REuwNohqMqf9hLueNJyKin51dgn8JSzDCwscx/lAOn9smht
	UWZCQbwFFWv27nCmHWKusAubMSNe5GR9kO4dIJGywPErk0T4a8vqfd00qxgBF4RavwPaKJplkl94v
	YYFP3q+LKe/yEZAf2bXGpPaQ9MGggrZ6QHQ8ILJtThaDc7K3o4Ga+UonnO9ImtVwkqhRQKHeKpNxJ
	AA6FM+oYnD7r4fcfDCcIo2uwDDRk9JkBrlahSGCJYTltyipPKdavZz5HIFxpzd+R4/nwZLCOa3KYj
	koTvymJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSWW-00HLq1-Rf; Wed, 01 Mar 2023 19:54:00 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSWT-00HLo0-SC; Wed, 01 Mar 2023 19:53:59 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pXSWN-0007Gg-2m;
	Wed, 01 Mar 2023 20:53:52 +0100
Date: Wed, 1 Mar 2023 19:53:44 +0000
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
Subject: [RFC PATCH v11 02/12] dt-bindings: net: mediatek,net: add mt7981-eth
 binding
Message-ID: <6a2c16f7523752c1784bf6b6539ff146fe7ba45f.1677699407.git.daniel@makrotopia.org>
References: <cover.1677699407.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677699407.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_115357_968827_E0B0473C 
X-CRM114-Status: GOOD (  10.84  )
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

Introduce DT bindings for the MT7981 SoC to mediatek,net.yaml.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 53 +++++++++++++++++--
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 7ef696204c5a7..b7f6474dc5abd 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt7623-eth
       - mediatek,mt7622-eth
       - mediatek,mt7629-eth
+      - mediatek,mt7981-eth
       - mediatek,mt7986-eth
       - ralink,rt5350-eth
 
@@ -78,6 +79,11 @@ properties:
     description:
       List of phandles to wireless ethernet dispatch nodes.
 
+  mediatek,wed-pcie:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the mediatek wed-pcie controller.
+
   dma-coherent: true
 
   mdio-bus:
@@ -123,6 +129,8 @@ allOf:
 
         mediatek,wed: false
 
+        mediatek,wed-pcie: false
+
   - if:
       properties:
         compatible:
@@ -160,6 +168,8 @@ allOf:
           description:
             Phandle to the mediatek pcie-mirror controller.
 
+        mediatek,wed-pcie: false
+
   - if:
       properties:
         compatible:
@@ -206,6 +216,44 @@ allOf:
 
         mediatek,wed: false
 
+        mediatek,wed-pcie: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7981-eth
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+
+        clocks:
+          minItems: 15
+          maxItems: 15
+
+        clock-names:
+          items:
+            - const: fe
+            - const: gp2
+            - const: gp1
+            - const: wocpu0
+            - const: sgmii_ck
+            - const: sgmii_tx250m
+            - const: sgmii_rx250m
+            - const: sgmii_cdr_ref
+            - const: sgmii_cdr_fb
+            - const: sgmii2_tx250m
+            - const: sgmii2_rx250m
+            - const: sgmii2_cdr_ref
+            - const: sgmii2_cdr_fb
+            - const: netsys0
+            - const: netsys1
+
+        mediatek,sgmiisys:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -242,11 +290,6 @@ allOf:
           minItems: 2
           maxItems: 2
 
-        mediatek,wed-pcie:
-          $ref: /schemas/types.yaml#/definitions/phandle
-          description:
-            Phandle to the mediatek wed-pcie controller.
-
 patternProperties:
   "^mac@[0-1]$":
     type: object
-- 
2.39.2


