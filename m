Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6767FC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgkEJPRHfhmBzG1fz6Px6SFuhmQW5PscDfkr1hfPyIg=; b=ucadkYcVUyhMgj2CE5Eo3wn3Zw
	tyqut7sahkHszM1YMbQ5rNQ7aN1UcSqqiobS0i2PeK9TuOXisqS8oaCGwf0dTSTqCU3Bd6YV9PLjl
	v7uF1LZ8zXNywNNgsTCTyzYaC4j3VcmeEz0+MU4vDrTmXpDEMj85eNPfG3ZeYN2HEXxHE3RGh08Xk
	WXNfsrcpnrnguyhfqw0Emwhyc/pygK6+jGKbODX8mo/MxsHFZUXYdz3uDf8tvysrrh9k/Qpj55UyD
	AzXLYJLxSoonQam4skrAr3zTInpAFHpmVf16Klhd+eExxzetNl/eyGwh+jbRS7bK4EGh3TWY21lPn
	PkBe2a3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnti-00CBMn-3a; Wed, 24 Aug 2022 10:46:10 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnrt-00CAGY-M2; Wed, 24 Aug 2022 10:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661337835; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nGBayXmFjxXQke5t4+LXhpw908kxXlrbaI77yke/xdxLf8u0Aq66+/yHxuQsPYN3XKQ6NIuobFEKD/jMOHzoeXqTqQJAfWL8tWu3d1VkAemAbn0x88IV3DA9h05fiEFuV6LggzQGNxtCXeDKYWvyZ638doYDvhqb7HkcLcmfjTU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661337835; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vgkEJPRHfhmBzG1fz6Px6SFuhmQW5PscDfkr1hfPyIg=; 
	b=AM4gARZTqUrevflwPr49ka8L1RNRGoGGube50iFbGiHkCSnCscqI3h/TlAbgBWKs6lwZLvITPng0vQLeQj+Jf6GnTD7Fdpn1q7SiGony5Pmk8aBEC72PUn/jubEry+uqz3D9Uo6Hdwdv8OQWQH8xeeXpwHPoyYIBcRxNOwBhK4w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661337835;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=vgkEJPRHfhmBzG1fz6Px6SFuhmQW5PscDfkr1hfPyIg=;
	b=D1hEC3pLOt5nC1l8d4mkQeIM8tEhZ9V3YHaTidY7iBckJE/D3Eyaf0l+JjA7FvlN
	u0wBHjIAwuLeqiyY67q/TboeEmnsuRljN41Y8cym45Pjnm1oKLuO/yEeRS67nvNy6gY
	8Ssa8jaCBKbwHJPcw3n4F6IQXzZvi7GQG4VLrozA=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661337833791867.3390861462567; Wed, 24 Aug 2022 03:43:53 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v5 6/7] dt-bindings: net: dsa: mediatek,mt7530: define phy-mode for switch models
Date: Wed, 24 Aug 2022 13:40:39 +0300
Message-Id: <20220824104040.17527-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824104040.17527-1-arinc.unal@arinc9.com>
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_034417_794364_3B1406CF 
X-CRM114-Status: UNSURE (   9.08  )
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

Define acceptable phy-mode values for the CPU port of mt7530 and mt7531
switches. Remove relevant information from the description of the binding.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 61 +++++++++++++++----
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index a6003db87113..6d7228687d36 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -49,17 +49,6 @@ description: |
   * mt7621: phy-mode = "rgmii-txid";
   * mt7623: phy-mode = "rgmii";
 
-  CPU-Ports need a phy-mode property:
-    Allowed values on mt7530 and mt7621:
-      - "rgmii"
-      - "trgmii"
-    On mt7531:
-      - "1000base-x"
-      - "2500base-x"
-      - "rgmii"
-      - "sgmii"
-
-
 properties:
   compatible:
     oneOf:
@@ -150,6 +139,30 @@ $defs:
                 label:
                   const: cpu
             then:
+              if:
+                properties:
+                  reg:
+                    const: 5
+              then:
+                properties:
+                  phy-mode:
+                    enum:
+                      - gmii
+                      - mii
+                      - rgmii
+              else:
+                properties:
+                  phy-mode:
+                    enum:
+                      - rgmii
+                      - trgmii
+
+              properties:
+                reg:
+                  enum:
+                    - 5
+                    - 6
+
               required:
                 - phy-mode
 
@@ -164,6 +177,32 @@ $defs:
                 label:
                   const: cpu
             then:
+              if:
+                properties:
+                  reg:
+                    const: 5
+              then:
+                properties:
+                  phy-mode:
+                    enum:
+                      - 1000base-x
+                      - 2500base-x
+                      - rgmii
+                      - sgmii
+              else:
+                properties:
+                  phy-mode:
+                    enum:
+                      - 1000base-x
+                      - 2500base-x
+                      - sgmii
+
+              properties:
+                reg:
+                  enum:
+                    - 5
+                    - 6
+
               required:
                 - phy-mode
 
-- 
2.34.1


