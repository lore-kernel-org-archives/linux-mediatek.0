Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982D6C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BC6EQ1obEhQLKqEFNINH6VyUO4hiBgpZ2jUI/KIfwmc=; b=ywKViQVFfDxEO7najEdO5BCwJM
	cEHgIHlJ15GN92jYIvi0uwrrdMA5QokTo2NInCC9Fbxq4UPnK8RJHOI4NQR42DXRKiA4VS/Ni6awv
	ewNKiXXZ46tNpcWeQeGsth9SD0hp6/Iwzp8hpyng2YkTnmA+7bmJGnWCfsV1hOtNk30jHD1LMQPfr
	BwBpQoE8IMS0UwNNRN2blpFDJywL07Qxm6nkvWauAY1e449Xi+PBTvup5LAT4WkHJA0d2xM81gVlz
	b5WtyniE9TW4NIZ0hlxAE7IImJNVQxiVBykFzVFXKEZuBQB5Jaq8VeL/5h3lmMRw8jYxYHRwL/BiB
	JsI30pag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt5Es-00E55p-0U;
	Sun, 30 Apr 2023 11:29:10 +0000
Received: from perseus.uberspace.de ([95.143.172.134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt5Em-00E53p-3A
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Apr 2023 11:29:08 +0000
Received: (qmail 18696 invoked by uid 988); 30 Apr 2023 11:28:54 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
From: David Bauer <mail@david-bauer.net>
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document MDIO-bus
Date: Sun, 30 Apr 2023 13:28:33 +0200
Message-Id: <20230430112834.11520-2-mail@david-bauer.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430112834.11520-1-mail@david-bauer.net>
References: <20230430112834.11520-1-mail@david-bauer.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-3) R_MISSING_CHARSET(0.5) MIME_GOOD(-0.1) MID_CONTAINS_FROM(1) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: -0.1
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sun, 30 Apr 2023 13:28:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from;
	bh=sTYmJdxkbJ6INid41yoAQ9uYdKno4uxUMFR5arFxeCc=;
	b=jOG5PZqyf0Fr/vBRT7d3DIMKD7eTMbfb4F6YNlEPi9GCL326ZHSewYXKDuO5hSwHhWvjJrlDb8
	V9U9sNTecZc3GGlBu3ZBAdFdPPiZ4dCI0YQoJV6oaAlc6GP5SGF0BE+7DbsSTH8WLCX3oINCTVvI
	TJxipRze5M8tl2c65CrX3SKFDBikA4xMg1Xz25Uxh8A4bqTKd7uN47dTk2GP8riZ84aVV31olbAL
	Bnb8pX9sLT+hqrKFAhStBiUgmE1w7UCTCqFLIRmPTF4nlg8BFFzHEUOWQJEJzqIX/in2TtmwMWuD
	JXy/jjU++UOmqBtW5OHXsha20f8d05y0AGWc4s2HOHjwhgXf6FPwBKrRzlUy4Gw5dBC1YOQOWz1f
	cXeIvoXXOSRVdh7C8uN1hY8vq7Qu8ymv2BQgivOg/TFVEAT7TJC1I3U3tRotGcfR+PLw32hLZFlX
	T+/d4EXZm5w1WBjNrFOrsAdpaNg0a1b+d8VaBAcecVjc2OWV3w/ZROGkVJLkwJX+4PmB9cTAvZS0
	bkvL0akVRqCTdZV8exHIQyTzergXnTYH7ZIAsVynx/ZHEoXr1E44g6VfFzmWytA8Tp7P7BzDoyZ7
	eCW4IuxOS3kWXlvJ37cSHw7LKr1XrTcXMFnh6D7ByBe9H4amiCLIhaTnnLkCV8QaXeKxWl5av9xC
	8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_042906_000506_2F5E6C3F 
X-CRM114-Status: UNSURE (   8.67  )
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

Document the ability to add nodes for the MDIO bus connecting the
switch-internal PHYs.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index e532c6b795f4..50f8f83cc440 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -128,6 +128,12 @@ properties:
       See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
       details for the regulator setup on these boards.
 
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Node for the internal MDIO bus connected to the embedded ethernet-PHYs.
+
   mediatek,mcm:
     type: boolean
     description:
-- 
2.39.2


