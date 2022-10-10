Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE802C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSjTFaTwHPwjZGfr8E/xLaRY+zXJO4LqPIEifjrfoTQ=; b=rUQquC1Fc86swbNnKmJXUopKxu
	d1yFi/+1eXp+sL4bWYiIAc1Bjxd+lWf6mYuG2qwDltORDc7uHcvx3+bkmPWBiqx9pVGzyFlKqqT45
	D0AWZeWkzPnTXT8ox3dYsh6/Gq4Trm0FrmOPf1xl8KIyeEbdNYjLBdVvQbkkdVrMsoUfeejMNYSsh
	cx7A4uZZYbRDq2jZLoGCjvAnFibmy63wPQh4cyDVeEtT41BXLhasGI5Df6r/UmQgryMrgrT6VE7fq
	7CeVCJwxwv/KPYlSz/6hOqgR09BWK+mDczFCbYJLCfm3NeQhMg3byOsH0LaTLXo4IznjwaleLZ6JX
	xW5pa36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqwZ-000azR-47; Mon, 10 Oct 2022 11:27:35 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqwW-000axU-Kg
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 11:27:33 +0000
Received: by mail-qt1-x835.google.com with SMTP id c23so2264010qtw.8
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Oct 2022 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nSjTFaTwHPwjZGfr8E/xLaRY+zXJO4LqPIEifjrfoTQ=;
        b=Y1CkvobD1V1y3GjwD966ve4tQ+VBxUsL2HuIu4DnGRt4ZagEpIIAaz/wURxeZt3msF
         /W/ZYds95zmNeiCVwFuoTU3cX8V3Y1oVq6+4ka/qRo+o2206eXXJi6pI19Hu4XJcKwIr
         X2HK9bHpQm0LM4IK694ZCJFyGPajDIOkuioZyCpAG3iUSjCncK9EEW/73Yxwul46y4Ed
         j3sqOP/sCh/URjpYohEDz+vZrlk3LTWPHgtV7rAmLfPskoQOeh9pq7fs76YKpYwa0Snp
         LSS6xtXixaTiQ+aL5LloffHYJTjrkL5kmUjNsqCczBbRY0JAZDvExzjeSaXNPlGDg1jK
         ju7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSjTFaTwHPwjZGfr8E/xLaRY+zXJO4LqPIEifjrfoTQ=;
        b=wHxb3f/5ZI5Jhv7eT3ZHteOhF4WN5x+glTB40dv6ybNBfWmIJ/tlHZt5Or7m65SKv8
         tiT1oN/LAFfUq2VWekBAmVtuU7gS0QhYM9tm6U41zPJ/B0K+4fpRBR7Nk2SwGaGKW2n+
         KdVMhWggWBc9eh0Rn3kVhfyQw7IK9MAYTOVFpFvThrrYy5C78vvevPz0iNjRhL7ktEEr
         dspy4AOHCcZotGXPoQDAeqFt808ENOrgARsCKAKKrUemmJu9hTMA386S6+blq4fIXkgI
         rL5HZsBzBrUQ+VhOta0Xwin4Jl8/Ap/OWJCJezZnzfk7zePl5837zsk1+MDBcpMotk5+
         GCmA==
X-Gm-Message-State: ACrzQf1m+4Sm4KU6H1Yj1f+E0XLQKRRmIp+las2aHlk07U9uSdRCxTUg
	ebRWTu+4na55/69bVioScNuXYg==
X-Google-Smtp-Source: AMsMyM48kE4mbcoryr6M5z/FYPc1qt6vfqtHUIXrJ+kU/szZ7iL2Q7z8GlBKVvw+gzg2ObohiQtDGQ==
X-Received: by 2002:a05:622a:10c:b0:35d:4d0f:fead with SMTP id u12-20020a05622a010c00b0035d4d0ffeadmr14224343qtw.325.1665401250775;
        Mon, 10 Oct 2022 04:27:30 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id dt27-20020a05620a479b00b006ed61f18651sm1710023qkb.16.2022.10.10.04.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:27:30 -0700 (PDT)
Message-ID: <14317653-bf79-2926-1a9e-7747854df05f@linaro.org>
Date: Mon, 10 Oct 2022 07:25:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 08/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-9-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007125904.55371-9-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_042732_730864_B7DB2F07 
X-CRM114-Status: GOOD (  15.09  )
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

On 07/10/2022 08:59, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The MT6765 pin controller has had a driver for a while, but DT
> bindings were never documented for it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index cada3530dd0a..71a9aae2cc8c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -18,6 +18,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - mediatek,mt6765-pinctrl
>        - mediatek,mt6779-pinctrl
>        - mediatek,mt6795-pinctrl
>        - mediatek,mt6797-pinctrl
> @@ -62,6 +63,28 @@ required:
>  
>  allOf:
>    - $ref: "pinctrl.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6765-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +          maxItems: 9
> +
> +        reg-names:
> +          items:
> +            - const: iocfg0
> +            - const: iocfg1
> +            - const: iocfg2
> +            - const: iocfg3
> +            - const: iocfg4
> +            - const: iocfg5
> +            - const: iocfg6
> +            - const: iocfg7
> +            - const: eint

Blank line

>    - if:
>        properties:
>          compatible:

Best regards,
Krzysztof


