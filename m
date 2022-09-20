Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B01C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 17:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2aHD/2EQ0E3NOJZmAmLUmUUrpAWHblOhyutE0P5unM=; b=YOcH8BXry9KRrfd1wTb1bB2pBo
	zuZcUidbyhQRYnK3pMFGgQd9z163m2Oo+jt4CHz6wKHJxPVGLoVJDhwXVRGRuHVxQbW/yJ6vCtfhw
	XbFhwtBBI6StzlRSQ7du5MM7pdFioLb8A5NltWR6kvXNaYL1CYSHRBgGnepEi/pTC7o5x0EafnJn7
	dy9ZK0MhiPMtMUYVfe8/q36PiB4Pre202zDFxAWHtO6iOSGnIkBe5rHQ0wF/yjjTT3tpE9HB0t/+J
	5lVAa1Lzbg2L/phsFGTRmD1a7zan4hkFxFpy0AhnpQcdKBof24b5SvttD7oRyB1yTEGMegqVaUbQH
	MUaLeVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah2V-005S1y-2f; Tue, 20 Sep 2022 17:28:07 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah1Y-005RTq-Ao; Tue, 20 Sep 2022 17:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663694810; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vf4SWT654FdYobDvJdXk5Qbm/45ar0C8Ef6qbNZzX8An7in+9Gs1SbmlDfxCq63lgY5Gx/Z+UkOJe2FZ+dHa6Fgb0YYaYv3kyORMgyROjMhrILA4eiuyL7BKht5V64BAUddWo5mNAuNgjpgNw3ZPWM3EEFZMMTM21sFYEqE37eo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663694810; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=q2aHD/2EQ0E3NOJZmAmLUmUUrpAWHblOhyutE0P5unM=; 
	b=YhUNPcWi8hNKxBIlyxgHkOfXjh8EeC+FTV+tG13wj2UNK6ohCpNzM+3Rmk9Mb7TqSWfNKIR7mDvxApUiw38Bdn5g97M3NZiii46uxILHBwMphK2EqjJ2M7YFgnn6g2EECS5+/j3r1FlnrRFW/Urljbj7yvCuL58e1dM4aE1yf1E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663694810;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=q2aHD/2EQ0E3NOJZmAmLUmUUrpAWHblOhyutE0P5unM=;
	b=EiaQkh4dX2Q7XjYLdtQcB/Irw5Ut8+4ukyCjOfZjfwQJqi/lr22tQfeQ7Fu9EQ3M
	Qu1whWvYaV9+LyB5FSoru0CKypyK0OBfcKZGYK2KpdKVB+MK8f3/89uUGtTBuHfeNzF
	3YyLZNSebvjUxuarSZ9NHnq8WzY/3GUjUUfRZK4s=
Received: from arinc9-Xeront.fusolab.local (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663694806491670.9202934830495; Tue, 20 Sep 2022 10:26:46 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 net-next 03/10] dt-bindings: net: dsa: mediatek,mt7530: expand gpio-controller description
Date: Tue, 20 Sep 2022 20:25:49 +0300
Message-Id: <20220920172556.16557-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920172556.16557-1-arinc.unal@arinc9.com>
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_102708_468623_AA73191E 
X-CRM114-Status: UNSURE (   9.90  )
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

Expand the description of the gpio-controller property to include the
controllable pins of the MT7530 switch.

The gpio-controller property is only used for the MT7530 switch. Therefore,
invalidate it for the MT7531 switch.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 138ee6bff267..f2e9ff3f580b 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -104,7 +104,14 @@ properties:
   gpio-controller:
     type: boolean
     description:
-      If defined, MT7530's LED controller will run on GPIO mode.
+      If defined, LED controller of the MT7530 switch will run on GPIO mode.
+
+      There are 15 controllable pins.
+      port 0 LED 0..2 as GPIO 0..2
+      port 1 LED 0..2 as GPIO 3..5
+      port 2 LED 0..2 as GPIO 6..8
+      port 3 LED 0..2 as GPIO 9..11
+      port 4 LED 0..2 as GPIO 12..14
 
   "#interrupt-cells":
     const: 1
@@ -263,6 +270,7 @@ allOf:
     then:
       $ref: "#/$defs/mt7531-dsa-port"
       properties:
+        gpio-controller: false
         mediatek,mcm: false
 
   - if:
-- 
2.34.1


