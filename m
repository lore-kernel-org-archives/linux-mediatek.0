Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B1FC25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 21:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4egLvTsPGkFbTjp++Gcne3a5KH6iCWzI7mVj0VbmgI=; b=Q7omGb5uJbpZDFk2nPKezXfQNb
	RwhQOZGAnqyNg0gb+VJrKu7gHaESSHr2Zt4RioHtvJT4cpFSpPMKhTbmlE80UC+wFxTH/qOx+eSep
	Iz7L3Xhrejy+MigkZXLhdwW808C8zf7QLyy7BzmO0X7l9vi5YgP/e4Qobzoqx2dKyGDcjJPJ/T5Gy
	AWbJg3zKlOZeJdhPzk4iIycjrRCe8lv1J9rrj9CIqR9RS1RVcsLlrYx+ZtJHPzUVAn5DOhpAVs7R/
	GL9e+TShhmwXDb6fwytMU7LMd3G8vQHnzHkgP0bLLC/grgnbKvCqPJS35sAU2n3bT2NeEOuXXEm0S
	jHyKbc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3hv-006yVm-0o; Tue, 16 Aug 2022 21:02:39 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3hj-006yQh-FC; Tue, 16 Aug 2022 21:02:29 +0000
Received: by mail-io1-f43.google.com with SMTP id o2so9199843iof.8;
        Tue, 16 Aug 2022 14:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=l4egLvTsPGkFbTjp++Gcne3a5KH6iCWzI7mVj0VbmgI=;
        b=j2PIuHk7S0YQ2GXvEypysC59uhJJ9UuLZfEcL1X5YaowIzmCcuTNfMwyFZNkwyXlQB
         bcxCJBhpU93VwlK/lhz0zvuoHGaKAgz4wE7FIcxvR2h9SAF7yBkG0YLjAEl47zpqHcru
         JkIwtT1sgmzOeyJyQckrjpcNS4eHKU2UBJK3KsmY+/weU3x0orxgIvbJm9nKasHKRucs
         rjJy5SF4TCwv8XmKzRDswiN5wjUh9b9vIr4krIt9Ac4knqo1RKOlu5jAv4CeLN3VM71g
         DQQDlcn4lG2DkH2lKASuguOL0/QrApOptdOwARJ1OJcCI9XdYQ3MmpMQk3cMq7Os1UX6
         k0eQ==
X-Gm-Message-State: ACgBeo3jdZo8Oe91QvmMOvmU36SUrdZGUT4QCzc8ejSjwXRppsaIdiYW
	tC8vS5pgYqOg/MbvR/Ki/A==
X-Google-Smtp-Source: AA6agR4QVx4f7/PzkKYp7FkfrjXZT1iNJ6NCK9UlU9Kl3LCt/4FJGHK0mmR0kRChYXNr76/pRm4dfQ==
X-Received: by 2002:a05:6638:25d6:b0:342:916c:d59a with SMTP id u22-20020a05663825d600b00342916cd59amr10135723jat.51.1660683746559;
        Tue, 16 Aug 2022 14:02:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v30-20020a02b09e000000b00339dbd4c8d7sm4788423jah.45.2022.08.16.14.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:02:25 -0700 (PDT)
Received: (nullmailer pid 2727395 invoked by uid 1000);
	Tue, 16 Aug 2022 21:02:23 -0000
Date: Tue, 16 Aug 2022 15:02:23 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: net: dsa: mediatek,mt7530: update
 examples
