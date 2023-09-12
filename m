Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1068ECA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stR6EqZjuV5HhouRZxBMlxYw04Q56qEGFFA6lvC7lcc=; b=Bg9feoPDj55Om1HhZc8H0HiX6k
	GtJ/8gJhAKtZcutfFUHEskRGdZ5Rc6GHww1r5lfkyfNuiECw8p47uIYgaWdPwbE0hKg2ZcZCQChAw
	QGf5OGCbGjBxitw7YnjXi8UVi/PNGeIU0ZYK2cGq+imAMq4RQCXSmv8l4d1TLPzBVHOerDa/XynQf
	EMCu2SsFBdiZcrb1ed0tBjBDEEfVxPhOQDNOCdfktx3WO5LKYHvSYvuthmAdzO+/9cVibCG3FHc5X
	zfr/XE66x+fcDGR2toisb06m8jS0FdOo0snok+HQ4n/XYM1YlTJxEuPL70qFXWlzvdpUIOJI864nL
	+ksG+Vew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyct-002YUT-0a;
	Tue, 12 Sep 2023 08:20:03 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfycp-002YSY-0h
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 08:20:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99bf3f59905so665005666b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 01:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506797; x=1695111597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=stR6EqZjuV5HhouRZxBMlxYw04Q56qEGFFA6lvC7lcc=;
        b=AcPeBm9CfR6N/85XPDzDb71OHHV+u6UDZr4firIC383NIdiPtRKapp6A18xgOtKPdc
         Zdh0Ysso+Fv+zm7r9E+wu5AoZsn1aLD5J1fASUSFk9QOSssZ6enrVwuydQrddZzet1QC
         7Ud5xO2pjgDgQhb3hgRkUukFUiEnZgULub4nlGZIG5k1LmWZz2U1afNuMrntKviFvwX8
         FghxjqkXxBs0UkDQpN3EvHMIdgLT1A1Pl3ejVyoJeDGnldfWledo+9z7UVmfmVcP6uf/
         LdH7DGqAhCCs8cdPV6rm5jbaPIJ8q7C+mdNnoBhSl8pd3tJUOnit7yxduKz0chobuBez
         kkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506797; x=1695111597;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stR6EqZjuV5HhouRZxBMlxYw04Q56qEGFFA6lvC7lcc=;
        b=EiRa9J1VT8ayScf+W3yrJmwow6Au6RGBL6EM9xLrQZtScNxCI75kWnyq1d4vJoWZ5I
         xrpzPocfrxMMfLJHaLO3px6c5psz0Vf3/e6Ib1z9J4WKtIBs0LCGQRmCeEPbKIXVzH3i
         LiIVQcuhVtiUjHfD8Uw/tgkQZqZkeOTwmgCtTgWI3PRHYSXJytZc1E4zser03cmnTnDa
         Dlt63XsTKoyJBE9pAi4nDPPYcqvexWK6qevap3sWo02bwyA9pSU+8KaP2lGpphBL9BkA
         y6BFXy+2fYoPmKJXTuKtnnveYY/iI0p5ZGb85DERHunHR5M0OLdPWGNUuwGNNotjlZzx
         m9qA==
X-Gm-Message-State: AOJu0Yw+Nu/cez6Q+QvAwnwu/eSftyZsES02WzC2714b5suav29vQirS
	O10upm2wPgBy62nR0bsnv87vTg==
X-Google-Smtp-Source: AGHT+IHxLh1j6/qZJbH3ElIvOS9Ozbj27bZE0UvkopwLq9g/xzJNVDe1VEoNG2+PPxZRq+qjnUzJSg==
X-Received: by 2002:a17:907:a0c7:b0:9ad:8f26:fdba with SMTP id hw7-20020a170907a0c700b009ad8f26fdbamr477711ejc.15.1694506796686;
        Tue, 12 Sep 2023 01:19:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id r12-20020a170906c28c00b00997c1d125fasm6476225ejz.170.2023.09.12.01.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:19:55 -0700 (PDT)
Message-ID: <e4119fa6-a4b7-f59e-7115-044fa83c9063@linaro.org>
Date: Tue, 12 Sep 2023 10:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 3/3] dt-binding: mediatek: add MediaTek mt8195 MDP3
 components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-4-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075651.10693-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_011959_258854_134F9424 
