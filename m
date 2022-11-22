Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC0CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUcHxKNUlASZz/X8KuXB0tRt7hDcsZtxJiE2XAUFgK0=; b=CeL5YRnHDJwHJGrEt6rE3TUXBT
	Mr8rvn4FGQqdtglUC9WssKcmerZM8jUcTMZ+pnFcBPF/6ktKuYAVnNKUtF6ri0lHdb7w1R7GK7rpq
	pzlYHDkxPCvE9g+JunJSonTvoWbQAUw4lhXNCL8Js0C3bo+BzXD0JPHzjHuUWsSmM94f2oi3bOeOG
	Gxl/F/STsJISQhQZalfmAbJFPLY9Ag8dgbsc84lMLK02CrkbUK6VB5uBx23JNz4Ch7sYZTOICf1hh
	z6hDPPvuBxAbZif/DuM4dPiPGiaoFA3gG88fCf2NsbxDhb5m+HhHEUsUGPRjOT79dmEnQ1sHdcsi+
	llL9w5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWfJ-00Auqu-Uz; Tue, 22 Nov 2022 17:02:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWfG-00Auop-Uq; Tue, 22 Nov 2022 17:02:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id d1so13567435wrs.12;
        Tue, 22 Nov 2022 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUcHxKNUlASZz/X8KuXB0tRt7hDcsZtxJiE2XAUFgK0=;
        b=QfIK0hXCjKJVeI0i0Z8r3P7A0TRBhzEwfNMv7GdcuQ8byRz9v9xDE1/xQXpXzScshj
         gcRiFXtjXNZv8/4+2XGXaKQt8HqXk2FNxHeKAyh92mO8RGEB+hLOLB9m7vlps76+bIZs
         +8VQgUPMrH3lPvJKzA8vevmS9h3ST7QFsdmJBR+FidD4wLQSSf8trA1H01D2AxOYnm2W
         FmWn0UuBVuq5+M7gsiPS8D4iilJqrUkJeDotVIm2JtWeJw3UwpGxtlKBn4VOLRd2TSg9
         LHOv924/g2YRJXGzw6O09VPW72nD14vEKGIey3znmEbYYiQC5/AG/ggvVYgqVastnsMC
         OmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUcHxKNUlASZz/X8KuXB0tRt7hDcsZtxJiE2XAUFgK0=;
        b=0gRMzOJhFqZdzfq1QI10Dnyg7mAd7XizQvIynXn7BkAS+HOG5ELtST+D+RXOQN9qEo
         eyItdxgXmRrSYMF+uJZVvyQThMUPgJhhVtaHB01MAhoGIUsqw+HFrnVsE/PkZfic7fa9
         jLJyCH0S1Z9B04GbwuPme7dK6NIEDGLnKssmS/26xT9mVq4L2/C7Ia7+qqH8h6Y3RS6H
         OKHoDUoEw+4IzIiTCmBeM0saHY6mkNrQJU6vMuGBpOcvL2oTBz4Cvh/9E+GAW0rwvZBB
         apzgdtQA6/DPR1toIq4GLu3W4/1KE+wjyjJWV8W4OyVJDMIErowKxmV1HrvQsnWxQxMx
         /4UQ==
X-Gm-Message-State: ANoB5pnbOvyAl78pL5NmpgVjIFk+ltQkO8wBZ7evjIGkZiHX8ZgumMHK
	f1Z0FezuZFg96qw48ZhKqc8=
X-Google-Smtp-Source: AA0mqf49HIMZSzdOoEtBJ9tRmIBfPJn16ehrqs2keL04CLnigLwdWrXYnLZc4qam3NRENhayvSEnGA==
X-Received: by 2002:adf:dd10:0:b0:22e:4f2e:e57 with SMTP id a16-20020adfdd10000000b0022e4f2e0e57mr15005618wrm.698.1669136546331;
        Tue, 22 Nov 2022 09:02:26 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id n27-20020a05600c3b9b00b003cfa81e2eb4sm19846292wms.38.2022.11.22.09.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 09:02:25 -0800 (PST)
Message-ID: <6945a20d-098b-fad3-766e-f4bcb3c37da8@gmail.com>
Date: Tue, 22 Nov 2022 18:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/7] dt-bindings: pinctrl: mediatek,mt65xx: Deprecate
 pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 krzysztof.kozlowski@linaro.org, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-4-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122010753.3126828-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_090231_014086_D29EDA1E 
X-CRM114-Status: GOOD (  13.53  )
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



On 22/11/2022 02:07, Bernhard Rosenkränzer wrote:
> Make pins-are-numbered optional and deprecate it
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index 33b5f79e741ab..1b44335b1e947 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -31,7 +31,8 @@ properties:
>     pins-are-numbered:
>       $ref: /schemas/types.yaml#/definitions/flag
>       description: |
> -      Specify the subnodes are using numbered pinmux to specify pins.
> +      Specify the subnodes are using numbered pinmux to specify pins. (UNUSED)
> +    deprecated: true
>   
>     gpio-controller: true
>   
> @@ -62,7 +63,6 @@ properties:
>   
>   required:
>     - compatible
> -  - pins-are-numbered
>     - gpio-controller
>     - "#gpio-cells"
>   
> @@ -150,7 +150,6 @@ examples:
>             compatible = "mediatek,mt8135-pinctrl";
>             reg = <0 0x1000B000 0 0x1000>;
>             mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
> -          pins-are-numbered;
>             gpio-controller;
>             #gpio-cells = <2>;
>             interrupt-controller;

