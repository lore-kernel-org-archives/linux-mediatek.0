Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0FDCAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZbpXEUxbf5i4kX1LWSahhezFSeJsNj0DV486apUphg=; b=OQNpbCjRle8io+jheSZMuevGJe
	sPr1fvnT8AIc238VXMN58LJRZdYLHiJYYbuKSzxw3SlDNHAmijku9Gmncb25bnbY9YdqoMUCDjYNg
	zKV2Eyv5ZZKKnuc78RS0eNxCSrJASUWcjcXTARd/4eE5e8ymQWzmwFLFL9nJSUpEYi9IFsJMP2Vld
	cotsG3VN60YcAQk7+hMMBnTHAJO/VAoGj6VwLYHHcuFnqNJYeRpAvZ3MmbUmmL+x2CVcmkU9QlgY7
	haHwYQcNsSfi2YfSotmcJXxGTee+wNm298Z6ZrSqceUJFwOpy+yZmDO5IHZfTGm357dzHC3Dd60vJ
	Rzg58wug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1Q5-00000008ab0-3tML;
	Tue, 09 Sep 2025 16:42:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvupa-0000000637G-2KFi;
	Tue, 09 Sep 2025 09:40:10 +0000
Received: from localhost (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DECA3340EC3;
	Tue, 09 Sep 2025 09:40:03 +0000 (UTC)
Date: Tue, 9 Sep 2025 17:39:58 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/15] gpio: spacemit-k1: use new generic GPIO chip API
Message-ID: <20250909093958-GYA1207638@gentoo.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-12-9f723dc3524a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-12-9f723dc3524a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024006_990903_DE38DCA8 
X-CRM114-Status: GOOD (  21.07  )
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


On 11:15 Tue 09 Sep     , Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Thanks for converting this

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
>  drivers/gpio/gpio-spacemit-k1.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> index 3cc75c701ec40194e602b80d3f96f23204ce3b4d..9e57f43d3d13ad28fcd3327ecdc3f359691a44c9 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -38,7 +39,7 @@
>  struct spacemit_gpio;
>  
>  struct spacemit_gpio_bank {
> -	struct gpio_chip gc;
> +	struct gpio_generic_chip chip;
>  	struct spacemit_gpio *sg;
>  	void __iomem *base;
>  	u32 irq_mask;
> @@ -72,7 +73,7 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  
>  	for_each_set_bit(n, &pending, BITS_PER_LONG)
> -		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
> +		handle_nested_irq(irq_find_mapping(gb->chip.gc.irq.domain, n));
>  
>  	return IRQ_HANDLED;
>  }
> @@ -143,7 +144,7 @@ static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file
>  {
>  	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
>  
> -	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
> +	seq_printf(p, "%s-%d", dev_name(gb->chip.gc.parent), spacemit_gpio_bank_index(gb));
>  }
>  
>  static struct irq_chip spacemit_gpio_chip = {
> @@ -165,7 +166,7 @@ static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i
>  	if (i >= SPACEMIT_NR_BANKS)
>  		return false;
>  
> -	return (gc == &sg->sgb[i].gc);
> +	return (gc == &sg->sgb[i].chip.gc);
>  }
>  
>  static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
> @@ -173,7 +174,8 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  				  int index, int irq)
>  {
>  	struct spacemit_gpio_bank *gb = &sg->sgb[index];
> -	struct gpio_chip *gc = &gb->gc;
> +	struct gpio_generic_chip_config config;
> +	struct gpio_chip *gc = &gb->chip.gc;
>  	struct device *dev = sg->dev;
>  	struct gpio_irq_chip *girq;
>  	void __iomem *dat, *set, *clr, *dirin, *dirout;
> @@ -187,9 +189,19 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	dirin	= gb->base + SPACEMIT_GCDR;
>  	dirout	= gb->base + SPACEMIT_GSDR;
>  
> +	config = (typeof(config)){
> +		.dev = dev,
> +		.sz = 4,
> +		.dat = dat,
> +		.set = set,
> +		.clr = clr,
> +		.dirout = dirout,
> +		.dirin = dirin,
> +		.flags = BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
> +	};
> +
>  	/* This registers 32 GPIO lines per bank */
> -	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
> -			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
> +	ret = gpio_generic_chip_init(&gb->chip, &config);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
>  
> @@ -221,7 +233,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	ret = devm_request_threaded_irq(dev, irq, NULL,
>  					spacemit_gpio_irq_handler,
>  					IRQF_ONESHOT | IRQF_SHARED,
> -					gb->gc.label, gb);
> +					gb->chip.gc.label, gb);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to register IRQ\n");
>  
> 
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)

