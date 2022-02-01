Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E15C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJaEvd5t3J6VgRAANaWMSEuUnTAGaBf/v3BaDs5g8wY=; b=iJqoTAoDjnUa2O
	rdY1U9uvJwTzixlDXp5Y4Q09FOXJl1f2pTBZuJdb9O5ouaRTWx9MksWOWlqHLVm1QYu4vU3SQEt9H
	lIUoNRfc9th1Av2ufREWEUjw1hGOk40D9eeGNhd6H5Mj4HY/25AjLqjIhUVgSRcBpHdh20uYoYqYE
	4XSj3YwM5ExA9fvY+ZKS12m+V3kHryoH61n2/+NPBiZ555VyU1WkwsAGSm2OT0czoKF2Wq5eLci44
	SqG10W2DF9a4RFlDh2n8j6+3uqwU3mZHjRQJR5z5cYiHZO9Q41mc8Zyks77/cfUPaK9tC44RxOEI6
	eKtx3KZbLchFinpAOamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEv3B-00CfSz-6n; Tue, 01 Feb 2022 15:26:33 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEuto-00Cb8t-3T; Tue, 01 Feb 2022 15:16:53 +0000
Received: by mail-pg1-f174.google.com with SMTP id t32so15575226pgm.7;
 Tue, 01 Feb 2022 07:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LY0Jv14zZsje7/vHQSOHToHuOdksSPX4R2A4AD12wOM=;
 b=ZVm21JX7U9ENpWHP3kAG4lNej3SzXLEuuUTe6y/ugDnSHhMshx4CF/h/AjbFJZLnXH
 u96JF1vhsUo3fipj5QWYkV38OPVHA9tz9z2YBaz4B74DBLJxIAllh7uIMiSE9pto6NyR
 fNP2KplFvxHrN/JsbExu2QT/AuA25E+55/rQ9WgH5KhtB+7Mm2u36oF6nvWlqNAEfOWH
 b7gol9euDMC9pf8LPVqjORvRhVvLYcg8QJjGw7HXMGRB14mffwfrjoloEawkdTNfYrX4
 dl5kkKqUXZCIxT8N9OZEG8sw3X3gfpSnTAM21uiBDHGdGB/FrXsJq5RmZNx5ZsqFqNNQ
 hgfw==
X-Gm-Message-State: AOAM531+JLDEnEbyAqFSpNuyH0W75lTRhIHw/Qydl8u+BMbBcyBrbKQX
 FzYnt2huHTzsmkuWuJIyq8X10XmFGNOjlhMsftc8o382yy0=
X-Google-Smtp-Source: ABdhPJzMM6DKe2TD1hOG7K71ff+PLE71AdlCmcIrtDVMD21uR4nKDkEtbCJu7CJ3qll0XUJJEoo2PbmWHDla8a7YMKI=
X-Received: by 2002:a62:2982:: with SMTP id p124mr25626587pfp.53.1643728610762; 
 Tue, 01 Feb 2022 07:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-12-maz@kernel.org>
In-Reply-To: <20220201120310.878267-12-maz@kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 1 Feb 2022 16:16:39 +0100
Message-ID: <CANBLGcxCmeaXXFWi6GFSHN=RhjUp5BVRYTMXHQihsLJCocD1xg@mail.gmail.com>
Subject: Re: [PATCH 11/12] pinctrl: starfive: Move PM device over to irq domain
To: Marc Zyngier <maz@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-omap@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_071652_212670_3511DCF2 
X-CRM114-Status: GOOD (  18.75  )
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

On Tue, 1 Feb 2022 at 13:19, Marc Zyngier <maz@kernel.org> wrote:
>
> Move the reference to the device over to the irq domain.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pinctrl/pinctrl-starfive.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
> index 0b912152a405..5be9866c2b3c 100644
> --- a/drivers/pinctrl/pinctrl-starfive.c
> +++ b/drivers/pinctrl/pinctrl-starfive.c
> @@ -1307,7 +1307,6 @@ static int starfive_probe(struct platform_device *pdev)
>         sfp->gc.base = -1;
>         sfp->gc.ngpio = NR_GPIOS;
>
> -       starfive_irq_chip.parent_device = dev;
>         starfive_irq_chip.name = sfp->gc.label;
>
>         sfp->gc.irq.chip = &starfive_irq_chip;
> @@ -1330,6 +1329,8 @@ static int starfive_probe(struct platform_device *pdev)
>         if (ret)
>                 return dev_err_probe(dev, ret, "could not register gpiochip\n");
>
> +       irq_domain_set_pm_device(sfp->gc.irq.domain, dev);
> +

The gpio framework uses the irq_domain at sfp->gc.irq.domain, so
shouldn't this be set before registering the gpio_chip with
devm_gpiochip_add_data above?

>  out_pinctrl_enable:
>         return pinctrl_enable(sfp->pctl);
>  }
> --
> 2.30.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
