Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWhe5ZSH7BeRUt0dXWrL7cU/VM7fAfqfc0fqjvROP9M=; b=JonZOXp6ktZqir
	M8lTLt4oDKw4RjE3Xe92eRqGdUIOL/jIwzhkUfWozAL+WLCwvPPUKXCth2gGPnidqDgoByHsXpywr
	AMoGwPVrIF7J1G+OP+LLK5PqabIDdFUCaNWya15uOpJrDio7DwVM+tIEYYXSDwMODpQooUc1dkE1S
	zXKnzRDztOHb7JTC4vVwpRNDuKPkCNv6d04FGpxFiHGpFf2/RAIvqgrHlCQT8hbsWqaYlfZcxi8L8
	ffs4Dlgd2Q2ODV3abOlIX/kQTBrU+7ENDu3hz4JNXz6ttIyDgedHwosZ0iZSmmaEIacKHR9DPrcP2
	prhvyqXRPe5skZe+zLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEv7M-00Ch8H-E3; Tue, 01 Feb 2022 15:30:52 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEv6l-00Cgx9-6F; Tue, 01 Feb 2022 15:30:16 +0000
Received: by mail-pf1-f171.google.com with SMTP id 192so16188968pfz.3;
 Tue, 01 Feb 2022 07:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NI5/5cwcQQunIPAZVQCMWs9N9hH37FdlDTNKGxYQ7E=;
 b=efH1n48KPMxmsL06uKumt7w/bR/huQjjX96D6PxVQw1e2cLjztZ0DM4boiz6dXusU/
 RrT94Z3ubiRtbBZhIPaPu/AkLNW5Uk6LfNzExmKWr+HjCGgrzbNE1g/AZJEmqRUNcH5Z
 m9IxjfO1vMU1SX0uaWkg8KOEmuWVa207ITJ4oQ98w96uulH349+yiC52mfX4XyXz13Yn
 zIBBD+q9lMSsOjQCCxDoJ6/dLu77njBmtOLMawurJp+MmjolJM+1nLz2mSALHwIN6Au6
 0qv/upjiNgmodmD6rvpdNL/WzJOeBE1BOrJyNmWyr1DXIg0J2aRblDkJgBO4jWSqFS7V
 JcOQ==
X-Gm-Message-State: AOAM531xWKJTrC5tMgnPMReKWu5CV/Xn2pq3VhTlc/n9QvkxJI4GTNWX
 Je31osvP/bgauDBsBoK1x6YmaRPxY8glAlafWng=
X-Google-Smtp-Source: ABdhPJwZNq0IinMera7zRuVK7Muwvrp92NYs2qCGjwudmM11k2zeBJdEaahQlwH16dsk6UqlFGc0aAuF4CaTORjd4vE=
X-Received: by 2002:a63:904c:: with SMTP id a73mr21118692pge.449.1643729414082; 
 Tue, 01 Feb 2022 07:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-12-maz@kernel.org>
 <CANBLGcxCmeaXXFWi6GFSHN=RhjUp5BVRYTMXHQihsLJCocD1xg@mail.gmail.com>
In-Reply-To: <CANBLGcxCmeaXXFWi6GFSHN=RhjUp5BVRYTMXHQihsLJCocD1xg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 1 Feb 2022 16:30:02 +0100
Message-ID: <CANBLGcy_zEY7qkMe96v+tpsxbp9CDJh14utug5wseCfBhOSvdA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220201_073015_280193_09965524 
X-CRM114-Status: GOOD (  19.80  )
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

On Tue, 1 Feb 2022 at 16:16, Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 1 Feb 2022 at 13:19, Marc Zyngier <maz@kernel.org> wrote:
> >
> > Move the reference to the device over to the irq domain.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/pinctrl/pinctrl-starfive.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
> > index 0b912152a405..5be9866c2b3c 100644
> > --- a/drivers/pinctrl/pinctrl-starfive.c
> > +++ b/drivers/pinctrl/pinctrl-starfive.c
> > @@ -1307,7 +1307,6 @@ static int starfive_probe(struct platform_device *pdev)
> >         sfp->gc.base = -1;
> >         sfp->gc.ngpio = NR_GPIOS;
> >
> > -       starfive_irq_chip.parent_device = dev;
> >         starfive_irq_chip.name = sfp->gc.label;
> >
> >         sfp->gc.irq.chip = &starfive_irq_chip;
> > @@ -1330,6 +1329,8 @@ static int starfive_probe(struct platform_device *pdev)
> >         if (ret)
> >                 return dev_err_probe(dev, ret, "could not register gpiochip\n");
> >
> > +       irq_domain_set_pm_device(sfp->gc.irq.domain, dev);
> > +
>
> The gpio framework uses the irq_domain at sfp->gc.irq.domain, so
> shouldn't this be set before registering the gpio_chip with
> devm_gpiochip_add_data above?

Ah, no. sfp->gc.irq.domain is a pointer to an irq_domain that is
initialised when adding the gpio_chip.

Reviewed-by: Emil Renner Berthing <kernel@esmil.dk>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