X-CRM114-Status: GOOD (  23.10  )
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

On 12/09/2023 09:56, Moudy Ho wrote:
> Introduce more MDP3 components present in MT8195.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        |  2 +-
>  .../display/mediatek/mediatek,color.yaml      |  2 +-
>  .../display/mediatek/mediatek,merge.yaml      |  1 +
>  .../display/mediatek/mediatek,ovl.yaml        |  2 +-
>  .../display/mediatek/mediatek,split.yaml      |  1 +
>  .../bindings/media/mediatek,mdp3-fg.yaml      | 61 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-hdr.yaml     | 60 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-pad.yaml     | 61 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 16 ++---
>  .../bindings/media/mediatek,mdp3-stitch.yaml  | 61 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tcc.yaml     | 60 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
>  12 files changed, 378 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 7fd42c8fdc32..04b1314d00f2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
> +          - mediatek,mt8195-mdp3-aal
>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> @@ -63,7 +64,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts

Why? commit msg tells nothing about it. Why interrupt is not erquired in
mt8173? How dropping such requirement is anyhow related to mt8195?


>    - power-domains
>    - clocks
>  
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index f21e44092043..8e97b0a6a7b3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2701-disp-color
>            - mediatek,mt8167-disp-color
>            - mediatek,mt8173-disp-color
> +          - mediatek,mt8195-mdp3-color
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-color
> @@ -66,7 +67,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts

Why?

>    - power-domains
>    - clocks
>  
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index eead5cb8636e..401498523404 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - mediatek,mt8173-disp-merge
>            - mediatek,mt8195-disp-merge
> +          - mediatek,mt8195-mdp3-merge
>        - items:
>            - const: mediatek,mt6795-disp-merge
>            - const: mediatek,mt8173-disp-merge
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 3e1069b00b56..10d4d4f64e09 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt8173-disp-ovl
>            - mediatek,mt8183-disp-ovl
>            - mediatek,mt8192-disp-ovl
> +          - mediatek,mt8195-mdp3-ovl
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-ovl
> @@ -76,7 +77,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts

Why?

>    - power-domains
>    - clocks
>    - iommus
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index a8a5c9608598..a96b271e3240 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -23,6 +23,7 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt8173-disp-split
> +          - mediatek,mt8195-mdp3-split
>        - items:
>            - const: mediatek,mt6795-disp-split
>            - const: mediatek,mt8173-disp-split
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> new file mode 100644
> index 000000000000..71fd449de8b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 FG
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to add film grain
> +  according to AV1 spec.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-fg
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

This must be maxItems. Use existing code as an example, do not re-invent it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@14002000 {
> +        compatible = "mediatek,mt8195-mdp3-fg";
> +        reg = <0x14002000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> new file mode 100644
> index 000000000000..fb1bb5a9e57f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 HDR
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to perform HDR to SDR
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-hdr
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Here as well. Why is this minitems?

> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@14004000 {
> +        compatible = "mediatek,mt8195-mdp3-hdr";
> +        reg = <0x14004000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
> new file mode 100644
> index 000000000000..13b66c5985fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-pad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 PADDING
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to insert
> +  pre-defined color or alpha value to arbitrary side of image.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-pad

And you cannot add it to existing padding because?

> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Nope

> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@1400a000 {
> +        compatible = "mediatek,mt8195-mdp3-pad";
> +        reg = <0x1400a000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_PADDING>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 0c22571d8c22..17cd5b587e23 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -23,6 +23,7 @@ properties:
>      enum:
>        - mediatek,mt8183-mdp3-rdma
>        - mediatek,mt8195-vdo1-rdma
> +      - mediatek,mt8195-mdp3-rdma

m is before v

>  
>    reg:
>      maxItems: 1
> @@ -50,17 +51,19 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: RDMA clock
> -      - description: RSZ clock
> +    oneOf:
> +      - items:
> +          - description: RDMA clock
> +          - description: SRAM shared component clock
> +      - items:
> +          - description: RDMA clock

Why now mt8183 can have SRAM clock optional? How changing mt8183 is
related to this patch?

I'll finish the review, sorry fix basics here.

Best regards,
Krzysztof


