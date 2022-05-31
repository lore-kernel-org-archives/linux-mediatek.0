Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvzpbSEPy8hH2j8nCMLdy/B7cPNM92GjfuEe4Y3SeWM=; b=uZolN9BZq0Iv+k
	Eph3HAQD4Vj6IhY+07wSiIixL2zSgS4mp/GMZr9niWo3T0ToKbrHj6FtLbkOsuG1TWTrCmojuHw0Z
	z5FY8z/bG2tNajmijJk4xskcdGNlv/2SO9KkZk0BcO6gNGwQymUvso8w5fEBHolny+gLvAr+ifHHr
	hZRWggg6x6owsLqGPjylgJWzp0clT9UXKeyOIqvru4MzONt2q92/XWSZHnXw/jTUevcAV+ceKeV4Q
	G7XV3S4jxx6SOhqgQzaEj6+UeeMWXxUusjUL+xfO9x2kk1xSrtfhAaB6E3pypI/cRTS3duV6S7tj9
	F2tTEDKSA/qJrh1Zwuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8fE-00CZ7M-2q; Tue, 31 May 2022 20:40:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8f4-00CYwj-66
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 20:40:19 +0000
Received: by mail-ed1-x52c.google.com with SMTP id x62so7276829ede.10
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 13:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Alpwe54um/pAMi391V2OXK5ebcRXESWz/C1BKY6Vx2U=;
        b=bpXiaXVheIuoXS4qYPJJkBRiRLc0xdm8fJsiezzNxaSbqbM0HnHijdjFweVTNkO5Bt
         OZqNy/x48s3aknETcJSY51qRmtTvaefEriEEJgQKisgFjaP183xCgKHWGQMMuAEHM6iq
         Tc3YKXQYkPZ94qbC96FiM34BqIpNNbIw3S8bJFm37gUnEIpXhZlKzpuEHXf1T8hzTbUW
         Du1P41pKola5rfLIqjTtayOOX87K1DlGcQtFT+ikof7IHHBi0DGNf1t+EUD7xcGMBNpZ
         EvT5U5w/Mdqm9rktSC9cQ0mZie8pKoeXyPlTqMEFXnEeubuvBemuKrU2SexCdF1YgbDO
         BdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Alpwe54um/pAMi391V2OXK5ebcRXESWz/C1BKY6Vx2U=;
        b=rnXk9HEl1PB9Gid88WXTsXzqTmLFJFBBisUA5lOg8cBabQWNQVbpW/bvzSm6hnhYqK
         EnCX0GP6XjM7kpbewb8n3Z1rdY45zPfGZ/4cV8v7m/2YKLNed8xmaejREa2Escyl4qkf
         k0ENuvp5dhTmkuW6wHilMKtvx907uHK0CWdRVGPRw8DXDX056XrEHjlui//N8nfOUlUY
         ARxaKXyCmF6/MeD52Yxi0wOyJ6f+jV1vVIz5IhQ855zvHANomKCI89o1cWOiGtcErJyH
         c6f9S+rMzTT4vwVrLLtHBMy68AOWSuwbS0jtyn7egSoSTgYe6MiihoRrZ85WDzytuDto
         fyUg==
X-Gm-Message-State: AOAM533mBbzoDljI1hMCoo7U8YclTVIkGgl3HdG9x2OzSRfkW13LMXOy
	ye1gEsdqr6NXmRk6fYJdoNxw2g==
X-Google-Smtp-Source: ABdhPJzdZx04tPobjk6aL2VQPYwY9rAKwfMAkoP+ACgtkB/OwGTdsTuE3oT/JNLygYdZnn9MWjUmsw==
X-Received: by 2002:a05:6402:c1:b0:42a:b8a5:8d5e with SMTP id i1-20020a05640200c100b0042ab8a58d5emr67401586edu.266.1654029614622;
        Tue, 31 May 2022 13:40:14 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gt2-20020a170906f20200b006ff01fbb7ccsm5299610ejb.40.2022.05.31.13.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 13:40:14 -0700 (PDT)
Message-ID: <3ab7892e-cee0-f5d6-7b58-1a9bfc803ea9@linaro.org>
Date: Tue, 31 May 2022 22:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 12/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
 binding documentation
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
 <20220531104211.17106-4-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531104211.17106-4-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_134018_253432_D5AF39B8 
X-CRM114-Status: GOOD (  16.50  )
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

On 31/05/2022 12:42, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 

Subject - same comment as previous #10 patch.

> Add Mediatek MT6370 flashlight binding documentation
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---
>  .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> new file mode 100644
> index 000000000000..b1b11bd3d410
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-mt6370-flashlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  see Documentation/devicetree/bindings/mfd/mt6370.yaml
> +  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-flashlight
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-1]$":
> +    type: object
> +    $ref: common.yaml#
> +    description:
> +      Properties for a single flash LED.

Same as patch #11.

> +
> +    properties:
> +      reg:
> +        description: Index of the flash LED.

As well.

> +        enum:
> +          - 0 #Address of LED1
> +          - 1 #Address of LED2

'#' starts a comment, so there is always a space after '#'

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
