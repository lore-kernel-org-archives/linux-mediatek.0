Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97ACC25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 22:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxBVhVumfgFXAdQqW2kPOpPPhvJtnmmOvTBSGY8R4R8=; b=RtoW7i+Jx+WOES
	VTRQ0IsXwYAvFSwr+1mRweVEuxoDxnTCmhlnAGU+xspwA0ux8U0rcqRNkMUE+6Dx3sEFyMZjHB6+A
	fGO6jit6CpiEZXx+FNFlOuqT/rZUhU7B8tnqbLAzDlEwafxoLgHtGFuUyObAi6aclLrN07Qiplnqg
	a9S/QlkN1UMmhzbzY7aJC0HCbc3Af+0QJ6kmUN/buYoBPMmhug4Ag7dvtLa+bu8gs5FcWyraM7HvX
	714ScixRlttOrX3sERhsTcE5P7gX5ExvbHpzCsoXgTb0Z3cwwp++aYFXrslKW4SP/cJWEHaHJVyfp
	+qFg/FG0gkp/xCszEDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO4r6-007Qnh-4p; Tue, 16 Aug 2022 22:16:12 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO4qu-007Qkl-Qh; Tue, 16 Aug 2022 22:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660688137; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bPMcKkRyVZfUCCU335HWN3m6zTrsaHlK3Btl7KbRFeYjBT3CNQxVK+IZhowIVhi5NKsxEvyKxR7fUGhzGbjZvY9gwbkQWGOxSSJsi7RB6UXThgDtGs0FayAilNjdCnyNhUih1SSDZX8rJcJexsL5aEsJ5fkGN4Z1MVCOHbi28l0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660688137; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SxBVhVumfgFXAdQqW2kPOpPPhvJtnmmOvTBSGY8R4R8=; 
	b=L8JpVq9FoaMKGbicq99QYbsitH2gBv6Ibi0xo3ohhJosM+GLbRtNBVP0lOAn3DZPJllsf+BqLYmkjEkMj54WLoYUIbjspNq3jMZRvXuR5TAe/sBjviKXfFVpZzJg3/4besBpSW9fEbkj6G2RvaZccKrIJikvHnbnfHheX/6fIac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660688137;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SxBVhVumfgFXAdQqW2kPOpPPhvJtnmmOvTBSGY8R4R8=;
	b=DmlpJKR3MvTM0N0qcTqT15C4TRmCQy6JO34GQgyjW9ua1VCRx/LlWQXuv431kc08
	cn8fT4hYxyO9jcyDbdW1l5XYbgT1Ek/UTcgvSrEWhp2SmH2LZiaqq+GaK2MQKQ4anYw
	He0lWbDSj9IgtZuI5uHzE8LoN6LbCanwXcpGbm30=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1660688134449648.2828314113265; Tue, 16 Aug 2022 15:15:34 -0700 (PDT)
Message-ID: <53672ace-ad26-efdf-b3e5-bc8e4163c567@arinc9.com>
Date: Wed, 17 Aug 2022 01:15:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: net: dsa: mediatek,mt7530: update
 examples
To: Rob Herring <robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-4-arinc.unal@arinc9.com>
 <20220816210223.GA2714004-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20220816210223.GA2714004-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_151600_977007_A46035FD 
