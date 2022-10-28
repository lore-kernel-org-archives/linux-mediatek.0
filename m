Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090B4ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdMQ1e2RSiY0iFjHTnOY+ZoLlVTTLqoC3Ptqc5DqK0I=; b=1SrR4lxgVBvxoXMM1ziHh9ipME
	rj3L/Q1DToe8b8a85XlH1c8qBc9mrsQU7G4cloSRpgvdgm0p2LgS3Vp0xztdhKssOZWa+r9a10cT1
	nYOToxCDxSyPkCXk1eNRfwXvDt++MM7YwCTIDmPBYVKAYfRBSdfUUKZO0Zfz0yigZszBivk2IG3Q+
	jvI48APtCO/zq1IkvJOlN/bOkVWqKrAPInN+20psZi89Nd6113qJUz8r33m31g3tkrX8iS4SuWqO7
	DseTax0AO1Zw4abBJCFwGfBNccGqoU82TD1eqRMB9PLk9PwZhe0mYRjtgOWp/lEiTEMlHLiaMlTta
	AirYYA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVYb-002519-L2; Fri, 28 Oct 2022 20:02:21 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVYN-0024wa-Gk
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 20:02:09 +0000
Received: by mail-qk1-x72e.google.com with SMTP id t25so4173334qkm.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdMQ1e2RSiY0iFjHTnOY+ZoLlVTTLqoC3Ptqc5DqK0I=;
        b=PcqZ7PtW5MlDoiLP2IwcD+4RGCbeVZgP8Ksej6kiYupCJ8j+Ee9znOOhCKCd+Xs5m9
         vHlrKzRJTBMnvo+aNvaGBudhEltguTzoc8Cjo2zBRrlX4Fa0sAuPbHHoHwbF1XXrhIpC
         uMDPzyHpUpDGsJ7C67l22jfaKS6nIdticRTNFiIZpA1AMRM9Ug3ZQ4oGLGV259rLUVBG
         6yZwkCzCDTG8IFGZc7HVfOgdCUNE6lGJnd62PKYU08DJA++91R1ZZ3F8cWlWjMRNGtPS
         5aexMW7upmnpRE6YqJRp5EAYSHk5+YM6N1LumIhWeFSIY8j4fasxqCM5RwRkqgSQMX/F
         lngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bdMQ1e2RSiY0iFjHTnOY+ZoLlVTTLqoC3Ptqc5DqK0I=;
        b=EVimX1ezhlJTWMTiKc7VKr22U2EU9xlwxibGpqk6U2wVcxr2EjDLgFAhuZuvPni2VV
         bYK6hjr++UjpvEXgpj2cU6eDrr1slrYP052uijfoKvqQd13k47JPHtWBsZjiRlWMUFgb
         sAo+ctAvttZl6P6q6oNI2G2dTOC0zU6Cui9FCr8IupZTAjaoM8R/olkLz1wqLew0pyk3
         Zqwx8ic9ggQ/0VxZACQ6at/WTLHYBWb+T9WGy6URntaCRXesr3c7T3AfUSdDYjMeaxSQ
         1mzDsZhpj+JPCCsOI6bG9z8iCfgJOp1IhLhUJl5yhx5aNZIb825Mm/skKsyL9TKrMCxT
         kXqg==
X-Gm-Message-State: ACrzQf1AvspOv2tiIs6St8Stv+3UqmsCgJJ+YpuMkDrom+UhHJN20KGa
	EqaxtQRV9j1bo9ZQSnHRuqN88A==
X-Google-Smtp-Source: AMsMyM5YpeL94Iw48e5O3aOG/3SA+rFA4qewOF0lq3w+vTmwLbFf7lZKx0HynAPmLDSOr4u3Ran9sA==
X-Received: by 2002:a37:2d02:0:b0:6f1:15cd:1493 with SMTP id t2-20020a372d02000000b006f115cd1493mr769971qkh.131.1666987320813;
        Fri, 28 Oct 2022 13:02:00 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id v6-20020a05622a014600b003999d25e772sm2839124qtw.71.2022.10.28.13.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 13:02:00 -0700 (PDT)
Message-ID: <e34b35f4-4197-3973-0947-14ee577494e9@linaro.org>
Date: Fri, 28 Oct 2022 16:01:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 09/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
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
 linux-kernel@vger.kernel.org
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
 <20221028153505.23741-10-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028153505.23741-10-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_130207_578868_EE482BAB 
X-CRM114-Status: GOOD (  19.81  )
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

