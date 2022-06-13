Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E4DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkxPJVeQ4Q1ztXoHHNjcLHDmotSSY2LcDoezmgLRnq8=; b=yq/EsnLdQIVcLg
	9RmI/wNloxn4v8CEY5a8JuhGZGAPmBwS6claQ7MlgM1d3g2A+LkgkI5c5PQWVlVXFZVGOPWCWeD0W
	4yMaDL9+uL7IBwIcb0bJALd6jUr8NIFhzk1yd8gGywuJJOyLzunTDlAOsI5lZ51uYWVsWXw12EjPQ
	IlrNZTwpP1qtlTI7ltV/91caXJTOs6rda/5DA9McMciqq9TwN3uC9vwwzzjz7pFYnubt3D7hFTA87
	3Ow1/q3j7b1Nohxf1Cl9JvCXZDnv4DGjirxbFVD4/KG3ygB6ffY4h/6yHYs3py2x+advh0Abv5CaR
	UKIfCsM7vgU3kczmG6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0nZ4-004rIM-4d; Mon, 13 Jun 2022 17:09:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0nYk-004r94-Al
	for linux-mediatek@lists.infradead.org; Mon, 13 Jun 2022 17:09:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id f9so5650374plg.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jun 2022 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AZWAPWwrm8+A0CgIBwRq++T65dkqg+V1CymCWTXMIwM=;
        b=LIOySr/baoj4EAyTjKf+aH+Qatb2p3UHDovP+gotSlTiSN1yTcg4GCjyqC3fyUX7wl
         npmmJtdNhVDNh5XKGkUnpjvg/YJI9/ZyQwGvcnz/SS0pPOuUekmDMJRnmbvEUG9D+H7+
         BZM1DLAMJ8q+I+4MvG2IfeZzZu5Z2p2pmZvJH76I7ELfeoqXCbnsuzr33o2epyIJ5WeO
         vlWeMTh3YdX80pJSfJHrPWOfpq4BMQV7PRBFhgbMKMVtr4faZ0ISbwZoAbpm/guz5Lxu
         3Q1Lh7nmkcWUV2iquou5G8hgE2UlhX7m7htGh4cx10X02rbX81xYSe5d64L24n5jYZOT
         up1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AZWAPWwrm8+A0CgIBwRq++T65dkqg+V1CymCWTXMIwM=;
        b=G5cBOm6vsSUfZuhL+7nGSPshzGnTgvR9ENACFB/LrGaEew/tAPN1fQHf2xRMFM6T0d
         PWMPMLkSL0zCgG+3TD0lKF2KcJ8I43+ag5vWU/0wXskw+y5ZzNqjqK3nFKeDO8Hkm+HL
         JofI8vpJP/azZT8dxVjLpXzSi0y48kT8NCbyLrBBdsDrvIO7yruh0VKwlkBksXiYqzrH
         yVSiR3xmC/GPz/CQoyVRVgZEc08W7+t+iWu5j1KUB+p17xpuWo68nJsUi9kBGLmDDdpR
         ccwLF4Vkz90jtYmMURBql/r7O2FH0NNIFZj7hUiPhaaXFpyr89Tod9I3IcbLdGzEQhMo
         7q8w==
X-Gm-Message-State: AJIora+yISopfByoaLJHHt4kPXdJyIFfdXuTpQ4dSKmYXDnc5FPe/hhk
	JHCBttDL7sVYGxfnB6ghnZWS+A==
X-Google-Smtp-Source: AGRyM1sELmzXAHQOaDg6BJ3FBShrRSur5yPmIKoRf1jf9G2G72yJQERR+jxqILTIiQmADcP/b1HsAg==
X-Received: by 2002:a17:902:c94b:b0:166:4f65:cffb with SMTP id i11-20020a170902c94b00b001664f65cffbmr14965pla.103.1655140137656;
        Mon, 13 Jun 2022 10:08:57 -0700 (PDT)
Received: from ash.lan ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 142-20020a621994000000b00518b4cfbbe0sm5632766pfz.203.2022.06.13.10.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:08:56 -0700 (PDT)
Date: Mon, 13 Jun 2022 18:08:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
	lee.jones@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com, ChiaEn Wu <chiaen_wu@richtek.com>
Subject: Re: [PATCH v2 15/15] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220613170853.bffuwkcmflfgg4gt@ash.lan>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-16-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613111146.25221-16-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_100902_403727_0F57C0E2 
X-CRM114-Status: GOOD (  17.76  )
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

On Mon, Jun 13, 2022 at 07:11:46PM +0800, ChiaEn Wu wrote:
> +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> +					    struct backlight_properties *props)

Most of the changes in this version looks good... but it looks the new
code in this function has a number of problems. See below...


> +{
> +	struct device *dev = priv->dev;
> +	u8 prop_val;
> +	u32 brightness;
> +	unsigned int mask, val;
> +	int ret;
> +
> +	/* Vendor optional properties
> +	 * if property not exist, keep value in default.
> +	 */

That's not the right strategy for booleans. Not existing means false
(e.g. flags should actively be unset).


> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-enable")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +					 MT6370_BL_PWM_EN_MASK,
> +					 MT6370_BL_PWM_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}

As above comment... all of the boolean properties are now being read
incorrectly.


> +
> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +					 MT6370_BL_PWM_HYS_EN_MASK,
> +					 MT6370_BL_PWM_HYS_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-pwm-hys-input-bit",
> +				      &prop_val);
> +	if (!ret) {
> +		val = min_t(u8, prop_val, 3)
> +		      << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +					 MT6370_BL_PWM_HYS_SEL_MASK, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-ovp-microvolt",
> +				      &prop_val);
> +	if (!ret) {
> +		val = min_t(u8, prop_val, 3)
> +		      << (ffs(MT6370_BL_OVP_SEL_MASK) - 1);

This has been renamed but still seems to the using 0, 1, 2, 3 rather
than an actual value in microvolts.


> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OVP_SEL_MASK, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "mediatek,bled-ovp-shutdown")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OVP_EN_MASK,
> +					 MT6370_BL_OVP_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-ocp-microamp",
> +				      &prop_val);
> +	if (!ret) {
> +		val = min_t(u8, prop_val, 3)
> +		      << (ffs(MT6370_BL_OC_SEL_MASK) - 1);

Likewise, should this be accepting a value in microamps?


> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OC_SEL_MASK, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "mediatek,bled-ocp-shutdown")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OC_EN_MASK,
> +					 MT6370_BL_OC_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Common properties */
> +	ret = device_property_read_u32(dev, "max-brightness", &brightness);
> +	if (ret)
> +		brightness = MT6370_BL_MAX_BRIGHTNESS;
> +
> +	props->max_brightness = min_t(u32, brightness,
> +				      MT6370_BL_MAX_BRIGHTNESS);
> +
> +	ret = device_property_read_u32(dev, "default-brightness", &brightness);
> +	if (ret)
> +		brightness = props->max_brightness;
> +
> +	props->brightness = min_t(u32, brightness, props->max_brightness);
> +
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
> +				      &prop_val);
> +	if (ret) {
> +		dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
> +		return ret;
> +	}
> +
> +	if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
> +		dev_err(dev, "No channel specified (ch_val:%d)\n", prop_val);

Error string has not been updated to match condition that triggers it.


> +		return -EINVAL;
> +	}


Daniel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
