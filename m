Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854DCC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGSnZm0VuOKrEONTomsoi2Y6B05gYl3IoTvA9v5tU9g=; b=ufMPnMtA30KvQxhh04/gKIDaFe
	an5yW9DN3d7yXxjE9DMMOnCbHhAC1f+8XdualJwmLWFZBuXduQ0+Hq4K3aA6C+U5tjPHfBZKiBRef
	bBUAWHgVrABW8pJM5MNSKgvwxfyOMBTRYStsT4eLav9tQJ7GB+JWYjacvPICq376fo4HUAU4aF6F6
	GVJBLgGzrcjZMw5Rxzwx255zzxeqMZmOqN3WvTAwh1uUyGenJHtWMwCrvCkR2+P5pIL2EeSzDyPAh
	syM92Avjd77uI6IeDTicq/oDC+SSzoDof31f2xk5cGp7dxdF9IOGBhMqYMVR0+a+qIwMap3Luyd3P
	zp6Wutug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp2R-009iqn-1P;
	Wed, 06 Dec 2023 10:21:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp2O-009ipM-01
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 10:21:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33338c47134so518407f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Dec 2023 02:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701858110; x=1702462910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGSnZm0VuOKrEONTomsoi2Y6B05gYl3IoTvA9v5tU9g=;
        b=o1vA8R69ByW16HrQk6bdQibF1wRAVwXBnoSrE7THcDkKSn2BIncvJG3bdX/1ymT5Mn
         N12nV6MmNXB6dI6OGePfashcT2sKmnJXi/iIQCsXAPfD8WyZtortqnDeKpZyzKk8ZdD4
         DAGdJKvR8kfSkgC+5q23/hrrXh3HBz5WsZdHx0G9ln3ZG9iPVIgXcSoE7eQftzudOgrJ
         TTQZ7d0orf5qURiT1vUBli7fGASQKBoAnYrcMnPq4g/5cCyp0L9ueiqktvv0smoozFE0
         oual7G62ALfka85yvUVQTcr2sIkLy84Oj17a4TKOeBtyujwYsk/Gjz2khn420Gb6XdTT
         tGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858110; x=1702462910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGSnZm0VuOKrEONTomsoi2Y6B05gYl3IoTvA9v5tU9g=;
        b=VkB6s95s9C+M5pbreaeOBuubMn9a683cwLT/1f1vZJYjJYBjwApTa039upEmDxYdRf
         bRU3bfGp56Hg8W+RxyU5Gmut0rV/ynzJfdBuUtEIU96g9mljWgZLX/EsBg7BRgbJ8zmO
         ttvHz9MAXFxHYFPSNYM14DXM9DIldmWAhIvKzg3eNGWtMuZqQ1NFGtQzAsOHDsSw6ujk
         vm55DcwHBIuHszVKjMMjN67N6966hFZclykUtSfjNtostE7lYIIggy65ETXSIhizpSpd
         FSR6xDQxx2IXUCT3Q7BPA+vdarhpVua2/oQP4SRvhvULVLHL/hztkaUsA1v6KmKofeIf
         C4ZA==
X-Gm-Message-State: AOJu0Yxjcswh3imIIDiob8Vt26v04wFfE/NJuFQfKHFopdNo6IZMoOgX
	eaGzGZqWcBRiWH+JD1pAANSGHg==
X-Google-Smtp-Source: AGHT+IGzoXE3rpphUtOBnh/oIY8xteut/PqQ2jIxfq/sklKsNF9weobqCp6uu5qey33cTeJI8p0wlA==
X-Received: by 2002:a5d:4a11:0:b0:333:2fd2:6f75 with SMTP id m17-20020a5d4a11000000b003332fd26f75mr340639wrq.127.1701858110600;
        Wed, 06 Dec 2023 02:21:50 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id b5-20020adfe645000000b00333404e9935sm9831476wrn.54.2023.12.06.02.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:21:50 -0800 (PST)
Message-ID: <d80d493f-bc77-4e27-9432-36512e445ba0@linaro.org>
Date: Wed, 6 Dec 2023 11:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Jianhui Zhao <zhaojh329@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, "Garmin.Chang"
 <Garmin.Chang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <23bc89d407e7797e97b703fa939b43bfe79296ce.1701823757.git.daniel@makrotopia.org>
 <def05aac79ddff872d3e56698b736cb445f14116.1701823757.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <def05aac79ddff872d3e56698b736cb445f14116.1701823757.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_022152_108175_CF1EBD72 
