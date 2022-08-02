Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E8C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8NreoGKkK+VxQp/D3L+V3RlsEHxAYo7BDb9bUMwhTs=; b=AJ9yj1ZC0N7Z4V3boZpL+ovKll
	0Z0FeU2JllRIK2vfpd9USKgUWun6kXrC0iQpxC64dI/5SCTsB2AVG5EPgEvl3kJdy/rDW6UqCOIj1
	VBrmrCZPFLsZVSVGyXw0Su0JHDtb8imQuBNstnPIg2VArFeW//RLp5b7lgfmEzppiKt8oyfwX7K8I
	Kw33rD2KH1Vj1ng5JJSfNLLLb59oK6aZAgfWbqDu+2GzfLIK9zqXQrortQ2oi4/vxaoBo0NKuJ7EB
	IdoYVdN0n/MAd1JfNORxTOCT3DOm9mYWg+JKb59EW9fLGmVKMbwYW6IoI+NxDJpDjNgcsdoD2QxqY
	h698w0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInUk-00BxQK-Da; Tue, 02 Aug 2022 08:43:18 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInUf-00BxMQ-6b
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 08:43:14 +0000
Received: by mail-lf1-x12f.google.com with SMTP id z25so20991054lfr.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A8NreoGKkK+VxQp/D3L+V3RlsEHxAYo7BDb9bUMwhTs=;
        b=DwrLHX9yv9a8Ud9/kIJugf+4hQBmuanUhErYtoe6/goL+ogB2ykWvvcQyUwVLWlkYj
         qFNefVxy68HeperxWCEP+9vswwbg5RfGhvHv+l1g5u8SXhWc0VuDzywuhZd238D8p5ac
         KyGxuyXUVakLRw3hgIOQWwwWFzoXdqAVJOobUHZB5FxyWIxZZp/IgxOs8QXUma8DNkvb
         oC2cvhNBodZf33kA1xbhPSeNalvm+W1rkppk0T8ll4PIHo5FRocf7mBw9yb6A9lWLMDX
         ElRVNHIGOS+6exADX8ux/LxeNoRJp7U04v532c2etT0VctOi0XQZR5Aygf/WLuOC+YHa
         KDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A8NreoGKkK+VxQp/D3L+V3RlsEHxAYo7BDb9bUMwhTs=;
        b=qwlG8qPpqK8sxXrpnun724vrgida9GiOvplbbNGEGW+RCdKLEQe6dCv3IVVqmnxfVS
         TA06bsbd0fNbaFB9fOx+/+Mamwfy7wTjBfIItTYyg96Pee0lRM5VBj0X/YlER+neCeP7
         3s79Sa86pOWsXBJpwGnuOGWEUD0DwMuIAvgJ31+eYY3fKgwPXHyAVLAIb1I9n5hYQF6f
         NdkPTwNysgMeZsxvabTgnz+FiNMGjfm54WEVdezT3VJBMs7SHfiSi86vZUR3SDbqMSPM
         p7Q629AKSqF1ynYqamOxw67oQ46Q7SheIKhm6puNUcWjt4R56IJBl0/CmLkQIgdsFLnI
         dYfQ==
X-Gm-Message-State: AJIora8KqZrVcYg34x+mJN6aNPdBRwfPMMxhwg5lXkG9UHWMEZbut3XS
	br+mdL0ZypsjS5LwU2P43Nbucw==
X-Google-Smtp-Source: AGRyM1vrpapAb7WmuZGQGBBORJ//+bpBS9bq+/4bd5osnpi4MDcUw4lE/0OkZuXdpEGXVU6t7ClspA==
X-Received: by 2002:a05:6512:b1a:b0:47f:b574:9539 with SMTP id w26-20020a0565120b1a00b0047fb5749539mr6734853lfu.143.1659429791625;
        Tue, 02 Aug 2022 01:43:11 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id h19-20020a056512221300b0048ae9114c73sm1312970lfu.243.2022.08.02.01.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:43:10 -0700 (PDT)
Message-ID: <83cc7c13-fb91-655c-0be3-1f2ad0e4c0f6@linaro.org>
Date: Tue, 2 Aug 2022 10:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: mediatek,mt7530: update
 examples
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
 <20220730142627.29028-3-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220730142627.29028-3-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_014313_321614_47792ACA 
X-CRM114-Status: GOOD (  20.60  )
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

On 30/07/2022 16:26, Arınç ÜNAL wrote:
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
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 661 +++++++++++++-----
>  1 file changed, 500 insertions(+), 161 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 541984a7d2d4..479e292cb2af 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -186,144 +186,374 @@ allOf:
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

This is the same as previous... actually several examples are similar.
Do not add examples for each compatible - this is not DTS. Add only one
example for significant differences.

Best regards,
Krzysztof

