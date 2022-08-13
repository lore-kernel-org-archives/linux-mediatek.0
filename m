Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93157C19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Aug 2022 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jeVUYQX9J/2owiK6eAWTqPnBtbCS5zQ8DbyaccFKw4=; b=u9bYcZ6XQzC8iuT7VAs0/8WmHB
	6z4jixyaeE7w4Ct+DZZDKwr0aSEXeBkJokvJddwzgQvDuco/lbBxgnuTZl85i7CPcBANN9Ges6Gea
	2Gwv7WI/DjDdCz2hb63PV8rVycjkz8ZubMdY1c5zlZQfpCP7xYwTJWULZFQClkEP347fTXtMydAtK
	OWS+Uvj5CY5QQNUWd7i7dUAcZIfqhPvz6SSWQXatWhupBrmR1oh3oU+4JhB9LXLvnxg22y5zy056X
	yU/lxmIo7rLJ1T1TRGMLf30t1xP72dwZcc8g2Sa7LieqNIm3PV7KTIV+Isfvh4SveEwXF48Ofjv/v
	rxNUCifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtLO-00FYx8-N7; Sat, 13 Aug 2022 15:46:34 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtKD-00FY98-U7; Sat, 13 Aug 2022 15:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660405501; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ErqpvuYoieUM4bDr40iitvrnhevKZD1muIBJaJW10Cvzxuvzfeaab4OIRdOIlzAWGlaXSVad4cFrChjbEys+XdiRoCZtgz6wnoBgE2Sl/Bi4JYDSMvvaaXMpvDfA4Cw9HdzRge8DW7VtMqzmpI6KWu7duCg+NWit3QjyKYzLNqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660405501; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2jeVUYQX9J/2owiK6eAWTqPnBtbCS5zQ8DbyaccFKw4=; 
	b=dgyzKOuqGpcvUgaeqi8tLo9TqVzFnNp5sfyuvARuehEijDND8GpMGGAMz7qrywxcROGC72cj0AiD8bsi28I7gRWM902Mes0/jV3wCQbf1oY2eoV+ZxbcVRtnKnJPjJ6oNrp4qUVoXciwLzvBVsnW+ZX8Q/9memcs8OihdMLJKrs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660405501;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=2jeVUYQX9J/2owiK6eAWTqPnBtbCS5zQ8DbyaccFKw4=;
	b=HIhGksqYfYrSyXo1fZDr2KdRk1HnkOVjwFMiLGaNpe6G3o+wZP4G2wf6kcvHvhfl
	rqIOt/5yM0gDAVmUPHVC8OpuZ5vOgH1BADx7n5oPP+Lj5LJNuF0aLGXZkdVTFMM843s
	PQLbrJWGgmfOT1u50KrebK6zKfktkSQhZnr7kEMo=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1660405500648584.308589731525; Sat, 13 Aug 2022 08:45:00 -0700 (PDT)
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
Subject: [PATCH v2 4/7] dt-bindings: net: dsa: mediatek,mt7530: define port binding per compatible
Date: Sat, 13 Aug 2022 18:44:12 +0300
Message-Id: <20220813154415.349091-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220813154415.349091-1-arinc.unal@arinc9.com>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_084522_073875_453C8405 
X-CRM114-Status: UNSURE (   8.12  )
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

Define DSA port binding under each compatible device as each device
requires different values for certain properties.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 116 +++++++++++++-----
 1 file changed, 87 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index cc87f48d4d07..ff51a2f6875f 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -130,35 +130,6 @@ properties:
       ethsys.
     maxItems: 1
 
-patternProperties:
-  "^(ethernet-)?ports$":
-    type: object
-
-    patternProperties:
-      "^(ethernet-)?port@[0-9]+$":
-        type: object
-        description: Ethernet switch ports
-
-        unevaluatedProperties: false
-
-        properties:
-          reg:
-            description:
-              Port address described must be 5 or 6 for CPU port and from 0
-              to 5 for user ports.
-
-        allOf:
-          - $ref: dsa-port.yaml#
-          - if:
-              properties:
-                label:
-                  items:
-                    - const: cpu
-            then:
-              required:
-                - reg
-                - phy-mode
-
 required:
   - compatible
   - reg
@@ -189,6 +160,35 @@ allOf:
         - core-supply
         - io-supply
 
+      patternProperties:
+        "^(ethernet-)?ports$":
+          type: object
+
+          patternProperties:
+            "^(ethernet-)?port@[0-9]+$":
+              type: object
+              description: Ethernet switch ports
+
+              unevaluatedProperties: false
+
+              properties:
+                reg:
+                  description:
+                    Port address described must be 5 or 6 for CPU port and from
+                    0 to 5 for user ports.
+
+              allOf:
+                - $ref: dsa-port.yaml#
+                - if:
+                    properties:
+                      label:
+                        items:
+                          - const: cpu
+                  then:
+                    required:
+                      - reg
+                      - phy-mode
+
   - if:
       properties:
         compatible:
@@ -198,6 +198,35 @@ allOf:
       properties:
         mediatek,mcm: false
 
+      patternProperties:
+        "^(ethernet-)?ports$":
+          type: object
+
+          patternProperties:
+            "^(ethernet-)?port@[0-9]+$":
+              type: object
+              description: Ethernet switch ports
+
+              unevaluatedProperties: false
+
+              properties:
+                reg:
+                  description:
+                    Port address described must be 5 or 6 for CPU port and from
+                    0 to 5 for user ports.
+
+              allOf:
+                - $ref: dsa-port.yaml#
+                - if:
+                    properties:
+                      label:
+                        items:
+                          - const: cpu
+                  then:
+                    required:
+                      - reg
+                      - phy-mode
+
   - if:
       properties:
         compatible:
@@ -207,6 +236,35 @@ allOf:
       required:
         - mediatek,mcm
 
+      patternProperties:
+        "^(ethernet-)?ports$":
+          type: object
+
+          patternProperties:
+            "^(ethernet-)?port@[0-9]+$":
+              type: object
+              description: Ethernet switch ports
+
+              unevaluatedProperties: false
+
+              properties:
+                reg:
+                  description:
+                    Port address described must be 5 or 6 for CPU port and from
+                    0 to 5 for user ports.
+
+              allOf:
+                - $ref: dsa-port.yaml#
+                - if:
+                    properties:
+                      label:
+                        items:
+                          - const: cpu
+                  then:
+                    required:
+                      - reg
+                      - phy-mode
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