X-CRM114-Status: GOOD (  21.34  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel@vger.kernel.org, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17.08.2022 00:02, Rob Herring wrote:
> On Sat, Aug 13, 2022 at 06:44:11PM +0300, Arınç ÜNAL wrote:
>> Update the examples on the binding.
>>
>> - Add examples which include a wide variation of configurations.
>> - Make example comments YAML comment instead of DT binding comment.
>> - Define examples from platform to make the bindings clearer.
>> - Add interrupt controller to the examples. Include header file for
>> interrupt.
>> - Change reset line for MT7621 examples.
>> - Pretty formatting for the examples.
>> - Change switch reg to 0.
>> - Change port labels to fit the example, change port 4 label to wan.
>> - Change ethernet-ports to ports.
> 
> Again, why?

For wrong reasons as it seems. Will revert that one.

> 
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 663 +++++++++++++-----
>>   1 file changed, 502 insertions(+), 161 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index 4c99266ce82a..cc87f48d4d07 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -210,144 +210,374 @@ allOf:
>>   unevaluatedProperties: false
>>   
>>   examples:
>> +  # Example 1: Standalone MT7530
>>     - |
>>       #include <dt-bindings/gpio/gpio.h>
>> -    mdio {
>> -        #address-cells = <1>;
>> -        #size-cells = <0>;
>> -        switch@0 {
>> -            compatible = "mediatek,mt7530";
>> -            reg = <0>;
>> -
>> -            core-supply = <&mt6323_vpa_reg>;
>> -            io-supply = <&mt6323_vemc3v3_reg>;
>> -            reset-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
>> -
>> -            ethernet-ports {
>> +
>> +    platform {
>> +        ethernet {
> 
> Don't need these nodes.

Will remove.

> 
>> +            mdio {
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
>> -                port@0 {
>> +
>> +                switch@0 {
>> +                    compatible = "mediatek,mt7530";
>>                       reg = <0>;
>> -                    label = "lan0";
>> -                };
>>   
>> -                port@1 {
>> -                    reg = <1>;
>> -                    label = "lan1";
>> -                };
>> +                    reset-gpios = <&pio 33 0>;
>>   
>> -                port@2 {
>> -                    reg = <2>;
>> -                    label = "lan2";
>> -                };
>> +                    core-supply = <&mt6323_vpa_reg>;
>> +                    io-supply = <&mt6323_vemc3v3_reg>;
>> +
>> +                    ports {
> 
> 'ports' is for the DT graph binding. 'ethernet-ports' is for DSA
> binding. The former is allowed due to existing users. Don't add more.

Will fix.

> 
>> +                        #address-cells = <1>;
>> +                        #size-cells = <0>;
>>   
>> -                port@3 {
>> -                    reg = <3>;
>> -                    label = "lan3";
>> +                        port@0 {
>> +                            reg = <0>;
>> +                            label = "lan1";
>> +                        };
>> +
>> +                        port@1 {
>> +                            reg = <1>;
>> +                            label = "lan2";
>> +                        };
>> +
>> +                        port@2 {
>> +                            reg = <2>;
>> +                            label = "lan3";
>> +                        };
>> +
>> +                        port@3 {
>> +                            reg = <3>;
>> +                            label = "lan4";
>> +                        };
>> +
>> +                        port@4 {
>> +                            reg = <4>;
>> +                            label = "wan";
>> +                        };
>> +
>> +                        port@6 {
>> +                            reg = <6>;
>> +                            label = "cpu";
>> +                            ethernet = <&gmac0>;
>> +                            phy-mode = "rgmii";
>> +
>> +                            fixed-link {
>> +                                speed = <1000>;
>> +                                full-duplex;
>> +                                pause;
>> +                            };
>> +                        };
>> +                    };
>>                   };
>> +            };
>> +        };
>> +    };
>>   
>> -                port@4 {
>> -                    reg = <4>;
>> -                    label = "wan";
>> +  # Example 2: MT7530 in MT7623AI SoC
> 
> Looks almost the same as example 1. Examples are not an enumeration of
> every possible DT. Limit them to cases which are significantly
> different.

It seemed to me it would be useful to reference the reset line for the 
MT7623AI SoC. Using mediatek,mcm and especially MT2701_ETHSYS_MCM_RST in 
dt-bindings/reset/mt2701-resets.h.

Should I remove anyway?

> 
>> +  - |
>> +    #include <dt-bindings/reset/mt2701-resets.h>
>> +
>> +    platform {
>> +        ethernet {
>> +            mdio {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                switch@0 {
>> +                    compatible = "mediatek,mt7530";
>> +                    reg = <0>;
>> +
>> +                    mediatek,mcm;
>> +                    resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
>> +                    reset-names = "mcm";
>> +
>> +                    core-supply = <&mt6323_vpa_reg>;
>> +                    io-supply = <&mt6323_vemc3v3_reg>;
>> +
>> +                    ports {
>> +                        #address-cells = <1>;
>> +                        #size-cells = <0>;
>> +
>> +                        port@0 {
>> +                            reg = <0>;
>> +                            label = "lan1";
>> +                        };
>> +
>> +                        port@1 {
>> +                            reg = <1>;
>> +                            label = "lan2";
>> +                        };
>> +
>> +                        port@2 {
>> +                            reg = <2>;
>> +                            label = "lan3";
>> +                        };
>> +
>> +                        port@3 {
>> +                            reg = <3>;
>> +                            label = "lan4";
>> +                        };
>> +
>> +                        port@4 {
>> +                            reg = <4>;
>> +                            label = "wan";
>> +                        };
>> +
>> +                        port@6 {
>> +                            reg = <6>;
>> +                            label = "cpu";
>> +                            ethernet = <&gmac0>;
>> +                            phy-mode = "trgmii";
>> +
>> +                            fixed-link {
>> +                                speed = <1000>;
>> +                                full-duplex;
>> +                                pause;
>> +                            };
>> +                        };
>> +                    };
>>                   };
>> +            };
>> +        };
>> +    };
>> +
>> +  # Example 3: Standalone MT7531
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    platform {
>> +        ethernet {
>> +            mdio {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                switch@0 {
>> +                    compatible = "mediatek,mt7531";
>> +                    reg = <0>;
>> +
>> +                    reset-gpios = <&pio 54 0>;
>> +
>> +                    interrupt-controller;
>> +                    #interrupt-cells = <1>;
>> +                    interrupt-parent = <&pio>;
>> +                    interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                    ports {
>> +                        #address-cells = <1>;
>> +                        #size-cells = <0>;
>> +
>> +                        port@0 {
>> +                            reg = <0>;
>> +                            label = "lan1";
>> +                        };
>> +
>> +                        port@1 {
>> +                            reg = <1>;
>> +                            label = "lan2";
>> +                        };
>> +
>> +                        port@2 {
>> +                            reg = <2>;
>> +                            label = "lan3";
>> +                        };
>> +
>> +                        port@3 {
>> +                            reg = <3>;
>> +                            label = "lan4";
>> +                        };
>>   
>> -                port@6 {
>> -                    reg = <6>;
>> -                    label = "cpu";
>> -                    ethernet = <&gmac0>;
>> -                    phy-mode = "trgmii";
>> -                    fixed-link {
>> -                        speed = <1000>;
>> -                        full-duplex;
>> +                        port@4 {
>> +                            reg = <4>;
>> +                            label = "wan";
>> +                        };
>> +
>> +                        port@6 {
>> +                            reg = <6>;
>> +                            label = "cpu";
>> +                            ethernet = <&gmac0>;
>> +                            phy-mode = "2500base-x";
>> +
>> +                            fixed-link {
>> +                                speed = <2500>;
>> +                                full-duplex;
>> +                                pause;
>> +                            };
>> +                        };
>>                       };
>>                   };
>>               };
>>           };
>>       };
>>   
>> +  # Example 4: MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs
>>     - |
>> -    //Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
>> -
>> -    ethernet {
>> -        #address-cells = <1>;
>> -        #size-cells = <0>;
>> -        gmac0: mac@0 {
>> -            compatible = "mediatek,eth-mac";
>> -            reg = <0>;
>> -            phy-mode = "rgmii";
>> -
>> -            fixed-link {
>> -                speed = <1000>;
>> -                full-duplex;
>> -                pause;
>> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>> +    #include <dt-bindings/reset/mt7621-reset.h>
>> +
>> +    platform {
>> +        ethernet {
>> +            mdio {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                switch@0 {
>> +                    compatible = "mediatek,mt7621";
>> +                    reg = <0>;
>> +
>> +                    mediatek,mcm;
>> +                    resets = <&sysc MT7621_RST_MCM>;
>> +                    reset-names = "mcm";
>> +
>> +                    interrupt-controller;
>> +                    #interrupt-cells = <1>;
>> +                    interrupt-parent = <&gic>;
>> +                    interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                    ports {
>> +                        #address-cells = <1>;
>> +                        #size-cells = <0>;
>> +
>> +                        port@0 {
>> +                            reg = <0>;
>> +                            label = "lan1";
>> +                        };
>> +
>> +                        port@1 {
>> +                            reg = <1>;
>> +                            label = "lan2";
>> +                        };
>> +
>> +                        port@2 {
>> +                            reg = <2>;
>> +                            label = "lan3";
>> +                        };
>> +
>> +                        port@3 {
>> +                            reg = <3>;
>> +                            label = "lan4";
>> +                        };
>> +
>> +                        port@4 {
>> +                            reg = <4>;
>> +                            label = "wan";
>> +                        };
>> +
>> +                        port@6 {
>> +                            reg = <6>;
>> +                            label = "cpu";
>> +                            ethernet = <&gmac0>;
>> +                            phy-mode = "trgmii";
>> +
>> +                            fixed-link {
>> +                                speed = <1000>;
>> +                                full-duplex;
>> +                                pause;
>> +                            };
>> +                        };
>> +                    };
>> +                };
>>               };
>>           };
>> +    };
>>   
>> -        gmac1: mac@1 {
>> -            compatible = "mediatek,eth-mac";
>> -            reg = <1>;
>> -            phy-mode = "rgmii-txid";
>> -            phy-handle = <&phy4>;
>> +  # Example 5: MT7621: mux MT7530's phy4 to SoC's gmac1
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>> +    #include <dt-bindings/reset/mt7621-reset.h>
>> +
>> +    platform {
>> +        pinctrl {
>> +            example5_rgmii2_pins: rgmii2-pins {
>> +                pinmux {
>> +                    groups = "rgmii2";
>> +                    function = "rgmii2";
>> +                };
>> +            };
> 
> No need to put this in the example. We don't put provide nodes in
> the examples of the consumers. It's also incomplete and can't be
> validated.

Will remove.

> 
>>           };
>>   
>> -        mdio: mdio-bus {
>> +        ethernet {
>>               #address-cells = <1>;
>>               #size-cells = <0>;

