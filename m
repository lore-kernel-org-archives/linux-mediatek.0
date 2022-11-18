Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45934C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 08:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQCH/Sp176vbPRXqpJPGAQyRVR8G2dlYjS15CYSHZ+Y=; b=grcmGnMBuOqBAMGr9et4jc+kPd
	X6m0p0GFGVURFVal4PXUq0J3q3NcEpwtRnVI5nT7wNuITqH9ffKq98isXhw5GwtMzOcoxYzDD/wQZ
	+50I/5FFAKkWtG/blfhAaR+cb8h4oI/B2+cSutaJsDj1qHxLxgdU+eiLyc94dnGPYQ3cPvpXABFIL
	4PGzMAQS5Z27KSwcuJ+1mpwuWIXiZDnp7NYeJW5EGFDdjbUVU+0Qzc26srZy3tBCHygaLcXukOL/Q
	HqPXMXW/hKtxk1LUu+KrWL67zG8fWpUhrbeWRU34PKFUF2BB7ejZ5b8k1F2jg6/uRE5Eg4wk6abSn
	adTauoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwXY-002iuO-JV; Fri, 18 Nov 2022 08:16:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwXW-002is4-1e
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 08:15:59 +0000
Received: by mail-lf1-x136.google.com with SMTP id b3so7029851lfv.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 00:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQCH/Sp176vbPRXqpJPGAQyRVR8G2dlYjS15CYSHZ+Y=;
        b=kEqJjuyusNzd4++TgyrS8RNq2Ilzx7GR9H5D91NisqLDvTCqy92gnovfPYdjGFgQpO
         EbkqADOiNmdhH9u30mp5BCBtskG39bfePFbLl/+20UfKg8DJ+OXm+TIo64q5h9hnuH0m
         NMduGQ48uCQGOTq22ZpQoNQMENAIg4Y6ONwbztwN03PDEYhOy7HM6cFavgs3eVLa4JXZ
         giMPOAdoXJe+DDDbEdxlsZLsed+C9tTWAdLI5u5Yo4i2eySArzx6x0f5XGBEBHuCfaUG
         kfKS44/dbyjf4nWfjNBYFBFOh7RmFBXKkNhEE73n5fUKFN2DQgA741yucT/rG1t6BnEM
         hfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQCH/Sp176vbPRXqpJPGAQyRVR8G2dlYjS15CYSHZ+Y=;
        b=l9DCrLmsLGsPLtLlFO3fbI3lMWNgnhiK+FtwwzP9Y5FN8w73yddFM9xAR+cTXyXLy4
         HTKpEovHcz8/9AZrRrxTifEOA1FAZWjWMLEVA6baKrvLmc/mQCM+cjDb901waFYsnIzn
         dzsTi7sGBfZ+yqYiYCCF5BAW8qmoqPfQ5tbdDzJ4I3XaXAvu8QPvasReVxweJxC3HdlQ
         +ZqneUerq+X1WMQjqgtELZy/wpE0mT2/lbZg7eeI0KpU1BTAhvh/Awu3UC0uJ/wPVw2I
         Rya1MBVXEEbce3cei12KmrUJt8+Cwkc029TNLg6hTfQiRYojID2EGv4d92ox0GvN/W0w
         vr4Q==
X-Gm-Message-State: ANoB5pk9l8COeDaEiK5NcYuknGue+9PuAfYMXMbtP8mwlRmuHlh58otc
	unBUk4Vnq/Pw61CXfnrt1iTavw==
X-Google-Smtp-Source: AA0mqf6r+spSfA5uDVZqKrli1/yAsMTUjo7NgEJOEEtln0/O302Tz+lT5MvAPAeXznogLjyKObJtmg==
X-Received: by 2002:ac2:43d8:0:b0:4a2:45ce:a169 with SMTP id u24-20020ac243d8000000b004a245cea169mr2189309lfl.51.1668759355586;
        Fri, 18 Nov 2022 00:15:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b0049478cc4eb9sm559358lfo.230.2022.11.18.00.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:15:55 -0800 (PST)
Message-ID: <898329c5-5ad6-bbf6-34db-a58ba4244882@linaro.org>
Date: Fri, 18 Nov 2022 09:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk
 board
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogiocchino.delregno@collabora.com
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-2-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117210356.3178578-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_001558_116085_C318013C 
X-CRM114-Status: GOOD (  11.34  )
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

On 17/11/2022 22:03, Bernhard Rosenkränzer wrote:
> Add bindings for the Mediatek mt8365-evk board.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 7642f9350d2c0..a9c18fc7905c0 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -243,6 +243,10 @@ properties:
>            - enum:
>                - mediatek,mt8183-pumpkin
>            - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-evk
> +          - const: mediatek, mt8365

Still wrong compatible.

Best regards,
Krzysztof


