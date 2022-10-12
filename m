Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D0DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qu0VT1cU4p+B62cqisN42qlK73dW1LvJqZOVJmFr5q4=; b=Mw89FZgpOryTjuL2WUQhoyNyDV
	+d/C4KgTvhafX8kC1dwYmDdduVcitwG4ytem90UtCf+/9Pz/g1m3SEkpOYVZXifi3cl2ptctA80hd
	046YeiLomOfjkXrlXinPJExu1ziC4jaDWvg0IEecAFzNiQYhSFDNpFopLZ23qi11J9gwxyuH+hXUh
	UgVUM9J+K1GeHJkx8qEwUl8N63gTE+OrP0M/BvO/lj4MfubaxNk3SgaInDHJO+LenOtWUeofJ2/DW
	aucK22mLFArUz5+yv37r5UWpIy4oWZYHNFERHInBg+oEt+721K5Rxb9/eakEi9ZNR/UHWK/ehxmge
	qcv6tt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZ0W-007gCl-9K; Wed, 12 Oct 2022 10:30:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZ0L-007g9K-HM
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 10:30:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b4so25594066wrs.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qu0VT1cU4p+B62cqisN42qlK73dW1LvJqZOVJmFr5q4=;
        b=LN7tGr68c1Kko6MPfvrDbyLOBVHPl1lH3XqcwNI+js8HOzSqomXdnH0yl9rzGuutAP
         q/lADkCqzpdj3i/7l4inV4fIMJLQiZfuIsenLf2NvZr02beIjchyEdmQxYmgIzNfWijK
         iqbJ+1zKb/tm2GAOj9+suV1csz7Niip+qJBAZv9BqFnrWhY2tKg1mQDs3JYbUE9ykiGO
         jNWwvTjw12A9Uqyr4xvMIdtDH+ITwbsbGQ4MjdKcpXb59neyaoZl51XNQT3rV9I2StkS
         T5zv7oj3ZQ/F/gGgKTNMJv3dzTQAqTxI3X/re/NMR/io+lDgVZrFOZUJ5fF86Wo0i+9u
         3x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu0VT1cU4p+B62cqisN42qlK73dW1LvJqZOVJmFr5q4=;
        b=ggjymphaN9eqrDhA3idxnnj3JG8QV7wpPXCjkeG59IsJPhXfq53/+5boU/p3f2j+En
         /t71JfBa8IC6KhIH89aSB4oYeOCZqqUgcvioS0Ppg8E4gcn44ZKVeeREsjm6XkBgA7dj
         c9MA+JPCPNNBS+lj2bgCdDNCThweYaO4w2Xw81WXv763AQriG8FvTj+g6yu+nPAtVJPA
         KQotkBnevn6sQ7ydRD9FKsVEcYrKlbsWhbHTbXuWb9k8dK4JXoK6/Bu4ZUV1AmMpBNh0
         QLpJoyDdUD8VyfWFm6W7ZHup+k+dA5WFWAk+icSm0DlMOziujb4u/oWuYQjf2k6q+Im/
         5MiA==
X-Gm-Message-State: ACrzQf1zdIo4OzkoPD17FMD0InfuWGArWTDQAOqrSQve10jbVKgheAAx
	qSLOFT6krAYJ/JyswrnGXi7oTw==
X-Google-Smtp-Source: AMsMyM6SMfhbUpOAoKh61uohQ9F30hK8tkk8XwsgcmYbLOawFsON935JP9StXGyYmnecjJF7fu2S3Q==
X-Received: by 2002:a05:6000:4c:b0:22e:48e0:1a0b with SMTP id k12-20020a056000004c00b0022e48e01a0bmr18204805wrx.618.1665570621954;
        Wed, 12 Oct 2022 03:30:21 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003a4efb794d7sm1417335wms.36.2022.10.12.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:30:21 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:30:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/7] gpiolib: of: add a quirk for reset line for Cirrus
 CS42L56 codec
Message-ID: <Y0aXO6i87PE8hyBo@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-5-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v1-5-e01d9d3e7b29@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_033025_583019_E5A49DCF 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, Oct 11, 2022 at 03:19:33PM -0700, Dmitry Torokhov wrote:
> The controller is using non-standard "cirrus,gpio-nreset" name for its
> reset gpio property, whereas gpiod API expects "<name>-gpios".
> Add a quirk so that gpiod API will still work on unmodified DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 7d4193fe36e5..953d1c23950a 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -407,6 +407,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
>  		{ "wlf,ldo1ena", NULL,		NULL }, /* WM8994 */
>  		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
>  #endif
> +#if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
> +		{ "reset",	"cirrus,gpio-nreset",	"cirrus,cs42l56" },
> +#endif

Same question as before about bindings maintainance but other than that:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

