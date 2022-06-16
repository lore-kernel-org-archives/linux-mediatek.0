Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F05C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhpZ+GjXampjNpe+tQocPabcYpHKe+t5MxtxSoAd/gk=; b=ptWr8geXgrkltXUifSccEnaGji
	CAUeekrMndFU0gq8tbsPv2iY+siFI8cxWXtwZQoowjaGfJ6XjoB0MpyYmio2bpoy/X+Z6VS1p9Rkc
	Ss/W3qUm8j32pkoefAiIPMfheJQ7jjjefTiRvsDhpAC+KjqQyxFjJmPR4ksaycEuHM9oRasBK0yPX
	IGkX0mW7Gsm/uZjiHzu1tEelWLBg1drWtpJfu0sE09zdaSI3V/0VVsiEM/joG48ON0VBvoK8qjO0M
	JIN16hB+7/njRqaDbJMMNSa7B2rSLOqydpIsEa4ya+hDqznVl9EsVbqOstk3QgHT0qIsFQD0Cj+Hh
	R9ubGL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wk7-004Mxb-24; Thu, 16 Jun 2022 21:09:31 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wk2-004Mu9-KD
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 21:09:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id u2so2522830pfc.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 14:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zhpZ+GjXampjNpe+tQocPabcYpHKe+t5MxtxSoAd/gk=;
        b=c/mnodrbMqdEEZtK4ydiC51al8PB7S6Cw/2mpPGAnndPSmu2+WM1Ll5DPr4l2TlOQS
         nqxcxIqTkzcsEO3ksP2QW/htFKuizhTMRc2FmleMjdWDxtyteBBiNyVAp83VADdUQn3X
         G/hCcE8fhF8THykoNLr9837Zpz64pICy6pXDGznnY2WIMG93RYJ0Cm2F5tQqmGHz/ew2
         yqiJMi3apylM6BgwpGCG/sfJ83FiC5EaO/9MBOx8Ti2RX8TKdRByxdJEyDRw3bdyXr/x
         BWCtUHy2R46F/HtRQqol9dJaSnsHI9AI05hVUXfj35TZbFtNdUodT4OBz0pviOs5GdPx
         gbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zhpZ+GjXampjNpe+tQocPabcYpHKe+t5MxtxSoAd/gk=;
        b=xnCVRGr67rjGYOKLQsptaho3vAtd4qPGEEJPP00/I7T7RiYlmlXBWtpDeyZfkhOLZg
         hkPZwxftc0Fn7+LS6CYa0qtMb74ekbPANQ055FnTyUh0lBYjokLzc2w8R6qY4gRwfMhV
         dTqYlBw5o7f8CAV82AHBYMBhePZiizcbSjDZu71Aihs3QrpVtxiz4AiJEMM0yT0w0uqO
         pG1huQLKP4koM8dPdzRZmqJI7jVrP0Vg+14hBeFoNDTUkVgHeTlCwD4r7AziI2gqK7F+
         nz+JBt6aCru9Eq/Yz7KXFdLEFIFzibS+4fK5I7ghsf1I7dzglKUNHc2cG7zLYgrMqkAO
         m96A==
X-Gm-Message-State: AJIora/6IuLeHyAzk4Dp54bjTcedm3Lg5qaCPlS9a0UBODydnNRDSwtP
	zgQ+DCqO0kPdcu1Jr/Fp3lD09A==
X-Google-Smtp-Source: AGRyM1tDcKhZpWC6x4Z99cOnzfLaqqe5JLXzIahj3Uu4wTqFJmQBE7GebAoPUSjcUlojxk8MyILZ2Q==
X-Received: by 2002:a63:3c3:0:b0:3fc:5864:7412 with SMTP id 186-20020a6303c3000000b003fc58647412mr6068104pgd.138.1655413763706;
        Thu, 16 Jun 2022 14:09:23 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090a4bc200b001e2ebcce5d5sm1929001pjl.37.2022.06.16.14.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:09:23 -0700 (PDT)
Message-ID: <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
Date: Thu, 16 Jun 2022 14:09:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
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
 <20220613111146.25221-4-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-4-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_140926_728656_005EA848 
X-CRM114-Status: GOOD (  14.35  )
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
> Add Mediatek mt6370 current sink type LED indicator binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> new file mode 100644
> index 000000000000..42b96c8047a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-indicator
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^(multi-)?led@[0-3]$":

If this is multi-led, then you should reference
/schemas/leds/leds-pwm-multicolor.yaml

See other examples using it.



Best regards,
Krzysztof

