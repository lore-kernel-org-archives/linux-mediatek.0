Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EB6C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goQBq6ugKS/BUWjMWs6Q49ZicZEa3mbuoDf4l0njwaU=; b=zVDo2ITHAvICIoEsShzYPPFNxl
	hfEMhf4nQyKL1areNMFZVKuQ2rV46fYh1365oKpdvCyUlA4a2X6WAMwRo5PFwVLuw2NzI3FvRIIu+
	cUceIc8dKsiEIh+iyXq/ohnC/TUARWLpsPUGHVtM6OeUOkUELE65WOYWDstDikUwvGXniBnKgxas1
	y7wGxNEMrny3NMEcAVkbI3kU+VBeKjMM70WpwydMkYeBmImcBocIQ/A5WxAJ5wWUAVWSVnNBJJZiL
	8yK+3jwRVq33KWYh1gXURksV246zq1W8+FvP4VS/Q0iD76Nae3r121KZMJjyE8tjucQRBRDlCi/FK
	LhAnZqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0bs-005i0h-1r;
	Wed, 19 Jul 2023 06:24:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0bm-005hwJ-1j;
	Wed, 19 Jul 2023 06:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=goQBq6ugKS/BUWjMWs6Q49ZicZEa3mbuoDf4l0njwaU=; b=BSuU7g4D25P0rCthpfDWGfSSjN
	sEcu9NMGCEiNsrV5cQs/gdXr/CWa6YULLvhx7dcjtQirxCuArTV8EYiBQNWB+Ssz4tLZ/pLEW0eM1
	ego5MRzdIiEUA3V3x+ugKijNh0bNLctCUEC6hi9PRtQG8VQRQuzFdJ+HvP33LekMTt1CyFYULzCOc
	VAI2O3dqdKSJgsFKA3Y5qpxa18byMvt23H+EPZq3UdlPpN9gr8auMXcCxj6xTSPpPQISEfR5K7iuV
	CpFfZYK1tv/hBFXswyjQutoKVmPIy4SOxpRG0hVVbEk1YyLkvmm/m0LVQcb1MgifzjGFAoUMfrixK
	CQaiM9nA==;
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLsHF-00C4FD-0j;
	Tue, 18 Jul 2023 21:31:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qLsGw-0001Jr-1c;
	Tue, 18 Jul 2023 21:30:18 +0000
Date: Tue, 18 Jul 2023 22:30:10 +0100
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
Subject: [PATCH net-next v3 1/9] dt-bindings: net: mediatek,net: add missing
 mediatek,mt7621-eth
Message-ID: <38831ee59390aae8e65b1bfa7641ed542d9981b3.1689714291.git.daniel@makrotopia.org>
References: <cover.1689714290.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689714290.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_223043_630240_185D8E9D 
X-CRM114-Status: GOOD (  11.33  )
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

Document the Ethernet controller found in the MediaTek MT7621 MIPS SoC
family which is supported by the mtk_eth_soc driver.

Fixes: 889bcbdeee57 ("net: ethernet: mediatek: support MT7621 SoC ethernet hardware")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index acb2b2ac4fe1e..38aa3d97ee234 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - mediatek,mt2701-eth
       - mediatek,mt7623-eth
+      - mediatek,mt7621-eth
       - mediatek,mt7622-eth
       - mediatek,mt7629-eth
       - mediatek,mt7981-eth
@@ -32,7 +33,7 @@ properties:
   clock-names: true
 
   interrupts:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   power-domains:
@@ -131,6 +132,30 @@ allOf:
 
         mediatek,wed-pcie: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7621-eth
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: ethif
+            - const: fe
+
+        mediatek,wed: false
+
+        mediatek,wed-pcie: false
+
   - if:
       properties:
         compatible:
-- 
2.41.0

