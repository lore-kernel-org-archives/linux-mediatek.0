Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1665DC54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWMOyAMGj4BPUfVQH/f9CThvYEhtc8ZUIoj4aNclbDw=; b=aPK1hQYutfN53Q9T2yMgwdkieR
	pkldjowBT3/4e9C9bb3SG0BWKA3RWySlj3DAXVgX7yi4zMgtmbcArqHQPLalvKP2EDxInlImIjfjG
	ReA/vTn9gsMOKoiKLtKGGtOjBCmv+qdatilyTNDFb6qXySXvRyhn1z1k33+IuzHyU15raQB1RHHMk
	2DaociuRrjXy6KcLs3TQzqBkBbE2hnmkQZxkQsNuQFfBjumF8itMzkBKsPdkXykFphm9CM8wcUEUR
	ulf3rgEj8YN2jxFZkkXnpTEkjGD86+5zekkBc6peQ5Gn2M+goMjahDkge4EScGo+XKoAPybwRendT
	WD/ty6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retQH-00000004Rvv-389B;
	Tue, 27 Feb 2024 09:06:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retQE-00000004Run-1hUK
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Feb 2024 09:06:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so3898481a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Feb 2024 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709024805; x=1709629605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWMOyAMGj4BPUfVQH/f9CThvYEhtc8ZUIoj4aNclbDw=;
        b=SeJVZtROm/qMGH3jrzgUCdOEhglG8IhtLdlvanZO/UgEhY/38JmP00q86oWWxJ5xUb
         HLJfQMlYi49vixO6VYRaf2tRijgKRhCm2yuakPHu2oa8PbUpYOmgInaWBen8jMjTiy25
         NzIvLpn5PN4eZDqfyN18uK8XxB19ZHByqBfI1IbE1MW4DjhMQGfpzzHxjmtKsdmq2V/5
         S+mXy/d28k/iMMMoDKC64EINNWF7EJ+JWCLqfGnZZiF1W0l0kYpZ0B2FxXdZD4E3RRq6
         24Jfnljs8eOVMGxla0l6CVwLSnmXNm+wtNsfw4UWgOTqi13iK3iorPB2w0LncV2vH14a
         +MmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024805; x=1709629605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWMOyAMGj4BPUfVQH/f9CThvYEhtc8ZUIoj4aNclbDw=;
        b=IWRXeFYBElZJ09B55d+rsJnqA7x/66RXkFzcnzaQKdfiVU8vXUu0fuJ7KF/k4LgtXs
         87IeC2b+UpL5MXcyyn1uFCgxxs1boChh2e3if4D5k4SiAmd9HEvvwaTYFNmDdjXCMLGj
         7IbYdC/TuDYyezc/chNazF03lwOFV9y4mrrHZjVjXyC0oFPE7yG1EH9ODJcZrPRrfJHU
         GPc9NIPT1cS0LsTTA++7Z4pTlPbKQnZX3Fvkm2cTFf1uPDMOw300UV5VVncWNDwhQbXP
         NRWKNnbZt9ZLTk0rGKmEYjibXvJTjgMN+CZHk0QGvIF2gNpug5zOnJ52X4fZguhk1yJV
         rv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4Fj3IUIaqAXIep7nIe/QSVp9lILdNzlWA3lamoG6IBcFV+rCuNGYH2aL7OjO/uzc3GZ4nbiHhOzLJnRAY1zECZtYJhOESKpQ1aM2b59eJ1tiQ
X-Gm-Message-State: AOJu0Yxo6UomCO3TkszznQYNjt7aU/hKfk5uXChADL0jEPR8y3ubduhJ
	A1ZppyJS2f7HhWKcEDO1c0b8Xfraoqu63aAdizI1lbQUP5f/AozH9wgmtYvhfIQ=
X-Google-Smtp-Source: AGHT+IEovXgAKdcS8TSAMgvRMulbwgj3LkU/1bchkBdxalI2nz+zFL8jWTP4iUK9IOgaIRhW10dMuA==
X-Received: by 2002:a17:906:4a4a:b0:a43:a1b5:66f with SMTP id a10-20020a1709064a4a00b00a43a1b5066fmr1249287ejv.10.1709024804807;
        Tue, 27 Feb 2024 01:06:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id h19-20020a170906719300b00a3e92467f22sm547354ejk.163.2024.02.27.01.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 01:06:44 -0800 (PST)
Message-ID: <16739065-4187-4e51-b7f0-4a55de101744@linaro.org>
Date: Tue, 27 Feb 2024 10:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_010646_510404_005F1CAF 
X-CRM114-Status: GOOD (  19.88  )
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

On 26/02/2024 15:01, Alexandre Mergnat wrote:
> Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
> new file mode 100644
> index 000000000000..f469611ec6b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8365 sound card with MT6357 sound codec.

Drop full stop. This is title.

> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description:
> +  This binding describes the MT8365 sound card.

Say something useful. There is no need to say that binding is a binding
describing something. Or just drop it if this is obvious.


> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-mt6357
> +
> +  mediatek,hp-pull-down:
> +    description:
> +      Earphone driver positive output stage short to the
> +      audio reference ground.
> +      Default value is false.

That's obvious, isn't it? Drop.

> +    type: boolean
> +
> +  mediatek,micbias0-microvolt:
> +    description: |
> +      Selects MIC Bias 0 output voltage.
> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]

0 is 0V, not 1.7! That's total mess. You use here microvolts. Look at
property name.

> +
> +  mediatek,micbias1-microvolt:
> +    description: |
> +      Selects MIC Bias 1 output voltage.
> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8365 ASoC platform.
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: aud_default

Drop redundant parts. aud looks like block name.

> +      - const: aud_dmic
> +      - const: aud_miso_off
> +      - const: aud_miso_on
> +      - const: aud_mosi_off
> +      - const: aud_mosi_on
> +
> +  vaud28-supply:
> +    description:
> +      2.8 volt supply for the audio codec
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    type: object
> +    description:
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      codec:
> +        type: object
> +        description: Holds subnode which indicates codec dai.
> +
> +        properties:
> +          sound-dai:
> +            maxItems: 1
> +            description: phandle of the codec DAI
> +
> +        additionalProperties: false
> +
> +      link-name:
> +        description:
> +          This property corresponds to the name of the BE dai-link to which
> +          we are going to update parameters in this node.
> +        items:
> +          const: 2ND I2S BE
> +
> +      sound-dai:
> +        maxItems: 1
> +        description: phandle of the CPU DAI
> +
> +    additionalProperties: false
> +
> +    required:
> +      - link-name
> +      - sound-dai
> +
> +additionalProperties: false

This goes after required: block. See example schema.

> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +  - pinctrl-names
> +  - vaud28-supply
> +


Best regards,
Krzysztof


