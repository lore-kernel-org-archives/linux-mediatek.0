Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D42C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPOWYK4xS+6xhzOdhfTnsSnUcVxUYMBnV8hiXVR43SI=; b=vxOc6WcTPrVkhs4zht9yP9nDnA
	BtcejcIvslFWUuSmMC99vdUqj56Hwvh+qJ4s359LuJs+E4CD4W0Alj5EPjKLbnkW2MMrJH1pIR4p5
	EoNLiWPebhpEZdQBml3kCHLFlr/BjRABWCykkWba3TFNtFqHgiOMOdK6b/khAvRxIDsIU9FY7cEGg
	ZGKT7S2b7Hb6awOlMwbSBUEBMdkuAVYAjVPFdglBH4A09nczPltANQ/2v9CwgnXS9BCz4FpTG6TtP
	sDNqRIs1ZENhC1XiQebeTQHptQul22l8Qw7rnrFxPQYENyMIbEJUyQX5cyTQg0Jx6FV3Ohn4bhd5Z
	M7xobLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNrD-00CnfJ-Ps; Mon, 02 Jan 2023 16:40:16 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNjd-00ClW3-NC
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 16:32:28 +0000
Received: by mail-lf1-x12e.google.com with SMTP id g13so42183745lfv.7
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 08:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPOWYK4xS+6xhzOdhfTnsSnUcVxUYMBnV8hiXVR43SI=;
        b=WuNHynlhNUkJUcD6KxjstzrRlxBGV8jbuBJ/hrag17I5q4FZ19LDt1kUasU+Mf/ow1
         JBdFdf/Q0EPoES9VCm0vib2w7JjQ6b0vOTXDcL9B89agvmmRsdc/EE+vKc/H2Lep6lT7
         kvujpwUNElUfG8MRBS8uQJjwjOD3nhMAo9M0FcLNOllZ8+YQVMk5PaCE3nKmji6OVgcG
         IIz+6L5GswHwQziHEeMp6UDveSxrLnfs0llc1Zs1AvixoQrFZYbEhPSGKbxY3n135fNu
         jgyNdng/nhQCdHUrDtQKR65iViyWju50338n/pJMMU4qhyrO6wxw1rk0Q8wo/7AJuJQa
         yEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPOWYK4xS+6xhzOdhfTnsSnUcVxUYMBnV8hiXVR43SI=;
        b=R+231HQrGgMnHBN3ay+Nz5ABILz30dgcqbVpFaDBYbahnK8ZwWWRLdI0J5jcCJDTBC
         IBDhToD1mGmjHWhlJh0Ec7rKDjtQurxEs7XC1y50KeDPfdIXuLqFkSdok1pjssTibBMB
         3bBU+1haHuyhDhbEffrkKeRNll7DhCU6K/6+2ZiGD+ui7Y6o7JJT49rLh+/5LxsMT4lX
         CUQLYXCjCtzwZZIECI/W95GUpIpQBIfr0fe0YeEp0DnMbWPBZ0VoZwLcNH7FU3UHZyIU
         rDOwVSex5k1eplZR990/+GuOsu4EetEDKHJzUUYGpB4vfrL39U/FFdo08kMxxZoYLZmS
         S7Ug==
X-Gm-Message-State: AFqh2kojZOz6BfYJ9Mkab3rUFqSgZCvsZxB5REiE78WGuwCzfPKvNlCx
	LIRgZeiaHb4N+xGkxse1//ExkA==
X-Google-Smtp-Source: AMrXdXtWnVOJrl54acwW1/P+lvWqyeGREQQIrliL5JrxuI2mDuRvgOBvBPJG9vCCGvebf+wH1RlFEw==
X-Received: by 2002:ac2:5fcf:0:b0:4b5:5f97:6a16 with SMTP id q15-20020ac25fcf000000b004b55f976a16mr11197018lfg.43.1672677144056;
        Mon, 02 Jan 2023 08:32:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651234cc00b0047f7722b73csm4481991lfr.142.2023.01.02.08.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 08:32:23 -0800 (PST)
Message-ID: <a885bf4b-253d-75fe-0224-02f8dfb44006@linaro.org>
Date: Mon, 2 Jan 2023 17:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/13] dt-bindings: mediatek: mt8188: add mt8188-mt6359
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
 <20221230055443.16024-14-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230055443.16024-14-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_083225_952890_B60C1A65 
X-CRM114-Status: GOOD (  18.79  )
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

On 30/12/2022 06:54, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mediatek,mt8188-mt6359.yaml         | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> new file mode 100644
> index 000000000000..5754c1d460db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 ASoC sound card
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-mt6359-evb
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      sink/source pair of strings. Valid names could be the input or output
> +      widgets of audio components, power supplies, MicBias of codec and the
> +      software switch.
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 ASoC platform.
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    type: object

On this level:
additionalProperties: false

> +    description: |
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      dai-link-name:

Instead:
link-name
> +        description: |
> +          This property corresponds to the name of the BE dai-link to which
> +          we are going to update parameters in this node.
> +        items:
> +          enum:
> +            - ADDA_BE
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

required sound-dai

> +
> +    required:
> +      - dai-link-name
> +      - codec
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +

Your example looks pretty straightforward. Maybe you can use
simple-card.yaml?	


Best regards,
Krzysztof


