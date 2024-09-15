Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAD2C35FE4
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Sep 2024 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEy2s6mdbEvETGfBs4ih+7MAVHb2th2MzF/jMUC7wo8=; b=uJVQDnOx9I/A+V0+HBeMtUN6R0
	Yfk7NEE/PWUWbb/vF2hsltLY58j3bmuqB1Jd9BcYom5BIiesYK7MKKFUoZYEDlNTTeFfmZl1zT29c
	HQrquIeeaf0TI5dic3A5lpt4AwsVkPc//2SXugrOb4HI0WDoofs8bksRnfzZZ4LlfMGOy6CWB0UfP
	o1ctNrkCJ8iPhTVGYOktwJZicr6ixh6O6rUKVl0FFnJtc8a6sm7pKzB8LObk/u6+OIno0y3vzgBo7
	iTGCxPxIczxmShxFWS3xEt+9H5SD8iL3nhdMsGWt2EhSDkqYLBXY+HYTWb/zfMW6g9JWlckdBU4OV
	cqrEQwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1splrS-00000001w1s-0INx;
	Sun, 15 Sep 2024 09:48:06 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1splqL-00000001vss-1j6T;
	Sun, 15 Sep 2024 09:46:58 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2f758f84dfbso28974521fa.0;
        Sun, 15 Sep 2024 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726393615; x=1726998415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEy2s6mdbEvETGfBs4ih+7MAVHb2th2MzF/jMUC7wo8=;
        b=jqkwo0itg0PMgnqWcajtyM9KrZctXHo7Jzm8blxbiheo497eqYjQJVWbrwD07CnRH0
         ZOb2Nb7USSHvO9UPTBakwirdzwH4tR5cfbKALeQ58h/KamYhz/j1VRAVVyiCvC6CnL5J
         zvrBh12z/gSZ62g0oEUqUypyZZAebTTA3DurBJhItjXOcSUUNz5khr3w2TrvK/I/rT2W
         bmvshKriqYwPloVtAaS4SnB2Lf8zaxTrwG7nOe0ozIJ4pf6KFJqfJKBWlbPEXqsaslKy
         TtEp0a986Ey53kwASAPt/+0XK6pAQ7QgAcnHsXyFSNQYj3qhkPutVqoJfZYIOTV0m9oU
         MMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726393615; x=1726998415;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEy2s6mdbEvETGfBs4ih+7MAVHb2th2MzF/jMUC7wo8=;
        b=gi+WLh4faZArlh//fS65GqOY/V8Oyz7EPoUDQ1DkQzy4BP83ah2lCe7tepRBYSB/cH
         wrTG5hrrL9Lca9iVtk3ebAUmfOt5XKc1ppmhi8AfZWEccQagO9BklFdWW1mNVb7bh5N7
         DK8O0jKvWSrFFTIvxGufIFWlIXtmmCd9zjUF7cA8YlMqoiG3PnTUfkSm6XaBH9C/xeJp
         RQPT7Bx52tvUvoyP7D/dosvwJjBwIV55istbUQN2f6ZA4NAm3jjFPptKxTWel7dUqZ3V
         Rc6J2Rf0M/rizrqs1HHmPl7RgtlATVQioRwvoNdOhI5XyWgUbgzNn8qij+Q9JGJ7c6w1
         0Q6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWLVE/NCPEEhWk8ER7IGdvtcBd7mtolNtRhco89ZzPtAJrOh0+ENbN78BSYVnyxPlMoZit6eXtC398YLww6Is=@lists.infradead.org, AJvYcCWzh89DT6AzLmbh8qMjzhF7fTeg7mUkLH8rwl81Ph/ylGnHNYm4HyrG6tzH+xrTK2MugLKx8lMAgS+feQeKMYoz@lists.infradead.org
X-Gm-Message-State: AOJu0YxuNWNleLUNDALAfNw4Cpjj5Jir1sgyBAkv08wDjmtOlXet2UQk
	1yDyn7Heqpxd358QCfkLPwjq2rwvBFwpU0W/cgl+WBcqfZ1Pkf2R
X-Google-Smtp-Source: AGHT+IEEqRu62KpQRhPXfLbt6VDlSqGvXS4SEhyoRi7eANQzGYsSen3MDKGTeAvoXvpSJFNvO09jJA==
X-Received: by 2002:a2e:9003:0:b0:2f5:806:5d00 with SMTP id 38308e7fff4ca-2f787f3b98bmr48952041fa.32.1726393613881;
        Sun, 15 Sep 2024 02:46:53 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d300851sm4873921fa.47.2024.09.15.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 02:46:53 -0700 (PDT)
Date: Sun, 15 Sep 2024 12:46:52 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZuatDOocfDumBzE_@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_024657_494089_639C4DAD 
X-CRM114-Status: GOOD (  20.47  )
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

Hi,

On 24-09-11 15:27, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

> diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
> index 541451fbf58d..c5e241163c94 100644
> --- a/include/linux/i2c-of-prober.h
> +++ b/include/linux/i2c-of-prober.h
> @@ -83,6 +83,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   *
>   * The following helpers are provided:
>   * * i2c_of_probe_simple_get_res()
> + * * i2c_of_probe_simple_free_res_early()
>   * * i2c_of_probe_simple_free_res_late()
>   * * i2c_of_probe_simple_enable()
>   * * i2c_of_probe_simple_cleanup()
> @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve resources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO.
>   * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().
> + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passed to msleep().
> + * @gpio_high_to_enable: %true if GPIO should be set to electrical high to enable component.
>   */
>  struct i2c_of_probe_simple_opts {
>  	const char *res_node_compatible;
>  	const char *supply_name;
> +	const char *gpio_name;
>  	unsigned int post_power_on_delay_ms;
> +	unsigned int post_reset_deassert_delay_ms;
> +	bool gpio_high_to_enable;

Missing '#include <linux/types.h>', otherwise compiler complains
about unknown bool type, when 'i2c-of-prober.h' included without any
previous includes.

-- 
Best regards,
Andrey Skvortsov

