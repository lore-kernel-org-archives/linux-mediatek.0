Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB32EC77B62
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZzZTeTbACO9jNrXV7gkXRIT2/Za9jKiU5TxwHhZyjc=; b=Bm+9tB/RYZC8x4wf1mBpAcqSjD
	B96wLeF05NIt3Lmgwn0zjGdnNwihGbzQtiClUpPjFgU1QG+U4hlUAqwxYuEG1pviCyXR9pnrsNRfS
	+/OG7O/ZEiXEAUMkEqJYNZ46Niv7ArNvu3ev+jWNtZ/W+QxQEza0nAO5UlmgA/sw09KaoYUXqIY20
	IPXIOv9WCjIw7dJkjaZAjSlkKfEWWwcFanLqQ78YZMadQoZfm6KFEQq3lu4C341EwH8qhwhbczVie
	JOEz8zcgoBtPbj5XUafoyRXX5fk6/TA+cAlluBLlLwKVij6/PXWCosoYx9gMJgE0SQMUXffHN888D
	KdGTyPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu8D-004FAp-1q;
	Thu, 30 Mar 2023 15:24:05 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phu89-004F7J-27;
	Thu, 30 Mar 2023 15:24:04 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phu87-0006mh-1T;
	Thu, 30 Mar 2023 17:23:59 +0200
Date: Thu, 30 Mar 2023 16:23:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 15/15] dt-bindings: net: dsa: mediatek,mt7530: add
 mediatek,mt7988-switch
Message-ID: <80a853f182eac24735338f3c1f505e5f580053ca.1680180959.git.daniel@makrotopia.org>
References: <cover.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_082401_720155_C2F71C62 
X-CRM114-Status: GOOD (  12.05  )
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

Add documentation for the built-in switch which can be found in the
MediaTek MT7988 SoC.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 5ae9cd8f99a24..15953f0e9d1a6 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -11,16 +11,23 @@ maintainers:
   - Landen Chao <Landen.Chao@mediatek.com>
   - DENG Qingfang <dqfext@gmail.com>
   - Sean Wang <sean.wang@mediatek.com>
+  - Daniel Golle <daniel@makrotopia.org>
 
 description: |
-  There are two versions of MT7530, standalone and in a multi-chip module.
+  There are three versions of MT7530, standalone, in a multi-chip module and
+  built-into a SoC.
 
   MT7530 is a part of the multi-chip module in MT7620AN, MT7620DA, MT7620DAN,
   MT7620NN, MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs.
 
+  The MT7988 SoC comes a built-in switch similar to MT7531 as well as 4 Gigabit
+  Ethernet PHYs and the switch registers are directly mapped into SoC's memory
+  map rather than using MDIO. It comes with an internally connected 10G CPU port
+  and 4 user ports connected to the built-in Gigabit Ethernet PHYs.
+
   MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs
   and the switch registers are directly mapped into SoC's memory map rather than
-  using MDIO. The DSA driver currently doesn't support this.
+  using MDIO. The DSA driver currently doesn't support MT7620 variants.
 
   There is only the standalone version of MT7531.
 
@@ -81,6 +88,10 @@ properties:
           Multi-chip module MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs
         const: mediatek,mt7621
 
+      - description:
+          Built-in switch of the MT7988 SoC
+        const: mediatek,mt7988-switch
+
   reg:
     maxItems: 1
 
@@ -268,6 +279,17 @@ allOf:
       required:
         - mediatek,mcm
 
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7988-switch
+    then:
+      $ref: "#/$defs/mt7530-dsa-port"
+      properties:
+        gpio-controller: false
+        mediatek,mcm: false
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.2


