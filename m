Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64E5C32774
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auj7qQ5/aix+HuhW0IHlBxdSquG9BXFzhbv1T/Lezro=; b=t4dl3q+tQ1vVmFh/7G/blUExBM
	F7sND0NMVPp2lFTRJFHgzjphbRa40zF4D949KWjdn57KSLVu/S0S/HDvkLDOaTD90H3LwozAzN7YG
	HvzORt7wLGgQmWBzhYq2Kf8uUVfeW0MmQOfiUPjwzr+oIs+iRE44rChmWmcoSoYWwZS2YROwyW5zi
	1dqgi/gauDaYmB0bJe5XM4VuL2N/+1lOPfdquhUAmE16qYnSH0IoFyrtaBl0Dkkd2BKWKlwZL4KVf
	sIRQKiBOZtmt85glH/ZbLQ6DqvLSxwSrG/f3Rgw9NKN38CwU3BD6fk5gjTg9J0R8i7jB1fJRhAVOM
	deF5OCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJYY-004f1A-JQ; Sat, 20 Aug 2022 08:10:10 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJXN-004e1k-2E; Sat, 20 Aug 2022 08:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660982914; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cw+s+Ut4zFB2EFf5KX8jrEmghyXXyMk8ToPt/Sqil5andrBgX+SR/GSzNqHjtVteskjYjtCrP3NZIINPYC0OTHQiaITEmab6VnxB+rdttqduF0C+Lk9U6fo/K3JSgmdRW/tsNhpVG4f5nEaMLwClJU+vFxLEz9RWIuhWnb36Ego=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660982914; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=auj7qQ5/aix+HuhW0IHlBxdSquG9BXFzhbv1T/Lezro=; 
	b=E3Y/vw/9vhU+GHAF9imAixGYYKBaHal469qHMWfr3LSuTDqMWksUWCt+jGU4a+JMWj9C+jX34bznoIWB1UEbHl+6ikF9PdI2lZ3MMyB1A9LIaKm2d5l60bdIIUqNJPIMzA6nnrlHxqwtMMfbwdfJvSnIy0XF2l+xWG6VtZnn+fI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660982914;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=auj7qQ5/aix+HuhW0IHlBxdSquG9BXFzhbv1T/Lezro=;
	b=KUB3gvE9Y6QAnlhorBrrGMVtEvE+TYNfKA1DBlAgBZbN1umqwcQUmRM+K5Z9mEQB
	eLCpm6HKQaIcla+iOmmn0teKjOKQt4oHncCycW3STkbRWWbIHEA52+bG09x8lgWvxEC
	uiKUMECuZinvSPo7CoGofUeK0huJMm4ZII6yrfGo=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 166098291317911.246125532335668; Sat, 20 Aug 2022 01:08:33 -0700 (PDT)
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
Subject: [PATCH v4 4/6] dt-bindings: net: dsa: mediatek,mt7530: define port binding per switch
Date: Sat, 20 Aug 2022 11:07:56 +0300
Message-Id: <20220820080758.9829-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220820080758.9829-1-arinc.unal@arinc9.com>
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_010857_184536_8DE1CEC5 
X-CRM114-Status: UNSURE (   7.74  )
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

Define DSA port binding per switch model as each switch model requires
different values for certain properties.

Define reg property on $defs as it's the same for all switch models.

Remove unnecessary lines as they are already included from the referred
dsa.yaml.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 56 +++++++++++--------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 657e162a1c01..7c4374e16f96 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -130,38 +130,47 @@ properties:
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
+required:
+  - compatible
+  - reg
 
-        properties:
-          reg:
-            description:
-              Port address described must be 5 or 6 for CPU port and from 0
-              to 5 for user ports.
+$defs:
+  dsa-port-reg:
+    properties:
+      reg:
+        description:
+          Port address described must be 5 or 6 for CPU port and from
+          0 to 5 for user ports.
 
-        allOf:
-          - $ref: dsa-port.yaml#
-          - if:
+  mt7530-dsa-port:
+    patternProperties:
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-9]+$":
+            $ref: "#/$defs/dsa-port-reg"
+            if:
               properties:
                 label:
                   items:
                     - const: cpu
             then:
               required:
-                - reg
                 - phy-mode
 
-required:
-  - compatible
-  - reg
+  mt7531-dsa-port:
+    patternProperties:
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-9]+$":
+            $ref: "#/$defs/dsa-port-reg"
+            if:
+              properties:
+                label:
+                  items:
+                    - const: cpu
+            then:
+              required:
+                - phy-mode
 
 allOf:
   - $ref: dsa.yaml#
@@ -185,6 +194,7 @@ allOf:
           items:
             - const: mediatek,mt7530
     then:
+      $ref: "#/$defs/mt7530-dsa-port"
       required:
         - core-supply
         - io-supply
@@ -195,6 +205,7 @@ allOf:
           items:
             - const: mediatek,mt7531
     then:
+      $ref: "#/$defs/mt7531-dsa-port"
       properties:
         mediatek,mcm: false
 
@@ -204,6 +215,7 @@ allOf:
           items:
             - const: mediatek,mt7621
     then:
+      $ref: "#/$defs/mt7530-dsa-port"
       required:
         - mediatek,mcm
 
-- 
2.34.1


