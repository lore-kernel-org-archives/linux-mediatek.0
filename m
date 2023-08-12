Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A93C001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38WNKp1tIHZuWDWyB1VGwPuC9C9gEwniYXC3BCan83U=; b=BsU894dMx8luxxj7u6mHl7TXaH
	vLLlt8ei8VdEUKS81cLQBdCuNrhImBIR0cNIc/CEOe5b5/ZTgTeT4pX93OooZN1fZzYixTPnou9YI
	5YXlWKV6iEP4HrbS/bqITp7cXbzPSsMM72XWUrxnRwb8eL2yknH/Q2mPFolx0L35K++Bld67ZjLUv
	vP+kM1UKnIMf8cW1EpazcDW0ND0LeMLg7Rb8k/0m+hgX/wMpr832+Ggf14/RMaYf6/8ZB/UUCDzRX
	N+y3SXtjZv9yo6KNhAqKcswDxGXjm47X8B9J+QdNCMKvwXwlXviyL9s5uyIc8CYH2oZY6q/xfwl19
	7H3cPo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUrTQ-00Di28-08;
	Sat, 12 Aug 2023 16:28:20 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUrTM-00Di1Q-33;
	Sat, 12 Aug 2023 16:28:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A51C20002;
	Sat, 12 Aug 2023 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691857692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=38WNKp1tIHZuWDWyB1VGwPuC9C9gEwniYXC3BCan83U=;
	b=btMVtgRqMyn/AKspRKynx1G2Dg6YT82EWik4KPC2lQZOo2oqPltopNdfNbwNV0UyqDhE57
	rr5W7V6PXFcb21pzwX6pidCTc59c5yFAQEzbd8HiPS7Qlt5c47y5gwn3qqmcymz1ZBFWLb
	gn4zfwmCj73tskoy7Zo0DZ7YEWXa1l7EMjaYIeF1/yHKlzXmNEbthAZb2fuGS4ne+9fhuP
	vRxUE52SRldB0IBCiLxjw2eC3p4o39sQD0Us2JJ8zo5aCkBeFtuqkoYz36g9U20Ew+zYxD
	DQuA9Serq/WreUiX/0ilFqR/G95g9WzbLkrtZKdjy+lnp/sBSEB27QOHtuPoAA==
Message-ID: <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
Date: Sat, 12 Aug 2023 19:28:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230812091708.34665-3-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_092817_301203_46A2BAB9 
X-CRM114-Status: UNSURE (   8.23  )
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

I changed this to below. I will wait for reviews before submitting v2.

The realtek.yaml schema extends the mdio.yaml schema. The mdio.yaml schema
is also being referred to through dsa.yaml#/$defs/ethernet-ports now which
means we cannot disallow additional properties by 'unevaluatedProperties:
false' on the dsa.yaml schema.

On the realtek.yaml schema, refer to dsa.yaml#/properties/mdio instead to
point the human readers to the description on the dsa.yaml schema.

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
index cfd69c2604ea..f4b4fe0509a0 100644
--- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
@@ -96,7 +96,7 @@ properties:
        - '#interrupt-cells'
  
    mdio:
-    $ref: /schemas/net/mdio.yaml#
+    $ref: dsa.yaml#/properties/mdio
      unevaluatedProperties: false
  
      properties:

Arınç

