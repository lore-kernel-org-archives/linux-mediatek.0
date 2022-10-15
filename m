Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8EBC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Oct 2022 05:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wl1CNvTcx9C1NQyxDr1FjFvdKECNGo52b0NkbSv8Mmc=; b=CPR9maQA+6T4zBeufI3obbvDm/
	+14Euz6WmyEbltURIPtrYi+JlJN2PaZCBjEnL4UBoENy7I4kDOl0ePm6mtpFEfjQE2KkTnMRacg4I
	rhYSOR90DXEDtYV0G8sGoreLHTSSiUUpYrcskq6VyqhZeNO+2pemL9g5QH6ifa7PX2FohDtLkPRTm
	0B61RAsiUWgJKCeFkxoHjSZFwdmMo8Ly36YsYJ7r2jaJ/tVA6lKl3SxgNn4gIfoaNt1651YhRtEjq
	2yn3Iw4U4M0sDBuvd1lqxu9Fdid5VkSXueCe90oBTla/9W/kaa35y+2+ZTU8jyznM5VpBGTXp3G6d
	0lY/vq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojZJY-00GS9W-8p; Sat, 15 Oct 2022 05:02:24 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojZJV-00GS8t-Mv; Sat, 15 Oct 2022 05:02:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id m16so9331173edc.4;
        Fri, 14 Oct 2022 22:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wl1CNvTcx9C1NQyxDr1FjFvdKECNGo52b0NkbSv8Mmc=;
        b=eeEFSLmnT9lXGWLDZPg3qEuKFzVzewXktLASJcGO1yeOQa6W468Eyao+PTciOZro0O
         2kkS6pAT9/AVx77VvqNTvHE5FGO3Ma4X2eB8v0Djy2ysj+mM7EcHDJjLfkX5SX4IB5f1
         JSwiKxv7Q3KOuhfimSjLrcH25x3Xx243vfq0RyGeRF+rKjWi2Ex6/5rNx2cdkTAE/FGJ
         UEsFTLBMT59CeTFv2N3lO5vcT2QBDIHo6L1nfqEVgDGZXNSat69+Ytg29rd6VQkQIYwv
         UGBNL/0ewVnuAutYiUWuL04qQfK2isRdP6RfVwgIliEr+cb8XboD7YQDKbToOe03X+WN
         VSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl1CNvTcx9C1NQyxDr1FjFvdKECNGo52b0NkbSv8Mmc=;
        b=qE2uBSMoY76J7PRVnxF4+IK6JoNQKxbJQo9ixRbWxcUb0VBHhhZUtaStzncmdx6Kof
         703pa3ZohBWZOBR0RtX5pMGEC607pGQ1G47mFkbLK5hBNm0dnHhSbdFRQkFFz1q4BNgJ
         28b71WP5UQxqpCqZn3n7B3ViK3mlHRc+qxPL6T9C/zv9Du4DVCvYVoCG9iQlhBGSJkVj
         DAOduNq8wRCCiQZiEL54vpQsLIuiYegUmHumrRfBaE6wUoTo1dfhwPehx6/4e/pJSEIk
         TJ7bHgU/IUXQcmjG8JvLEmpgMFs4Oax6+zLaECkVMAKnJ3L7HLpJ1YzI9iKwAQEGpYyb
         bzAA==
X-Gm-Message-State: ACrzQf04LfP+/Ucy7dFBj71gQ/rYFQlZRaYeM3/espyQG0pMVC7e0b2W
	GshmMbNB0XfMIhwEExKkTEY=
X-Google-Smtp-Source: AMsMyM54Lfi2ufHuB3MBb1iQmFpjDzYeJlaCPnd3NnEocdemnj5EaHumfDM1UvRGifRen6uZM5nTKQ==
X-Received: by 2002:aa7:c314:0:b0:458:dc90:467a with SMTP id l20-20020aa7c314000000b00458dc90467amr907854edq.284.1665810137987;
        Fri, 14 Oct 2022 22:02:17 -0700 (PDT)
Received: from penguin ([57.190.1.13])
        by smtp.gmail.com with ESMTPSA id q3-20020aa7da83000000b00458a243df3esm2999482eds.65.2022.10.14.22.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 22:02:17 -0700 (PDT)
Date: Fri, 14 Oct 2022 22:01:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 5/9] gpiolib: of: add a quirk for reset line for
 Marvell NFC controller
Message-ID: <Y0o+wXYe9mXOuI58@penguin>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
 <20221011-gpiolib-quirks-v2-5-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v2-5-73cb7176fd94@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_220221_805057_F1D14D2B 
X-CRM114-Status: GOOD (  17.60  )
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

On Fri, Oct 14, 2022 at 10:54:29AM -0700, Dmitry Torokhov wrote:
> The controller is using non-standard "reset-n-io" name for its reset
> gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
> so that gpiod API will still work on unmodified DTSes.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2b5d1b3095c7..5c11ee7638d1 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -390,6 +390,16 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
>  #if IS_ENABLED(CONFIG_MFD_ARIZONA)
>  		{ "wlf,reset",	NULL,		NULL },
>  #endif
> +
> +#if IS_ENABLED(CONFIG_NFC_MRVL_I2C)
> +		{ "reset",	"reset-n-io",	"marvell,nfc-i2c" },
> +#endif
> +#if IS_ENABLED(CONFIG_NFC_MRVL_SPI)
> +		{ "reset",	"reset-n-io",	"marvell,nfc-spi" },
> +#endif
> +#if IS_ENABLED(CONFIG_NFC_MRVL_UART)
> +		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },

I just noticed that there is another compatible (not documented, so I
assume it is a legacy one): "mrvl,nfc-uart", so I will be adding it and
sending another version.

Thanks.

-- 
Dmitry

