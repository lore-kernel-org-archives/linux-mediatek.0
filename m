Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAexDlphs0bPOTYuy6RDj9/9WL1gIn+kdu35mmzoVv4=; b=MKgtxtEVjYbTKo
	kFDnvFdPf/tmcjFE45el03Byh8exQTQtACvTUiC6kxpDQ2m2cHeQcuhhkBV0C6GAK9/ttCAQHAdDf
	W5XNTGmESLIYeZzPeJKnATKyJ0LtggMvBWiomgfJSs7n+t7yf3aEbv4rXnkWTNXOJqA2ZfpEm5jnX
	YZ/dJF3aUYqPfYFD10QzP3CMm3dgg62AtFqIXbaLX45LQb2frHKVTcPNvN8pfCQ3yJ8wdZnO/qJmu
	CTqRM0mkn0oXqYcPyxwqRKM2tobHATMRh8HQg4x0v1eqF3czW0l54aD3kFQsyEA+/b6zeC2fSBtss
	VccNApTPhAOXAO/8G/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrxil-00BBn2-F0; Fri, 20 May 2022 08:10:51 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrxib-00BBkW-7h
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 08:10:43 +0000
Received: by mail-lj1-x22c.google.com with SMTP id e4so8268900ljb.13
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/Q2zXV+8LUjkYKDjIzBXp7BrDdbuagm69yyU6TmRueE=;
 b=PnTRMGFE7BbPHDZAQyZ4YMlza6eW9Ev20ZOHkE79gI1JpTWLE4xJThgm/r5s9t239+
 fHDAmNvNu0RfGPf9w+ld+P26yWOMR/vjnmPPjeMFv2cqoJhw2SVV9FcPacDaz7H8YUN1
 0RVqysnTGJwd9fgie+/CoH1MMMRPjf0cVI+BIZoavWtshnVwunP2qywHHpkbzL3lmqfP
 uUAnoytcdoPfEpWsQzE/u1MOLUmEpU/Wh0lq/7QsS8VZJzfEcth67c7QVTervg3EWohw
 IPtNpV92Mgp1p954XRHrH6O+QoljU9RGkJEXuJABPnyt3aJ3Jt/RP3bcrPzxSUaONMv5
 9D0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Q2zXV+8LUjkYKDjIzBXp7BrDdbuagm69yyU6TmRueE=;
 b=M+B1R/ppU0p8mFyTeqoxBqbdBbZyG+xsAlrT7d1e120HiYvZg0fFBIpvEFxVhYVBHN
 eoooqe075rAuUdiEmyMjO5iOZ2RlSPAmt8SQ/ryfGK2J8ExRgjTb0ZitFeu7PYzFWUbw
 WvvXxUybk4GOIwBT9ua8oeY7j3cj6HuqvJkge/h3L5eMxMOwwjZgUtECwDP54uxWSzif
 eA1TGh2qPlBrclhldvrQKmSetvpyny62Wdz9Fjx9TQsN+r+eDqW5GfJdo3A9TfWOcb17
 My0P5N+XUYVSkYNU0kDgTg6A+Z+EAVwSNjLnSMXFSPF3zH8E96dNmuqBdLMWC0quhcwz
 088w==
X-Gm-Message-State: AOAM5324uVu3hLy9B7vFrdny1XlV4SfpAQa7ajLnZ161wnJ16Y7xFsvx
 Amik1LSwN+jdUa0JDhxzH9ipfg==
X-Google-Smtp-Source: ABdhPJzOxCXf5B4f0uotUCSQeT7IL0G63fQ0rGQ3FRjBwXyQY1KqTrYwI6Xi3xuur/4LN/BEusNRvw==
X-Received: by 2002:a2e:391c:0:b0:253:c3e8:8e79 with SMTP id
 g28-20020a2e391c000000b00253c3e88e79mr4694809lja.304.1653034237150; 
 Fri, 20 May 2022 01:10:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d25-20020ac24c99000000b00477b624c0a8sm565749lfl.180.2022.05.20.01.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 01:10:36 -0700 (PDT)
Message-ID: <40562324-8d15-6dd6-46db-053f65b030b6@linaro.org>
Date: Fri, 20 May 2022 10:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dt-bindings: serial: mtk-uart: Convert txt to
 json-schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220519152329.55028-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519152329.55028-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_011041_302546_F7BFA3EA 
X-CRM114-Status: GOOD (  16.28  )
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

On 19/05/2022 17:23, AngeloGioacchino Del Regno wrote:
> Convert the mtk-uart documentation from freeform text to a json-schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> v2: Changed to also accept just "mediatek,mt6577-uart" as compatible.
> 
> 
>  .../bindings/serial/mediatek,uart.yaml        | 121 ++++++++++++++++++
>  .../devicetree/bindings/serial/mtk-uart.txt   |  59 ---------
>  2 files changed, 121 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/mediatek,uart.yaml
>  delete mode 100644 Documentation/devicetree/bindings/serial/mtk-uart.txt
> 
> diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> new file mode 100644
> index 000000000000..7929aa123487
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Universal Asynchronous Receiver/Transmitter (UART)
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +allOf:
> +  - $ref: serial.yaml#
> +
> +description: |+

No need for |+

> +  The MediaTek UART is based on the basic 8250 UART and compatible
> +  with 16550A, with enhancements for high speed baud rates and
> +  support for DMA.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

This is just single item, so no items.

> +          - const: mediatek,mt6577-uart

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
