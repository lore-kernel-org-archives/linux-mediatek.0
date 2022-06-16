Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A87C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 21:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tml1AzLWRr4YzF3sAdjGFBXOgQpNGM4CdcoqHXy6fq8=; b=WaawfsBV8VTon+OUzK67RS9zMV
	IwS+gVhLYQx/aShMBhvsuhQJLlhCmfwbYnO2/rXXQwlHRZDUdB5hEem4ltlAQotlI/XvSgZ/CKku5
	oa9azCGulhxJJDdqBKH9fUDVzGE80BGDJtdy5Ay5J6OmcM5xmiPp6qgHeO5glKw2jn7Jd6ZJQ5Ggu
	EN274/O7qUJ2/16LD1K6vD2WjoC+/JSCsE6SeftsHaVdlszs6r1BajI/U1OkzAIFeG3JeNPbbKuTE
	N4ZRapdqf6/HQcpM35m7sbfRYXCWCSjfSszvTYUwRMoR7FPep3ktb8pB05UCje1rh2c0oYpV1xgC6
	Nehvtkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wqJ-004OsZ-De; Thu, 16 Jun 2022 21:15:55 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wqE-004OpR-SP
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 21:15:53 +0000
Received: by mail-pg1-x52e.google.com with SMTP id d129so2314626pgc.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tml1AzLWRr4YzF3sAdjGFBXOgQpNGM4CdcoqHXy6fq8=;
        b=jqIsk7Q+m6EcCuXgHO5qdrSbk9XCkK4QrELg4P/y5TFyxvqpcMjqJNM+E8zK9d5Q7c
         FcDjUcLBJ/8XBeegZ7WhoXEoQ9Rms8fcCrmoVVla5DeUWH6FcdNUr90bcpBiNfd+0yX0
         QUgEc7zEmcPW4VNgURMMFv7Yf6dnaMW3BF2L0DpMkLVllk6pUf88SARfSTB/OlxSXWd/
         S/ngORpZ2XySJVG+qWCpq4u1c45IieRfdipQCz36HZit/QPrMn0O9wYhQRmtnisyxeFf
         qptBWeOlEWksEUDXOIzm9lezHFrXuazZFiYdP96fsDiKS/P1FjazmQAqxUHu6o5SMaQW
         SbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tml1AzLWRr4YzF3sAdjGFBXOgQpNGM4CdcoqHXy6fq8=;
        b=pRm0ZTShfoCwe+d84B3Qf3GIjPF+yJhWQTvnnC8PdLPfcSVrirbVWsBGIFfy4ZezU9
         8TyhZ4pxfpV3yYin+chK0nMj1lelczj+/4O/kN+dgTkDlU5YSk6EbwFuKnoFZmeWcEcg
         NlScrMMb88PBnr3SNVmWiSVc+JWTxSs5NAO6Lq8AyzksuvaOFw2G5XQyitdqfidUsJ2D
         +oM7ImN8qrN/bzVHDplIgqhvdtvtmu1y4rMR8g9yVcWn4iBDPh19MGNEBHMURKNH1+sk
         ixHLG3S+X6DL04IueaWzz3YAY+k1O+W0+zZrwyg28QQr9UkBUjuuO+lfsyCMhgpFaglE
         TBeA==
X-Gm-Message-State: AJIora+EWiUOAymN9HizeOSlreLQsaIv/EUwH3mxtYMP8yt3FXOzUf2n
	Ys/BNX+YfJtobrb0MD0NcTjA9g==
X-Google-Smtp-Source: AGRyM1sh6e+GuWnqSFtrhbHqrmFWx8Qa99sAGwZCXTtI91IuORU3SI44Gi/lqC6ObXbqOvNYusLNiw==
X-Received: by 2002:a63:3ec7:0:b0:408:d3ac:9c0c with SMTP id l190-20020a633ec7000000b00408d3ac9c0cmr6200985pga.176.1655414146402;
        Thu, 16 Jun 2022 14:15:46 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d88d00b0016196bcf743sm2052571plz.275.2022.06.16.14.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:15:46 -0700 (PDT)
Message-ID: <28b73da7-d97c-5ea5-0b22-724fa971aeb0@linaro.org>
Date: Thu, 16 Jun 2022 14:15:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 ChiYuan Huang <cy_huang@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-7-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-7-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_141551_074887_12346901 
X-CRM114-Status: GOOD (  16.67  )
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

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
>  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
>  2 files changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> new file mode 100644
> index 000000000000..6c2639e81e50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> @@ -0,0 +1,279 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 SubPMIC
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description: |
> +  MT6370 is a highly-integrated smart power management IC, which includes a
> +  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
> +  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
> +  driver, a backlight WLED driver, a display bias driver and a general LDO for
> +  portable devices.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370
> +
> +  reg:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  adc:
> +    type: object
> +    description: |
> +      Provides 9 channels for system monitoring, including vbusdiv5, vbusdiv2,
> +      vbat, vsys, chg_vddp, ts_bat, ibus, ibat, and temp_jc.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6370-adc
> +
> +      "#io-channel-cells":
> +        const: 1
> +
> +    required:
> +      - compatible
> +      - '#io-channel-cells'

Decide in your entire patchset whether you use ' or ". Don't mix.

Since you did not test your bindings, I am not reviewing it. First, test
them. No need for me to do the job of a automated tool, right?

Best regards,
Krzysztof

