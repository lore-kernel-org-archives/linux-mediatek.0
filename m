Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B95C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3PeHDGShv0/Y1SaTBcwWlp0DgIC2lqoORc+f/lyUag=; b=eVoA60nEOh0+0GeFKwOY399rNo
	0n0gnWdSr16cxwCd8y8+ZElJ6lbn6CvnuKnRpcbhyONILx+6fUSH/YqcCT9ycvpXLWJQCkCRI6KNQ
	cYziCKzK3swWmDTNcNfAhBWbMj0UUWSkmljmtH2ZTiltEc53+it30OZL+8OpuzfUTLCbuRg2O+PD7
	jIP7TxFFKZk6tAKfqK/F9hADW6hP2z9URAS/MBgZ1uOaVLxcsnaXndyk+NTDR5eb9KJLstbD0uTbo
	86qS/L/J6JB2RamiryxstN52VMxUpJ7WG5KhMbl8RcrE3SGpdR4uNh7SFLE9hiK6/jVXrZivYXsNA
	tTiCTIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0L4-005YLi-0U;
	Wed, 19 Jul 2023 06:07:06 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0L1-005YJv-26
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z3PeHDGShv0/Y1SaTBcwWlp0DgIC2lqoORc+f/lyUag=; b=LmcR5u0+Uqx/Nf6g8xGHE4Dfwv
	4RFiy29ssCsPh7zG6o9AOlDx3FIKgiqIs55/6L0DBgdi4twBBHq30mYIRTSgHxqB/zSHE2YXWZy+A
	wgN9MUb9pwrQlsgy59rPIHOhd7B+ryp67rxv/x9nTRIFQcKJEFIOpb60LtnjS9/W68Tpr2yO4fcoc
	DirxwWXIcYabdmfGkQ1zGRdblWk1ZZFodPztRQC7KRCQq9YrLJ8Xp4PdATFb9v9NS0OBuAy6R/2Ey
	NxMhQCFqM+oo9W3AOcTIAfYPbi/6S2BtwmVR4qipH44BCtFOidGXSoRaWueDXKPwFuuLjg6kCXf4d
	MUyOHoCQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLm1C-00BeKr-0C
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 14:49:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbea147034so54122695e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1689691711; x=1692283711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3PeHDGShv0/Y1SaTBcwWlp0DgIC2lqoORc+f/lyUag=;
        b=a8ZhbREt0uH7gJ9cBW17TnUuIeY9lua9HO/AozN0hssszX/Phmw738FVOnzPEoqKPM
         9g4ej6yAf/cuK4nEWyxjfBYtwq2t48q5q+nSJ+5OQlOzhsONtMZQnc+j6RCyZcUN1oz/
         WJHBxQoDbrIWi0QyPl72CzT34+UDqSNvbRnQbvEHLyPBKdnn5nr3RT3iXFXMDi5NLpyh
         FK1WZibGA4JoIsa4IL/UxG9P0jvEctbL10XGpyZRaKz+cEvrufbngxfwDfXOD15lMLC7
         etDDOD4GaZZtjqltQf05sbbfL2Pe45hszeZCcAgOKSgMQQVmIrrOfYsXhwu4Vt/0vXQy
         ekaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689691711; x=1692283711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3PeHDGShv0/Y1SaTBcwWlp0DgIC2lqoORc+f/lyUag=;
        b=ToRrKxDJwS7nj0SlxPAyr10BfFTA5J2x3T8ROSyaCxkZwF6BJQSFRKhBs5IUawno1N
         E367Gce/dIEGkPuLLwJTTVmZMwakvu/60xr9QnrUDtEjf2zCTUxXMg2+0Yk2VIerqqUo
         o1Y11tidEvyaD5r1fVlwBIEKC9QGanZe4hF7cvfZGxpFO2j9yzs7ULZbv+g8Xt6/TFm/
         7FfZBcjAA/GC4KC+g2i9M1APSXAmWIKfCoaN3Klv+jIbibu+9V81IyywJt4GQz8XkTu6
         TxjVRJErg1kO/VbXcTCsyedStwLDHA1j9xIZIehqgYHAcJQ1Nc8Yiw49ZJcUer7gRyEl
         wQVA==
X-Gm-Message-State: ABy/qLYSFot1KLugiN4Z9G2+peqzv8MH8LtK5EUcGIzKtbp/v/er6IHw
	7C84ELAd0/lMUKiZln/rXaGW5w==
X-Google-Smtp-Source: APBJJlH8FgksFnhHrYa/bYaQB7Lf3bViTB+cyeDz8GdO0wx0X43DqCQgnSsDAnuYgKuzpQVErJxIqg==
X-Received: by 2002:a05:600c:d5:b0:3fc:5606:c246 with SMTP id u21-20020a05600c00d500b003fc5606c246mr2052029wmm.22.1689691711290;
        Tue, 18 Jul 2023 07:48:31 -0700 (PDT)
Received: from [10.0.2.15] ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id f22-20020a7bc8d6000000b003fbb5142c4bsm10659329wml.18.2023.07.18.07.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 07:48:30 -0700 (PDT)
Message-ID: <b0bdccb7-e10e-8d8a-fb64-0d41248adf8a@tuxon.dev>
Date: Tue, 18 Jul 2023 17:48:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 06/10] pinctrl: at91: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Balsam CHIHI
 <bchihi@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-7-andriy.shevchenko@linux.intel.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230717172821.62827-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_154938_384976_6D9A46FA 
X-CRM114-Status: GOOD (  21.06  )
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

On 17.07.2023 20:28, Andy Shevchenko wrote:
> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>   drivers/pinctrl/pinctrl-at91.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 39956d821ad7..608f55c5ba5f 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1657,7 +1657,7 @@ static int gpio_irq_set_wake(struct irq_data *d, unsigned state)
>   	return 0;
>   }
>   
> -static int __maybe_unused at91_gpio_suspend(struct device *dev)
> +static int at91_gpio_suspend(struct device *dev)
>   {
>   	struct at91_gpio_chip *at91_chip = dev_get_drvdata(dev);
>   	void __iomem *pio = at91_chip->regbase;
> @@ -1675,7 +1675,7 @@ static int __maybe_unused at91_gpio_suspend(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused at91_gpio_resume(struct device *dev)
> +static int at91_gpio_resume(struct device *dev)
>   {
>   	struct at91_gpio_chip *at91_chip = dev_get_drvdata(dev);
>   	void __iomem *pio = at91_chip->regbase;
> @@ -1903,15 +1903,13 @@ static int at91_gpio_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static const struct dev_pm_ops at91_gpio_pm_ops = {
> -	NOIRQ_SYSTEM_SLEEP_PM_OPS(at91_gpio_suspend, at91_gpio_resume)
> -};
> +static DEFINE_NOIRQ_DEV_PM_OPS(at91_gpio_pm_ops, at91_gpio_suspend, at91_gpio_resume);
>   
>   static struct platform_driver at91_gpio_driver = {
>   	.driver = {
>   		.name = "gpio-at91",
>   		.of_match_table = at91_gpio_of_match,
> -		.pm = pm_ptr(&at91_gpio_pm_ops),
> +		.pm = pm_sleep_ptr(&at91_gpio_pm_ops),
>   	},
>   	.probe = at91_gpio_probe,
>   };

