Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAA8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdabzGP2/vr/NX9uK28DbswHt1GjziTK0ZCkBnMtuFo=; b=JYYiJhdNiX3/5C
	2plATGeej7tmeNwJmxyiQbOSTBLam84xbmCqG7AUU6wrVYe3qlAIcFzxRfIPAdIcp0DZNZQeNmwzh
	IlPn6ugmjdg2I3c9RBUpvm1OLFw5k6c+JmMP6UwWCxoeZdwtwSd3wXcWaCNNoUOa34Zu2bFSE5XYZ
	L2NAmCUH0vLvROsMz8EY2pIUqPK1/txzIhrEhth2xoqDpC0rYDHX/2il5UMx36IQC8XhVIqBgD2HZ
	0xkoPkyJ3JK48xq30y9pu2qwUA3hBLtcKoi9fl4rQdKrbSMNFcC9/1Wv70VuIj/akRyzLlIZQMujp
	Vy3TD25BnsYRa96Md1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltG8-006As6-SV; Tue, 03 May 2022 14:12:12 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltG3-006AoC-WF; Tue, 03 May 2022 14:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651587032;
 bh=jBf0jkgXes2Bgvz1mr0yTofTeW0CJcZ+iijJU1rFRkA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hw2PQaLw/ZvT//biTMBcCkn13OhYbNvQ6wTYb3SbSJJRw8o0lHAJTvzKLI13U7jP2
 5cxIpubl5IGIN6RfPuKJJt+OuM8JzFYg+fjKkkeGA0eFy9S3Ounb6LS/J1KTTFn+bd
 VkAIW6VriU18sIlhnomWKFGMGYuMEb/SzN6nHc8k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.168] ([80.245.79.168]) by web-mail.gmx.net
 (3c-app-gmx-bap25.server.lan [172.19.172.95]) (via HTTP); Tue, 3 May 2022
 16:10:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-cda3b94f-8556-4b83-bc34-d2c215f93bcd-1651587032669@3c-app-gmx-bap25>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Ungerer
 <gerg@kernel.org>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Aw: Re: [RFC v1] dt-bindings: net: dsa: convert binding for
 mediatek switches
Date: Tue, 3 May 2022 16:10:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <d29637f8-87ff-b5f0-9604-89b51a2ba7c1@linaro.org>
References: <20220502153238.85090-1-linux@fw-web.de>
 <d29637f8-87ff-b5f0-9604-89b51a2ba7c1@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:O5oBof9XGL3SxmQsXmJowuqSpbkg8qCPhR75Rqj8d7AWC0TscwGJa0vS4RQCp8q3HxeFt
 66exxqD6usZY2JU0sPJpokt5fCdbgHA8DIKLGjCQnD07s1XPN5wm51EFS4FBZyEa13y1ksjpJPz7
 X0luNj1XJO/2ff6Ic3TAnikuk13kEO0jAEY6lCQu0ur5TmVDk1XcjdynDsbBb6arWo0FpFCgX74v
 VdB6M09uzDjabMUnZlaYV4FnjRoxdXS1HoEA5pOoG94xpfgL5UJgjkip7NPt8PhHGTxM0Sx4LTve
 SI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:WhcYUwKPK54=:mjGQ2JYTdacnqf++cuEFfa
 aUu8RvnvGlhBUgCnvPyEBLTlZFA2TAyTtknQyLbFIr6JfDAimT1vFl/1YjFsh4S+/GHOEjypp
 QG8HkYsZYmsXHwsGopwb2MrzuJgODuyfbK2YaT1WyY5hU+/yUsirtpFpj7dB7waTtPQ95GzT5
 goTDIRjYAm7/xjShlJLaz2o+V0BVAZqVnGwCechdeXAWfLm8PEF4dB5prr4tXOsSE4DjtPlYH
 OH/ul3FdGijAXiRe6wZXF4SAldnxySwWo0ulC6zUDPdCyyRS0P4v7DCAaBOYGDxb2HU/JFsAf
 8CJP3vGJ/UYEGFYXGhGvUgyMj9f5Kb8380mYNpR/vp83aaXOgWT8BS85Lo6aYf1IhBnwQls82
 FltGU1+eeSsu1OHPiQnjLoe0xICgS3HEPVpTPh1K6B2zjcvgi0UgKVVMYSiXnl1QY1ltr1p0B
 tEhWYnsMymSBxSXnUpyU7C9MJd59JdkgrY5gs6FbxCf6GgYfJl/LCfscxD0F9DxiwR6g2MhRh
 GbLP7+c0s1vDGIwloZCrgMxIdZwvfs0/u/UQ9OSWZx0oWbVYPtQVdPJiHzQejUE/oQ5RJR8vH
 jaES1RmAW2LRlCx7vuWHhsmfZ2UBIjPr/NcHnoXNce+fjP7bqPg6m906fYkFyZa7nucFvf3md
 Jv1xZ8GrR2N1CRBWXXEYIFAEpxlbW3Qq4Ot0FdtZ0pfq8jgJc5UbwDrfsC3XdjQXvm3OR1Oej
 axa4xi2A3mUV2cXG41kEnw7fM9slU256BNQ/Bx3UShyX5MyR5ioKxdQgJRn5St43Qd57q0n/o
 PC6turt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_071208_567720_DA84F13B 
