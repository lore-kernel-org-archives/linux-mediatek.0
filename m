Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909C2C0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voAtLXmLl9r79y4j5NbdVi9awaISDF1Sa79XgocDMGs=; b=rKesyOi1+z7GZVijInAiIwXIJg
	xVRf1fFT3iJHYKyf0G+3ne02O7DMktoWsvoj+Jrq6iD6INnFO2qPazWo/E0iiy2n9mA9MhUyzoaxv
	0sw02zcQ4JlKN3LMJF/LzhqqgMb8pPhrgY8k0jB0EnqtuzEpCaxCBNh55qJCDQe5vYiRjs57S52Fp
	5okchRlGKrd0T8OjV9BKQkp/K2iDK069Sc3ryMpyd062KYml/Lxi3hia+bJD+8Mb8L2x+E33IpOZd
	QFTBUlo9jRyNzE7CRkj2j0fSE2ibb0SXr2kFLkYSD6APA6X1DROhIjnyAQjPk3r3mDLv8zeANXE4e
	uqepCeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkY-00D0On-1Z;
	Sat, 12 Aug 2023 09:17:34 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkkS-00D0Lv-2A;
	Sat, 12 Aug 2023 09:17:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61E701BF206;
	Sat, 12 Aug 2023 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691831847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voAtLXmLl9r79y4j5NbdVi9awaISDF1Sa79XgocDMGs=;
	b=kncA3e3JiQcrxoNOJ4hUbNZOZ3oAl04PNDSloDgEq6cUb5Lz4IoUQ9aW5yKUf2sozSK2oS
	zCvZWVOPPWPvljoxiw2YsHG7n6yaRAV/tngrRQk8UPt89kXCuBjos1klD8u19jgy7VMBiQ
	yQMiIOWrMpUmDmdnkHLX10sBb3L24hCQ1vMUFQjdMMM3zn2wTGyR2EOvqsg0iRD6oFaoMI
	JTEvNqHIt7kqdk+TqXyd4ux+xMhZWq43eyeDutFTcDxvw+zydqUZRL8kKc9UUONIy2S4jL
	6sJoaBMHMt3cJjHgB72OdUHSHcEXNKZ4g4uheAbakfY5RqOy4usqR4iiGolCYQ==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: net: dsa: microchip,lan937x: add missing ethernet on example
Date: Sat, 12 Aug 2023 12:17:05 +0300
Message-Id: <20230812091708.34665-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812091708.34665-1-arinc.unal@arinc9.com>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_021728_841221_62CE1758 
X-CRM114-Status: GOOD (  10.88  )
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

The port@5 node on the example is missing the ethernet property. Add it.
Remove the MAC bindings on the example as they cannot be validated.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/microchip,lan937x.yaml           | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
index 8d7e878b84dc..49af4b0d5916 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
@@ -68,16 +68,6 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    macb0 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            fixed-link {
-                    speed = <1000>;
-                    full-duplex;
-            };
-    };
-
     spi {
             #address-cells = <1>;
             #size-cells = <0>;
@@ -138,6 +128,7 @@ examples:
                                     phy-mode = "rgmii";
                                     tx-internal-delay-ps = <2000>;
                                     rx-internal-delay-ps = <2000>;
+                                    ethernet = <&macb1>;
 
                                     fixed-link {
                                             speed = <1000>;
-- 
2.39.2


