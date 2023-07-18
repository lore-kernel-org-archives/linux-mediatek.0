Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1E1C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/cZx+B5WGizvxlDSeTCv+oXqDXqtzh/XYjiGDm0tKA=; b=E+JHl++ZuP15pzy/s70uSOzHmd
	5EmO6Cxxa+FQmfJWet0Ct33oa/58r3Mj3uJqNykDyWyfXggy3881gMCt4P8N1THHg/L9jyqNOjz0f
	G6DZ65Dw1f9GmBhYfQC4jfnwVvaamsV7pLXq3OGDXxbXBPwSiU2LANi0uwv5vC9IZK1K8HY/wv/VW
	xJkQ46K5dx5ZEq33T+VwJbcqzHgssjvXTV+avo89Rq78cBeWtWMG+pG2un6cInU8AbBKV2zboMxHc
	amrk4xx5gLD0mgWOs1yyuPH7YrYUdXZ1SXly6M4MfpKZ88X6OTaw4BQsgjohCfZTf33MYM5KGIk3L
	8tIqIXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0GM-005WOV-0q;
	Wed, 19 Jul 2023 06:02:14 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0GK-005WMZ-06;
	Wed, 19 Jul 2023 06:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j/cZx+B5WGizvxlDSeTCv+oXqDXqtzh/XYjiGDm0tKA=; b=GfCc0yVe8bpS3cG5b7ejvo4AqS
	oNE8nq4w28ynzzyhXR9KxLHrLPNuqE8PwjxkIzzZzyiVDOdCHlUeOjiiezCN6OLDLi/dzSDS5aga4
	f3Y5H3NWM5uRM9Qlj+kqydrZuTiARmW9+wvjhpi9mlgir8hz3CcrRUHiw9hxOymeM9tj+qTYzS2uW
	PhEkUHaXRzfpHkdjTlW3GoijcYyqAWZIDzEt4r0KIcjb9Qnj4MWYRvsQVWj8TKmNutIyEokWd2R0Y
	nIyzdawzKnO6UyfjhoDR6gnrQ+ExqNynHuI868pGZlKrzi61Xqy2VGk7COxkDiNs6mIkzM9lHWMih
	WK9pHw7A==;
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLsHb-00C4GN-0C;
	Tue, 18 Jul 2023 21:31:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qLsHJ-0001KL-2T;
	Tue, 18 Jul 2023 21:30:41 +0000
Date: Tue, 18 Jul 2023 22:30:33 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
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
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Message-ID: <584b459ebb0a74a2ce6ca661f1148f59b9014667.1689714291.git.daniel@makrotopia.org>
References: <cover.1689714290.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689714290.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_223112_418775_23F328E4 
X-CRM114-Status: GOOD (  12.86  )
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
5GBase-KR or 10GBase-KR.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 74 +++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 38aa3d97ee234..ae2062f3c1833 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -24,6 +24,7 @@ properties:
       - mediatek,mt7629-eth
       - mediatek,mt7981-eth
       - mediatek,mt7986-eth
+      - mediatek,mt7988-eth
       - ralink,rt5350-eth
 
   reg:
@@ -61,6 +62,12 @@ properties:
       Phandle to the mediatek hifsys controller used to provide various clocks
       and reset to the system.
 
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon node that handles the path from GMAC to
+      PHY variants.
+
   mediatek,sgmiisys:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
@@ -229,11 +236,7 @@ allOf:
             - const: sgmii_ck
             - const: eth2pll
 
-        mediatek,infracfg:
-          $ref: /schemas/types.yaml#/definitions/phandle
-          description:
-            Phandle to the syscon node that handles the path from GMAC to
-            PHY variants.
+        mediatek,infracfg: true
 
         mediatek,sgmiisys:
           minItems: 2
@@ -315,6 +318,67 @@ allOf:
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
+        mediatek,infracfg: true
+
 patternProperties:
   "^mac@[0-1]$":
     type: object
-- 
2.41.0

