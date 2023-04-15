Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53C9C77B71
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7bWAyZyLD6uo7vF/WlVxj3C8Ki8eISz7a0rWcMvR1k=; b=rKhEPTct6vjYq4Tuu8AQexC7/n
	dWTnY6iEzH1qwGug3wvp5UN0MC9UXOi5A5a4fxw8tCt57Yj1DdB6hXoQpaJwHRbpZqfyZgz0XmGMu
	OxlBSNW+4MjA8EBI0DjLKkGN61IOv6UUuTN+Cwp7u57gPvErneax0SSe6R6rsqKspzTbNtOfxxJkR
	E8lmTod9J2GchR9qS3OI7A4rWvNQZMXqHJD85zu8G1/f9pzAhCwIjXWt8yDH+ZENvNgrXYmyOlrte
	Fx6jC5jKPPEWtTpM00BfMaRmYX4XpgkBp72O4Xv+88YB2TlL9X50LF3kf0PVflIszNkgle8wSntwY
	8ndIgNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnbmE-00Bg4S-1S;
	Sat, 15 Apr 2023 09:00:58 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnbm9-00Bg3V-28
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Apr 2023 09:00:55 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94f1a6e66c9so22469966b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Apr 2023 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681549251; x=1684141251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7bWAyZyLD6uo7vF/WlVxj3C8Ki8eISz7a0rWcMvR1k=;
        b=Co0OwPVRZSFCKAUtHmKZxfLEAl4+Yk9tRoSp0clTuJuTTsTWsesS7PWBTgdyTOlyEd
         bvErnPDwam2MuQ/85GuljVZSjqxCU4lay98TPaSI6eh+3DbgqXhKiXdeP4hhJpLgBzPR
         QONKjBWMsLwAiAUmhgHneXIT4yUvIfDtAd04MVj6qXuGPQUYtah+cHnfkZdJ8xwDwzWf
         7Z9urp7g82zxPXKJlqXl+ZFL0g2kh8xhmkrijuXx0FCo30I0AJvnYWTlWadx5OQb7KT8
         1nGYSyuKtZOANDAyIr4QKAl1B3jd6va4NY5Nb/G/jEvrtXDSn+wV122H06cH5GFbxNPp
         XIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681549251; x=1684141251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7bWAyZyLD6uo7vF/WlVxj3C8Ki8eISz7a0rWcMvR1k=;
        b=WP78ntCstG7v6GB/a508zeqwVJm5re2GwuPMo9Bqww4AS+NjwqTlbXmhapa07XHSWI
         kkPdvqtQ+uhPhYQCtbQkNlzcz86q+0LqHbdwp1Dtb/g/W/xOlEpavVR8cAQSbigulmE7
         n+ysMqFDfcRkI1Sl3VfOr5CSfphYK6lbqWGJJ+RVqZ52Gh/YH/5Wp4l54Ly+IF1phdMJ
         mNpfHmFUjl7cuk3CWinv5yZZn8+TPf2jRdAAfeTX01N/eBRhG9i2Lcmsk5KqhE2HIDxn
         7JceHmTpdn+BfF+VmfiKlpY7pNj1KJTZ1vGH1Ysl4h7a+sBOeHkQ3bkPt+VqYIaOfLS2
         uXkQ==
X-Gm-Message-State: AAQBX9em8sG39kpNlcm7dLWFnCacgQU1YQoO1NaOkSXu61h6vrtmjhPv
	H7HSWXAid5KdH1V/fVEHLyhuBQ==
X-Google-Smtp-Source: AKy350aEJnSqnbH8WH/aQ9lyPmdapGYw/EYooeirvjzag7l10B9FqEzScCXV7gADNUZ63773fFSs4A==
X-Received: by 2002:a05:6402:1a2c:b0:506:7d14:984c with SMTP id be12-20020a0564021a2c00b005067d14984cmr6282723edb.19.1681549251217;
        Sat, 15 Apr 2023 02:00:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36? ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id wt10-20020a170906ee8a00b0094f225c0cd3sm421385ejb.86.2023.04.15.02.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 02:00:50 -0700 (PDT)
Message-ID: <310e8979-de96-dda8-6c95-0e6033d8b403@linaro.org>
Date: Sat, 15 Apr 2023 11:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-8-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413104713.7174-8-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_020053_724256_B465C742 
X-CRM114-Status: GOOD (  15.56  )
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

On 13/04/2023 12:47, Trevor Wu wrote:
> Assign top_a1sys_hp clock to 26M, and add apll1_d4 to clocks for switching
> the parent of top_a1sys_hp dynamically
> On the other hand, "mediatek,infracfg" is included for bus protection.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> index 82ccb32f08f2..03301d5082f3 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> @@ -29,6 +29,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of the mediatek topckgen controller
>  
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek infracfg controller
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -37,6 +41,7 @@ properties:
>        - description: 26M clock
>        - description: audio pll1 clock
>        - description: audio pll2 clock
> +      - description: audio pll1 divide 4
>        - description: clock divider for i2si1_mck
>        - description: clock divider for i2si2_mck
>        - description: clock divider for i2so1_mck
> @@ -58,6 +63,7 @@ properties:
>        - const: clk26m
>        - const: apll1
>        - const: apll2
> +      - const: apll1_d4

Why do you add clocks in the middle? The order is strict, so you just
broke all DTS.

>        - const: apll12_div0
>        - const: apll12_div1
>        - const: apll12_div2
> @@ -74,6 +80,12 @@ properties:
>        - const: i2si2_m_sel
>        - const: adsp_audio_26m
>  
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1

Usually these two are not needed.

> +
>    mediatek,etdm-in1-cowork-source:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -147,6 +159,8 @@ required:
>    - power-domains
>    - clocks
>    - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

Why making them required?
Best regards,
Krzysztof


