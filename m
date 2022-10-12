Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A0EC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMt1aL/E1BmzA/95rCNVdItc5Kfhg0GFqfGel3e+zbE=; b=vyMOmPKcz0H3NdvItkrM6U/pfs
	phfTNv1rVABZo9VxL6gMNxvR5oAS5kc2IoGOnr0rd12WqvpruytwpjwrQMX++XAeZ3XLuAznUMk3X
	yPfzkzqK5rjxwfzAd0tGxhUXf4OvgEnPmYu/CdOMNt37MerGkzadU+41aETHH6bEpabUDCvfxxozO
	coNANQhtIKgOqSJKyOaBeF1dnD4XUVL7DuwvpTjiyvvxmb/E44bQ2EgTazKooT4CygD0ICmmSO+lM
	tNF7oCESkGDK+/nqWKchOxmYT0PGp1R3QvKo3+BpTkwt4ny40FKBYbzl94hIbtZ6n9ihIeQURzHe6
	gb1mfTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYz7-007fmE-3w; Wed, 12 Oct 2022 10:29:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYz4-007fkg-56
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 10:29:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r13so25547963wrj.11
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMt1aL/E1BmzA/95rCNVdItc5Kfhg0GFqfGel3e+zbE=;
        b=bHfVRBUuRXOtzm5qHBRADP8cD7GTOZXxO80RTmHUCSkO5IAW3rFX1sWl2055ma4y+h
         Njw1FT0LA9lH8iTi3jBdIyj6iNlKqkQyKlP+tBIEWw/NlwJ9Mxsky/FTvDm9ZPzP22HV
         7dN7zO3lCWKRCaa/7xE178mNydWYGmFTY3Itxith055fTzksOBVyhVYocjWDm9n0zUw+
         ylwylW7QzAkyPOg38jl8vo60Nq2k3rye/izFSh1zF/iggo6xtDAWk6SfjtjHYeqDojhr
         BD8TznS3Ylqe3FoOMuDc6pQ7o37w/PMNxne5mzhtu5XjEtQagSErN7U+IFMq+jKJmSn9
         lDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMt1aL/E1BmzA/95rCNVdItc5Kfhg0GFqfGel3e+zbE=;
        b=aZkDY1agJltRp/M5CjydoBbYboDy6qUZ9SEffpZOn45z9UNlj5T9pLvrJZgcsDsh4w
         KCMzv3vU7lQe90hlavtAMD1+jNJAJbkYTgGrB9tG13EnFX+zgyo6uAdncCIScZ0AsSp5
         RUzyXq8N3SU+YIfWAf9pte5LvvFEC6owoBF2LXb1uBdviBHskPKunCvCLpuStvNvDMO1
         7vKivtt1ZPWVGeh5JmvAYweWY43Cb9YWfb8FWjh/TqMPSsL2HZVzwZYohH8bxUUW3WgH
         cBd/xNPS+ALgpfqeSKeCHJlHghXUB8BbIaD+X1V+0rPCC30ssZrXPWsugEj5p3EAq+cp
         U7CA==
X-Gm-Message-State: ACrzQf3bkKM9C/Zji8PGmvZ8tk6eMWzhIGjayXx84Yn5ZYT2Y250G+TK
	MGCyG5jlh492ZtfeCWW0KzFlOw==
X-Google-Smtp-Source: AMsMyM6aleo8xLLLDII4VdjsqTh4bJE28lsCUuyzn3j+VQwOmEWm/XTqLD9AyPCLE57sGU8ie7I5rg==
X-Received: by 2002:a5d:5d89:0:b0:226:e5ca:4bc2 with SMTP id ci9-20020a5d5d89000000b00226e5ca4bc2mr17755457wrb.310.1665570544589;
        Wed, 12 Oct 2022 03:29:04 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id c188-20020a1c35c5000000b003b4a68645e9sm1430138wma.34.2022.10.12.03.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:29:04 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:29:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] gpiolib: of: add a quirk for reset line for Marvell
 NFC controller
Message-ID: <Y0aW7vDxfNa/8bAk@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_032906_231197_4A3D60A3 
X-CRM114-Status: GOOD (  18.43  )
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

On Tue, Oct 11, 2022 at 03:19:32PM -0700, Dmitry Torokhov wrote:
> The controller is using non-standard "reset-n-io" name for its reset
> gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
> so that gpiod API will still work on unmodified DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

How/when has/will the DT bindings documentation for this hardware be
updated to describe the new bindings?

Delivering the quirks ahead of driver updates is great for avoiding
merge conflicts but it also conceals the rename from reviewers so
risks neglecting to update the bindings.

Other than that:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> ---
>  drivers/gpio/gpiolib-of.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 576f2f0c3432..7d4193fe36e5 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -383,6 +383,16 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
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
> +#endif
>  #if !IS_ENABLED(CONFIG_PCI_LANTIQ)
>  		/* MIPS Lantiq PCI */
>  		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
>
> --
> b4 0.11.0-dev-5166b