X-CRM114-Status: GOOD (  44.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

thank you for first review.

> Gesendet: Dienstag, 03. Mai 2022 um 14:05 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> Betreff: Re: [RFC v1] dt-bindings: net: dsa: convert binding for mediatek switches
>
> On 02/05/2022 17:32, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Convert txt binding to yaml binding for Mediatek switches.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  .../devicetree/bindings/net/dsa/mediatek.yaml | 435 ++++++++++++++++++
> >  .../devicetree/bindings/net/dsa/mt7530.txt    | 327 -------------
> >  2 files changed, 435 insertions(+), 327 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/dsa/mediatek.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt
> >
> > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek.yaml
> > new file mode 100644
> > index 000000000000..c1724809d34e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek.yaml
>
> Specific name please, so previous (with vendor prefix) was better:
> mediatek,mt7530.yaml

ok, named it mediatek only because mt7530 is only one possible chip and driver handles 3 different "variants".

> > @@ -0,0 +1,435 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>
> You should CC previous contributors and get their acks on this. You
> copied here a lot of description.

added 3 Persons that made commits to txt before to let them know about this change

and yes, i tried to define at least the phy-mode requirement as yaml-depency, but failed because i cannot match
compatible in subnode.

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/dsa/mediatek.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT7530 Ethernet switch
> > +
> > +maintainers:
> > +  - Sean Wang <sean.wang@mediatek.com>
> > +  - Landen Chao <Landen.Chao@mediatek.com>
> > +  - DENG Qingfang <dqfext@gmail.com>
> > +
> > +description: |
> > +  Port 5 of mt7530 and mt7621 switch is muxed between:
> > +  1. GMAC5: GMAC5 can interface with another external MAC or PHY.
> > +  2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
> > +     of the SOC. Used in many setups where port 0/4 becomes the WAN port.
> > +     Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
> > +       GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
> > +       connected to external component!
> > +
> > +  Port 5 modes/configurations:
> > +  1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
> > +     GMAC of the SOC.
> > +     In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
> > +     GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
> > +  2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
> > +     It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
> > +     and RGMII delay.
> > +  3. Port 5 is muxed to GMAC5 and can interface to an external phy.
> > +     Port 5 becomes an extra switch port.
> > +     Only works on platform where external phy TX<->RX lines are swapped.
> > +     Like in the Ubiquiti ER-X-SFP.
> > +  4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
> > +     Currently a 2nd CPU port is not supported by DSA code.
> > +
> > +  Depending on how the external PHY is wired:
> > +  1. normal: The PHY can only connect to 2nd GMAC but not to the switch
> > +  2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
> > +     a ethernet port. But can't interface to the 2nd GMAC.
> > +
> > +    Based on the DT the port 5 mode is configured.
> > +
> > +  Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
> > +  When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
> > +  phy-mode must be set, see also example 2 below!
> > +  * mt7621: phy-mode = "rgmii-txid";
> > +  * mt7623: phy-mode = "rgmii";
> > +
> > +  CPU-Ports need a phy-mode property:
> > +    Allowed values on mt7530 and mt7621:
> > +      - "rgmii"
> > +      - "trgmii"
> > +    On mt7531:
> > +      - "1000base-x"
> > +      - "2500base-x"
> > +      - "sgmii"
> > +
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt7530
> > +      - mediatek,mt7531
> > +      - mediatek,mt7621
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  core-supply:
> > +    description: |
> > +      Phandle to the regulator node necessary for the core power.
> > +
> > +  "#gpio-cells":
> > +    description: |
> > +      Must be 2 if gpio-controller is defined.
> > +    const: 2
> > +
> > +  gpio-controller:
> > +    type: boolean
> > +    description: |
> > +      Boolean; if defined, MT7530's LED controller will run on
>
> No need to repeat Boolean.

ok, will change

> > +      GPIO mode.
> > +
> > +  "#interrupt-cells":
> > +    const: 1
> > +
> > +  interrupt-controller:
> > +    type: boolean
> > +    description: |
> > +      Boolean; Enables the internal interrupt controller.
>
> Skip description.

ok

> > +
> > +  interrupts:
> > +    description: |
> > +      Parent interrupt for the interrupt controller.
>
> Skip description.
ok

> > +    maxItems: 1
> > +
> > +  io-supply:
> > +    description: |
> > +      Phandle to the regulator node necessary for the I/O power.
> > +      See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> > +      for details for the regulator setup on these boards.
> > +
> > +  mediatek,mcm:
> > +    type: boolean
> > +    description: |
> > +      Boolean;
>
> No need to repeat Boolean.

ack

> > if defined, indicates that either MT7530 is the part
> > +      on multi-chip module belong to MT7623A has or the remotely standalone
> > +      chip as the function MT7623N reference board provided for.
> > +
> > +  reset-gpios:
> > +    description: |
> > +      Should be a gpio specifier for a reset line.
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    description: |
> > +      Should be set to "mcm".
> > +    const: mcm
> > +
> > +  resets:
> > +    description: |
> > +      Phandle pointing to the system reset controller with
> > +      line index for the ethsys.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> What about address/size cells?

you're right even if they are const to a value they need to be set

> > +
> > +allOf:
> > +  - $ref: "dsa.yaml#"
> > +  - if:
> > +      required:
> > +        - mediatek,mcm
>
> Original bindings had this reversed.

i know, but i think it is better readable and i will drop the else-part later.
Driver supports optional reset ("mediatek,mcm" unset and without reset-gpios)
as this is needed if there is a shared reset-line for gmac and switch like on R2 Pro.

i left this as separate commit to be posted later to have a nearly 1:1 conversion here.

> > +    then:
> > +      required:
> > +        - resets
> > +        - reset-names
> > +    else:
> > +      required:
> > +        - reset-gpios
> > +
> > +  - if:
> > +      required:
> > +        - interrupt-controller
> > +    then:
> > +      required:
> > +        - "#interrupt-cells"
>
> This should come from dt schema already...

so i should drop (complete block for interrupt controller)?

> > +        - interrupts
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          items:
> > +            - const: mediatek,mt7530
> > +    then:
> > +      required:
> > +        - core-supply
> > +        - io-supply
> > +
> > +
> > +patternProperties:
> > +  "^ports$":
>
> It''s not a pattern, so put it under properties, like regular property.

can i then make the subnodes match? so the full block will move above required between "mediatek,mcm" and "reset-gpios"

  ports:
    type: object

    patternProperties:
      "^port@[0-9]+$":
        type: object
        description: Ethernet switch ports

        properties:
          reg:
            description: |
              Port address described must be 5 or 6 for CPU port and from 0 to 5 for user ports.

        unevaluatedProperties: false

        allOf:
          - $ref: dsa-port.yaml#
          - if:
....

basicly this "ports"-property should be required too, right?


> > +    type: object
> > +
> > +    patternProperties:
> > +      "^port@[0-9]+$":
> > +        type: object
> > +        description: Ethernet switch ports
> > +
> > +        $ref: dsa-port.yaml#
>
> This should go to allOf below.

see above

> > +
> > +        properties:
> > +          reg:
> > +            description: |
> > +              Port address described must be 6 for CPU port and from 0 to 5 for user ports.
> > +
> > +        unevaluatedProperties: false
> > +
> > +        allOf:
> > +          - if:
> > +              properties:
> > +                label:
> > +                  items:
> > +                    - const: cpu
> > +            then:
> > +              required:
> > +                - reg
> > +                - phy-mode
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    mdio0 {
>
> Just mdio

ok

> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        switch@0 {
> > +            compatible = "mediatek,mt7530";
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0>;
> > +
> > +            core-supply = <&mt6323_vpa_reg>;
> > +            io-supply = <&mt6323_vemc3v3_reg>;
> > +            reset-gpios = <&pio 33 0>;
>
> Use GPIO flag define/constant.

this example seems to be taken from bpi-r2 (i had taken it from the txt). In dts for this board there are no
constants too.

i guess
include/dt-bindings/gpio/gpio.h:14:#define GPIO_ACTIVE_HIGH 0

for 33 there seem no constant..all other references to pio node are with numbers too and there seem no binding
header defining the gpio pins (only functions in include/dt-bindings/pinctrl/mt7623-pinfunc.h)

> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                port@0 {
> > +                    reg = <0>;
> > +                    label = "lan0";
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    label = "lan1";
> > +                };
> > +
> > +                port@2 {
> > +                    reg = <2>;
> > +                    label = "lan2";
> > +                };
> > +
> > +                port@3 {
> > +                    reg = <3>;
> > +                    label = "lan3";
> > +                };
> > +
> > +                port@4 {
> > +                    reg = <4>;
> > +                    label = "wan";
> > +                };
> > +
> > +                port@6 {
> > +                    reg = <6>;
> > +                    label = "cpu";
> > +                    ethernet = <&gmac0>;
> > +                    phy-mode = "trgmii";
> > +                    fixed-link {
> > +                        speed = <1000>;
> > +                        full-duplex;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    //Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
> > +
> > +    eth {
>
> s/eth/ethernet/

ok

> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        gmac0: mac@0 {
> > +            compatible = "mediatek,eth-mac";
> > +            reg = <0>;
> > +            phy-mode = "rgmii";
> > +
> > +            fixed-link {
> > +                speed = <1000>;
> > +                full-duplex;
> > +                pause;
> > +            };
> > +        };
> > +
> > +        gmac1: mac@1 {
> > +            compatible = "mediatek,eth-mac";
> > +            reg = <1>;
> > +            phy-mode = "rgmii-txid";
> > +            phy-handle = <&phy4>;
> > +        };
> > +
> > +        mdio: mdio-bus {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            /* Internal phy */
> > +            phy4: ethernet-phy@4 {
> > +                reg = <4>;
> > +            };
> > +
> > +            mt7530: switch@1f {
> > +                compatible = "mediatek,mt7621";
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <0x1f>;
> > +                mediatek,mcm;
> > +
> > +                resets = <&rstctrl 2>;
> > +                reset-names = "mcm";
> > +
> > +                ports {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    port@0 {
> > +                        reg = <0>;
> > +                        label = "lan0";
> > +                    };
> > +
> > +                    port@1 {
> > +                        reg = <1>;
> > +                        label = "lan1";
> > +                    };
> > +
> > +                    port@2 {
> > +                        reg = <2>;
> > +                        label = "lan2";
> > +                    };
> > +
> > +                    port@3 {
> > +                        reg = <3>;
> > +                        label = "lan3";
> > +                    };
> > +
> > +        /* Commented out. Port 4 is handled by 2nd GMAC.
> > +                    port@4 {
> > +                        reg = <4>;
> > +                        label = "lan4";
> > +                    };
> > +        */
>
> Messed up indentation

will fix it

> > +
> > +                    port@6 {
> > +                        reg = <6>;
> > +                        label = "cpu";
> > +                        ethernet = <&gmac0>;
> > +                        phy-mode = "rgmii";
> > +
> > +                        fixed-link {
> > +                            speed = <1000>;
> > +                            full-duplex;
> > +                            pause;
> > +                        };
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    //Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
> > +
> > +    eth {
>
> Also ethernet?

will do

> Best regards,
> Krzysztof

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
