Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC28C001DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU7S5qPeQUp1eHxVNeGHqMFjJ+iXV2AcvQVM/ZRzqKQ=; b=sXYw7oj4dPdulkzMTF+yKUd/5S
	0SjLhsAe+nYBf5BbSQNu03gE7FXvwmpkkIeevnbfPfftjwsGn1tn3hU9BWqhYtXA9eV6YtJTPTyAL
	fIkPUTc8GOUfgmiy042Rpknf4NLIdLTcaIhfIaLpRm62HvgDMW2epQmGlvYZ6qTT+vJEAIGuE9BgS
	HDY6IarGe6JpcsLciYuov8sefXLWv5EO2FwnzWNmDN4f1YWo/e0qumCVgMbwuOsGAshwa5aRdVUBP
	a3IJTE1bPg0xXjV9MyS/zOSJVL8mvfHvfuuwUX/1n8qXO+ijKEqLilw9L4xeSVCOGNseSWvlIHPHG
	HVv5W5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJluH-001hxO-1Q;
	Thu, 13 Jul 2023 02:18:13 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJluE-001hwR-1r;
	Thu, 13 Jul 2023 02:18:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qJluC-0005W8-2s;
	Thu, 13 Jul 2023 02:18:09 +0000
Date: Thu, 13 Jul 2023 03:17:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: [PATCH v2 net-next 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Message-ID: <6c2e9caddfb9427444307d8443f1b231e500787b.1689012506.git.daniel@makrotopia.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689012506.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_191810_615731_4EF69F89 
X-CRM114-Status: GOOD (  12.54  )
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

Introduce DT bindings for the MT7988 SoC to mediatek,net.yaml.
The MT7988 SoC got 3 Ethernet MACs operating at a maximum of
10 Gigabit/sec supported by 2 packet processor engines for
offloading tasks.
The first MAC is hard-wired to a built-in switch which exposes
four 1000Base-T PHYs as user ports.
It also comes with built-in 2500Base-T PHY which can be used
with the 2nd GMAC.
The 2nd and 3rd GMAC can be connected to external PHYs or provide
SFP(+) cages attached via SGMII, 1000Base-X, 2500Base-X, USXGMII,
5GBase-R or 10GBase-KR.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 38aa3d97ee234..59f074e56fe2a 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -24,6 +24,7 @@ properties:
       - mediatek,mt7629-eth
       - mediatek,mt7981-eth
       - mediatek,mt7986-eth
+      - mediatek,mt7988-eth
       - ralink,rt5350-eth
 
   reg:
@@ -71,6 +72,22 @@ properties:
       A list of phandle to the syscon node that handles the SGMII setup which is required for
       those SoCs equipped with SGMII.
 
+  mediatek,toprgu
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the mediatek toprgu controller used to provide various clocks
+      and reset to the system.
+
+  mediatek,usxgmiisys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 2
+    items:
+      maxItems: 1
+    description:
+      A list of phandle to the syscon node that handles the USXGMII setup which is required for
+      those SoCs equipped with USXGMII.
+
   mediatek,wed:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 2
@@ -85,6 +102,21 @@ properties:
     description:
       Phandle to the mediatek wed-pcie controller.
 
+  mediatek,xfi_pextp:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 2
+    items:
+      maxItems: 1
+    description:
+      A list of phandle to the syscon node that handles the XFI setup which is required for
+      those SoCs equipped with XFI.
+
+  mediatek,xfi_pll:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the XFI PLL unit.
+
   dma-coherent: true
 
   mdio-bus:
@@ -315,6 +347,85 @@ allOf:
           minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7988-eth
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+
+        clocks:
+          minItems: 34
+          maxItems: 34
+
+        clock-names:
+          items:
+            - const: crypto
+            - const: fe
+            - const: gp2
+            - const: gp1
+            - const: gp3
+            - const: ethwarp_wocpu2
+            - const: ethwarp_wocpu1
+            - const: ethwarp_wocpu0
+            - const: esw
+            - const: netsys0
+            - const: netsys1
+            - const: sgmii_tx250m
+            - const: sgmii_rx250m
+            - const: sgmii2_tx250m
+            - const: sgmii2_rx250m
+            - const: top_usxgmii0_sel
+            - const: top_usxgmii1_sel
+            - const: top_sgm0_sel
+            - const: top_sgm1_sel
+            - const: top_xfi_phy0_xtal_sel
+            - const: top_xfi_phy1_xtal_sel
+            - const: top_eth_gmii_sel
+            - const: top_eth_refck_50m_sel
+            - const: top_eth_sys_200m_sel
+            - const: top_eth_sys_sel
+            - const: top_eth_xgmii_sel
+            - const: top_eth_mii_sel
+            - const: top_netsys_sel
+            - const: top_netsys_500m_sel
+            - const: top_netsys_pao_2x_sel
+            - const: top_netsys_sync_250m_sel
+            - const: top_netsys_ppefb_250m_sel
+            - const: top_netsys_warp_sel
+            - const: wocpu1
+            - const: wocpu0
+            - const: xgp1
+            - const: xgp2
+            - const: xgp3
+
+        mediatek,sgmiisys:
+          minItems: 2
+          maxItems: 2
+
+        mediatek,usxgmiisys:
+          minItems: 2
+          maxItems: 2
+
+        mediatek,xfi_pextp:
+          minItems: 2
+          maxItems: 2
+
+        mediatek,xfi_pll:
+          minItems: 1
+          maxItems: 1
+
+        mediatek,infracfg
+          minItems: 1
+          maxItems: 1
+
+        mediatek,toprgu
+          minItems: 1
+          maxItems: 1
+
 patternProperties:
   "^mac@[0-1]$":
     type: object
-- 
2.41.0

