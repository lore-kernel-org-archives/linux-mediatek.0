Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C170BC32796
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPz/gqrs9UAnKOmU1LI09g/Gr7azGI9lnGYOIQMvUFk=; b=DargLFOaAdxWEgJk8iq2wPpO/Y
	RYrQjk/8MRpze9jqx75r7gWlI6CnhgKz046L/W9Hisy4uMB9HOUF8Z2Sbx3BDLeHMFOmRgePNOs9C
	TivYjvsRfowUFfNdLGHcFO6M104vqYbARpz4hfzTM+2Z2NoQ9QiEZvfkb7Q0Fo70t8cZAt2Lx92eI
	1RctaY8h5fRAW6Z2V1w0RjvzzI9AcWISsit5DvPWnPIAzHNdWCPuyq7RxrnNQPoE7yjztWXztUmdg
	YuZoHODg3yJfnWhMa1ffAJOAvGCRID+JhAOAWhmdrh10TrAZGDNYpwMZo/4i5VQERMVM7F0j2cRiL
	QOgH2U1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnrk-00CABD-Rc; Wed, 24 Aug 2022 10:44:08 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnrP-00CA3I-Pk; Wed, 24 Aug 2022 10:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661337803; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nOoBOmU1Lb71NWhB2kDvzWmG5Dn1qDFV/HSZYLjIk1150z3WRzkGuft6EVjcIKH3Il1fNg3hl0S8tuOMp5VimqpZxZePLCF+2PVBQzvRJa1anXgsap4Ve2t/6n54Zfbl4arW399C2VxT86SmVt0O1U07YDyhR0dsuD1W7km91A0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661337803; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=EPz/gqrs9UAnKOmU1LI09g/Gr7azGI9lnGYOIQMvUFk=; 
	b=lrNp5E/Xq8bzuTe1twNKOL8vIOOUZhZVMopUN7ukMquQt79WgdedBDAxzWXZj7TLV/Z2glv5V1kt69vNYinPY7tBnuEXY+RNer9ORNWgh8GjPWCe9A5v4hXFYsoFAMNptqUFmGZFeQEgT4Wo+OksWeRkK9+5WiB9h3Lt87/fFzI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661337803;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=EPz/gqrs9UAnKOmU1LI09g/Gr7azGI9lnGYOIQMvUFk=;
	b=TerAnyEyLODYhnd2lUysyep/ok/gbByuBHS5w002mmmiVwQnk2EiFkkNcYxg3jZ+
	8G8a++G8IzgAtNhR721NabSWd0jPiVBh41aROvsGoEAyufKzXZFULGQB3iIAlQTvPPm
	1NnC+SARSXiXYOotCmSBgrO6PUtHUrN97ZxDO46A=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661337800739519.6884663029855; Wed, 24 Aug 2022 03:43:20 -0700 (PDT)
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
Subject: [PATCH v5 1/7] dt-bindings: net: dsa: mediatek,mt7530: make trivial changes
Date: Wed, 24 Aug 2022 13:40:34 +0300
Message-Id: <20220824104040.17527-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824104040.17527-1-arinc.unal@arinc9.com>
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_034347_911224_49EDE0D9 
X-CRM114-Status: GOOD (  11.52  )
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

Make trivial changes on the binding.

- Update title to include MT7531 switch.
- Add me as a maintainer. List maintainers in alphabetical order by first
name.
- Add description to compatible strings.
- Stretch descriptions up to the 80 character limit.
- Remove lists for single items.
- Remove quotes from $ref: "dsa.yaml#".

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 39 +++++++++++--------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 17ab6c69ecc7..4dc85a1cdfb5 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -4,12 +4,13 @@
 $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT7530 Ethernet switch
+title: Mediatek MT7530 and MT7531 Ethernet Switches
 
 maintainers:
-  - Sean Wang <sean.wang@mediatek.com>
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Landen Chao <Landen.Chao@mediatek.com>
   - DENG Qingfang <dqfext@gmail.com>
+  - Sean Wang <sean.wang@mediatek.com>
 
 description: |
   Port 5 of mt7530 and mt7621 switch is muxed between:
@@ -61,10 +62,18 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7530
-      - mediatek,mt7531
-      - mediatek,mt7621
+    oneOf:
+      - description:
+          Standalone MT7530 and multi-chip module MT7530 in MT7623AI SoC
+        const: mediatek,mt7530
+
+      - description:
+          Standalone MT7531
+        const: mediatek,mt7531
+
+      - description:
+          Multi-chip module MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs
+        const: mediatek,mt7621
 
   reg:
     maxItems: 1
@@ -79,7 +88,7 @@ properties:
   gpio-controller:
     type: boolean
     description:
-      if defined, MT7530's LED controller will run on GPIO mode.
+      If defined, MT7530's LED controller will run on GPIO mode.
 
   "#interrupt-cells":
     const: 1
@@ -92,8 +101,8 @@ properties:
   io-supply:
     description:
       Phandle to the regulator node necessary for the I/O power.
-      See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
-      for details for the regulator setup on these boards.
+      See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
+      details for the regulator setup on these boards.
 
   mediatek,mcm:
     type: boolean
@@ -110,8 +119,8 @@ properties:
 
   resets:
     description:
-      Phandle pointing to the system reset controller with line index for
-      the ethsys.
+      Phandle pointing to the system reset controller with line index for the
+      ethsys.
     maxItems: 1
 
 patternProperties:
@@ -136,8 +145,7 @@ patternProperties:
           - if:
               properties:
                 label:
-                  items:
-                    - const: cpu
+                  const: cpu
             then:
               required:
                 - reg
@@ -148,7 +156,7 @@ required:
   - reg
 
 allOf:
-  - $ref: "dsa.yaml#"
+  - $ref: dsa.yaml#
   - if:
       required:
         - mediatek,mcm
@@ -163,8 +171,7 @@ allOf:
   - if:
       properties:
         compatible:
-          items:
-            - const: mediatek,mt7530
+          const: mediatek,mt7530
     then:
       required:
         - core-supply
-- 
2.34.1


