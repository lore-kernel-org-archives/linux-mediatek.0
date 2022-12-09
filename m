Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3CCC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x00HNX5290w6ocB8BzuOCSV57L/qluq8fXghF2f6Urk=; b=lKQnt5rTICEIkjAShk7GLZDJhN
	ciegHWOrMq1GRPvNS9Ef1nnX9xbQMw0gAmGbJJTFAz6w4XRIRfeHrixMvKFscMhmp39sySrt/43G0
	lTNhotx+YCiWIk2iDIwb8veis2MCcdBE4mHiiTfhm5KyZraVuHf+DRJuerKsXUEdGIAarWyyJlLb6
	9QoRVR55nXEKqee17OmL1q+aKzPvUSCsqkaCdP4Zr/KQvzYjgfrpih93mWAJTQG1Qhw++xyDOzTFZ
	UfXRFbxqlF7q+S8GeR0R8Ohx73Nrf7pyPJATAr0wZCIKgn+kS4UnJ5U/uLZySGWoMdQM4HBwWB5Kj
	Duanu2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3aT8-006Urb-Kn; Fri, 09 Dec 2022 10:19:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3aSw-006UfZ-08
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 10:18:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 1so6307043lfz.4
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Dec 2022 02:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x00HNX5290w6ocB8BzuOCSV57L/qluq8fXghF2f6Urk=;
        b=i3pJ5Zl8a1/s05t+pot30xPJdKFR8X7DbUHQqO2fWpR3NS7IV9xMH7yPs/PvXLeXj1
         YsliKZrWIZ9SHauCdh+2/SMnHGrvhA6Hes4DZesF9nM5hAR3JjyoWQlRX8l8H7Sctiza
         H1oS0rJMvlteo49XLIaiR+pCt8scMj7srITdJDpVyfITifbrTK/gvqpGZoMa9JOVTJvE
         MsYhaoNDvxe/O57eIcZV6GorlescZblOMkiDtCa3cyhCOs4UtA8DdGlxSwT2RDuKcO5v
         0ovORGCdPRLBmwJFViw5nZ6TLWcO5gaoTmR6EfdW22S2Y2UJ0Siww/THZdiuFh72msGx
         Hl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x00HNX5290w6ocB8BzuOCSV57L/qluq8fXghF2f6Urk=;
        b=WeGSpjheGVuonn+6VSMib+uly74aBPSwIt+bnouoo9AxMipcfA532ON8xS35pWKcG2
         L7W0/Quk0eFH2cLqg0rkr4/YDKzg7Klj22UoUvyvlp1SAs2jDPGOtM5d3dpkHdRPFtYg
         FMpxmRX6KajtftY1Hoh01cCvz2l6MFjX9RN5lc24x9BR105T1Mg4Us1bKEq5v1cXiXBO
         9FRQTC9+S40Qn3Mwlj3BbzCy+HXJKCT705xgEVTHCNWkQCZI0GZDt5xbnTK008EAQmEg
         NhWtvw1D0aySlrhQw89ZGY/V8SAcP5FtE9QBo4I8qcqCNyPqm1RyEjVfQdB6I66hDuEa
         Hc7w==
X-Gm-Message-State: ANoB5pl8GpSvoDmFMTQ7LdblKdBXuHnl5iqFgcwCy31oons5UpoJVkHk
	Vlgx/EpuZ5wF6K17LGxUQg7G/Q==
X-Google-Smtp-Source: AA0mqf57GDeyjbTzizTDvwgHZIWKGjktE97SxwOAvab3vKYoBljLv+Jv7y6GOFoRNsx0ysHmTjUQTA==
X-Received: by 2002:a05:6512:224e:b0:4a4:68b8:c2de with SMTP id i14-20020a056512224e00b004a468b8c2demr1789569lfu.53.1670581127329;
        Fri, 09 Dec 2022 02:18:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a26-20020a056512201a00b004b5aa1c4d10sm197829lfb.118.2022.12.09.02.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 02:18:46 -0800 (PST)
Message-ID: <6350def8-bb1f-8aeb-4c98-4d02a4c59aed@linaro.org>
Date: Fri, 9 Dec 2022 11:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359
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
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-13-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208033148.21866-13-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_021850_106358_DBC53B9D 
X-CRM114-Status: GOOD (  15.53  )
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

On 08/12/2022 04:31, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-mt6359.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> new file mode 100644
> index 000000000000..eac1c87b693a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml

Missing vendor prefix. You got comments for it already.

> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
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
> +  mediatek,dptx-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 Display Port Tx codec node.
> +
> +  mediatek,hdmi-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 HDMI codec node.

Why you do not use DAI links for all these?

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +examples:
> +  - |
> +

Drop blank line.

> +    sound: mt8188-sound {

Drop label, not used. Use generic node names, so just "sound".

> +        compatible = "mediatek,mt8188-mt6359-evb";

Best regards,
Krzysztof


