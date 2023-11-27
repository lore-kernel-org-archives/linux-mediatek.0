Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C335AC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g86YtSS//IjTCJBYsf1NPWyqXQksoEkdn33XBneuwxE=; b=XGIXWA6S8I5DrEVM7F8NmVbmzS
	zjxS/1v22Tjf3WU0/r8iBL3qauJkhIrnfQVC8MvGsxln57O/VgiIP+BGxcqsMsyCzc75ZzLDB67b2
	SvE5Ol1vi6At8jM7pXdy/8QHO+1ekehe7OLinC9W9EqqQmIJhxu+fEF6NUzYsOHlcNOZ4JneVVItN
	jui067OeSuRyFKDSBmAY2W4EuhpoEAz0JzvXF0ZHzIO3ARCfzc1zfgDTaVNZE0bYjhGkZ7bNh8M2L
	5e8EBlrPHWPTA6WcGwlQp+eJGMptMfoJMtOobo4Oh4egHG4B00W4FEaL8YUaJiQDwvzgM+GJCelP2
	KC1JlGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7kCQ-003bK5-1i;
	Mon, 27 Nov 2023 22:35:30 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7kCM-003bJM-0t;
	Mon, 27 Nov 2023 22:35:28 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b833b54f14so2172318b6e.1;
        Mon, 27 Nov 2023 14:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124525; x=1701729325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g86YtSS//IjTCJBYsf1NPWyqXQksoEkdn33XBneuwxE=;
        b=qW9m/QpKCx0zUIuvF5ltlWwwUnpFN2nc/Y8six1Kr9ZMgnlXBZtAZtUPAU+8S8bEmB
         U/qSqAOtZ6dttEPRqF8ex01V5G+8rsBb1+NQdnbE5z17O99R02HPprOpatfhAT7H10HM
         R9EYW1npwjIf25Y8jyUsgYwi33MnxZWIoLicF79Yyn8jmgxepG38cshNj+MD/RG4amv1
         PzE7Wzx8rL74YVwGFNHEd14//GU8SAghKJ9D7n1dSG3IRXLDCftMO4YM9PiyXO7rfPao
         IXrRzXhImAOJLVb43I4KnbhB7HjXArvAF4zjH3SKmlyvvoABjeBEbYNE2r+iNWL62Syq
         DiNw==
X-Gm-Message-State: AOJu0Yz9QG4MElmR0exf9huBpcilYhpwCTjblKNvl4xpIPL3uKzeMIHw
	OMpH45zsXHHG26Aylbs4eQ==
X-Google-Smtp-Source: AGHT+IG3Ehv5n5h/9/ZyzIfSBG1aHBg8h1q7IcFURoniaHTNxt9dc4pnOUUpAeplCccO1Zl8PRxQUw==
X-Received: by 2002:a05:6808:bd0:b0:3af:7c6a:6043 with SMTP id o16-20020a0568080bd000b003af7c6a6043mr6023680oik.23.1701124524930;
        Mon, 27 Nov 2023 14:35:24 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bf4-20020a056808190400b003af56ef1510sm1630793oib.20.2023.11.27.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:35:24 -0800 (PST)
Received: (nullmailer pid 151319 invoked by uid 1000);
	Mon, 27 Nov 2023 22:35:23 -0000
Date: Mon, 27 Nov 2023 16:35:23 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 6/8] dt-bindings: net: Document Qcom
 QCA807x PHY package
Message-ID: <20231127223523.GB4023452-robh@kernel.org>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_143526_432746_08FBEB10 
X-CRM114-Status: GOOD (  28.72  )
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

