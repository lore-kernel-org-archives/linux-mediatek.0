Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453DDC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deWpEeAoza1LIualsVZbdy0EHlWRefem1NxcUaee0Zg=; b=Lu6zQX/2IekBfG2kf8rcv9tyG3
	pSxbkS0EXICmMg2eBKhjRmgBWomJCMbKryTFUPoSyFFbhFe8G7912Qt8eOF5nW+bEW6jiEN4ehwpf
	ZwzJAV+pj9I6xAeoTsHXpkw7UD2s2m6My/9cYxs8RfrmKgVXlJPI4KTL4WKuKu6Gad5rR4r2ydkAf
	sFdwVX7KU6FgHU58H34eTjgxczhhALNkg/grnS2TuihYBSedjKKFWiyN12vlUl8w8JW81sAjSVAju
	jvzh8N59s25YqTxFP0A0tCk8TCSXHh0bmyGzBqCfxOoD7yYUc0qG4UlJ4l+EmUc53ikeQIxDUpaou
	wecclY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJIZ-00Drgf-0f;
	Wed, 13 Dec 2023 07:04:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJIG-00DrMd-1H
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 07:04:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50dfac6c0beso4215654e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Dec 2023 23:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702451068; x=1703055868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deWpEeAoza1LIualsVZbdy0EHlWRefem1NxcUaee0Zg=;
        b=A+JyT/55AQHBi5RLlIX/W9GBARl1hjoWXdTHWctYGiu0F2t5zANPBTVssVW8vIxN+7
         jJfqQ2OTLV0SAyHeP4dcjFjnOefCHsS+q6palj9Gf4trJLyIKxtoV+szt/oCqwgqa5zK
         5K3tikp/2jSk7MVU53cGm+Z3QqyAYpFlrkFjoZFxJdbk6U9Z18Vm04lBfVjdNoKNnnzT
         MDcK/VigDBQngI5MdoVBSmh5phNAIABJGdvOQDCfCRX12tbnV39D8NtNqZ/Cjvtjxabw
         R2Pi2pwsslsLosXkZjUEa0EVQiZaM3YnHUXPuovwXhUW8vfoH7tdoFLhP1zIS5JWWYIL
         D5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451068; x=1703055868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deWpEeAoza1LIualsVZbdy0EHlWRefem1NxcUaee0Zg=;
        b=n+bDb1hIl+boIyXvAkvpcdM0cA8/OLx3AZjQBFPzk6tT6oqIEi+7bf0LQfTnTnW4B+
         P9D0FVJKqzgRVizei8U5WEA75i2higNoAO+lPpS19J+DWNtieZ620ihpdAEptdYpWINQ
         ooCV/KBQwwLMno7XCK8B/kkuxUNlDuY3EFaGuJFxDhqzfbqUsoONGzRis6hOef89j4uT
         3mpHDNxKC53tVNkw49zhP9M4QP8xC2/mG2H844gMFKBUnk7W3Q/+5J4B8jHz2YUWb0PC
         dGBSpMhb25tov0uueO8iqq1AGv0UFUddqoRDlc3cEtAs+tU3Ii339TGwCmJkmOFSDw5B
         gJjg==
X-Gm-Message-State: AOJu0YyvmWPsCkUx9tcxOlcuB9D6QAkPR33sktbde4sO6qHEQYt0ld+j
	WXeLjO0LMm9hoRCSoLdgmyXkgA==
X-Google-Smtp-Source: AGHT+IGiKF2oMLU28+2oME+tA62AXHIXuo2gREvYYSDjnfH4ylJlVQQHKbnuWwDLWMIVd4Qro9wzqA==
X-Received: by 2002:a19:ad4b:0:b0:50b:f71f:2cc1 with SMTP id s11-20020a19ad4b000000b0050bf71f2cc1mr3014522lfd.62.1702451068447;
        Tue, 12 Dec 2023 23:04:28 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id cr7-20020a056402222700b0054ce9ef93fbsm5349829edb.4.2023.12.12.23.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 23:04:28 -0800 (PST)
Message-ID: <7c878a4e-da9b-4e8e-a965-9eeefe073d13@linaro.org>
Date: Wed, 13 Dec 2023 08:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sabrina Dubroca
 <sd@queasysnail.net>, Chen-Yu Tsai <wenst@chromium.org>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
 <ce9b1e777090724794cf9f0c52bcd8618385fd06.1702350213.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ce9b1e777090724794cf9f0c52bcd8618385fd06.1702350213.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_230432_435639_3D69DFCC 
X-CRM114-Status: GOOD (  10.49  )
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

On 12/12/2023 04:18, Daniel Golle wrote:
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

...

> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt7622-sgmiisys
> +              - mediatek,mt7629-sgmiisys
> +              - mediatek,mt7981-sgmiisys_0
> +              - mediatek,mt7981-sgmiisys_1
> +              - mediatek,mt7986-sgmiisys_0
> +              - mediatek,mt7986-sgmiisys_1
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt7988-sgmiisys_0
> +              - mediatek,mt7988-sgmiisys_1

No underscores in compatibles. At least for new ones, because you cannot
touch the old.

> +          - const: simple-mfd
> +          - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -35,11 +42,47 @@ properties:
>      description: Invert polarity of the SGMII data lanes
>      type: boolean
>  
> +  pcs:
> +    type: object
> +    description: HSGMII PCS logic
> +    properties:
> +      compatible:
> +        const: mediatek,mt7988-sgmii
> +
> +      clocks:
> +        maxItems: 3
> +        minItems: 3

drop minItems

> +
> +      clock-names:
> +        items:
> +          - const: sgmii_sel
> +          - const: sgmii_tx
> +          - const: sgmii_rx
> +
> +    required:
> +      - compatible
> +      - clocks
> +      - clock-names
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
>  

add allOf: here

> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mediatek,mt7988-sgmiisys_0
> +          - mediatek,mt7988-sgmiisys_1
> +
> +then:
> +  required:
> +    - pcs

else: also valid?

Maybe there is no point to have it in this binding?

Best regards,
Krzysztof


