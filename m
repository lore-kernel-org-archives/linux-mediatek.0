Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B5C54ED1
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jun 2025 09:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgeEoJwP1RRKkglcECdGpkEEfNbWqvY35txVx4ntqiU=; b=25zfrtOpNiTlGr
	AB/KRZpWQQjA2jwsQgnE+mh7dA8r0aAZubHdoAk4c9D7/txhLYqJ3S7ZKUO1SG7LkbBF2sxfsESf5
	r4SA4g2zZ6fXNPBe2WKgwvTo9y4eqMMEm7uxRG7ysECDah0Wsoe/WGzGqDCFSIElH3u0oZnEmxDEd
	0aiMeIEz8xU4Cb2Hu4lZ30pCBusigzCYn/dCpvWM+ndKbi09jAspaKVBkVWr8grBfEJjj+XtA2EFn
	urHVIH6gvPRYLeiePyaB/icin9U2ajiBiDdu6dj2ij13GylItPFuWIF4Wt9K+X6pnMzDgjTHqjP/n
	WM8xBopwI53+xF7GO3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRnu-0000000GcuR-1suF;
	Sat, 28 Jun 2025 09:24:58 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRaJ-0000000GbDw-0uoQ;
	Sat, 28 Jun 2025 09:10:58 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 920895FD7B;
	Sat, 28 Jun 2025 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751101851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgeEoJwP1RRKkglcECdGpkEEfNbWqvY35txVx4ntqiU=;
	b=AjLz9OmzYbggR4Ei1+YPIRF1/sNAVGGSlsI/4Z7ZjbytXLQ9j9wcZpPaQrcjjmARskZkHp
	T17tmyPEjUCgU2g8LYa7l3TxXAJC0y2jpiska5emk0t0/2BbGdUlV/ZRTmPJz8anEqRC43
	qsjNZkd+CitzoEwR8MRKESJdsfdm1PE=
Received: from frank-u24.. (fttx-pool-217.61.150.139.bambit.de [217.61.150.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 3618212272D;
	Sat, 28 Jun 2025 09:10:51 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 03/15] dt-bindings: net: mediatek,net: update for mt7988
Date: Sat, 28 Jun 2025 11:10:27 +0200
Message-ID: <20250628091043.57645-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628091043.57645-1-linux@fw-web.de>
References: <20250628091043.57645-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_021055_394846_E3203B89 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Update binding for mt7988 which has 3 gmac and a sram for dma
operations.

MT7988 has 4 FE IRQs (currently only 2 are used) and 4 IRQs for use
with RSS/LRO later.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v6:
- split out the interrupt-names into separate patch
- update irq(name) min count to 4
- add sram-property
- drop second reg entry and minitems as there is only 1 item left again

v5:
- fix v4 logmessage and change description a bit describing how i get
  the irq count.
- update binding for 8 irqs with different names (rx,tx => fe0..fe3)
  including the 2 reserved irqs which can be used later
- change rx-ringX to pdmaX to be closer to hardware documentation

v4:
- increase max interrupts to 6 because of adding RSS/LRO interrupts (4)
  and dropping 2 reserved irqs (0+3) around rx+tx
- dropped Robs RB due to this change
- allow interrupt names
- add interrupt-names without reserved IRQs on mt7988
  this requires mtk driver patch:
  https://patchwork.kernel.org/project/netdevbpf/patch/20250616080738.117993-2-linux@fw-web.de/

v2:
- change reg to list of items
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 6672db206b38..74a139000f60 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -28,7 +28,8 @@ properties:
       - ralink,rt5350-eth
 
   reg:
-    maxItems: 1
+    items:
+      - description: Register for accessing the MACs.
 
   clocks:
     minItems: 2
@@ -66,6 +67,10 @@ properties:
       - const: gmac
       - const: ppe
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to mmio SRAM
+
   mediatek,ethsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -418,7 +423,7 @@ allOf:
             - const: xgp3
 
 patternProperties:
-  "^mac@[0-1]$":
+  "^mac@[0-2]$":
     type: object
     unevaluatedProperties: false
     allOf:
-- 
2.43.0


