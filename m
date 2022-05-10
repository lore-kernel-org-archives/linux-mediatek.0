Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0U4jmTiEVY1PZf3RgqHkMTrF+FF5Uoj3F2Bu2wpGV9c=; b=xqr0MA/A0+r8kn
	6pzEKZpOfuatNMeZZemC1X5PuPuuwgkC50/T3JW1u1B9qcXwVZOZhSdju5EBtBmxnnycjAlQUrKxg
	hEriFhr3RV/YBbO08rWAeMPpL2HzUDpWIq+vjvQPtJ29pAt8yy4wytiZZQx1AUTVGxaJL7N4GHShy
	KLa/MD7MD3y6+ANJEj4kubze7ASuLQLnBO/58jjD6zwRC9E1+8g2eVu/8e3WjxuwukoJcFh/a6dm7
	6BI/3lm5PfasK5OVOz9jYzXL3i3d9otPiztpRV2H39XAzsdx7ddtuWdkDz4bFnGMEssKVKKl0RII8
	8JEyIHb0ZYx3cs230bKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noUqs-003hcP-OC; Tue, 10 May 2022 18:44:54 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noUqo-003hYG-M8; Tue, 10 May 2022 18:44:52 +0000
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so35190fac.9; 
 Tue, 10 May 2022 11:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MPXufwJAh41IRd4r3GKaRJRRh2QCesjvbaZhsgLi68g=;
 b=rMnciGRuZ3ZNSPlU9HxCnBIMDAHm87LxxWlpLpzvOOXABufevGMxXlpEw/6sgmVMkY
 ECt4AnzsO3SrZ0NFv8SdZlLnICTahY1LCVaKEv76SrJnF7JTxuEebfEZFZjZ3Lp6cFqu
 g54cXpzdydM3zhyCN/0qtth+1ePsgrl24UBNooImZ4XRNLv5nX/aMYLYI4SfgOX6He8J
 aytxS+XfkIJ6jFvsFORHS4IKiYKARmXuYMhOYW4gLJ+6qbKZSznaUt8NhvZC1SaVZ936
 t5UWKJMdCvcDsObQoFAcnYFBN1oy5rYCANrwhQpR4fqtUmJbjeTeYl0wSFNzMyz1cHKO
 XK2A==
X-Gm-Message-State: AOAM533rG01K3/5TJfvG7aCVECvPeIPW61uI6D+uT+DWwQu+W4ER62hs
 Rax4Z5Rq5M06CNtnrksQBQ==
X-Google-Smtp-Source: ABdhPJzEeQ30XaAC+XdOP/iCCrqRWxt4H+g5o3r0bi8VUx/PK0GuMt+t8NV0yPKGTMCLEYpNeWLYhQ==
X-Received: by 2002:a05:6870:80cb:b0:ed:aaeb:27e0 with SMTP id
 r11-20020a05687080cb00b000edaaeb27e0mr883725oab.187.1652208285415; 
 Tue, 10 May 2022 11:44:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020aca1b07000000b0032698578409sm4324592oib.38.2022.05.10.11.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 11:44:44 -0700 (PDT)
Received: (nullmailer pid 2376194 invoked by uid 1000);
 Tue, 10 May 2022 18:44:43 -0000
Date: Tue, 10 May 2022 13:44:43 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 1/6] dt-bindings: net: dsa: convert binding for
 mediatek switches
Message-ID: <YnqymzCbabEjV7GQ@robh.at.kernel.org>
References: <20220507170440.64005-1-linux@fw-web.de>
 <20220507170440.64005-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220507170440.64005-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_114450_774353_30906708 
