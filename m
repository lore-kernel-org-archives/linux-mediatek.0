Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F486CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 18:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsyZLidmB5xFNhp6Bid96U+ejdpwbcEwnmJpxnx1OFw=; b=J2DRkU9D/wHlpVzC9OeY/cuwIH
	HpzSH6uUK1MWnUR0+8T0FTHGWKHLFnS9MFebQT0qK8Pp1qTFMoe+hUgJHWIFIzw5huu5sBmqy45g/
	jcymxmt9iaJcat7mles3SN2uhKu/qMXdWajvSozv5vgKQBdptBZbpBAnYgG0xlF7y5R4MQdTXenDu
	H4W5gBYM19Xjt49t3mGMkeuNFNGLmntRPD9k4TxUmT3Jo518g+DgEHkVqi5cnV5nQcTWDcG6+Naxt
	y4OgkBZSC0yNgbmmMYOy4zMZ91Q9IT05f/v+fladO4ZR/ZYzaf7KCYLNFYx7Tuzs34T1pWsRkkUvj
	0jtRTpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJAn-00G64i-0T;
	Mon, 18 Sep 2023 18:40:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJAi-00G63L-0j;
	Mon, 18 Sep 2023 18:40:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 45EBBCE0F02;
	Mon, 18 Sep 2023 18:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F7AC433C9;
	Mon, 18 Sep 2023 18:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695062427;
	bh=ohRJW2WpMAFgJxA1JBZsN3B28gEviJ+HU0xdzWwTN+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwvYjQdtjC+c5KTGzQRn+2rim3mcWRXiI89lVvDYEQQfvxncUA3YIWgBcyKPJOKEM
	 yZDeCufA/vTDVJOPpGvulb3N0LdWMlDgDptvPL4Ou8eMp5b4LIxerpjfZHH4SZksjS
	 zv1qD3GmW0gNstrldOF5I4Zq0QpL7YFEuPIBNJQWdfZH2cL/lP9md1qzLneGr+GY/K
	 RCfI3VBnp5otoEjMfVKRugCvn9NyI0b6W7tpLLRCipeCvEuYkgd855V/X3DKgZOfWv
	 KMAedyFaVL73ZJ/DAGVkR+3U9InmBl5sz9mn/+Uj78kxI9sOjkfJKe/HxYlvIKaItw
	 WIhEzXiMKBpZQ==
Received: (nullmailer pid 1492209 invoked by uid 1000);
	Mon, 18 Sep 2023 18:40:16 -0000
Date: Mon, 18 Sep 2023 13:40:16 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, George McCollister <george.mccollister@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>
 , Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Marek Vasut <marex@denx.de>, Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, John Crispin <john@phrozen.org>, Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Horatiu Vultur <horatiu.vultur@microchip.com>, Oleksij Rempel <linux@rempel-privat.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar
  Nori <nsekhar@ti.com>, Shyam Pandey <radhey.shyam.pandey@xilinx.com>, mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 08/10] dt-bindings: net: dsa: marvell:
 convert to json-schema
Message-ID: <20230918184016.GB1464506-robh@kernel.org>
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <20230916110902.234273-9-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230916110902.234273-9-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_114036_618111_C4477F30 
X-CRM114-Status: GOOD (  37.96  )
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

