Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A6FC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 21:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=stOdTfkGUoKXVhBFL0Q7i63rpqfUfuy3WeOD+3yZwoQ=; b=O4OoQwEmqVxxWX41rJieDbpXN8
	p6Ar8blqZkfH1K7FOZ9WX2guI+sO1LUGofQlh+/cchXymvKPjetw9iqJtsxdn6Pjr+ADZqKEaAHcq
	m24c2n7pbqHGPgCywwRCMdsTIsVmEEaTHXrKzmziOH6NAZFs48DcjUex/MuF/Tcn0/BoupdQaIA5B
	wrtLsb75mgH4H87ZfZZyORnDuVh90hNK4JXKoU6c0B/q4hYZLS0JLBfQNpA6NAn6hPDhhPANvlUbv
	rePp0FGhKWx7F/Driu0/9dz14xlb0MSngTgap8fsiHS34zbajbEVAEgaZYjAPSIUHO0T/N93ZEof/
	orp9Iegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1vQc-000000081Bc-1PZl;
	Tue, 30 Apr 2024 21:54:22 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1vQY-000000081A3-19lZ;
	Tue, 30 Apr 2024 21:54:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s1vQI-0000000016x-33u8;
	Tue, 30 Apr 2024 21:54:02 +0000
Date: Tue, 30 Apr 2024 22:53:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: net: mediatek: remove wrongly added clocks and
 SerDes
Message-ID: <ea2e786eda4561cb5d11b62a4edd7e75c0975f1f.1714513773.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_145418_358529_0506763E 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Several clocks as well as both sgmiisys phandles were added by mistake
to the Ethernet bindings for MT7988.

This happened because the vendor driver which served as a reference uses
a high number of syscon phandles to access various parts of the SoC
which wasn't acceptable upstream. Hence several parts which have never
previously been supported (such SerDes PHY and USXGMII PCS) are going to
be implemented by separate drivers. As a result the device tree will
look much more sane.

Quickly align the bindings with the upcoming reality of the drivers
actually adding support for the remaining Ethernet-related features of
the MT7988 SoC.

Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 32 ++++---------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index e74502a0afe8..030d106bc7d3 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -337,32 +337,23 @@ allOf:
           minItems: 4
 
         clocks:
-          minItems: 34
-          maxItems: 34
+          minItems: 24
+          maxItems: 24
 
         clock-names:
           items:
-            - const: crypto
+            - const: xgp1
+            - const: xgp2
+            - const: xgp3
             - const: fe
             - const: gp2
             - const: gp1
             - const: gp3
+            - const: esw
+            - const: crypto
             - const: ethwarp_wocpu2
             - const: ethwarp_wocpu1
             - const: ethwarp_wocpu0
-            - const: esw
-            - const: netsys0
-            - const: netsys1
-            - const: sgmii_tx250m
-            - const: sgmii_rx250m
-            - const: sgmii2_tx250m
-            - const: sgmii2_rx250m
-            - const: top_usxgmii0_sel
-            - const: top_usxgmii1_sel
-            - const: top_sgm0_sel
-            - const: top_sgm1_sel
-            - const: top_xfi_phy0_xtal_sel
-            - const: top_xfi_phy1_xtal_sel
             - const: top_eth_gmii_sel
             - const: top_eth_refck_50m_sel
             - const: top_eth_sys_200m_sel
@@ -375,15 +366,6 @@ allOf:
             - const: top_netsys_sync_250m_sel
             - const: top_netsys_ppefb_250m_sel
             - const: top_netsys_warp_sel
-            - const: wocpu1
-            - const: wocpu0
-            - const: xgp1
-            - const: xgp2
-            - const: xgp3
-
-        mediatek,sgmiisys:
-          minItems: 2
-          maxItems: 2
 
 patternProperties:
   "^mac@[0-1]$":
-- 
2.44.0