X-CRM114-Status: GOOD (  37.53  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org,
 Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, May 07, 2022 at 07:04:35PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Convert txt binding to yaml binding for Mediatek switches.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - include standalone patch in mt7530 series
> - drop some descriptions (gpio-cells,reset-gpios,reset-names)
> - drop | from descriptions
> - move patternProperties above allOf
> 
> v2:
> - rename mediatek.yaml => mediatek,mt7530.yaml
> - drop "boolean" in description
> - drop description for interrupt-properties
> - drop #interrupt-cells as requirement
> - example: eth=>ethernet,mdio0=>mdio,comment indention
> - replace 0 by GPIO_ACTIVE_HIGH in first example
> - use port(s)-pattern from dsa.yaml
> - adress/size-cells not added to required because this
>   is defined at mdio-level inc current dts , not switch level
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 423 ++++++++++++++++++
>  .../devicetree/bindings/net/dsa/mt7530.txt    | 327 --------------
>  2 files changed, 423 insertions(+), 327 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> new file mode 100644
> index 000000000000..a7696d1b4a8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -0,0 +1,423 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT7530 Ethernet switch
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +  - Landen Chao <Landen.Chao@mediatek.com>
> +  - DENG Qingfang <dqfext@gmail.com>
> +
> +description: |
> +  Port 5 of mt7530 and mt7621 switch is muxed between:
> +  1. GMAC5: GMAC5 can interface with another external MAC or PHY.
> +  2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
> +     of the SOC. Used in many setups where port 0/4 becomes the WAN port.
> +     Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
> +       GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
> +       connected to external component!
> +
> +  Port 5 modes/configurations:
> +  1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
> +     GMAC of the SOC.
> +     In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
> +     GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
> +  2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
> +     It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
> +     and RGMII delay.
> +  3. Port 5 is muxed to GMAC5 and can interface to an external phy.
> +     Port 5 becomes an extra switch port.
> +     Only works on platform where external phy TX<->RX lines are swapped.
> +     Like in the Ubiquiti ER-X-SFP.
> +  4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
> +     Currently a 2nd CPU port is not supported by DSA code.
> +
> +  Depending on how the external PHY is wired:
> +  1. normal: The PHY can only connect to 2nd GMAC but not to the switch
> +  2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
> +     a ethernet port. But can't interface to the 2nd GMAC.
> +
> +    Based on the DT the port 5 mode is configured.
> +
> +  Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
> +  When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
> +  phy-mode must be set, see also example 2 below!
> +  * mt7621: phy-mode = "rgmii-txid";
> +  * mt7623: phy-mode = "rgmii";
> +
> +  CPU-Ports need a phy-mode property:
> +    Allowed values on mt7530 and mt7621:
> +      - "rgmii"
> +      - "trgmii"
> +    On mt7531:
> +      - "1000base-x"
> +      - "2500base-x"
> +      - "sgmii"
> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7530
> +      - mediatek,mt7531
> +      - mediatek,mt7621
> +

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

I don't see any child nodes with addresses, so these can be removed.

> +
> +  core-supply:
> +    description:
> +      Phandle to the regulator node necessary for the core power.
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller:
> +    type: boolean
> +    description:
> +      if defined, MT7530's LED controller will run on GPIO mode.
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  interrupt-controller:
> +    type: boolean

Already has a type. Just:

interrupt-controller: true

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  io-supply:
> +    description:
> +      Phandle to the regulator node necessary for the I/O power.
> +      See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> +      for details for the regulator setup on these boards.
> +
> +  mediatek,mcm:
> +    type: boolean
> +    description:
> +      if defined, indicates that either MT7530 is the part on multi-chip
> +      module belong to MT7623A has or the remotely standalone chip as the
> +      function MT7623N reference board provided for.
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: mcm
> +
> +  resets:
> +    description:
> +      Phandle pointing to the system reset controller with line index for
> +      the ethsys.
> +    maxItems: 1
> +
> +patternProperties:
> +  "^(ethernet-)?ports$":
> +    type: object

       additionalProperties: false

> +
> +    patternProperties:
> +      "^(ethernet-)?port@[0-9]+$":
> +        type: object
> +        description: Ethernet switch ports
> +
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            description:
> +              Port address described must be 5 or 6 for CPU port and from 0
> +              to 5 for user ports.
> +
> +        allOf:
> +          - $ref: dsa-port.yaml#
> +          - if:
> +              properties:
> +                label:
> +                  items:
> +                    - const: cpu
> +            then:
> +              required:
> +                - reg
> +                - phy-mode
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: "dsa.yaml#"
> +  - if:
> +      required:
> +        - mediatek,mcm
> +    then:
> +      required:
> +        - resets
> +        - reset-names
> +    else:
> +      required:
> +        - reset-gpios
> +
> +  - if:
> +      required:
> +        - interrupt-controller
> +    then:
> +      required:
> +        - interrupts

This can be expressed as:

dependencies:
  interrupt-controller: [ interrupts ]
    
> +
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: mediatek,mt7530
> +    then:
> +      required:
> +        - core-supply
> +        - io-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        switch@0 {
> +            compatible = "mediatek,mt7530";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            core-supply = <&mt6323_vpa_reg>;
> +            io-supply = <&mt6323_vemc3v3_reg>;
> +            reset-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
> +
> +            ports {

Use the preferred form: ethernet-ports

> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
