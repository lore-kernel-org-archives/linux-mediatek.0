Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ij3ADkKEqFYNcOUEVejXAPwu8+461xcX6IeK3lGK/xs=; b=k9XyjZBrek257/
	DOhWDnjL6A6xpUGdDx31bBsFITQHkD8iNNeEGIiTluccXQe4Fk0PDLqCFBk6op4g9lVeCbshG2iLK
	VNMJZN0dWCnQnl277XvSZSCpVU3uAu9eP/+7mBapSj//KX9uf91PCLU9nNqLlMlIL1GuVjIylsZee
	7Q1vnfZGO0TNqkXqBvHZ82Ce1HMbawbgLlwBxCKidSBidv22BhUOu/2aXNOuDmMaZLgFHpkOunGxP
	66hIcZF3Supg3FRYljI3qwrin8sV7ZkR5j8hOsVRXVrDO+UbJ0MRVClvRT3SSYnwudcyiLPYeOgpY
	iyNaVoaeHAS7XdN35PpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk5Ay-007UiS-DM; Thu, 28 Apr 2022 14:31:24 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk5Av-007UhL-2t; Thu, 28 Apr 2022 14:31:22 +0000
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so5304119fac.7; 
 Thu, 28 Apr 2022 07:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Pbfgb+P+Y6uKRbvZrIbkDzsXq4uSgu+65I8ansZfZg=;
 b=UbLtyP4RJ0rmmMDipHd3Gkbm6pSqy8mbMW96C45P3zkOGBDjHYgFK9rW0uSltSjf8A
 lyeF0gydfy7XX83xcftcZw9tcjmPJjLQSeKF9YA8+A2X/L2Vp38F5F2INRBgHcgfZSow
 Dl4Mj2NvYTvA9uRZ9A4UN/A7OcKrYtOeemkjE2OrDvCaI2CRy61XvDSypmXoVRNIESw+
 nSMB5Ezl5WG9wMm8djxPg4Ww0YuaW80Sdrhq9A+VAMoZb+M7agtijzrOKsgbozNOgSEO
 npryHZKWwPWpHBXiwIevdvacSGL6nmLKs9nTWufiSEblkMZ1fImGMxA99eiT2bAOUxMi
 zV+w==
X-Gm-Message-State: AOAM531tqMMvbnGgBi85uo1sEJU3lGkcg+2ZVyUtFrcgSC9qxoraIfEC
 GeAj8TdsVHC28z+Bt6rbXA==
X-Google-Smtp-Source: ABdhPJx1VX5F/tJUIHYIip9Fxu6rAMhFBcqi6cHTI0eggbgDWjn/9R4RMK7nTXnkcz/rMEflMMwQ3w==
X-Received: by 2002:a05:6870:3292:b0:da:d2ff:9dca with SMTP id
 q18-20020a056870329200b000dad2ff9dcamr14140353oac.215.1651156278750; 
 Thu, 28 Apr 2022 07:31:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 5-20020a9d0105000000b005fbe5093eb0sm31088otu.54.2022.04.28.07.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:31:18 -0700 (PDT)
Received: (nullmailer pid 2184573 invoked by uid 1000);
 Thu, 28 Apr 2022 14:31:17 -0000
Date: Thu, 28 Apr 2022 09:31:17 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
Message-ID: <YmqlNV31FrcAyuN9@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-17-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_073121_166761_AFC442A0 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, Apr 28, 2022 at 05:33:53PM +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> new file mode 100644
> index 000000000000..55e8649f2aea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8186-mt6366-da7219-max98357.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8186 with MT6366, DA7219 and MAX98357 ASoC sound card driver
> +
> +maintainers:
> +  - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +
> +description:
> +  This binding describes the MT8186 sound card.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8186_mt6366_da7219_max98357_sound

s/_/-/

> +
> +  mediatek,platform:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8186 ASoC platform.
> +
> +  headset-codec:
> +    type: object

       additionalProperties: false

> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle

sound-dai already has a type, so drop and define how many entries.

> +    required:
> +        - sound-dai
> +
> +  playback-codecs:
> +    type: object

       additionalProperties: false

> +    properties:
> +      sound-dai:
> +        minItems: 2
> +        maxItems: 3

If more than 1 entry, then you need to define what each one is and the 
order. Just like reg, interrupts, clocks, etc.

> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Drop

> +    required:
> +        - sound-dai
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +  - headset-codec
> +  - playback-codecs
> +
> +examples:
> +  - |
> +
> +    sound: mt8186-sound {
> +        compatible = "mediatek,mt8186_mt6366_da7219_max98357_sound";
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "aud_clk_mosi_off",
> +                        "aud_clk_mosi_on";
> +        pinctrl-0 = <&aud_clk_mosi_off>;
> +        pinctrl-1 = <&aud_clk_mosi_on>;
> +
> +        headset-codec {
> +            sound-dai = <&da7219>;
> +        };
> +
> +        playback-codecs {
> +            sound-dai = <&anx_bridge_dp>,
> +                        <&max98357a>;
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