Message-ID: <20220816210223.GA2714004-robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-4-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220813154415.349091-4-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_140227_568666_654672EA 
X-CRM114-Status: GOOD (  21.69  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 13, 2022 at 06:44:11PM +0300, Arınç ÜNAL wrote:
> Update the examples on the binding.
> 
> - Add examples which include a wide variation of configurations.
> - Make example comments YAML comment instead of DT binding comment.
> - Define examples from platform to make the bindings clearer.
> - Add interrupt controller to the examples. Include header file for
> interrupt.
> - Change reset line for MT7621 examples.
> - Pretty formatting for the examples.
> - Change switch reg to 0.
> - Change port labels to fit the example, change port 4 label to wan.
> - Change ethernet-ports to ports.

Again, why?

> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 663 +++++++++++++-----
>  1 file changed, 502 insertions(+), 161 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 4c99266ce82a..cc87f48d4d07 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -210,144 +210,374 @@ allOf:
>  unevaluatedProperties: false
>  
>  examples:
> +  # Example 1: Standalone MT7530
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    mdio {
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -        switch@0 {
> -            compatible = "mediatek,mt7530";
> -            reg = <0>;
> -
> -            core-supply = <&mt6323_vpa_reg>;
> -            io-supply = <&mt6323_vemc3v3_reg>;
> -            reset-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
> -
> -            ethernet-ports {
> +
> +    platform {
> +        ethernet {

Don't need these nodes.

> +            mdio {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> -                port@0 {
> +
> +                switch@0 {
> +                    compatible = "mediatek,mt7530";
>                      reg = <0>;
> -                    label = "lan0";
> -                };
>  
> -                port@1 {
> -                    reg = <1>;
> -                    label = "lan1";
> -                };
> +                    reset-gpios = <&pio 33 0>;
>  
> -                port@2 {
> -                    reg = <2>;
> -                    label = "lan2";
> -                };
> +                    core-supply = <&mt6323_vpa_reg>;
> +                    io-supply = <&mt6323_vemc3v3_reg>;
> +
> +                    ports {

'ports' is for the DT graph binding. 'ethernet-ports' is for DSA 
binding. The former is allowed due to existing users. Don't add more.

> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
>  
> -                port@3 {
> -                    reg = <3>;
> -                    label = "lan3";
> +                        port@0 {
> +                            reg = <0>;
> +                            label = "lan1";
> +                        };
> +
> +                        port@1 {
> +                            reg = <1>;
> +                            label = "lan2";
> +                        };
> +
> +                        port@2 {
> +                            reg = <2>;
> +                            label = "lan3";
> +                        };
> +
> +                        port@3 {
> +                            reg = <3>;
> +                            label = "lan4";
> +                        };
> +
> +                        port@4 {
> +                            reg = <4>;
> +                            label = "wan";
> +                        };
> +
> +                        port@6 {
> +                            reg = <6>;
> +                            label = "cpu";
> +                            ethernet = <&gmac0>;
> +                            phy-mode = "rgmii";
> +
> +                            fixed-link {
> +                                speed = <1000>;
> +                                full-duplex;
> +                                pause;
> +                            };
> +                        };
> +                    };
>                  };
> +            };
> +        };
> +    };
>  
> -                port@4 {
> -                    reg = <4>;
> -                    label = "wan";
> +  # Example 2: MT7530 in MT7623AI SoC

Looks almost the same as example 1. Examples are not an enumeration of 
every possible DT. Limit them to cases which are significantly 
different.

> +  - |
> +    #include <dt-bindings/reset/mt2701-resets.h>
> +
> +    platform {
> +        ethernet {
> +            mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                switch@0 {
> +                    compatible = "mediatek,mt7530";
> +                    reg = <0>;
> +
> +                    mediatek,mcm;
> +                    resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
> +                    reset-names = "mcm";
> +
> +                    core-supply = <&mt6323_vpa_reg>;
> +                    io-supply = <&mt6323_vemc3v3_reg>;
> +
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +
> +                        port@0 {
> +                            reg = <0>;
> +                            label = "lan1";
> +                        };
> +
> +                        port@1 {
> +                            reg = <1>;
> +                            label = "lan2";
> +                        };
> +
> +                        port@2 {
> +                            reg = <2>;
> +                            label = "lan3";
> +                        };
> +
> +                        port@3 {
> +                            reg = <3>;
> +                            label = "lan4";
> +                        };
> +
> +                        port@4 {
> +                            reg = <4>;
> +                            label = "wan";
> +                        };
> +
> +                        port@6 {
> +                            reg = <6>;
> +                            label = "cpu";
> +                            ethernet = <&gmac0>;
> +                            phy-mode = "trgmii";
> +
> +                            fixed-link {
> +                                speed = <1000>;
> +                                full-duplex;
> +                                pause;
> +                            };
> +                        };
> +                    };
>                  };
> +            };
> +        };
> +    };
> +
> +  # Example 3: Standalone MT7531
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    platform {
> +        ethernet {
> +            mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                switch@0 {
> +                    compatible = "mediatek,mt7531";
> +                    reg = <0>;
> +
> +                    reset-gpios = <&pio 54 0>;
> +
> +                    interrupt-controller;
> +                    #interrupt-cells = <1>;
> +                    interrupt-parent = <&pio>;
> +                    interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +
> +                        port@0 {
> +                            reg = <0>;
> +                            label = "lan1";
> +                        };
> +
> +                        port@1 {
> +                            reg = <1>;
> +                            label = "lan2";
> +                        };
> +
> +                        port@2 {
> +                            reg = <2>;
> +                            label = "lan3";
> +                        };
> +
> +                        port@3 {
> +                            reg = <3>;
> +                            label = "lan4";
> +                        };
>  
> -                port@6 {
> -                    reg = <6>;
> -                    label = "cpu";
> -                    ethernet = <&gmac0>;
> -                    phy-mode = "trgmii";
> -                    fixed-link {
> -                        speed = <1000>;
> -                        full-duplex;
> +                        port@4 {
> +                            reg = <4>;
> +                            label = "wan";
> +                        };
> +
> +                        port@6 {
> +                            reg = <6>;
> +                            label = "cpu";
> +                            ethernet = <&gmac0>;
> +                            phy-mode = "2500base-x";
> +
> +                            fixed-link {
> +                                speed = <2500>;
> +                                full-duplex;
> +                                pause;
> +                            };
> +                        };
>                      };
>                  };
>              };
>          };
>      };
>  
> +  # Example 4: MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs
>    - |
> -    //Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
> -
> -    ethernet {
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -        gmac0: mac@0 {
> -            compatible = "mediatek,eth-mac";
> -            reg = <0>;
> -            phy-mode = "rgmii";
> -
> -            fixed-link {
> -                speed = <1000>;
> -                full-duplex;
> -                pause;
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/reset/mt7621-reset.h>
> +
> +    platform {
> +        ethernet {
> +            mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                switch@0 {
> +                    compatible = "mediatek,mt7621";
> +                    reg = <0>;
> +
> +                    mediatek,mcm;
> +                    resets = <&sysc MT7621_RST_MCM>;
> +                    reset-names = "mcm";
> +
> +                    interrupt-controller;
> +                    #interrupt-cells = <1>;
> +                    interrupt-parent = <&gic>;
> +                    interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +
> +                        port@0 {
> +                            reg = <0>;
> +                            label = "lan1";
> +                        };
> +
> +                        port@1 {
> +                            reg = <1>;
> +                            label = "lan2";
> +                        };
> +
> +                        port@2 {
> +                            reg = <2>;
> +                            label = "lan3";
> +                        };
> +
> +                        port@3 {
> +                            reg = <3>;
> +                            label = "lan4";
> +                        };
> +
> +                        port@4 {
> +                            reg = <4>;
> +                            label = "wan";
> +                        };
> +
> +                        port@6 {
> +                            reg = <6>;
> +                            label = "cpu";
> +                            ethernet = <&gmac0>;
> +                            phy-mode = "trgmii";
> +
> +                            fixed-link {
> +                                speed = <1000>;
> +                                full-duplex;
> +                                pause;
> +                            };
> +                        };
> +                    };
> +                };
>              };
>          };
> +    };
>  
> -        gmac1: mac@1 {
> -            compatible = "mediatek,eth-mac";
> -            reg = <1>;
> -            phy-mode = "rgmii-txid";
> -            phy-handle = <&phy4>;
> +  # Example 5: MT7621: mux MT7530's phy4 to SoC's gmac1
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/reset/mt7621-reset.h>
> +
> +    platform {
> +        pinctrl {
> +            example5_rgmii2_pins: rgmii2-pins {
> +                pinmux {
> +                    groups = "rgmii2";
> +                    function = "rgmii2";
> +                };
> +            };

No need to put this in the example. We don't put provide nodes in 
the examples of the consumers. It's also incomplete and can't be 
validated. 

>          };
>  
> -        mdio: mdio-bus {
> +        ethernet {
>              #address-cells = <1>;
>              #size-cells = <0>;

