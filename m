Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA902C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24+UZDm+bboxj7ZmXKARXy52D/6fP2+29qM9adAHJQ4=; b=PgAzwGKRUtZ9X0D0LKP/HMWKSQ
	j1kqcbLpRkJvDvnLs4KrSBNXomffKet1WwxZeGys5l32HH3nsnIPqdXZPlEw8KDHbZIHozYLAQeSK
	KXa4YvsBzjQXTi/afACGwa9XELEV2XCucTbK4M6V2t+mybkOXoq5/1Hk0dk//2II3VxbN9VYJgY1t
	+mNcD9OwGa7JXw0FnDksavkNi1NfqKgMjhMcGKUr3TySLIlBGk0yPpjmB5zmYl8sfFOqhuBN4JiOW
	7UmFhNRDEgVg19KqdJdyRDRapO0Xf3uzim6nTghRE2JVqRwx47FHFMPxmf8ol7f3ijj7lDjFXKkbA
	Xg7basaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Mhw-00FIci-6j; Thu, 23 Jun 2022 13:17:16 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Mhk-00FIaE-9W; Thu, 23 Jun 2022 13:17:07 +0000
Received: by mail-qv1-xf36.google.com with SMTP id o43so29831765qvo.4;
        Thu, 23 Jun 2022 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=24+UZDm+bboxj7ZmXKARXy52D/6fP2+29qM9adAHJQ4=;
        b=J2q2PpDWZT/XG3kN+Z0MZyGzkZ1IoQg9qGfmPigxNXhO33ieQ/7lU/jHGk6LrR+5ev
         0NPd6cZ+hp3lmjeBc/XTklO3zfgt2v5H1VAQoYDcTUwHrEgpaenjvXcR0GsH0piLkA52
         p8Uy3PRzyQgj/cX8Zeiv+khK0zP4s4BPwjN6PgmH00wqKn2rQCus1mTQ32QoOSOvu4jZ
         dUgRIJ+1cZmtwdkXWjvGzYnVqyK9NmTSYqOB9l3gAMxqkZem/7Gv2w/2g0sMiO7zl67D
         6S6ylcqaVaBmjkDnJYEjtVCisEVeNO9zA26KRkH6E8fmeqd+ryvZqdIIQ1cflpUGlx56
         TeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=24+UZDm+bboxj7ZmXKARXy52D/6fP2+29qM9adAHJQ4=;
        b=xbwWtzCJf05Ty/jTvWSOPMWla4zYejRAkAE0HRP2Gm/JgauS0j9DG1Kov84GEGTR0f
         7KLcOWLEtU3BmfUdOVw1a+O5gxhXgWH/p9uxrBinHX5bHBAIWV8w1gWC44xDRu2nEBzC
         Zxut/XYETt4nHsB/ifoHD3Uv34/qHeXhikIiBKdOSczFoW1db8CQPq4qFaPzVj5/G9/Y
         /UCSbzDWl3PsEJOWn92AWAsyFDMI3V1eThskzS1ZwE1XhW4/CIYXgs9+OvPwpIrdoncb
         Tue/L7zOzAxD5zkdRn6tDO8/JdtDMSy1eE9eF+n6MOqCqrzswIn7Y98WWwkoz25OLIwX
         O9Ag==
X-Gm-Message-State: AJIora8nj0nU62Ia5lDtpj80b1oG3MY/1vdt18+PKihwFNHBUfUQjzji
	Q0IKTSXKJ+copnEhkRZmTSo=
X-Google-Smtp-Source: AGRyM1txIMaEVLgdPcHWGOvqHfkJqRf4fC0njW+U8dzkSZ9CnGAFNz+qzQMCuEb729NqDeTnCZBqjg==
X-Received: by 2002:a05:622a:60c:b0:307:c887:2253 with SMTP id z12-20020a05622a060c00b00307c8872253mr8011201qta.216.1655990221818;
        Thu, 23 Jun 2022 06:17:01 -0700 (PDT)
Received: from spruce (c-71-206-142-238.hsd1.va.comcast.net. [71.206.142.238])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a280a00b006a77940be22sm18717176qkp.95.2022.06.23.06.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 06:17:01 -0700 (PDT)
Date: Thu, 23 Jun 2022 09:16:59 -0400
From: Joe Simmons-Talbott <joetalbott@gmail.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v3 05/14] dt-bindings: backlight: Add Mediatek MT6370
 backlight
Message-ID: <YrRny9TPqMUW7Yr/@spruce>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-6-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623115631.22209-6-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_061704_389469_8521C07B 
X-CRM114-Status: GOOD (  18.36  )
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

On Thu, Jun 23, 2022 at 07:56:22PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add mt6370 backlight binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v3
> - Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
>   "mediatek,bled-pwm-hys-input-th-steps"
> - Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
>   "bled-ocp-microamp" enum values
> ---
>  .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> new file mode 100644
> index 0000000..26563ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 Backlight
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  The MT6370 Backlight WLED driver supports up to a 29V output voltage for
> +  4 channels of 8 series WLEDs. Each channel supports up to 30mA of current
> +  capability with 2048 current steps (11 bits) in exponential or linear
> +  mapping curves.
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-backlight
> +
> +  default-brightness:
> +    minimum: 0
> +    maximum: 2048
> +
> +  max-brightness:
> +    minimum: 0
> +    maximum: 2048
> +
> +  enable-gpios:
> +    description: External backlight 'enable' pin
> +    maxItems: 1
> +
> +  mediatek,bled-pwm-enable:
> +    description: |
> +      Enable external PWM input for backlight dimming
> +    type: boolean
> +
> +  mediatek,bled-pwm-hys-enable:
> +    description: |
> +      Enable the backlight input-hysteresis for PWM mode
> +    type: boolean
> +
> +  mediatek,bled-pwm-hys-input-th-steps:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [1, 4, 16, 64]
> +    description: |
> +      The selection of the upper and lower bounds threshold of backlight
> +      PWM resolution. If we choose selection 64, the variation of PWM
> +      resolution needs over than 64 steps.

more than?

Thanks,
Joe

> +
> +  mediatek,bled-ovp-shutdown:
> +    description: |
> +      Enable the backlight shutdown when OVP level triggered
> +    type: boolean
> +
> +  mediatek,bled-ovp-microvolt:
> +    enum: [17000000, 21000000, 25000000, 29000000]
> +    description: |
> +      Backlight OVP level selection.
> +
> +  mediatek,bled-ocp-shutdown:
> +    description: |
> +      Enable the backlight shutdown when OCP level triggerred.
> +    type: boolean
> +
> +  mediatek,bled-ocp-microamp:
> +    enum: [900000, 1200000, 1500000, 1800000]
> +    description: |
> +      Backlight OC level selection.
> +
> +  mediatek,bled-channel-use:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      Backlight LED channel to be used.
> +      Each bit mapping to:
> +        - 0: CH4
> +        - 1: CH3
> +        - 2: CH2
> +        - 3: CH1
> +    minimum: 1
> +    maximum: 15
> +
> +required:
> +  - compatible
> +  - mediatek,bled-channel-use
> +
> +additionalProperties: false
> -- 
> 2.7.4
> 

