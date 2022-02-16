Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CB4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2QfjU+I72ii2QSiCl8KrkQrmmTrOgLheK85faI7QIk=; b=KntK9ifNj8hb5f
	nafF5n7YnooDjjxNF4pQe8KQhengHMt11spA+z+mIDcgXpk/pPNrAGRa6oTBG29NEcZ+UfvrrKXTS
	3dEZHX5qjE5Ay9Raidov18gvcI4zxlhqGDs7R1vWgnZNCPpqyL/pjKHY08W3gjKiLqVnyJGRzXiN8
	SJSVHEZ2ZFSlcPXVooKYPitX72EsfwUlzsmdiAMPKPsXLYQUjOp8tqnagxaS+vr2j8HFL+rTC0QGe
	n7Xc7c6kHPkQv/8iewcLD6QUJKVfW/ecnj9cBVmzRezAfl5YR8wBy8cX9lODBy8/fXmoy90Fm9+4+
	H0n8yJArItyO0KGktY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKKE-007ATT-CQ; Wed, 16 Feb 2022 13:26:30 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKK8-007AQq-EF
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 13:26:28 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D0C4C4060A
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645017976;
 bh=HnLv2sgPTFeJCaPDj49F4ixfOdgITRk3XaxRkpYlXz0=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=d+ytUNIq/+YlMjkBHdiOV8f4oLa5IC3GzB6jvG+C7TfcqFdyX0KOr+USFSxC9EfzW
 gq4sf5GP+2Y9PEsc59qza/ErxG8NRKgmR8tyS5azhFwTtH329ZDBm2ITajzRbvduwY
 djHyqSCQsWveL2va2wT/eOz4fRUQ919qHtZ2EAJMnfzUI3Wx3c6Q1V+f7+lSJTGT4Y
 cV623To1sFST3A04oSdbBkd9Bl541P8v4XHGEujKDhUeevB7FXVse+VpePM30PDXFt
 yGlxbJTMN8smPmt2kqJYtjVhq3t5quGgig62hqd/H4EX/8G0JdurlhhgrHXxiDxruR
 SppoGEjyty4Fw==
Received: by mail-ed1-f69.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso1569800edh.1
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 05:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HnLv2sgPTFeJCaPDj49F4ixfOdgITRk3XaxRkpYlXz0=;
 b=T7A/wEmhmdo88Ug+2M1R1kw0bMD38Lpq1oTRdP7xDXPsM/IVJ2CCWzx8tCbSyEAzV3
 Mu1T3QSZAD87zZnPAP1T1dDArH0ujwmqLAbJp2hv9D0F5nDEY5BLVDmBgP3cT2HwCHb4
 b/VDf22EbrQnVgGuqVS60bEwfuKeUQ69XKXRlWLPOtbzp95gyrqTB0w1C4n9dqMNcknF
 7yTxs0p7j76ieKnJJF/XwG1ifyv+HvR90LKdjWe7bNx3hGTMOHLo5althlMfxbjsswZD
 dgc/JNJbsQb37zzOJ01pXdR07W1PXMPOP+O2hSSHWZUdE8HzHElJNwjfKzVqF1lD5VZg
 eMbg==
X-Gm-Message-State: AOAM530RPEZlXvdPGGJpxDePCsBKrVJALVJjhmOXAjGiwviKIbYzA/3I
 8jF6L7Yy6xD+eaymjBydjnggvM4sRJIRHZ/7uPnCRSe5W2U+EQWLoD9CURwIpTZ/BB6SgjLyGmH
 9vqSjU3hnhxltQUFJp23g42egDUFSrrmWepmqofu15PzsH618tA==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr2212963ejg.413.1645017975978; 
 Wed, 16 Feb 2022 05:26:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW6N5tK5VHWBe36Bj5vHHIMzDJlCB0AOnINLyfOUpi+aCPHYXEWQjcBrraceqmA2DJkZ7r6A==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr2212939ejg.413.1645017975741; 
 Wed, 16 Feb 2022 05:26:15 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id qf12sm1085572ejc.54.2022.02.16.05.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 05:26:15 -0800 (PST)
Message-ID: <79a47f67-bb66-bad4-b6bc-c6a8c0ef25dc@canonical.com>
Date: Wed, 16 Feb 2022 14:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org
Cc: robh+dt@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 long.cheng@mediatek.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220216114054.269656-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220216114054.269656-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_052624_648369_4C239867 
X-CRM114-Status: GOOD (  18.92  )
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

On 16/02/2022 12:40, AngeloGioacchino Del Regno wrote:
> Convert the MediaTek UART APDMA Controller binding to DT schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/dma/mediatek,uart-dma.yaml       | 112 ++++++++++++++++++
>  .../bindings/dma/mtk-uart-apdma.txt           |  56 ---------
>  2 files changed, 112 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> new file mode 100644
> index 000000000000..4583c8f535b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> @@ -0,0 +1,112 @@
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

It would be useful to have an "if:" block constraining the interrupts
(and reg array?), if the dma-requests is missing. If you need an
example, see length of "max8997,pmic-buck1-dvs-voltage" array in
relation to presence of max8997,pmic-buck1-uses-gpio-dvs.
https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml#L259

The best would be to restrict number of interrupts to number of
requests, but I think dtschema cannot express this.

> +    maxItems: 32
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
> +  - "#dma-cells"

No need for requiring dma-cells. It is coming from dma-common.yaml.

> +

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
