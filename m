Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C1BC636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fva50b8GrxlgxldYtMJBliwxYf7DEDUsjT9ufEpVuWs=; b=a0DdvkpNS0k0HXJqevdNOy+tre
	0x1vMchWeg8l6e1l4yBDtIBDRBTgTjD8muNxd7ntF2y+CW+hEh1WACnS1bitWdRne9uK7XT6/pMFC
	erI2DyeBKqOhW8StKyodP1c85d5Ipy1q6zRKdFZ2U4KglZctggMGMTZ+DP6vKHouzLhEDIMk4el23
	NAiaSWm+Mp72ABbT93kfGbGZmB5uLHpU/PAWbiwvf8F9RppMF88+az7V8Cq2kxJoBgk4hLnE5hLBI
	M41vWu8iGEsIdF4RjyLQ3U1B6PTw3bhzdVra016/4dx5n58mIws5Y6hmHWrpSfJ64ie//NTenhpRs
	oK9utI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaLo-009BrL-37; Thu, 16 Feb 2023 09:14:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaLd-009BnR-6P
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 09:14:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id jg8so3561124ejc.6
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 01:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fva50b8GrxlgxldYtMJBliwxYf7DEDUsjT9ufEpVuWs=;
        b=sMpHhFntXLyf3Jmld4QJX2eireDFCwQQBDBI2jY8bPjcAMN2ZHhutIKyFktb5S6PlV
         HEokQ7CW+nKEDlYPDP5tZr7VEITH/0Zx359EJ8GCekCBnunuWOcWABiGHtqjMLt0UX9c
         ik4nglpIBLWtAGoUcpXE2lQ8YAmqiBP6QVt//6+j2fyB4gjGtj0cUGKa4X0rdCyuPXtu
         LdCcZ468MwpYGNdZ+diXyQDYCAdbcLA3UKa0Ml9eFyWKIJEidfRuZPAZJMhgrdIGPzkI
         tI2GGGT67SF7JCDvLRZoqOhHNbYErSZUJLWK0c4moESSFf85KQ6uAU/S14VcnfAhqjqR
         HjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fva50b8GrxlgxldYtMJBliwxYf7DEDUsjT9ufEpVuWs=;
        b=IU4Xyia3GpBxQL6oC8ojzsp3AGqOXRIYlPzLGRCnNeA0pbVywSh8bX4vWHwzuVGlCO
         rbqqeeWbya2TdIDXn0zG1rI4KHMaOT1RfITqouYo3zeja3uHNhyL9/7ef0BUY/HYqbON
         UuTgVywrVB8OMH0WNF2CHCyLK7+4yQ8zwXbug05lR5MckOuUaWCc0vMRJKX1Ftw52rS1
         luwDCCkUiXvFkaxPmq8RuZXhBCM8HFiH5iybkbtttV2TTKkrF+gdbmou48kImyjtyfYn
         kgY4zA949Nw+7MLR5rN4onpRN/pMDMGt/IGVix7J5vkAVygt6xGntnroMJvGQ3FwtRcJ
         LLww==
X-Gm-Message-State: AO0yUKW18yeC2vnyozDjAzEVOQjhHdePhLSkmOPp0RY0sCtgZrIPnGpW
	n0RdAet7cSGjCXnbnblX7HKcMg==
X-Google-Smtp-Source: AK7set+yGgy9zHqyv9fI0T0DsAMPct9xvmoV8QwrREKROJoG352EmfWtwXagqgHQklpXsy91twxdqg==
X-Received: by 2002:a17:907:174d:b0:880:3129:d84a with SMTP id lf13-20020a170907174d00b008803129d84amr5500539ejc.60.1676538875587;
        Thu, 16 Feb 2023 01:14:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kj9-20020a170907764900b008b163745b7dsm447510ejc.120.2023.02.16.01.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:14:35 -0800 (PST)
Message-ID: <5341d0fa-1415-b711-30f0-f0a867af0bc4@linaro.org>
Date: Thu, 16 Feb 2023 10:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] dt-bindings: rng: Add MediaTek MT7981 TRNG
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Mingming Su <Mingming.Su@mediatek.com>, linux-crypto@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
 <c750e786ad0f529d2ae63c8f766d3c294808ff53.1676467500.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c750e786ad0f529d2ae63c8f766d3c294808ff53.1676467500.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_011437_355924_74FA25F4 
X-CRM114-Status: GOOD (  17.72  )
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

On 15/02/2023 14:27, Daniel Golle wrote:
> Add documentation to describe the MediaTek true random number generator
> which is provided by ARM TrustedFirmware-A of the MT7981.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/rng/mediatek,mt7981-rng.yaml     | 39 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml b/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
> new file mode 100644
> index 000000000000..d577d60538d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rng/mediatek,mt7981-rng.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Random number generator (v2/SMC)
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +properties:
> +  $nodename:
> +    pattern: "^rng$"

1. We don't enforce it in device bindings, so drop it.
2. It's not even correct. You have reg.


> +
> +  compatible:
> +    enum:
> +      - mediatek,mt7981-rng
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rng

Drop clock-names and rely on index.

> +
> +required:
> +  - compatible

and reg?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rng {
> +      compatible = "mediatek,mt7981-rng";
> +    };

Best regards,
Krzysztof


