Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPndSUq6Jpy0rjYPqHXADjR2f0NNFrqqkuYqQOOy04o=; b=hHMpoiyMLSijIp
	4YizWBY2Aw0dlXNrts6QyXgHla286ZVWFy1elBIKhG7B5W4GEYSTu0BVeKn/mC7EjXiXzFMzbX6es
	C5YiSBtibEVGB6lbwJYPfHpDePXnA/imtSziYokjemU2S4y4oJ5VdPmW0DHWpJZUy9RWo7nEPZWmn
	2q+F3JyrcZwtT4xmj/2hJGc/IZjIT3vt9GNxoUipYT7GyK3p06mlpqEExJ+zKqPqb2ry82sahSc79
	44QZLnRcJPdubQcjIY9bcSdgNEobmv3e1/kTpKkI0UV3mDt6TS3jF5AHqfubPGaSHEbMswVA1w1t/
	DprJY/OYeIWy9PNko1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlp9b-004vzr-Ap; Tue, 03 May 2022 09:49:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlp8f-004vUQ-Ew
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 09:48:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id a21so19241799edb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ia83NWe8LX9zGfMIBGWxWbf+jhXbsrN3kDN4N4rBK0Y=;
 b=hk7HN11Jv7N88CzppbvASPBZp9ZpBdDXCQRf7G19x30QvRcEuhRcRQRGepvwNsHqla
 6RplJLMdOo3CBysoleUkcwEEqJl+yKoLf9sYQYZgcMWXAelOe2j8KYMjSpN4uQ28V9Iy
 4Mu5J8SCb4o3E5zHKXxoM2AJM9GN+lI5+P6IWawVR+alB7/EKQgk75UMPnIthh0hXhd0
 ezeHYwD1TAyg0Av7SQ9QBPhdm7LGuXkytGf9vjGi3SYsKphKXgpWvUoaObK7FRTGOV/R
 krXVbyJgO5MfS5GzgkJMsvBArVpW9kaVWxEAr4Yf+qifdZehj+WNx+mQLO65MixBl8bL
 6hHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ia83NWe8LX9zGfMIBGWxWbf+jhXbsrN3kDN4N4rBK0Y=;
 b=CD4mAOFjw6x0XpVY68CuEaoMa8UF1EvacMB0UjyugfUurU0DQJN4yXH5QI/eo8/Est
 SrjQmbCk/H+XhEwS8nZQHV1QQK+WsdD7+g42jDkYWY5cmclpJ+dobXYJuES+c80ys5lX
 Bs4Q4mX6exMomG7vyH/IUfiETAaEq7SQWd307kRG/nD4mk5tCtFIvfjoa37V8lbMAvdT
 ulASldhEE3zf3BETUccLEryuwSLRW566feVigquWBIiWgGO7iEkQPkrJ4XK5SdsEVrv+
 lB57Hf2GQx2CbEz0dGwPJul+xuMYEePcUPrb5lZEPsJXBcDI/HZ0a5IORxUE1i4dFHnU
 jVbw==
X-Gm-Message-State: AOAM531naWnvErlS8fpooG0Yz4FfDibffh9pdN+Kqjja132sXl1Z0RAX
 181mXTXDgOQhi7m2bDMdGw3cog==
X-Google-Smtp-Source: ABdhPJyRBzzlCNn9yAoYuCi1t/fyhNT55q/wMox/p3Nsux+wm2joqDdAE60nwyosH7YQ3InoEUEoQw==
X-Received: by 2002:a05:6402:28b1:b0:425:c39e:b773 with SMTP id
 eg49-20020a05640228b100b00425c39eb773mr16587869edb.237.1651571291277; 
 Tue, 03 May 2022 02:48:11 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 zp1-20020a17090684e100b006f3ef214defsm4408678ejb.85.2022.05.03.02.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 02:48:10 -0700 (PDT)
Message-ID: <9110244a-9e75-40e6-4c82-d2ef149e0e6a@linaro.org>
Date: Tue, 3 May 2022 11:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: mfd: Add bindings child nodes for the
 Mediatek MT6360
Content-Language: en-US
To: Gene Chen <gene.chen.richtek@gmail.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, cy_huang@richtek.com
References: <20220503062843.12516-1-gene.chen.richtek@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503062843.12516-1-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_024813_584540_CAE6CA3B 
X-CRM114-Status: GOOD (  18.34  )
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

On 03/05/2022 08:28, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings child nodes for the Mediatek MT6360
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Link: https://lore.kernel.org/all/YmqTzlrVL5KaVPuz@robh.at.kernel.org/
> ---
>  .../bindings/mfd/mediatek,mt6360.yaml         | 212 +++++++++++++++++-
>  1 file changed, 201 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> index 4d8769f3748c..b3eecf661bc1 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> @@ -37,6 +37,18 @@ properties:
>      description:
>        The first cell is the IRQ number.
>  
> +  regulators:
> +    $ref: ../regulator/mt6360-regulator.yaml
> +
> +  charger:
> +    $ref: ../power/supply/mt6360_charger.yaml
> +
> +  tcpc:
> +    $ref: ../usb/mediatek,mt6360-tcpc.yaml
> +
> +  led-controller:
> +    $ref: ../leds/leds-mt6360.yaml

Full paths everywhere here, so:
/schemas/leds/leds-mt6360.yaml#

> +
>  required:
>    - compatible
>    - reg
> @@ -51,17 +63,195 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> +    #include <dt-bindings/leds/common.h>
> +    #include <dt-bindings/usb/pd.h>
>      i2c {
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -
> -        pmic@34 {
> -            compatible = "mediatek,mt6360";
> -            reg = <0x34>;
> -            wakeup-source;
> -            interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
> -            interrupt-names = "IRQB";
> -            interrupt-controller;
> -            #interrupt-cells = <1>;

Previous indentation was correct, don't change it from 4 spaces.

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      mt6360@34 {

What is the reason to change correct name to wrong name when adding ONLY
child nodes?

Please split any unrelated changes to separate patches, if they are
reasonable. Using wrong node name is not reasonable.

(...)

> +              port@2 {
> +                reg = <2>;
> +                endpoint {
> +                  remote-endpoint = <&dp_aux>;
> +                };
> +              };
> +            };
> +          };
> +        };
> +

no need for blank line

> +      };
>      };


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
