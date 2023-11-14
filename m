Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825AFC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grqabXhF1cc92vF8gq/pM9VwhzUupGdZ4UapkLTlThU=; b=BdaXdaIFi/gnO6WFsebEkYhPC1
	EAR5QwdALm1csnU3bSgdLyjMjgQr+60Yhsh7Nlpohd4vscPW715UuGSUW3x+1TiUR8phCVbpUCgOU
	2fG5roboMwdcHmUDtvJ6dyFbmyY0+Q9gVNnBT6aA1sgHqRrt1+cVmrOKDja9J+Gc1qvTkXea3lUZs
	6Pel6AQVfknNqBo46ZrD8MZv1dAiLzwjw3ckcE7zbD95rkQrUQEKTQbw4OtAdJKJvM89FI52O+nk0
	ujWo6mWE8ErC1/UHsBpKMyfxaSjI4SvG7VnzZ5v2ZLIPNlSIkh3zU8/u5C/vtTroPnuVhmvfvyH6f
	3tg7avmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uA3-00G8fs-0i;
	Tue, 14 Nov 2023 14:13:03 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2u9z-00G8ek-2n;
	Tue, 14 Nov 2023 14:13:01 +0000
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b2f4a5ccebso3674695b6e.3;
        Tue, 14 Nov 2023 06:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971177; x=1700575977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grqabXhF1cc92vF8gq/pM9VwhzUupGdZ4UapkLTlThU=;
        b=r2mdK/JlAjIHhrgU+cjanLX/3gttTRiTQqn2u1PSGAqgBmeU01Rd6eUaeSLQ/wFAW6
         UY/LhGfQoUfzPsaVFqD3HlUhAzsnhW4ztLrJ2FoeeSJrIlLE+/ijm1KdvIwrRrdjwZSi
         ziz0bI1ke5PE7S4s2Vs2sNaIjO8yTfyRgJSdBij1T8p8iq5TgwW/2Fo0LyZ+V7brFjmW
         of/8dal5FpC8eblrbF6IOrwdGEDCKGDTzXyMEhO4v+cFGsFBAuw3twMXydEgceV8Hxyb
         Es94XKZANhUaV5sObGddZ8sQcb7v9KrWU983hjLP+a0iRNMbUSGDTSiHheWIEdksc27f
         pFjQ==
X-Gm-Message-State: AOJu0YyPp5KSFfxl8qydXV4XgRbnC/I9sxDJlXGiX7k117pHk1H02yAt
	v8xO339LfVSTzll2cplF7w==
X-Google-Smtp-Source: AGHT+IGM8P2dNpor6yqmA3vMzSNCOpGNAQLuH/RBi+neq4/Gkrf0qxbf/uIffCsQIQU/hDO8wYDRbw==
X-Received: by 2002:a05:6871:64f:b0:1ea:3210:3b5d with SMTP id x15-20020a056871064f00b001ea32103b5dmr14372864oan.40.1699971177494;
        Tue, 14 Nov 2023 06:12:57 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z18-20020a9d7a52000000b006ce25d48e55sm205730otm.67.2023.11.14.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:12:56 -0800 (PST)
Received: (nullmailer pid 1682194 invoked by uid 1000);
	Tue, 14 Nov 2023 14:12:55 -0000
Date: Tue, 14 Nov 2023 08:12:55 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mediatek: add clock controllers
 of MT7988
Message-ID: <20231114141255.GA1678477-robh@kernel.org>
References: <cde7269e5975907ed2b7799328ea814e529ecf51.1699909748.git.daniel@makrotopia.org>
 <42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061259_901298_3D98D9CC 
X-CRM114-Status: GOOD (  21.70  )
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
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Sabrina Dubroca <sd@queasysnail.net>, Johnson Wang <johnson.wang@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Garmin.Chang" <Garmin.Chang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 13, 2023 at 09:12:19PM +0000, Daniel Golle wrote:
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any previous
> MediaTek SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/arm/mediatek/mediatek,ethsys.txt |  1 +
>  .../arm/mediatek/mediatek,infracfg.yaml       |  1 +
>  .../arm/mediatek/mediatek,mt7988-ethwarp.yaml | 60 +++++++++++++++++++
>  .../arm/mediatek/mediatek,mt7988-mcusys.yaml  | 46 ++++++++++++++
>  .../arm/mediatek/mediatek,mt7988-xfi-pll.yaml | 49 +++++++++++++++
>  .../bindings/clock/mediatek,apmixedsys.yaml   |  1 +
>  .../bindings/clock/mediatek,topckgen.yaml     |  1 +
>  .../bindings/net/pcs/mediatek,sgmiisys.yaml   |  2 +
>  8 files changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-mcusys.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-xfi-pll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> index eccd4b706a78d..ac52579e03618 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> @@ -12,6 +12,7 @@ Required Properties:
>  	- "mediatek,mt7629-ethsys", "syscon"
>  	- "mediatek,mt7981-ethsys", "syscon"
>  	- "mediatek,mt7986-ethsys", "syscon"
> +	- "mediatek,mt7988-ethsys", "syscon"
>  - #clock-cells: Must be 1
>  - #reset-cells: Must be 1
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
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.yaml
> new file mode 100644
> index 0000000000000..0c3d5e88b09df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.yaml
> @@ -0,0 +1,60 @@
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
> +  The reset-controller can be represented using the ti,syscon-reset bindings.
> +  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt7988-ethwarp
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-controller: true

type: object

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
> +        ethwarp: clock-controller@15031000 {

Drop unused labels. Elsewhere too.

> +            compatible = "mediatek,mt7988-ethwarp", "syscon", "simple-mfd";
> +            reg = <0 0x15031000 0 0x1000>;
> +            #clock-cells = <1>;
> +
> +            ethrst: reset-controller {
> +                compatible = "ti,syscon-reset";
> +                #reset-cells = <1>;
> +                ti,reset-bits = <
> +                    0x8 9 0x8 9 0 0 (ASSERT_SET | DEASSERT_CLEAR | STATUS_NONE)
> +                >;
> +            };
> +        };
> +    };

