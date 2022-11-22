Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3D7C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 17:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2ESf2ffEWNtfVyM0ZPvb6Y0s026dxSYBpFrwcaZ3J0=; b=VYL94KjrJ+DXQZZNatsw9i4oIG
	sXeQFl2V+g4b9dqmjRj3di90THTWINZrMHgMpk6/MEIDFIn1+RvvOqXXKYNHwKW3263+laX2+STVP
	BabBoR9QWYQ0SYxgrSJ7GturklPJWyo85PUqbWa12YQuX01x00LtN3Q6ZRJ7q1xrSLfyDD2Z8Iibx
	Feqv+mZtZKjDMxi9ivv9MnJqoKx8tklqeaPvY2TLMk5SaZBGlxLYVgBEwbfw8h81YVPN9obrBDEz9
	w3+f/kw+wNhcYwNYop2f88nYM5I31jkeTRefJq+wXZagxPD0OXw4Cnc+PBpYG3oQ0AklFoKRbNN/r
	VNNFO/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWfx-00Av62-Ks; Tue, 22 Nov 2022 17:03:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWfr-00Av3O-8u; Tue, 22 Nov 2022 17:03:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id d1so13570761wrs.12;
        Tue, 22 Nov 2022 09:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2ESf2ffEWNtfVyM0ZPvb6Y0s026dxSYBpFrwcaZ3J0=;
        b=jYH5L4jwO3/d+gHzNoEfN+SNyVccGsviLt9pM8GecpnpvqZNCOeanh91XhU9KlIWTa
         Bt6yU12pdtmPRaYodwRAFupLAk80R4xeJedy9BnqAWYbi+2IlgQ1IIQ6+Wg5ddg+xZPg
         Ne1X8dT2ltDivCtWGr1pN61s4Y5AN+S/DHlMq/+avsQLfAmXN8OX6XrzYMqC85/DYSgu
         pyzckN2+ZJ4vRprzLunP04BTAZx7zqpINeHK41p7vDkE1Qc33XKR8wxcZAzoMl9XhnP8
         ttx2giyAp2NdtLntxKdENItCv8OXzHTlqGOyTSCowzAoy20dgxe/3YcgnU0KNP8hZ9Kk
         z43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2ESf2ffEWNtfVyM0ZPvb6Y0s026dxSYBpFrwcaZ3J0=;
        b=fTbVzGO2p8N14iHYSdCO0ii+qiOdOKP9cmzjrSlEZRbvF3fPYpYfNzN7+QdK+osdPa
         0duU4j2VVSZTwkDBETuY+MNLp9W9xX/TJGE45wzdXi121b1d5zBWcLXwrFFiNEsQ/GVK
         ole6CCi6HREjPnj4jzpsEJ5hiW7iMcOdJ6w+TKd9AHt+LCuS8ukzujak3e8oAE/j5ePS
         jtkm9Afx5nYCLsJRbADMch1gwphunwoJ10hWhitL3Oebc0QjbaLru2mzyz2x3rTc8BZl
         Y8yZo6ugTIBClGRydOO3mlZ0k0lR2IfW3TPr7P2FW09nQSU9Y5cwvKqqMghKvEBCQRGV
         gxYw==
X-Gm-Message-State: ANoB5pla9WIfwFSvDQtw42wLJ3ZV2DVwmzEYDoT7/p4UgBOv4VZUZLUA
	6UDaRe4yLwbb0qoEHITbF64=
X-Google-Smtp-Source: AA0mqf5AAB2WpZpQrxG/QW1P9YfLF2voM76+7M892xh+AKLCme4WOa5olE+MEanw9+a/FkosbhcpOw==
X-Received: by 2002:adf:ed8e:0:b0:241:d7ce:4395 with SMTP id c14-20020adfed8e000000b00241d7ce4395mr6251645wro.553.1669136584924;
        Tue, 22 Nov 2022 09:03:04 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id c4-20020adfe704000000b00241cfe6e286sm8503223wrm.98.2022.11.22.09.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 09:03:03 -0800 (PST)
Message-ID: <16774569-6dbe-3bc9-7471-f238e04e6050@gmail.com>
Date: Tue, 22 Nov 2022 18:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/7] dt-bindings: pinctrl: st,stm32: Deprecate
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
 <20221122010753.3126828-5-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122010753.3126828-5-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_090307_377350_42B370A2 
X-CRM114-Status: GOOD (  12.52  )
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
> Deprecate the pins-are-numbered property
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml      | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 9d59208d83c18..eeb29b4ad4d1a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -34,7 +34,9 @@ properties:
>       const: 1
>   
>     ranges: true
> -  pins-are-numbered: true
> +  pins-are-numbered:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    deprecated: true
>     hwlocks: true
>   
>     interrupts:
> @@ -206,7 +208,6 @@ required:
>     - '#address-cells'
>     - '#size-cells'
>     - ranges
> -  - pins-are-numbered
>   
>   additionalProperties: false
>   
> @@ -220,7 +221,6 @@ examples:
>                 #size-cells = <1>;
>                 compatible = "st,stm32f429-pinctrl";
>                 ranges = <0 0x40020000 0x3000>;
> -              pins-are-numbered;
>   
>                 gpioa: gpio@0 {
>                         gpio-controller;
> @@ -238,7 +238,6 @@ examples:
>                 #size-cells = <1>;
>                 compatible = "st,stm32f429-pinctrl";
>                 ranges = <0 0x50020000 0x3000>;
> -              pins-are-numbered;
>   
>                 gpiob: gpio@1000 {
>                         gpio-controller;

