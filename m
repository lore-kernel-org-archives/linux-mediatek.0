Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF9EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+g8bhbYuaQlXpPh9UOtgjVnfBA2QaGFWh99Dxpg4ZE=; b=DeWj7wHUrUsgsx1KHu2i0/tSgG
	t6+Gpw0+nfWZTIy+quAjaOvo9RLCEM7am7oe6n/b+0jpO0T8x3X3/11emmgAZkCKku4UItW3siHmK
	aKXTwT5pIielu+SC6rK3j8bz8np7GKhsTvMGx3z8dHf0Q0I/xCnVoUSKzldeZ7ZzixlGRdR025Knk
	uQ21T1ehE2p2rWQwRybD1f0JJPdjEcGlIhjdS8dzmCNOfbwFiRjSo7x061VzP5XWNs7247PeSFCcb
	oxaw/hyx9iKWngxnUSvjNlE4tDcBjK/1zfu2Bpg9E4qVngJASjsu3QNUvXOkUna22ERydHMUW8QhP
	rf8NwyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Rmn-00Gk9M-TA; Wed, 14 Dec 2022 13:27:01 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RZW-00GcBD-P5
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 13:13:20 +0000
Received: by mail-lj1-x22f.google.com with SMTP id v11so6553610ljk.12
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Dec 2022 05:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+g8bhbYuaQlXpPh9UOtgjVnfBA2QaGFWh99Dxpg4ZE=;
        b=pH4lW0UzND66hSwgAr90gmNeJlHhMMjKxH++4eW3mWYQyc+QzxOJXFiGhRsFLzgJq3
         k3+WVeQmb6prwQwLr5tbLcNSDjevfkbBMeexkjwydyfk5wzC2d01uaqZ9KTKR4ZbmmSj
         P4BbNAO9HG/VNcHskBIak4fVt3eAS+98lwqxCaBfK7/840N6KSl+juF26s9XyI+9zx72
         v0SctXCPovZc5s4h19qrHjlfhaBFG7899spkzEHoVKHOe5BCc8b80P8G48Su4s+kR1L/
         flqXg0HjT5iXo4wesLl9SlcpG8/MXK43CZfSuMIKHUY2pU04i7qiRlmDFXAraT+VJGTV
         D/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+g8bhbYuaQlXpPh9UOtgjVnfBA2QaGFWh99Dxpg4ZE=;
        b=aQkQUfAmQLobF4OVQurc6MVJXNuwm1PgnBBsFAqUj4IGVfsC2aT1sPAeOrLcoB05H6
         utIaAZAieCF1uh6FI5/5PGvOzU3/DuZbXVBRzImMcQwYA9NeI+AzdnQ+MFGE3h266vrc
         1tyMMZRHqINvj4S9kC58n5o1Mvo8/NCEdur6gx2wdubSB3CtzxinPFCzOvXQFfiaX80C
         yFmmbXICImwJHYasIu3X8FcjU8NqBUY/eGp6wnSQNJ26EyypH52HDudleLz9lQ23HFjg
         bdmqiXWN+5PNcmohLoYTrws6MkcWyq8a6qMpAHmnzpOuyUXcSip0dsn/CFy36XS9TJ6/
         f7dQ==
X-Gm-Message-State: ANoB5pk2H1BAigKj7cSq8d5GdWgJegc4nKi1LufSQOdxwUJ9IDr8CRkC
	QiUuAO56g4P2TrlbwQvWxlEm+A==
X-Google-Smtp-Source: AA0mqf5PHGVRyKqw0AGxvuMvc+S3bUW9QX8UFoENXdCLSqKdTBPI3OD0tyhSW0GEGTa31bX/AAwYJQ==
X-Received: by 2002:a05:651c:883:b0:26f:db34:a157 with SMTP id d3-20020a05651c088300b0026fdb34a157mr5864463ljq.26.1671023592549;
        Wed, 14 Dec 2022 05:13:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bd9-20020a05651c168900b00279e93c9c25sm596663ljb.29.2022.12.14.05.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 05:13:11 -0800 (PST)
Message-ID: <9d7bda38-69c9-95c8-e867-8bd5733debe2@linaro.org>
Date: Wed, 14 Dec 2022 14:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: mt7621: add proper function
 muxing binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20221213130430.172876-1-arinc.unal@arinc9.com>
 <20221213130430.172876-4-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213130430.172876-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_051318_859557_96E79675 
X-CRM114-Status: GOOD (  13.87  )
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

On 13/12/2022 14:04, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/ralink,mt7621-pinctrl.yaml        | 204 +++++++++++++++++-
>  1 file changed, 197 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
> index 61e5c847e8c8..0efb03f1d88e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
> @@ -29,21 +29,212 @@ patternProperties:
>          $ref: pinmux-node.yaml#
>  
>          properties:
> -          groups:
> -            description: The pin group to select.
> -            enum: [i2c, jtag, mdio, pcie, rgmii1, rgmii2, sdhci, spi, uart1,
> -                   uart2, uart3, wdt]
> -
>            function:
> -            description: The mux function to select.
> +            description:
> +              A string containing the name of the function to mux to the group.
>              enum: [gpio, i2c, i2s, jtag, mdio, nand1, nand2, pcie refclk,
>                     pcie rst, pcm, rgmii1, rgmii2, sdhci, spdif2, spdif3, spi,
>                     uart1, uart2, uart3, wdt refclk, wdt rst]
>  
> +          groups:
> +            description:
> +              An array of strings. Each string contains the name of a group.

Here and in all patches - please add maxItems:1. The definition of field
should have some constraints (and your if:then: might miss a case).

Best regards,
Krzysztof


