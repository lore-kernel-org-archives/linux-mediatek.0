Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Dec 2021 00:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMqtwb0sQUqh2KoXhhC4Sk4/ajLztVo2dFwcxpIxEt0=; b=PetxkK0KQff6CH
	jKTq8Tg6F9gYx9VG77tU7YH0CR6zjTVhQYCYHN2mBSceV3g6f7rT3F+yfrqYJnTLlw8ocFKoJC/zH
	gRaJSxEIgTvTlxyM3Sk936Rgvg1grjzoC4uUU1mCVPA8Av01bPLda7an3o35H/qChon7GOB9vAtoh
	MIoZ8S8QoLJcKurJq0EqK9o5m8uC6yh/dAu7AieSaGMLclR7OG33D9TVmyUuEBMDLNJbCgnQjWf5k
	a+r2WR5nzN8mKW0osS/LX/OaXEcT3l6pylFbSH9IBHhcpSZb+jPQFypgkAMkdUp6wK/EEQozlkA53
	psPdr0KDCBfVKCmJavUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtf2t-0013Ab-6i; Sun, 05 Dec 2021 00:06:23 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtf2p-00139S-IY
 for linux-mediatek@lists.infradead.org; Sun, 05 Dec 2021 00:06:20 +0000
Received: by mail-oi1-x22f.google.com with SMTP id be32so13713257oib.11
 for <linux-mediatek@lists.infradead.org>; Sat, 04 Dec 2021 16:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLM7Vzy6+wcFi2+uw4mY6eHdc1c6QIPZ2YzBFSeQVDk=;
 b=oypqQM9WYczOUD8yOv4W0b0J4SdrSIP2/GWFE4TR5k1CGEkHNy9WPiO008zNzsg3Pz
 zh9bUtf/VG6/b3zJ480BiJtwEa7PuEjsHQIWuEsggMdMqcZfJwsOE3iFtiG2DEPADAsO
 hqFPrgRv7CWtgQ4J5ZJRkR9iA1oQHlUoWYY8QDKpr7VM+f+8Yrryge0w8oCSslRvNp+6
 exKWbX0iHLd50+WQaM9fAnPeBnEozwwfUcCOKBUJC5pSMVg0d33S/UEK3rrGtAaDpFWu
 Uv4am7V67+qDJ2gKBQwHEmdYiUOqE7eMf4wLG94y+RQ3YPpVsZKN31tRHAbmVgDqfwLj
 frKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLM7Vzy6+wcFi2+uw4mY6eHdc1c6QIPZ2YzBFSeQVDk=;
 b=gcKx89xJjvAP4Jei903LCnHJeFmP9dmBiztqEKe6eNl+BT/PiI5bSjpkEkMOg++kAm
 1R+Vgr4NiUTz1EFCOJFSq3XmaSmHm7YTUdURkNYlyqGq/w329YIxXdSE0RO2yi08dYs/
 bCho4JJjbiuzTFjIX55jUP9aMDhmL+9uek+8Ew/zjaiXodv7O8bGf/E1V4pobnYyJ/32
 AAKhFVNujTIyRw26QdJ0/7VDoBRQrGWSHXeVC1ekN3QEz7fZG4wGLiEaaolk0rQDfNeV
 sR5lEO2SRfXILNWT2J2yfZUrJid1zJhMeL4RXM02ibZQ2xuFMtMH6pprdvI53lqvpSk5
 2mDw==
X-Gm-Message-State: AOAM533zWWefPE3nuV9KDmpE4+Bdmzbv2r/B3jgU0VSJRNWM7zGWjKfM
 CsELLWkBhsc2deb2vaK8N2SOBmP/bi8yF1tcmq4XPQ==
X-Google-Smtp-Source: ABdhPJy/aeGs123LiAIPsyMW3EdsawUgHdqxl5iex8vMswm1x7JAmAebxj9z1jBeNmQdoS/RXvDPX+AOcq/DNJTtHIA=
X-Received: by 2002:aca:120f:: with SMTP id 15mr16602417ois.132.1638662778472; 
 Sat, 04 Dec 2021 16:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Dec 2021 01:06:07 +0100
Message-ID: <CACRpkdZbpKqG_uS2N8TW2-HL5CqnuKDpHVCabf66MyQQof0jOw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in
 the drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach <baruch@tkos.co.il>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Jianqun Xu <jay.xu@rock-chips.com>, 
 Alexandru Ardelean <aardelean@deviqon.com>, Thierry Reding <treding@nvidia.com>,
 linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 bcm-kernel-feedback-list@broadcom.com, linux-power@fi.rohmeurope.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 Scott Branden <sbranden@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Keerthy <j-keerthy@ti.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Lee Jones <lee.jones@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_160619_676778_D8688169 
X-CRM114-Status: GOOD (  16.56  )
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

On Thu, Dec 2, 2021 at 10:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is definitely a patch in the right direction, as Bart says
it can be a bit dangerous, the outliers are those drivers that
assign the .dev to something completely different than the
the dev where the of_node is copied from.

The idea was definitely always to only assign it in the core
*unless* there is a reason to have a completely different
of_node for some reason.

> +++ b/drivers/gpio/gpio-rda.c
> @@ -240,8 +240,6 @@ static int rda_gpio_probe(struct platform_device *pdev)
>         rda_gpio->chip.label = dev_name(dev);
>         rda_gpio->chip.ngpio = ngpios;
>         rda_gpio->chip.base = -1;
> -       rda_gpio->chip.parent = dev;
> -       rda_gpio->chip.of_node = np;

Mention in the commit message that in this driver
you also drop the the .parent assignment because the
core will handle it.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