On Sun, Nov 26, 2023 at 02:53:44AM +0100, Christian Marangi wrote:
> Document Qcom QCA807x PHY package.
> 
> Qualcomm QCA807X Ethernet PHY is PHY package of 2 or 5
> IEEE 802.3 clause 22 compliant 10BASE-Te, 100BASE-TX and
> 1000BASE-T PHY-s.
> 
> Document the required property to make the PHY package correctly
> configure and work.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/net/qcom,qca807x.yaml | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,qca807x.yaml b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
> new file mode 100644
> index 000000000000..136ba2128b73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,qca807x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCA807X Ethernet PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  Qualcomm QCA807X Ethernet PHY is PHY package of 2 or 5
> +  IEEE 802.3 clause 22 compliant 10BASE-Te, 100BASE-TX and
> +  1000BASE-T PHY-s.
> +
> +  They feature 2 SerDes, one for PSGMII or QSGMII connection with
> +  MAC, while second one is SGMII for connection to MAC or fiber.
> +
> +  Both models have a combo port that supports 1000BASE-X and
> +  100BASE-FX fiber.
> +
> +  Each PHY inside of QCA807x series has 4 digitally controlled
> +  output only pins that natively drive LED-s for up to 2 attached
> +  LEDs. Some vendor also use these 4 output for GPIO usage without
> +  attaching LEDs.
> +
> +  Note that output pins can be set to drive LEDs OR GPIO, mixed
> +  definition are not accepted.

This so far is about the only thing that convinces me of having child 
nodes.

> +
> +  PHY package can be configured in 3 mode following this table:
> +
> +                First Serdes mode       Second Serdes mode
> +  Option 1      PSGMII for copper       Disabled
> +                ports 0-4
> +  Option 2      PSGMII for copper       1000BASE-X / 100BASE-FX
> +                ports 0-4
> +  Option 3      QSGMII for copper       SGMII for
> +                ports 0-3               copper port 4
> +
> +$ref: ethernet-phy-package.yaml#
> +

Did you test this binding? No, because there is nothing to select it. 
Just put a wrong value for qcom,package-mode and see.

ethernet-phy-package.yaml will be applied, but since it allows any extra 
properties not much is tested.

> +properties:
> +  qcom,package-mode:
> +    enum:
> +      - qsgmii
> +      - psgmii

description needed.

I don't understand how the 3 modes works with only 2 modes defined here.

> +
> +  qcom,tx-driver-strength:
> +    description: set the TX Amplifier value in mv.

millivolts or...

> +      If not defined, 600mw is set by default.

milliwatts?

Whatever it is, use standard unit suffix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [140, 160, 180, 200, 220,
> +           240, 260, 280, 300, 320,
> +           400, 500, 600]
> +
> +patternProperties:
> +  ^ethernet-phy(@[a-f0-9]+)?$:

I'm confused. The addresses are MDIO, but you have just 0-4. Might be 
correct or might not?

In any case, the unit-address should be restricted to '@1?[0-9a-f]$'. 
Though that belongs in mdio.yaml and here '^ethernet-phy@' is sufficient 
(once there's a reference to mdio.yaml).

> +    $ref: ethernet-phy.yaml#

> +
> +    properties:
> +      gpio-controller:
> +        description: set the output lines as GPIO instead of LEDs
> +        type: boolean
> +
> +      '#gpio-cells':
> +        description: number of GPIO cells for the PHY
> +        const: 2
> +
> +    dependencies:
> +      gpio-controller: ['#gpio-cells']

No need for this, the common gpio schema does this.

> +
> +    if:
> +      required:
> +        - gpio-controller
> +    then:
> +      properties:
> +        leds: false
> +
> +    unevaluatedProperties: false

Move under $ref.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy-package@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "ethernet-phy-package";
> +            reg = <0>;
> +
> +            qcom,package-mode = "qsgmii";

Nothing in here tells me this is a QCA807X other than this property 
(sort of). You need a specific compatible.

> +
> +            ethernet-phy@0 {
> +                reg = <0>;
> +
> +                leds {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    led@0 {
> +                        reg = <0>;
> +                        color = <LED_COLOR_ID_GREEN>;
> +                        function = LED_FUNCTION_LAN;
> +                        default-state = "keep";
> +                    };
> +                };
> +            };
> +
> +            ethernet-phy@1 {
> +                reg = <1>;
> +            };
> +
> +            ethernet-phy@2 {
> +                reg = <2>;
> +
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            ethernet-phy@3 {
> +                reg = <3>;
> +            };
> +
> +            ethernet-phy@4 {
> +                reg = <4>;
> +            };
> +        };
> +    };
> -- 
> 2.40.1
> 

