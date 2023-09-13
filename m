Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9967CA5538
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHnJz9vPwCp13/wn71DlKTfF+k8HW1F+qyIl9mxelT0=; b=RtQoB9IIZFbxrhVQkpvWMxDGlE
	6xFiPQBeAzW2jkre2ES5hC4oUP3PD+UJK0x8AgNYphza1z2fNj8t2ozF0FMf1AIlTzE9vglPMak4F
	ncBDwIgHrUfQbz9nPJj5CpawujYqSC+fj6JYu3yUB2Kj8CNCmLNJjFH0I50o5BUM4MngFvI5W1/V9
	NCTGvcfbQazWBQ6ieGle1K3ZdDiJXU9dKLwPYq8hxMu0VurG2Oqk4bYcjX+F4gL69I8T7h/uGn5Zf
	ouynF6B+tnosink0/YX8fzqf7VD+BRTBDZh1+pmxKn8XfXzSMIeNs7DQtg7vnp085Aej+W2dziurw
	mKFL02OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNb4-005gZK-2a;
	Wed, 13 Sep 2023 10:59:50 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNb0-005gXp-10;
	Wed, 13 Sep 2023 10:59:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A857F60007;
	Wed, 13 Sep 2023 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694602782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHnJz9vPwCp13/wn71DlKTfF+k8HW1F+qyIl9mxelT0=;
	b=Pms5pXHS1wOzcaFjC50TNt2mweEv8a15tD8rol45QzcNoY1yhfrMHHh0DTtDSyvZO9xFHC
	86E4NTgkKKt6UD+4Yy0MVNcgVfR8sPSUjz7iJ8xEhREfI6jaW8eiN2o8DqySlq7f//dIV3
	hxZ4HjJO7v2D3TGhoViNFUCH16HGHZ4pBocm0rK/Tb51hpYmjQjkxT8Rtvz3E5Y/X52nSo
	v40h9cDMhyhGvjwn8D8bILflPQcjiQaz8uJwDCZN+UF4QWOu3C9DrZ2sj6n9Zyv/PbF0x0
	mHLutTjK9GvGr19DG5FDalQBnq/WhHGAtLwljmh/4rC2szWzPFGrr7Gbbyt17g==
Message-ID: <89c9b84c-574c-4071-9524-9207597a3f0a@arinc9.com>
Date: Wed, 13 Sep 2023 13:59:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
 <20230913074231.5azwxqjuv2wp5nik@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230913074231.5azwxqjuv2wp5nik@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_035946_753005_1417D127 
X-CRM114-Status: GOOD (  28.67  )
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

On 13.09.2023 10:42, Vladimir Oltean wrote:
> On Wed, Sep 13, 2023 at 08:52:37AM +0300, Arınç ÜNAL wrote:
>> On 12.09.2023 22:34, Vladimir Oltean wrote:
>>> Right, it should have been anyOf and not oneOf.. my mistake. It is a bug
>>> which should be fixed. It's the same phylink that gets used in both cases,
>>> user ports and shared ports :)
>>
>> One more thing, I don't recall phy-mode being required to be defined for
>> user ports as it will default to GMII. I don't believe this is the same
>> case for shared ports so phy-mode is required only for them?
> 
> phy-mode is not strictly required, but I think there is a strong
> preference to set it. IIRC, when looking at the DSA device trees, there
> was no case where phy-mode would be absent on CPU/DSA ports if the other
> link properties were also present, so we required it too. There were no
> complaints in 1 year since dsa_shared_port_validate_of() is there. The
> requirement can be relaxed to just a warning and no error in the kernel,
> and the removal of "required" in the schema, if it helps making it
> common with user ports.

I'd say no need as it doesn't make it complicated that much. See below.

> 
> I think that the fallback to PHY_INTERFACE_MODE_GMII applies only if
> there is a phy_device (phy-handle). But otherwise, I don't remember if
> the PHY_INTERFACE_MODE_NA passed to phylink_create() will persist at
> runtime, or cause an error somewhere.
> 
>>>> The phylink bindings for shared ports enforced on all switches on
>>>> dsa-port.yaml:
>>>>
>>>>     allOf:
>>>>       - required:
>>>>           - phy-mode
>>>>       - oneOf:
>>>>           - required:
>>>>               - fixed-link
>>>>           - required:
>>>>               - phy-handle
>>>>           - required:
>>>>               - managed
>>>>
>>>> Here's what I understand:
>>>>
>>>> - For switches in dsa_switches_apply_workarounds[]
>>>>     - Enforce the latter for shared ports.
>>>>     - Enforce the former for user ports.
>>>>
>>>> - For switches not in dsa_switches_apply_workarounds[]
>>>>     - Enforce the former for all ports.
>>>
>>> No, no. We enforce the dt-schema regardless of switch presence in
>>> dsa_switches_apply_workarounds[], to encourage users to fix device trees
>>> (those who run schema validation). The kernel workaround consists in
>>> doing something (skipping phylink) for the device trees where the schema
>>> warns on shared ports. But there should be a single sub-schema for
>>> validating phylink bindings, whatever port kind it is.
>>
>> Hmm, like writing phylink.yaml and then referring to it under the port
>> pattern node? This could prevent a lot of repetition.
>>
>> Arınç
> 
> Yes, that would sound good.

If I understand correctly, these phylink rules are for switch ports. The
fixed-link, phy-handle, and managed properties are described on
ethernet-controller.yaml so I thought it would make sense to define the
rules there and refer to them where they're needed.

Example:

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
index 480120469953..7279ab31aea7 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
@@ -65,16 +65,8 @@ if:
      - required: [ ethernet ]
      - required: [ link ]
  then:
-  allOf:
-    - required:
-        - phy-mode
-    - oneOf:
-        - required:
-            - fixed-link
-        - required:
-            - phy-handle
-        - required:
-            - managed
+  $ref: /schemas/net/ethernet-controller.yaml#/$defs/phylink-switch
+  required: [ phy-mode ]
  
  additionalProperties: true
  
diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index e532c6b795f4..742aaf1a5ef2 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -179,6 +179,15 @@ required:
    - compatible
    - reg
  
+if:
+  required: [ mdio ]
+then:
+  patternProperties:
+    "^(ethernet-)?ports$":
+      patternProperties:
+        "^(ethernet-)?port@[0-9]+$":
+          $ref: /schemas/net/ethernet-controller.yaml#/$defs/phylink-switch
+
  $defs:
    mt7530-dsa-port:
      patternProperties:
diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 9f6a5ccbcefe..d7256f33d946 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -284,6 +284,21 @@ allOf:
              controllers that have configurable TX internal delays. If this
              property is present then the MAC applies the TX delay.
  
+$defs:
+  phylink-switch:
+    description: phylink bindings for switch ports
+    allOf:
+      - anyOf:
+          - required: [ fixed-link ]
+          - required: [ phy-handle ]
+          - required: [ managed ]
+
+      - if:
+          required: [ fixed-link ]
+        then:
+          not:
+            required: [ managed ]
+
  additionalProperties: true
  
  ...

Arınç

