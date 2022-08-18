Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE4BC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWNYVGiTjPtPc/6FPyJ0S/2bJSMkD8JLkLPy2T5896U=; b=chagANfBqhe+uBNUQIMVM8gqpt
	90HDp/H5eSqukK375po41W68Ey487X4h9oAopsPLvUaEOpiZXcxhvMDXffWcVYykFrUSmR4vSmkvE
	kawiLxpWxaMvnxthJQjdWGKdEd8OtQyQQ96LTO0nAf+06zDXBXWe/lrsjDRf5X05BBXCBtLV4xXLW
	ri+OuptHiK0EXgjyAH/5Rsritvxz78AZUV21V1zss0hkrEwQHIFzz07Zx0wB5bXE26a5pbKQJKC3j
	doeooOpbUnz5ddgfWPIfl0E/XmKuccD9c5j8ILsr4OdhNUlqkTVC3QfkS1BZ3R7ejgMTHo8oNvpsV
	TGHWXl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObg6-001Vc0-0a; Thu, 18 Aug 2022 09:19:02 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oObea-001UA7-PK; Thu, 18 Aug 2022 09:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660814225; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QgoH4GrKf8HDFVt/8Fs49hY/kg92xp6tdS37jBQyJsqqB0MMmb5USLJbUX+udfCgdQtIXGj1JWac8WyadzODEa4kBbBXm8il0BuB0x47oxLel6+tRBbZEEfjKMM04QUbA5YTNtLrpZpDvK7udFK0GO712C5yARRwn45w+7u0tIY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660814225; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=wWNYVGiTjPtPc/6FPyJ0S/2bJSMkD8JLkLPy2T5896U=; 
	b=N0oaK/BSi6WvtURSkZPnN8btU9lc/NoZEgG63ywfAfAHZ2AZ+mml4DHVKp+Kz7QImtatYo2V6dX4/bHLbuG3TdeqqG/qWoFoY3X4S+BzGOjqpfDoBWNys6yIn+7vZEP80urLOzj66e74Ez99ByDCWwyHwWeUMtLSFjgsIHAwvIM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660814225;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=wWNYVGiTjPtPc/6FPyJ0S/2bJSMkD8JLkLPy2T5896U=;
	b=dlTHnTndnu4TosT6JgT8zIVfKRD+INelJZiD2aq5T8Yi+jpvPE9AJDvP76GawDW5
	H0jGH1Kch2CJwcCQm1zmAzJUq+XbmRVet8IPNdYN+w1/+Y2Tga6KXxK00fxg/o9ZIAy
	cyMmGRK9qCLPSfmc0jaCJ9Vm7LUqM6oOwCsbDNmo=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1660814224598289.3097465535868; Thu, 18 Aug 2022 02:17:04 -0700 (PDT)
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
Subject: [PATCH v3 4/6] dt-bindings: net: dsa: mediatek,mt7530: define port binding per switch
Date: Thu, 18 Aug 2022 12:16:25 +0300
Message-Id: <20220818091627.51878-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818091627.51878-1-arinc.unal@arinc9.com>
References: <20220818091627.51878-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_021728_903286_66CC3750 
X-CRM114-Status: UNSURE (   8.08  )
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

Remove unnecessary lines as they are already included from the referred
dsa.yaml.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 59 ++++++++++++-------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 657e162a1c01..b6c5cf4e706b 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -130,38 +130,50 @@ properties:
       ethsys.
     maxItems: 1
 
-patternProperties:
-  "^(ethernet-)?ports$":
-    type: object
+required:
+  - compatible
+  - reg
 
+$defs:
+  mt7530-dsa-port:
     patternProperties:
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
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-9]+$":
+            properties:
+              reg:
+                description:
+                  Port address described must be 5 or 6 for CPU port and from
+                  0 to 5 for user ports.
+
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
+            properties:
+              reg:
+                description:
+                  Port address described must be 5 or 6 for CPU port and from
+                  0 to 5 for user ports.
+
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
@@ -185,6 +197,7 @@ allOf:
           items:
             - const: mediatek,mt7530
     then:
+      $ref: "#/$defs/mt7530-dsa-port"
       required:
         - core-supply
         - io-supply
@@ -195,6 +208,7 @@ allOf:
           items:
             - const: mediatek,mt7531
     then:
+      $ref: "#/$defs/mt7531-dsa-port"
       properties:
         mediatek,mcm: false
 
@@ -204,6 +218,7 @@ allOf:
           items:
             - const: mediatek,mt7621
     then:
+      $ref: "#/$defs/mt7530-dsa-port"
       required:
         - mediatek,mcm
 
-- 
2.34.1


