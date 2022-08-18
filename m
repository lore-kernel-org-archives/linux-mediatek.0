Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07BBC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WCFNVdLELkDaCKJt4wFLENChRk7qUoEcMMckwo+ZtU=; b=oSJiev6oTQhPQkJ+BS59vtMnGn
	h4QIo2RD2ynzoOO+Wz/BJceQkdEPorWyh81PuuM4lLPsClSbzthgwSilS8oQ3PuSe39XpR3rv4Jck
	TF+ClQm+gBpEayGLHZFu8Ah7WgkeVIt0n4wA6cLErSsYXmxOwjvHNzeoBUC22adGuy2S2S5sePMxX
	/CX+p7/cmOGBaIvKf5b5KwOgMNdax4ybd2cCcUF43aDd0lSigBM63vzplu0rGCE+z2sEGa2rueHh2
	fSMNmYE8D8ynaAjK/vvUCx1WxKAh+H0u55MimAiDAfxkZFQ2Yt6hmgiGhYa1d+90Ir6duGo16OS1p
	CDsS2n3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObh9-001WZI-01; Thu, 18 Aug 2022 09:20:07 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObei-001UIf-Nf; Thu, 18 Aug 2022 09:17:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660814233; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YOeSYr9RupVsEGc02qy+WXfHXsy5yMuWb4tukLhIIkK/zd0mty0OLA4AV6GG2n35qBPGoKyw4ltf/fVbpx3EfVbQ8+c4auurV0S8DI9ZFz2F+aGjYi+5xuhido3c4NUV9v13nwpDMHW28KpPhNasOVVICo34LchIlA1Tpi62QQw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660814233; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6WCFNVdLELkDaCKJt4wFLENChRk7qUoEcMMckwo+ZtU=; 
	b=KPPa0YQgg7BzXSDTKAqchdhjk0aAVLvvr0aoQApggfRqp3J672CpTE/J4zWHyUAfrcROP2EKHhBOgI0iMpWRU5S4O4JvKvAgAHuFHEXhB17MTIhir4DA25xlEoQzS833AL3LYKUu7m8FEqp1S1zDOqyPtccGkGjVcYC+SskSgKY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660814233;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=6WCFNVdLELkDaCKJt4wFLENChRk7qUoEcMMckwo+ZtU=;
	b=gOezG8XRCN9vBophl5IydUxef5k4lSRImFaKjGrjHc8+wOSCDwsWhhWbMwZwDE7Z
	aa0Ea9Rfu5G7X3XBcfnG68NFK3JHUadF3IxGbOgBrCHIs74DvlY2r2yvyM3a55MwYa6
	mmDxIh5CshjWfvy+cjIta4E/OIz/czEmgsakxGpc=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1660814231021988.2191981946787; Thu, 18 Aug 2022 02:17:11 -0700 (PDT)
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
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v3 5/6] dt-bindings: net: dsa: mediatek,mt7530: define phy-mode for switch models
Date: Thu, 18 Aug 2022 12:16:26 +0300
Message-Id: <20220818091627.51878-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818091627.51878-1-arinc.unal@arinc9.com>
References: <20220818091627.51878-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_021736_891017_1623562E 
X-CRM114-Status: UNSURE (   9.39  )
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
index b6c5cf4e706b..b36497c4636e 100644
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
@@ -152,6 +141,30 @@ $defs:
                   items:
                     - const: cpu
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
 
@@ -172,6 +185,32 @@ $defs:
                   items:
                     - const: cpu
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


