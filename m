Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05796C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNXNtXezdPiz6WQwvH9xjCDeUeGJKj/mjFzziiI0LNM=; b=ykryugpRO8gO+64IShnelaMocF
	L3Kz7tVB1Z7ZSMHVo7ndk6oYFzw1oderpnsXI2OyBrsw4NL5w5l5fHCZVgkFhicdZPhdWjP2ym7YZ
	MiXtPgbsOEmviv1hem651NvcOzMIWEyIZOLDjv9Cnw/1aZ4VQiUbxjOCWeVtFTAqeHjyZ75azcrqW
	3NjAacz0Nmg6YWtd8buaB6uexHR+W3JXnDOM2RcQlYbjy/KveT5i0qfUBvphmPEznNrfFdf0AXkYR
	zoMVRjVV/uuBxxCW2IyYJiholMTwV8brP6nQnD/yaEVR3PIQGyQIdrEA+wi88vGQV7qvbVDhMKS2U
	6BmBnzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbjg-0000000CdiN-2ZI5;
	Thu, 29 Feb 2024 08:25:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbjd-0000000Cdgm-0fL0
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 08:25:46 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a441d7c6125so76175266b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Feb 2024 00:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709195143; x=1709799943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNXNtXezdPiz6WQwvH9xjCDeUeGJKj/mjFzziiI0LNM=;
        b=N4wxy9rcYKuJW9gsfEUE7GyvloBzH2AItuNdJ8ptpKbO3K8s/IxrYk57VTREPqOcA2
         S1nN0aNW9AcU3Uku7jhCzccSVVlpcK6I8ubSPrvE3d+Bv8TRbwIxZY/W+NYfsgBaWIyS
         bwzy+/Ziu+U7F+rSRpysjqVJeMBiV+IxoM0Nxd45cPYko65LMjjBRGlSIYg4dlxu+eIx
         oP9xfrJPZJaK9LedUnhNxjwXxaLgl9LQBYIaD19/z0qVFQc1aC/4U7BHCpExG9nc54Qq
         0tuNhJ8d0O7Tg5yaDCzLoNzv4sglmHfTMwJl21Mofy3Gms9wa+vo10XfdWHLWURUo/OW
         TPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709195143; x=1709799943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNXNtXezdPiz6WQwvH9xjCDeUeGJKj/mjFzziiI0LNM=;
        b=mEILITnNOAAvsHh46rVMmNoo0tKfRqTpC8v9K7VgwlPj5w69XRN4kmC+j2jfcJAc2y
         NWgjXpSUs3HUSb8C6coZglDafkGCorYKxaD7I0RBb02P7wfBD8sSi4hpGbfKVhTd29wB
         XGX+WTlxIYU0DO+Uiwjm1kvSJ52DhRs6PQXlkRACcsQ5f/SN2NryZEBx9aLI6EqTEiL5
         26TnRusSFJzOXPgUaghXC7dc5X0MbRHZQMZExJsUy60k1Y5NajAphHLrVyLUYm8nq3xq
         /9gE4N+KzLlOBXCXv+dJF68Ql+QN94zo8neZl+OohugItRPwp0GEEV1d7x4uIPZ/eue8
         OtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAg0XAwBzJPlQ+Wf7Ep0cHtcFmONPPlLY/LGHusHeAMlGwXlA47sYK2CvKjZgZxOzR0vswggt4PREuxnziUGea3lvTpD4e/0D+r373nD+PKKls
X-Gm-Message-State: AOJu0Yyw5pTo1xs2fqJAVNoUesuXlOy9vOmVrEQKzKkYleXM0aEaKVsw
	6mmT6iIayPEQKTvW1yVO3iedAK/RInd77sQtE8mEXDwsHiWv5qnmgYVlTNQasbw=
X-Google-Smtp-Source: AGHT+IEdRFYEnX4kAM1kYEF58dkyCyyKP45xIa7ZLp2VZd7u2TobvUB+aubfigdaalNJ9d2eEa2QgA==
X-Received: by 2002:a17:906:56d0:b0:a43:f22e:57a6 with SMTP id an16-20020a17090656d000b00a43f22e57a6mr715486ejc.67.1709195143177;
        Thu, 29 Feb 2024 00:25:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id vg9-20020a170907d30900b00a4439b7756bsm434508ejc.6.2024.02.29.00.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 00:25:41 -0800 (PST)
Message-ID: <32ff2f66-7a94-41ed-b77b-f78da2e57446@linaro.org>
Date: Thu, 29 Feb 2024 09:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] ASoC: dt-bindings: mt8195: Document audio-routing
 and dai-link subnode
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-19-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240227120939.290143-19-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_002545_218992_F144E502 
X-CRM114-Status: GOOD (  14.83  )
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

On 27/02/2024 13:09, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with driver hardcoded configuration.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


>  
>    mediatek,adsp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -45,12 +56,75 @@ properties:
>        A list of the desired dai-links in the sound card. Each entry is a
>        name defined in the machine driver.
>  
> +patternProperties:
> +  ".*-dai-link$":
> +    type: object
> +    description:
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name
> +        items:

That's not a list, but just enum.

> +          enum:
> +            - DPTX_BE
> +            - ETDM1_IN_BE
> +            - ETDM2_IN_BE
> +            - ETDM1_OUT_BE
> +            - ETDM2_OUT_BE
> +            - ETDM3_OUT_BE
> +            - PCM1_BE
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
> +        required:
> +          - sound-dai
> +
> +      dai-format:
> +        description: audio format
> +        items:

Ditto

> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b
> +
> +      mediatek,clk-provider:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: Indicates dai-link clock master.
> +        items:

Ditto

> +          enum:
> +            - cpu
> +            - codec
> +
> +    additionalProperties: false

This goes either to the top of the section (after type:object) for
readability or after required: block below.

> +
> +    required:
> +      - link-name
> +
>  additionalProperties: false

>  
>  required:
>    - compatible
>    - mediatek,platform
>  
> +# Disallow legacy properties if dai-link-xxx nodes are specified
> +if:
> +  not:

I don't think this works. To test if node is present or node, you would
need to use required.
https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L174

Are you sure this if:then: works as expected?


> +    patternProperties:
> +      ".*-dai-link$": false
> +then:
> +  properties:
> +    mediatek,dptx-codec: false
> +    mediatek,hdmi-codec: false
> +
>  examples:
>    - |
>  


Best regards,
Krzysztof