On 28/10/2022 11:35, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property for each variant.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 189 ++++++++++-----
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 227 ------------------
>  2 files changed, 127 insertions(+), 289 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 70e4ffa2d897..6f2cffe50b11 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -8,6 +8,7 @@ title: Mediatek MT6779 Pin Controller
>  
>  maintainers:
>    - Andy Teng <andy.teng@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>    - Sean Wang <sean.wang@kernel.org>
>  
>  description:
> @@ -18,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-pinctrl
> +      - mediatek,mt6795-pinctrl
>        - mediatek,mt6797-pinctrl
>  
>    reg:
> @@ -43,9 +45,7 @@ properties:
>    interrupt-controller: true
>  
>    interrupts:
> -    maxItems: 1

Leave the constraints.

Why? Because now you dropped it for mt6797... You bring here some random
changes and it is difficult to review it.

> -    description: |
> -      Specifies the summary IRQ.
> +    description: Interrupt outputs to the system interrupt controller (sysirq).
>  
>    "#interrupt-cells":
>      const: 2
> @@ -57,59 +57,6 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>  
> -allOf:
> -  - $ref: "pinctrl.yaml#"
> -  - if:
> -      properties:

Make the move of this hunk in your description cleanup patch. Don't mix
functional changes and some cleanups.

> -        compatible:
> -          contains:
> -            const: mediatek,mt6779-pinctrl
> -    then:
> -      properties:
> -        reg:
> -          minItems: 9
> -          maxItems: 9
> -
> -        reg-names:
> -          items:
> -            - const: gpio
> -            - const: iocfg_rm
> -            - const: iocfg_br
> -            - const: iocfg_lm
> -            - const: iocfg_lb
> -            - const: iocfg_rt
> -            - const: iocfg_lt
> -            - const: iocfg_tl
> -            - const: eint
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: mediatek,mt6797-pinctrl
> -    then:
> -      properties:
> -        reg:
> -          minItems: 5
> -          maxItems: 5
> -
> -        reg-names:
> -          items:
> -            - const: gpio
> -            - const: iocfgl
> -            - const: iocfgb
> -            - const: iocfgr
> -            - const: iocfgt
> -  - if:
> -      properties:
> -        reg-names:
> -          contains:
> -            const: eint
> -    then:
> -      required:
> -        - interrupts
> -        - interrupt-controller
> -        - "#interrupt-cells"
> -
>  patternProperties:
>    '-pins$':
>      type: object
> @@ -169,8 +116,7 @@ patternProperties:
>  
>            input-schmitt-disable: true
>  
> -          drive-strength:
> -            enum: [2, 4, 8, 12, 16]
> +          drive-strength: true
>  
>            slew-rate:
>              enum: [0, 1]
> @@ -202,6 +148,110 @@ patternProperties:
>  
>          additionalProperties: false
>  
> +allOf:
> +  - $ref: "pinctrl.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6779-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +          maxItems: 9
> +
> +        reg-names:
> +          items:
> +            - const: gpio
> +            - const: iocfg_rm
> +            - const: iocfg_br
> +            - const: iocfg_lm
> +            - const: iocfg_lb
> +            - const: iocfg_rt
> +            - const: iocfg_lt
> +            - const: iocfg_tl
> +            - const: eint
> +
> +        interrupts:
> +          items:
> +            - description: EINT interrupt
> +
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [2, 4, 8, 12, 16]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6795-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: base
> +            - const: eint
> +
> +        interrupts:
> +          items:
> +            - description: EINT interrupt
> +            - description: EINT event_b interrupt
> +
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6797-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 5
> +          maxItems: 5
> +
> +        reg-names:
> +          items:
> +            - const: gpio
> +            - const: iocfgl
> +            - const: iocfgb
> +            - const: iocfgr
> +            - const: iocfgt
> +
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [2, 4, 8, 12, 16]
> +
> +  - if:
> +      properties:
> +        reg-names:
> +          contains:
> +            const: eint
> +    then:
> +      required:
> +        - interrupts
> +        - interrupt-controller
> +        - "#interrupt-cells"
> +
>  additionalProperties: false
>  
>  examples:
> @@ -237,8 +287,9 @@ examples:
>              #interrupt-cells = <2>;
>              interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
>  
> -            mmc0_pins_default: mmc0-0 {
> -                cmd-dat-pins {

How this is related to the patch?

Organize the patches so they are easy for review.

Best regards,
Krzysztof


