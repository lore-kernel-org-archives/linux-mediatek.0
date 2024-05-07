Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10466C10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uFwurw9SHeLs2paCRYtN6dqmBWimooBARmEyRmjTS+Y=; b=l+at+tFZpUlpxPGEWmdiNMbucK
	wy9UsSNCBKEmh2GB3WTGqhj2GNWuAKJ7D+L7Zgn9uUA9t0L+PBUKLZ9d3t4haZ4hsUOSz+Rw4IGWq
	hsBp4yDe8fBXTwwuS2NUz2kr+Npi4ZgGvvui9GGDNoogjqhp+zg0F+3qdHeMMuT+CvmcIdxlqrv5g
	FcsCsvNRh6LH16pWjV9/GHM7wtLYNEf6IOQq4bfGJdFBzWA0FRCbsiRu2qaBwjMIqQreY69dkma4A
	O1dBUTJabnHNmf6q0TJVNB+E5Y6bc6z47nnrTL4JeU1fBKBKM+QvOWYCGfZkDJbBJRT2x94MdgePn
	BfV4gu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Joi-0000000Asam-07hT;
	Tue, 07 May 2024 12:21:08 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Joe-0000000AsZj-0HbZ;
	Tue, 07 May 2024 12:21:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s4JoQ-0000000046z-17PQ;
	Tue, 07 May 2024 12:20:50 +0000
Date: Tue, 7 May 2024 13:20:43 +0100
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
Subject: [PATCH v2] dt-bindings: net: mediatek: remove wrongly added clocks
 and SerDes
Message-ID: <1569290b21cc787a424469ed74456a7e976b102d.1715084326.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_052104_199634_DDD9A1D2 
X-CRM114-Status: GOOD (  11.17  )
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
to the Ethernet bindings for MT7988. Also, the total number of clocks
didn't match with the actual number of items listed.

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
v2: don't make changes to the order of clocks

 .../devicetree/bindings/net/mediatek,net.yaml | 22 ++-----------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index e74502a0afe8..3202dc7967c5 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -337,8 +337,8 @@ allOf:
           minItems: 4
 
         clocks:
-          minItems: 34
-          maxItems: 34
+          minItems: 24
+          maxItems: 24
 
         clock-names:
           items:
@@ -351,18 +351,6 @@ allOf:
             - const: ethwarp_wocpu1
             - const: ethwarp_wocpu0
             - const: esw
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
@@ -375,16 +363,10 @@ allOf:
             - const: top_netsys_sync_250m_sel
             - const: top_netsys_ppefb_250m_sel
             - const: top_netsys_warp_sel
-            - const: wocpu1
-            - const: wocpu0
             - const: xgp1
             - const: xgp2
             - const: xgp3
 
-        mediatek,sgmiisys:
-          minItems: 2
-          maxItems: 2
-
 patternProperties:
   "^mac@[0-1]$":
     type: object
-- 
2.45.0


