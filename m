Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FFEC3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 18:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tatVlw7Ll8C73e8CtjmnUeQO7ko7CLQbXeml5jBaMIk=; b=iLiKNwZ0lwx3nv
	eAXf4R39iFrtYfVDVFB4nEZssojwotylVM3nqWiW5s/qMnny5SD+T+PHvTix2sml+rLF3U+TZwNK/
	igOjI3jCxuyHNCUAfEFFuGaFFStZSYxryW0svaXCDZahQFL7k6u7PbrJ5F11VSzxYoT5lRx1kvUaP
	c4mj6HtL5HSNznP+ghb4NR5we2QrLIqolaIoKSzCAl4ZylZecfj937CV0aLs/4MmrgYF8HGaG3nd8
	OK4Sf2/e9IN5TJE8zM6eBZ0KZb6bu0/UbRiieyj3rzUK9zeaL6Hq3uFute9WBgqanGidjQskuZyi/
	hwDHSFIiJV7qe990fyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzXn-00000004HWL-1kK1;
	Fri, 16 May 2025 18:12:27 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNh-00000004FKN-1nK1;
	Fri, 16 May 2025 18:02:03 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 6DA50600A2;
	Fri, 16 May 2025 18:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tatVlw7Ll8C73e8CtjmnUeQO7ko7CLQbXeml5jBaMIk=;
	b=OUgq5Mac6KOVXXrXCKYMLmAYUcMxX1/SslI9EXqbIuwo53BDubLib4vkhsq7Ow5tQl1y9I
	lXr60EZwI6GUH6MFqS62+U+DiLNJbxSl6Bj6Ege/fAke/yLZ7Em/4m3Wnh7ulP8s2CNqy0
	b/ss2uKSz5ngiEey5BZItaYKto6Pqvc=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 1EB981226D6;
	Fri, 16 May 2025 18:01:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 03/14] dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
Date: Fri, 16 May 2025 20:01:34 +0200
Message-ID: <20250516180147.10416-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110201_632901_568992C4 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Mt7988 buildin switch has own mdio bus where ge-phys are connected.
Add related property for this.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- change from patternproperty to property
- add unevaluatedProperties and mediatek,pio subproperty
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index bb22c36749fc..1692adcedea3 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -132,6 +132,16 @@ properties:
       See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
       details for the regulator setup on these boards.
 
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      mediatek,pio:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle pointing to the mediatek pinctrl node.
+
   mediatek,mcm:
     type: boolean
     description:
-- 
2.43.0


