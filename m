Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84042C0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsRwvKVYtk21gU+9mAWLQMZ2egmxY1XWYNUSUt9DxMo=; b=AFOVeQ8SRcM8v88ulI0YGXcbsf
	KN8Bf9S2FY5EdjbNkDP/GWlJxRh5EgWWhBVNVkStikHqVmelJ7zmsfN25Ay7on5Y2u98Kqooc55Wh
	9duSD3neFl6NDcnW2IcbqVbtoirXe51cmJhNz2tPfy4CO1TM9xf93Y++VwhO43Em7CavtPFtREkum
	eB3ZJezE1JOtnYFzg/zsDblKCOqz/T6pcA2AEavUQgPh6A/V7ibdim9qmS8ZADxqdZURAMP4MumK6
	NTbys9HuWqJ8dA0gLfXhczYx+WpHECWektvH4IQdMdmQC1UnEPcwEKmFpNIzAmSFdWmRHQvaZMU6P
	UCg9rvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkke-00D0Qw-1b;
	Sat, 12 Aug 2023 09:17:40 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUkka-00D0Oz-2A;
	Sat, 12 Aug 2023 09:17:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9372F1BF204;
	Sat, 12 Aug 2023 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691831854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LsRwvKVYtk21gU+9mAWLQMZ2egmxY1XWYNUSUt9DxMo=;
	b=FwNw7L1GC8Df9y3lwueMde8imrg8OOVhGbTF/yJ67+g0C8mgismJeZHjEW3fLSi3mOzqoL
	NRZ/x93oZYTZVUKrYZTZJZkljv/76NiYLplgGPGW1yarpIQObKhpmDxg6bCZKtcDWtb2x2
	yQc34XfD21nFUSAMKODDiLNRjbygrAE9TSyDj1ln4rxOIWF92F+IFFhcIKfpBgjrpbIUO4
	31dxjC/E8cnKH/GE4TtXmPIB5ttnTxTTi0dZQ94yRCrU5ZvSsTFXQFMEox2qqLVVAILsFG
	ZqM40yaY1DizcfKIJSWOY/HylHGYZXjZojkpOpN7/0p1a2a6+rZCdA07FIvmLA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Date: Sat, 12 Aug 2023 12:17:06 +0300
Message-Id: <20230812091708.34665-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812091708.34665-1-arinc.unal@arinc9.com>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_021736_989089_6798110A 
X-CRM114-Status: UNSURE (   9.86  )
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

Add the schema to document the internal MDIO bus. Adjust realtek.yaml
accordingly.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/net/dsa/dsa.yaml      | 18 +++++
 .../devicetree/bindings/net/dsa/realtek.yaml  | 66 +++++++++----------
 2 files changed, 50 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
index ec74a660beda..03ccedbc49dc 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
@@ -31,6 +31,24 @@ properties:
       (single device hanging off a CPU port) must not specify this property
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
+  mdio:
+    description: The internal MDIO bus of the switch
+    $ref: /schemas/net/mdio.yaml#
+
+if:
+  required: [ mdio ]
+then:
+  patternProperties:
+    "^(ethernet-)?ports$":
+      patternProperties:
+        "^(ethernet-)?port@[0-9]+$":
+          if:
+            not:
+              required: [ ethernet ]
+          then:
+            required:
+              - phy-handle
+
 additionalProperties: true
 
 $defs:
diff --git a/Documentation/devicetree/bindings/net/dsa/realtek.yaml b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
index cfd69c2604ea..ea7db0890abc 100644
--- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Realtek switches for unmanaged switches
 
-allOf:
-  - $ref: dsa.yaml#/$defs/ethernet-ports
-
 maintainers:
   - Linus Walleij <linus.walleij@linaro.org>
 
@@ -95,37 +92,38 @@ properties:
       - '#address-cells'
       - '#interrupt-cells'
 
-  mdio:
-    $ref: /schemas/net/mdio.yaml#
-    unevaluatedProperties: false
-
-    properties:
-      compatible:
-        const: realtek,smi-mdio
-
-if:
-  required:
-    - reg
-
-then:
-  $ref: /schemas/spi/spi-peripheral-props.yaml#
-  not:
-    required:
-      - mdc-gpios
-      - mdio-gpios
-      - mdio
-
-  properties:
-    mdc-gpios: false
-    mdio-gpios: false
-    mdio: false
-
-else:
-  required:
-    - mdc-gpios
-    - mdio-gpios
-    - mdio
-    - reset-gpios
+allOf:
+  - $ref: dsa.yaml#/$defs/ethernet-ports
+  - if:
+      required: [ mdio ]
+    then:
+      properties:
+        mdio:
+          properties:
+            compatible:
+              const: realtek,smi-mdio
+
+  - if:
+      required:
+        - reg
+    then:
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+      not:
+        required:
+          - mdc-gpios
+          - mdio-gpios
+          - mdio
+
+      properties:
+        mdc-gpios: false
+        mdio-gpios: false
+        mdio: false
+    else:
+      required:
+        - mdc-gpios
+        - mdio-gpios
+        - mdio
+        - reset-gpios
 
 required:
   - compatible
-- 
2.39.2


