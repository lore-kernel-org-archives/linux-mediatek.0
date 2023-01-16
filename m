Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D5EC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zms17SHseS3wAoavooLT/19S/3viSn8s+o0NzNuVEiU=; b=YX8Zfd3fgN1vxuD6ItZr+4DdZw
	zSgCrlf9SERUmvJma1fHekjMWhbEIOIUJ7vvm71KbbHdUgAEIMFCFP/bPnXBpk2IrMwcHBMTaA1Js
	5ECcP+yB1raqech7YEi9SzILzj2I5Bvokmb7Oi1Lyj0O/EeCoHgDuKUDfhZ1LqduO61SElfwzMZB/
	bMe+kP4UTOmsw/VadErG1OdIYbDI0C3HpoV3c/Lwo6fvftOimm0rR6WPMLGm6Va5xt5uUjTUGLHhk
	06SRswenLM9fKC3yGu7moyvo0bVao+3wIt0bKmHdEhsrUPgrdDfxYNeZi5TlVE7oHtv4WSsjVVlUC
	fJBkvHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKZY-00978n-9c; Mon, 16 Jan 2023 08:10:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKZK-00974c-Cl
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 08:10:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id cf18so59771367ejb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 00:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zms17SHseS3wAoavooLT/19S/3viSn8s+o0NzNuVEiU=;
        b=h5Sj63KXGKJ6mTUFmnOoksQZFRd0wz0/9nKYmTFIxVovnq8T/KiMMHhMmv/YX/kO2d
         +d/hw+HaA53PTT1rJma1PlfP69+vcM9CadbwgE2yzurhYx/4KXcCFN2mRR41bzabVb4c
         sy6pvuXMaf7/9MNYHWQgZMyObKeSv25F1+zHPIQzPpvqAn5+sAYLrHcQEM0sDE7DVSFZ
         7KlgjqHiXG+qZaWlD0JWhoUv+0gsqXjd3q6gHl4H5QKJsxBCvM5AjBkmWESZz5Uh86GM
         MP1dSaDM4YuaoQNJ9DAHklVpcu96FXpdNUXT18aMH3PJ8YJ6scB2CkeQZ3/fi4AeivH0
         hrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zms17SHseS3wAoavooLT/19S/3viSn8s+o0NzNuVEiU=;
        b=lVxmnCrSSO6a+9kM1K+Y8auog28qW6BGScwZAsBT1XU3Qe49RM0El/M6HAWikTwBFB
         3TUezR2/MoebHIIZAB3FSUUutfI+X4x80rAtTAyxdulCeUIobEKeXX/JUdWYFhHGx7TC
         MgKW7gwczmv+qZH0pYXqVJZ4ufcKPM04Bz1XJlNqFHF2nijKtS5nuiwEPLSkRS6vfINe
         l3RdbkP7uv59HFpJLbvDkQo11KG3/RqvulpN02IiNpQ2ibUFuOI9a3IwwzTeuKqLm6jY
         Wi37YFOLfU0R63bMdNPv45T5pS8hD6c2FOyT8kuKNU9KlWs5GoQM2muKF9c2jyAE9zCJ
         AInQ==
X-Gm-Message-State: AFqh2kq1/YdI1vAE3BI9zCuqNauAuM6D5Y+rpBJO2Ody8+YHF97HCLKh
	txyEy6EwOYNPslz4EsqpxN35lA==
X-Google-Smtp-Source: AMrXdXsoQ8RZgHiEi0DjL+X9OpgWoZTiwWDn4sfC2Q/QMHAv5AT27GqlyXu1cVT+1PPwqX/xmaiOow==
X-Received: by 2002:a17:906:eb88:b0:870:7e7d:97a7 with SMTP id mh8-20020a170906eb8800b008707e7d97a7mr3021202ejb.72.1673856609899;
        Mon, 16 Jan 2023 00:10:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j3-20020a170906474300b0084d4cb08f27sm8551169ejs.104.2023.01.16.00.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:10:09 -0800 (PST)
Message-ID: <f24a54f1-2720-3345-9596-bb8d388ba16f@linaro.org>
Date: Mon, 16 Jan 2023 09:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND v3 01/13] dt-binding: mediatek: add bindings for MediaTek
 mt8195 MDP3 components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
 <20230116032147.23607-2-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116032147.23607-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_001014_445299_53A1CCBE 
X-CRM114-Status: GOOD (  22.36  )
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

On 16/01/2023 04:21, Moudy Ho wrote:
> This patch adds support for MT8195 MDP3 RDMA, and introduce more
> MDP3 components present in MT8195.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Subject: drop second/last, redundant "bindings for". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-aal.yaml     | 63 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-color.yaml   | 63 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-fg.yaml      | 63 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-hdr.yaml     | 62 +++++++++++++++
>  .../bindings/media/mediatek,mdp3-merge.yaml   | 63 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-ovl.yaml     | 63 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-pad.yaml     | 63 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 30 +++++---
>  .../bindings/media/mediatek,mdp3-rsz.yaml     | 11 ++-
>  .../bindings/media/mediatek,mdp3-split.yaml   | 75 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-stitch.yaml  | 63 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tcc.yaml     | 62 +++++++++++++++
>  .../bindings/media/mediatek,mdp3-tdshp.yaml   | 63 ++++++++++++++++
>  13 files changed, 731 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
> new file mode 100644
> index 000000000000..d2e1b5245778
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml

Filename should match compatible, unless you already expect this binding
will cover other devices. If so, why not adding them now?

> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-aal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 AAL
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components is responsible for backlight
> +  power saving and sunlight visibility improving.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-aal
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1

items with items syntax instead:

https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42

> +
> +  clocks:
> +    minItems: 1

Nope, maxItems.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    mdp3-aal0@14005000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Definitelly "3" and "0" are not generic suffixes.

All comments above apply to your other files here.

> +        compatible = "mediatek,mt8195-mdp3-aal";
> +        reg = <0x14005000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
> new file mode 100644
> index 000000000000..1d8aa5dc76b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-color.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 COLOR
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to adjust hue, luma and
> +  saturation to get better picture quality.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-color

This is exactly the same as previous file. Why do you split the binding?
It really looks unnecessary.

Probably all other files should be also squashed.

> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.

Full, real path please, so it could be validated with tools.


Best regards,
Krzysztof