X-CRM114-Status: GOOD (  22.09  )
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

On 06/12/2023 01:57, Daniel Golle wrote:
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3:
>  * move clock bindings to clock folder
>  * drop ti,syscon-reset from bindings and example
>  * merge mcusys with topckgen bindings
> 
> v2:
>  * dropped unused labels
>  * add 'type: object' declaration for reset-controller found in new
>    ethwarp controller and represented as ti,syscon-reset
>  * rebase on top of
>    "dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema"
> 
>  .../arm/mediatek/mediatek,infracfg.yaml       |  1 +
>  .../bindings/clock/mediatek,apmixedsys.yaml   |  1 +
>  .../bindings/clock/mediatek,ethsys.yaml       |  1 +
>  .../clock/mediatek,mt7988-ethwarp.yaml        | 49 +++++++++++++++++++
>  .../clock/mediatek,mt7988-xfi-pll.yaml        | 48 ++++++++++++++++++
>  .../bindings/clock/mediatek,topckgen.yaml     |  2 +
>  .../bindings/net/pcs/mediatek,sgmiisys.yaml   | 13 +++--
>  7 files changed, 112 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> index ea98043c6ba3d..230b5188a88db 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt7629-infracfg
>                - mediatek,mt7981-infracfg
>                - mediatek,mt7986-infracfg
> +              - mediatek,mt7988-infracfg
>                - mediatek,mt8135-infracfg
>                - mediatek,mt8167-infracfg
>                - mediatek,mt8173-infracfg
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
> index 372c1d744bc27..685535846cbb7 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
> @@ -22,6 +22,7 @@ properties:
>            - mediatek,mt7622-apmixedsys
>            - mediatek,mt7981-apmixedsys
>            - mediatek,mt7986-apmixedsys
> +          - mediatek,mt7988-apmixedsys
>            - mediatek,mt8135-apmixedsys
>            - mediatek,mt8173-apmixedsys
>            - mediatek,mt8516-apmixedsys
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
> index 94d42c8647777..f9cddacc2eae1 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
> @@ -22,6 +22,7 @@ properties:
>                - mediatek,mt7629-ethsys
>                - mediatek,mt7981-ethsys
>                - mediatek,mt7986-ethsys
> +              - mediatek,mt7988-ethsys
>            - const: syscon
>        - items:
>            - const: mediatek,mt7623-ethsys
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
> new file mode 100644
> index 0000000000000..9b919a155eb13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7988-ethwarp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7988 ethwarp Controller
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description:
> +  The Mediatek MT7988 ethwarp controller provides clocks and resets for the
> +  Ethernet related subsystems found the MT7988 SoC.
> +  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt7988-ethwarp
> +      - const: syscon
> +      - const: simple-mfd

Why this is a simple MFD without children? Something is not right here.
Either this is not simple-mfd or this is not complete binding.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/ti-syscon.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@15031000 {
> +            compatible = "mediatek,mt7988-ethwarp", "syscon", "simple-mfd";
> +            reg = <0 0x15031000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
> new file mode 100644
> index 0000000000000..fe5e3a70299fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7988-xfi-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7988 XFI PLL Clock Controller
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description:
> +  The MediaTek XFI PLL controller provides the 156.25MHz clock for the
> +  Ethernet SerDes PHY from the 40MHz top_xtal clock.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7988-xfi-pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        clock-controller@11f40000 {
> +            compatible = "mediatek,mt7988-xfi-pll";
> +            reg = <0 0x11f40000 0 0x1000>;
> +            resets = <&watchdog 16>;
> +            #clock-cells = <1>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
> index 6d087ded7437a..bdf3b55bd56fd 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
> @@ -37,6 +37,8 @@ properties:
>                - mediatek,mt7629-topckgen
>                - mediatek,mt7981-topckgen
>                - mediatek,mt7986-topckgen
> +              - mediatek,mt7988-mcusys
> +              - mediatek,mt7988-topckgen
>                - mediatek,mt8167-topckgen
>                - mediatek,mt8183-topckgen
>            - const: syscon
> diff --git a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
> index 66a95191bd776..68632cda334bd 100644
> --- a/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
> +++ b/Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
> @@ -15,15 +15,22 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> +    oneOf:
> +      - items:
> +        - enum:

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof


