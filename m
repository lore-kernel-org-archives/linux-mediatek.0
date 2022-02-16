Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mBq47VpYglqk8MoWfMfmQORPWFYrvuYiR+vmPeDySM=; b=jkAlKgZ0Bdqxi9
	w1YmznoYgQ04xR+S/jp5MfsU4Y6X2IJ2pL6oMVke9Bi9NfCRWByU0JvGxIB2APmUeYQSrHkghHS+F
	SC23Lxsjbbm5o8V8ShxKNmKX6tW/3bMJ+NGDfTfA1Y+pVlOLMJaCqcRpgnMNnDYktagLIiQpZWrKn
	J2E/snru26PZIedxBcCZRfkVCQY7+/sfz0qIV1ywBR6zTVh+zGxE70NCKcW5ib01tGp+RlZZzVVzB
	6C3L88ff9KsVJCnx9JbStH1XPfndS/+JM0/lh5jZ79Gi1Yw0VrTYuYwOEhXkncfvC5DnBFWV+C7kY
	PDaXrs9x01XAAzG+twHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKMw6-007dc4-Tg; Wed, 16 Feb 2022 16:13:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKMw2-007dYd-6G
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 16:13:45 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0F0923F4BA
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645028012;
 bh=yU0JTVfqmMQPB5NQYcUc7rbuKfmUJoXTRDxBU8L652M=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=PGJq69UTsVr7Df6oYusmZeJj0MMeLnvvH9wAornooBuzycN4vIMff1Eo9YXyHSbrB
 YIak/+pDcAHWTB405AgguBhrUxujPkz8OpfwadyDLbMgQgXRLxnZh1SWjCG5nRiYwm
 wVEN0B9vE/9Z6VyPrCEbiCtPVuoG5S1YthfgQdID1YFf+kohrL1I5nC52Laixlo0Zo
 JGQIvxR0PzUoZ/P7ZoT39exgwcpj3eYIusUGoi94NK4MKYoWa0Ak+6uqrIAM4WoSA4
 RVJbyP1FX55EMfbfALiNJculhLr/3yGx8VIC+wZljn+GGxaOGyU3913AnN+LoBJDrs
 rcp5T7RuiTYbg==
Received: by mail-ed1-f70.google.com with SMTP id
 m4-20020a50cc04000000b0040edb9d147cso1846485edi.15
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 08:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yU0JTVfqmMQPB5NQYcUc7rbuKfmUJoXTRDxBU8L652M=;
 b=6K/U9S7gl1bZglAzzUCwk1+eqUbrDJGofvuJRsDS0YLGvphFhM5LJYzemOpz5y5M0C
 3Oo3lo1oM1HVlyU23meEpfAEIJi//bIAmW1JUWVmUCEw4sDoet2s3iAS1tByPYszlLkG
 MP8DZy+mMUSm67d1Yx2NxsF1opLv8YV3IgjeHCKWJeVPwXU+FanSJ5ZSFC9wL+bQobRK
 VnG68eQbLLRsJsF6B9uIjmKc/WwC518wguDzL8FpcJ4/oyz9nsxV1f4wCwW5ju/gvNou
 P4FtX6MhDp19D76FMEaH02ZoEIqB5YGRZwYOOIYiSw+G08RYD8tDwlqHxUAw5pDhufTl
 jDFQ==
X-Gm-Message-State: AOAM530fNuXc6GRXYnTppgPamVPYn/xV2xuFfjP+V4jeTxUp8ijmDh11
 uCQaiZz4L7664A4184VVVx+CbC0R20mbiv0P0yR/0sd7A3+VxnaNTfn9SSi3PPUS5LOXGDrD7ya
 mt2i7H190JCt5Z7FXqiDKBsjyOGI0jn0sQXsz/uE0Ra0vCcn3YA==
X-Received: by 2002:a17:906:38d2:b0:6b7:9639:fd74 with SMTP id
 r18-20020a17090638d200b006b79639fd74mr2774319ejd.215.1645028011673; 
 Wed, 16 Feb 2022 08:13:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymIuMoqXEhQgrqUOZ0+AFR5IMCCCY5eWHy1U9oQcUI27s9rO86CRpktTGFYrnx+rEft91rZw==
X-Received: by 2002:a17:906:38d2:b0:6b7:9639:fd74 with SMTP id
 r18-20020a17090638d200b006b79639fd74mr2774299ejd.215.1645028011406; 
 Wed, 16 Feb 2022 08:13:31 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id 18sm67785ejj.1.2022.02.16.08.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 08:13:30 -0800 (PST)
Message-ID: <6c51427a-98e2-0bbe-8f4b-37a4d9cacec7@canonical.com>
Date: Wed, 16 Feb 2022 17:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org
Cc: robh+dt@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 long.cheng@mediatek.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220216151309.289348-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220216151309.289348-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_081342_396419_12E8B2BF 
X-CRM114-Status: GOOD (  18.31  )
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

On 16/02/2022 16:13, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek UART APDMA Controller binding to DT schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v2: Fixed interrupt maxItems to 16, added interrupts/reg maxItems constraint
>     to 8 when the dma-requests property is not present
> 
>  .../bindings/dma/mediatek,uart-dma.yaml       | 123 ++++++++++++++++++
>  .../bindings/dma/mtk-uart-apdma.txt           |  56 --------
>  2 files changed, 123 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> new file mode 100644
> index 000000000000..67dbb2fed74c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/mediatek,uart-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek UART APDMA controller
> +
> +maintainers:
> +  - Long Cheng <long.cheng@mediatek.com>
> +
> +description: |
> +  The MediaTek UART APDMA controller provides DMA capabilities
> +  for the UART peripheral bus.
> +
> +allOf:
> +  - $ref: "dma-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-uart-dma
> +              - mediatek,mt8516-uart-dma
> +          - const: mediatek,mt6577-uart-dma
> +      - enum:
> +          - mediatek,mt6577-uart-dma
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 16
> +
> +  interrupts:
> +    description: |
> +      TX, RX interrupt lines for each UART APDMA channel
> +    minItems: 1
> +    maxItems: 16
> +
> +  clocks:
> +    description: Must contain one entry for the APDMA main clock
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apdma
> +
> +  "#dma-cells":
> +    const: 1
> +    description: |
> +      The first cell specifies the UART APDMA channel number
> +
> +  dma-requests:
> +    description: |
> +      Number of virtual channels of the UART APDMA controller
> +    maximum: 16
> +
> +  mediatek,dma-33bits:
> +    type: boolean
> +    description: Enable 33-bits UART APDMA support
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +if:
> +  not:
> +    anyOf:

Thanks for the changes. This "anyOf" you can skip. It was needed in that
example because multiple properties should trigger restriction of maxItems.

In your case it is sufficient:
if:

  not:

    required:

      - dma-requests

then:
....


Rest looks good.

> +      - required:
> +          - dma-requests
> +then:
> +  properties:
> +    interrupts:
> +      maxItems: 8


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
