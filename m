Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53840C25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aqR9O1ypsm2Ib82yZoFMp4k7R74DV794Aen1osXdYY=; b=loVxkEGkRde1TKcH0gBXcBruvK
	RwhIcviJme3a83jaKhgrzk8eczBRhuTyf6B+LLky6GDn96A2Ic4BVNBl1XRRu9yvUgPmJScv+GU3f
	1syuyBR2hCPa/2VFYTb3Yu7Muwg6GCqTn9WF21p+NTvctd3XfeWUogvCl69YAvxCrMO9A7pH0ut5x
	hlnzp/D/LU+aRMAaZGNtAUBKsGCkBr6lwn9UzTje54MNzMoXNIHXvb6UY4n0voaMKJk4EDRaqyrGi
	heLibwKDHgHKMFSDYKFpsKkr7WZrafO1uIbH8S9iP8S1qfUVAICq+s1A47ujN3w/ZF0iTELJ1rGsc
	7WWUaB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJZ3-004fOw-IN; Sat, 20 Aug 2022 08:10:41 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJXS-004e5P-6R; Sat, 20 Aug 2022 08:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660982920; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EhvwNYOEg474UV2LgtdxYXDxjL9EMMV5Xk2fSRhCi6ChNrZ+UWIwZ8L84uTOCTnQ7zQXFgi/3JRQaBqJvY6BKAQIR3reBkGePZ2B2GW8lv9wsohq9VrZWTLuowUOYgULnkEENVkuKwxj+9eXxanFmcMOdnKrBAsaHkdpTJU9Kug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660982920; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6aqR9O1ypsm2Ib82yZoFMp4k7R74DV794Aen1osXdYY=; 
	b=kTKXPN8qyfHzGOVje9qmJE+J1p5D7WMNDmqx0seACv/wvQJpRhR6YYMGeIEIbo7d1r82VzYwBYZwXuW+QCHqhfVG4TKcZ6STTFuht7Tsq4mAKaao/Fur+PLCFZr14CNPLgpPNqUhKpawtEgvhDI9IRVpSwSN5dHF1YE+tSauLS0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660982920;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=6aqR9O1ypsm2Ib82yZoFMp4k7R74DV794Aen1osXdYY=;
	b=HK0MA+5Rl/kZGQ0l/Uy0/37/dHcq+DzUPerke/284vfWGbPzUf9tb9hrD9s8Op7a
	pC0BkGWjHMsXIWIrWZtpaNW7W/y1LNDb2191ZJIqwbRpHJUZ0ntvw98ebLgaeRZLsfB
	89q1zdur9xHiBh6rG2F3pYdRktRUFl/pQgKpsLks=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1660982919579888.5977647355193; Sat, 20 Aug 2022 01:08:39 -0700 (PDT)
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
Subject: [PATCH v4 5/6] dt-bindings: net: dsa: mediatek,mt7530: define phy-mode for switch models
Date: Sat, 20 Aug 2022 11:07:57 +0300
Message-Id: <20220820080758.9829-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220820080758.9829-1-arinc.unal@arinc9.com>
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_010902_343616_D3A8F9B9 
X-CRM114-Status: UNSURE (   8.66  )
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
index 7c4374e16f96..eff2f0c6182e 100644
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
@@ -154,6 +143,30 @@ $defs:
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
 
@@ -169,6 +182,32 @@ $defs:
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


