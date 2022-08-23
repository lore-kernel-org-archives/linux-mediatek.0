Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FCC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HP34AyNYe/j7dFIL+3WKkvgCr06Jg9c/Un+6T6F0jk=; b=BNqZjx6m5JfcQ7Lmk0IqgPsbu5
	QWv4basTq3UzuRTHjRXzsxci5daD8Q4VsJeZU7eup0bfH5h92cP/Z1C+NunFnLptFZnBtx2MURPXO
	++uK01dgH5hoSzAHGblONAuT7eBe2wPVa8KllDgsRx0i41hqa6gIjlExifl2f/gRbRlNTmGUrXQSa
	cp7pnYIb5vVWRK+FwPndGK2sAI3nt/jbcl95M9hC2ZhlYQKnBxoX9OpKcz9Z7qtCcgAsNIOe+OI+C
	syVN6IBeD2lJCVXYFo/XUuLvykry/OSYDTeh/e8a1emFGjslYwDLwUdUc1PDmH3ZzQ6gcyNmixCDj
	EXeaHo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQROc-0053i0-V9; Tue, 23 Aug 2022 10:44:34 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQROZ-0053ed-Tu
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:44:33 +0000
Received: by mail-lf1-x12e.google.com with SMTP id bq23so10061799lfb.7
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8HP34AyNYe/j7dFIL+3WKkvgCr06Jg9c/Un+6T6F0jk=;
        b=wQwWnZ9k1393yB7VB9rbCQ26CPuiOtrOJu4XhIY12J7q0aNEfe5n4E4F4jdGFHvfkS
         mz1u7pTeyLvtQXkCLc34UFF63tqsQ8tljVzMic/li5v7oy0KRj5HG9ktiRJb9I3qdLe+
         CuLTEPIKQzj1RUTGOpbg3hZUNxPSPT3+B0pUQP/ZVJ8LsfbCeA3176p41scq1wOeF1R7
         86qnJ+2RieUGWZTbDaT4jBMh4EhStWEPwS46gOve4FBMac04/nSq49OhgSuWk2tzoXhp
         CHo/LU+k+A31QCex8CCHt/c42FvrXSMkgBL44K+ZtltvZI4A2RXkJowkRMl2D6/fQOHe
         fWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8HP34AyNYe/j7dFIL+3WKkvgCr06Jg9c/Un+6T6F0jk=;
        b=HHusQmDRLB4jPTM3/GeeFt5xXaL5uAaZCOlkZ60r/3Q0kF+2FkIIYNMuQu/h6U3Y0X
         CyTZTxvD3FCJfLXYSMbNIpbZNhtlSjNuiiSjOHf0xoEdE+JWuw9tnTmolcSIGDXGVYCq
         AL6VsSuGZixhWZbkadM/0A6Mls2dRhzI/5EJ5tPA1P/vFv+OZDNh/4ODqoY9o5Um8FtV
         eDSSUn1sb5ycBmhJPSfTHFmBPsK3B4S1QaL1NBVBt6xPD8EKsADwu+lEYFnbr46r6rYD
         paUPpEBf6gp7KgRqaWmRqBvw7Ag0WNdmjfW2b5A2IKOEptQfrOiI9pCns/KK1orzf4Im
         DczA==
X-Gm-Message-State: ACgBeo0piWWVcDyo3RbBtgAQsr2n7FYMmmmwQvYKFZvEX7ky+qpl1PeB
	w7iQkKUOz1fmYZAqObY1UnnQmA==
X-Google-Smtp-Source: AA6agR4rxXhTjG7SiYhxHuWSPspv2TOFhsEws3bbk7/t4rVlK4kC/2dE/cQNj9NXAAnAUP9xnujcjA==
X-Received: by 2002:a05:6512:ad4:b0:492:c013:2359 with SMTP id n20-20020a0565120ad400b00492c0132359mr8721085lfu.376.1661251469099;
        Tue, 23 Aug 2022 03:44:29 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id p18-20020a2eb7d2000000b00261ba22d1f2sm2096208ljo.139.2022.08.23.03.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:44:28 -0700 (PDT)
Message-ID: <cf10e888-7fe2-7cf8-091a-40207eeb78b5@linaro.org>
Date: Tue, 23 Aug 2022 13:44:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 2/6] dt-bindings: net: dsa: mediatek,mt7530: fix reset
 lines
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-3-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820080758.9829-3-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034431_994531_A74FA320 
X-CRM114-Status: GOOD (  24.56  )
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

On 20/08/2022 11:07, Arınç ÜNAL wrote:
> - Fix description of mediatek,mcm. mediatek,mcm is not used on MT7623NI.

Separate commit. You are still doing here few things at a time.

> - Add description for reset-gpios.
> - Invalidate reset-gpios if mediatek,mcm is used. We cannot use multiple
> reset lines at the same time.
> - Invalidate mediatek,mcm if the compatible device is mediatek,mt7531.
> There is no multi-chip module version of mediatek,mt7531.
> - Require mediatek,mcm for mediatek,mt7621 as the compatible string is only
> used for the multi-chip module version of MT7530.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 31 +++++++++++++++++--
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index edf48e917173..4c99266ce82a 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -110,11 +110,15 @@ properties:
>    mediatek,mcm:
>      type: boolean
>      description:
> -      if defined, indicates that either MT7530 is the part on multi-chip
> -      module belong to MT7623A has or the remotely standalone chip as the
> -      function MT7623N reference board provided for.
> +      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
> +      switch is a part of the multi-chip module.
>  
>    reset-gpios:
> +    description:
> +      GPIO to reset the switch. Use this if mediatek,mcm is not used.
> +      This property is optional because some boards share the reset line with
> +      other components which makes it impossible to probe the switch if the
> +      reset line is used.
>      maxItems: 1
>  
>    reset-names:
> @@ -165,6 +169,9 @@ allOf:
>        required:
>          - mediatek,mcm
>      then:
> +      properties:
> +        reset-gpios: false
> +
>        required:
>          - resets
>          - reset-names
> @@ -182,6 +189,24 @@ allOf:
>          - core-supply
>          - io-supply
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:

Again, not items. This can be just const or enum.

> +            - const: mediatek,mt7531
> +    then:
> +      properties:
> +        mediatek,mcm: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          items:

Ditto.

> +            - const: mediatek,mt7621
> +    then:
> +      required:
> +        - mediatek,mcm
> +
>  unevaluatedProperties: false
>  
>  examples:


Best regards,
Krzysztof