On Sat, Sep 16, 2023 at 02:09:00PM +0300, Arınç ÜNAL wrote:
> Convert the document for Marvell ethernet switches to json-schema.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/net/dsa/marvell.txt   | 109 ----------
>  .../devicetree/bindings/net/dsa/marvell.yaml  | 204 ++++++++++++++++++
>  2 files changed, 204 insertions(+), 109 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/dsa/marvell.txt
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/marvell.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Documentation/devicetree/bindings/net/dsa/marvell.txt
> deleted file mode 100644
> index 6ec0c181b6db..000000000000
> --- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -Marvell DSA Switch Device Tree Bindings
> ----------------------------------------
> -
> -WARNING: This binding is currently unstable. Do not program it into a
> -FLASH never to be changed again. Once this binding is stable, this
> -warning will be removed.
> -
> -If you need a stable binding, use the old dsa.txt binding.
> -
> -Marvell Switches are MDIO devices. The following properties should be
> -placed as a child node of an mdio device.
> -
> -The properties described here are those specific to Marvell devices.
> -Additional required and optional properties can be found in dsa.txt.
> -
> -The compatibility string is used only to find an identification register,
> -which is at a different MDIO base address in different switch families.
> -- "marvell,mv88e6085"	: Switch has base address 0x10. Use with models:
> -			  6085, 6095, 6097, 6123, 6131, 6141, 6161, 6165,
> -			  6171, 6172, 6175, 6176, 6185, 6240, 6320, 6321,
> -			  6341, 6350, 6351, 6352
> -- "marvell,mv88e6190"	: Switch has base address 0x00. Use with models:
> -			  6190, 6190X, 6191, 6290, 6361, 6390, 6390X
> -- "marvell,mv88e6250"	: Switch has base address 0x08 or 0x18. Use with model:
> -			  6220, 6250
> -
> -Required properties:
> -- compatible		: Should be one of "marvell,mv88e6085",
> -			  "marvell,mv88e6190" or "marvell,mv88e6250" as
> -			  indicated above
> -- reg			: Address on the MII bus for the switch.
> -
> -Optional properties:
> -
> -- reset-gpios		: Should be a gpio specifier for a reset line
> -- interrupts		: Interrupt from the switch
> -- interrupt-controller	: Indicates the switch is itself an interrupt
> -			  controller. This is used for the PHY interrupts.
> -#interrupt-cells = <2>	: Controller uses two cells, number and flag
> -- eeprom-length		: Set to the length of an EEPROM connected to the
> -			  switch. Must be set if the switch can not detect
> -			  the presence and/or size of a connected EEPROM,
> -			  otherwise optional.
> -- mdio			: Container of PHY and devices on the switches MDIO
> -			  bus.
> -- mdio?		: Container of PHYs and devices on the external MDIO
> -			  bus. The node must contains a compatible string of
> -			  "marvell,mv88e6xxx-mdio-external"
> -
> -Example:
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -
> -		switch0: switch@0 {
> -			compatible = "marvell,mv88e6085";
> -			reg = <0>;
> -			reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
> -
> -			mdio {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -				switch1phy0: switch1phy0@0 {
> -					reg = <0>;
> -					interrupt-parent = <&switch0>;
> -					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> -				};
> -			};
> -		};
> -	};
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		interrupt-parent = <&gpio0>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -
> -		switch0: switch@0 {
> -			compatible = "marvell,mv88e6190";
> -			reg = <0>;
> -			reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
> -
> -			mdio {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -				switch1phy0: switch1phy0@0 {
> -					reg = <0>;
> -					interrupt-parent = <&switch0>;
> -					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> -				};
> -			};
> -
> -			mdio1 {
> -				compatible = "marvell,mv88e6xxx-mdio-external";
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -				switch1phy9: switch1phy0@9 {
> -					reg = <9>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.yaml b/Documentation/devicetree/bindings/net/dsa/marvell.yaml
> new file mode 100644
> index 000000000000..45756b8d74d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/marvell.yaml
> @@ -0,0 +1,204 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/marvell.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Ethernet Switches
> +
> +$ref: dsa.yaml#/$defs/ethernet-ports
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Arınç ÜNAL <arinc.unal@arinc9.com>
> +
> +description:
> +  Marvell ethernet switches are MDIO devices.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: |
> +          Switch has base address 0x10. Use with models:
> +          6085, 6095, 6097, 6123, 6131, 6141, 6161, 6165, 6171, 6172, 6175,
> +          6176, 6185, 6240, 6320, 6321, 6341, 6350, 6351, 6352
> +        const: marvell,mv88e6085
> +
> +      - description: |
> +          Switch has base address 0x00. Use with models:
> +          6190, 6190X, 6191, 6290, 6361, 6390, 6390X
> +        const: marvell,mv88e6190
> +
> +      - description: |
> +          Switch has base address 0x08 or 0x18. Use with models:
> +          6220, 6250
> +        const: marvell,mv88e6250
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO to be used to reset the whole device
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  eeprom-length:
> +    description:
> +      Set to the length of an EEPROM connected to the switch. Must be set if the
> +      switch can not detect the presence and/or size of a connected EEPROM,
> +      otherwise optional.
> +
> +  mdio:
> +    description:
> +      The optional node for the MDIO bus of the switch. The bus will be
> +      registered non-OF-based if this is not defined.

That's a detail of the OS behavior.

> +    $ref: /schemas/net/mdio.yaml#

       unevaluatedProperties: false

> +
> +  mdio-external:
> +    description: The externally reachable MDIO bus of the 6390 family switches
> +    $ref: /schemas/net/mdio.yaml#

       unevaluatedProperties: false

> +
> +    properties:
> +      compatible:
> +        const: marvell,mv88e6xxx-mdio-external
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - marvell,mv88e6085
> +            - marvell,mv88e6250
> +    then:
> +      properties:
> +        mdio-external: false
> +
> +  - if:
> +      required: [ mdio ]
> +    then:
> +      patternProperties:
> +        "^(ethernet-)?ports$":
> +          patternProperties:
> +            "^(ethernet-)?port@[0-9]+$":
> +              $ref: /schemas/net/ethernet-controller.yaml#/$defs/phylink

This probably doesn't work right. The problem is every node ultimately 
needs a single schema with all possible properties in order to not allow 
undefined properties. This is the reason for the complexity with a $ref 
at each level in schemas for these nodes.

I'm not sure it is worth the complexity to enforce what you want here. 
It may be easier to just always allow phylink properties in 
ethernet-port nodes.  

As this is a switch, it should be referencing ethernet-switch.yaml. 

Rob

