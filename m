Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606C1C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 13:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRK+unsPW70xNn5MF8+19eCG7D3AK/lgynWxuPdsIyE=; b=JfV3Cce1aUYIlRbTspdI9SeeeH
	mXp6jJ5U1LonEHEXCUJxqagFwRnS+BAnTTVdpxc6lSwbRcMuebVwZhi9pn0RWzAAEBDRE4ZvmI617
	6HkeE/PIJxiAble2Z0FcSzuDVmn5qxywIXI9ba+zqRkuirsUm19Adn9oh9LMTaNTo77KfGL6clF++
	MgpAthecvUYwQ8OXHv7kfU0k4d0BqTA2e/hdQ2CgiDMIYIAuQ78cKRciOaHH/ltvg1kLtLb9cN7yg
	5/Cu33m3UoCATzVJrSiiX/Zr+xkBrU4QFr22xbKu5/7uNVzak7Kq7cIx3KPBC+6VoSTjstNiYLkCt
	SFjKpZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4N7P-00FOif-JW; Thu, 23 Jun 2022 13:43:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4N7F-00FOeq-5c
	for linux-mediatek@lists.infradead.org; Thu, 23 Jun 2022 13:43:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id o8so28050255wro.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jun 2022 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eRK+unsPW70xNn5MF8+19eCG7D3AK/lgynWxuPdsIyE=;
        b=KC804tV7q8m5lKxx02VfQNPyCFRxbLo+UN5MqQqk1P+QbuQa4VcB2DrqvkkpPc4wLh
         s8YD9o2Eiw8erHMZ6g3Ia7a0hyCPKQt3dQhrWjxY7MVQ+N+R6b5WlLXKQYsrlnRxHzog
         E2sf54tTcmTN6YbXT+A5UHQ5N/d1dBEzbXYSl58xn/DSXDKRHGikl18c1Dewu5+tmqAo
         JWR2R+BecqmGJdKOoqPajDcTtrvcsivMLPCP1TsgqwJCt60ewBhMWun7q+A0t7wb6Fa5
         u7SPQBBJb5LqETPHZT7BjI6j+0AwxO054RkyMDT9jgCAOSDplPJobh2EkUOEu7PwvTVI
         nrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eRK+unsPW70xNn5MF8+19eCG7D3AK/lgynWxuPdsIyE=;
        b=1n/injOSRRkaGwH/NBAnC36S4DvapdZjJBQ/roxYJkjB/0UJXnNOffX6caz6s3XusT
         D6RNp734z4saCzf3ySgP7Gj4L7xstP8/Nc+cfhu54kAhyNFlH7D1nb0RqFfcLPY83l1y
         OLHVjgzHs7QAk17suGL1XZgNvGW6SKZb+mbVWd6T/4kxXdKgf5v4VaV2B8UguN0UNnNx
         /kU1TSN++EuEaSs0AvyP9z0o+lpAgxTrFbIj/PnoAORqOf1mxevpEeTRAyUNeWj0q7En
         V0f+h0F58HD4BunWiy6udFFE1YMXqwXIMtoc0hHHMrMnDHM8zcGp6OSToI+dcWVa0VMz
         JWmQ==
X-Gm-Message-State: AJIora8/9EnnqlvzZCzCUdqAEW+vJZYYNCZO5+itDngr7/23KkClsMUD
	0brq5W3iFTz01bE8zTYi7moMBg==
X-Google-Smtp-Source: AGRyM1vjF4PN7klzy0olb9rrzdVMRPfVzufgs3EKRfc33dNmi33WjI/0td30uX34aWiNQWi+iEa1Yg==
X-Received: by 2002:a05:6000:10b:b0:21b:88ca:9abf with SMTP id o11-20020a056000010b00b0021b88ca9abfmr8191539wrx.694.1655991799771;
        Thu, 23 Jun 2022 06:43:19 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id p129-20020a1c2987000000b003974cb37a94sm3313906wmp.22.2022.06.23.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 06:43:18 -0700 (PDT)
Date: Thu, 23 Jun 2022 14:43:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
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
Subject: Re: [PATCH v3 14/14] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220623134316.rg3adyobz3hkgflt@maple.lan>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-15-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623115631.22209-15-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_064325_256710_7A33DA71 
X-CRM114-Status: GOOD (  17.20  )
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

On Thu, Jun 23, 2022 at 07:56:31PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Backlight support.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a003e02..7cd823d 100644
> <snip>
> +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> +					    struct backlight_properties *props)
> +{
> +	struct device *dev = priv->dev;
> +	u8 prop_val;
> +	u32 brightness, ovp_uV, ocp_uA;
> +	unsigned int mask, val;
> +	int ret;
> +
> +	/* Vendor optional properties */
> +	val = 0;
> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-enable"))
> +		val |= MT6370_BL_PWM_EN_MASK;
> +
> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable"))
> +		val |= MT6370_BL_PWM_HYS_EN_MASK;
> +
> +	ret = device_property_read_u8(dev,
> +				      "mediatek,bled-pwm-hys-input-th-steps",
> +				      &prop_val);
> +	if (!ret) {
> +		prop_val = clamp_val(prop_val,
> +				     MT6370_BL_PWM_HYS_TH_MIN_STEP,
> +				     MT6370_BL_PWM_HYS_TH_MAX_STEP);
> +		/*
> +		 * prop_val =  1      -->  1 steps --> 0x00
> +		 * prop_val =  2 ~  4 -->  4 steps --> 0x01
> +		 * prop_val =  5 ~ 16 --> 16 steps --> 0x10
> +		 * prop_val = 17 ~ 64 --> 64 steps --> 0x11

                                                      ^^^^^
These numbers are binary, not hex, right? If so, the comments
should be 0b00 to 0b03 .


> +		 */
> +		prop_val = (ilog2(roundup_pow_of_two(prop_val)) + 1) >> 1;
> +		val |= prop_val << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +				 val, val);
> +	if (ret)
> +		return ret;

Overall, I like this approach! Easy to read and understand.


> <snip>
> +static int mt6370_bl_probe(struct platform_device *pdev)
> +{
> +	struct mt6370_priv *priv;
> +	struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.scale = BACKLIGHT_SCALE_LINEAR,

Sorry, I missed this before but the KConfig comment says that the
backlight can support both linear and exponential curves.

Is there a good reason to default to linear?


Daniel.
> 

