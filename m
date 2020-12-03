Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B239CC4361A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:36:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F9862220F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F9862220F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dT61/vph6nEuSH0MTigYgguJJ7pEZAQMZQgl/dAz1O0=; b=XbNDpoBLN+3jxhak1ZrPWWu1G
	oLP0sBUaAaqbo7+ZP0VHHZfUM+kDWkFVV2y7fux+EuJAYV3EGeK3neVvDut6EB/l1YRYQ85hdRseq
	nE7uyINrEtX8qyjI15/YFN7NYKt5CY7+zy+faMJ03sbhxQzwZ7J97/9/V4zSzkJl+fbtbPbHxISXi
	bRGR88BP5cV31EngHlTCcXVsr1zmkbFkG2OqfYv3RGIqiK+63sMqVk/pQ/fBZG4/mXr+h/y5GpRqd
	OTOGmAB00ieGW2Vek33utjiLFgtscBOkgGoE1LneQ9mYdS6Aae+ltsECo8e6i/cKxk5hdLwVGjpPD
	seS2i1g6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkvKQ-0006YF-QI; Thu, 03 Dec 2020 20:35:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkvKO-0006Xn-E3; Thu, 03 Dec 2020 20:35:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id e25so5226851wme.0;
 Thu, 03 Dec 2020 12:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dU03bFDd4EmhKp1sv3SYB6+nzXscAxpruUkgadQmNp0=;
 b=q8vJDoMOBpn2HIKfVGsDOSyVwC0UYIzdzgnkPMJFDXj+8tP5EZDjLpcWSlXQkXtQmk
 SzFXo1GGrw0m3ZuYXkv32hT6MoO/YXqFH8/G3i2A40JyYkewF4fAeM7DPBN01v7QM+0c
 RxkLrNKYyGzx+UVRiX66+yzmLIUns247t1bSM/oZ+1k8smaBnYvFDMMuPb1GJ0fL5Qr6
 7FqqHjLuy4b0AQS+TAvilptPGoS4ktN+c1+BYBzwxv3RQiAO6WUraz3HScAGCpRxJ0F7
 r7odGOqddLN5fPNlWCQPRZwwkejZyPe8WeZ2HL47mwQhjEtOMu2hfMEVJ/iVoCj2eS3O
 MZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dU03bFDd4EmhKp1sv3SYB6+nzXscAxpruUkgadQmNp0=;
 b=eoGL2FRnoBmSqAaukAXJvhLf9aPB18S3iS6qloUyG3rcsiwGDx7vLcK6Aqe5xwzRtN
 apSfyCdkpSDE9AdqcQ6EUh5IcBu4D+39HM8T1/cQ4luSwc0S50XWnp2SdEv/n4OCT96c
 HvvT9DNoK1CXvoOshNztlG/0gYPSC0qK4UwBN3/EvsJWnqYj5wF6OZr37yi57/rHmomm
 QIEVJNvNvgQKGkVfQtU3igjdCgsS3Yt1ihpj6mr8m9MgbsSQxraUl/Ms72dXu/YsG/Hz
 bdTol8sB0CF3UWUpsfCYkcPWC1UihNMwaWkxMtK7t9dQWXn/gMlNZx8j/1+ZpGH+vxZ6
 B+dQ==
X-Gm-Message-State: AOAM530748ileQzlA5LMa9t3p9sgB09ZLukVEF3vGJ/21tzz3kGdMKWn
 QcegxzVwetvbEX4V4dlvUFs=
X-Google-Smtp-Source: ABdhPJyd5R/8V40zUYtMb2LVtX/LVzt8JRzhXGnsS/an180Dgt2+kfXQjFtGFVnD+PMVGl6+bAMlZA==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr675598wmb.12.1607027747396;
 Thu, 03 Dec 2020 12:35:47 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:2969:dca1:ffae:a9ff?
 ([2a01:110f:b59:fd00:2969:dca1:ffae:a9ff])
 by smtp.gmail.com with ESMTPSA id z22sm533874wml.1.2020.12.03.12.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 12:35:46 -0800 (PST)
Subject: Re: [PATCH v11 5/5] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-6-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <058f0770-eae6-6a53-ec9f-dc69fdca86ac@gmail.com>
Date: Thu, 3 Dec 2020 21:35:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606906011-25633-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_153548_513560_EA9FF31E 
X-CRM114-Status: GOOD (  26.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Gene,

On 12/2/20 11:46 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  13 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 827 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 841 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..4f533bc 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,19 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS && OF
> +	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> +	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch
> +	  and strobe mode.
> +
>   config LEDS_S3C24XX
>   	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index c2c7d7a..5596427 100644
[...]
> +static int mt6360_led_probe(struct platform_device *pdev)
> +{
> +	struct mt6360_priv *priv;
> +	struct fwnode_handle *child;
> +	size_t count;
> +	int i = 0, ret;
> +
> +	count = device_get_child_node_count(&pdev->dev);
> +	if (!count || count > MT6360_MAX_LEDS) {
> +		dev_err(&pdev->dev, "No child node or node count over max led number %lu\n", count);
> +		return -EINVAL;
> +	}
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->leds_count = count;
> +	priv->dev = &pdev->dev;
> +	mutex_init(&priv->lock);
> +
> +	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!priv->regmap) {
> +		dev_err(&pdev->dev, "Failed to get parent regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	device_for_each_child_node(&pdev->dev, child) {
> +		struct mt6360_led *led = priv->leds + i;
> +		struct led_init_data init_data = { .fwnode = child, };
> +		u32 reg, led_color;
> +
> +		ret = fwnode_property_read_u32(child, "color", &led_color);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		if (led_color == LED_COLOR_ID_RGB || led_color == LED_COLOR_ID_MULTI)
> +			reg = MT6360_VIRTUAL_MULTICOLOR;
> +		else {
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret)
> +				goto out_flash_release;
> +
> +			if (reg >= MT6360_MAX_LEDS) {
> +				ret = -EINVAL;
> +				goto out_flash_release;
> +			}
> +		}
> +
> +		if (priv->leds_active & BIT(reg)) {
> +			ret = -EINVAL;
> +			goto out_flash_release;
> +		}
> +		priv->leds_active |= BIT(reg);
> +
> +		led->led_no = reg;
> +		led->priv = priv;
> +
> +		ret = mt6360_init_common_properties(led, &init_data);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		if (reg == MT6360_VIRTUAL_MULTICOLOR ||
> +			(reg >= MT6360_LED_ISNK1 && reg <= MT6360_LED_ISNKML))
> +			ret = mt6360_init_isnk_properties(led, &init_data);
> +		else
> +			ret = mt6360_init_flash_properties(led, &init_data);
> +
> +		if (ret)
> +			goto out_flash_release;
> +
> +		ret = mt6360_led_register(&pdev->dev, led, &init_data);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		i++;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	return 0;
> +
> +out_flash_release:
> +	mt6360_v4l2_flash_release(priv);

The need for releasing v4l2_flash devices here and not other LEDs is not
obvious at first glance. Of course this is due to the fact that
LED/flash registration functions have devm support but v4l2_flash
doesn't. It would be good to cover it at some point.

If you added that support to
drivers/media/v4l2-core/v4l2-flash-led-class.c then you could
simplify the code in this driver quite nicely.

But it's up to you.

That being said:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
