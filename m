Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T381KHjo2oJ8bfqD+s35yqkKdWo2kAfg9Elv0dBcsZM=; b=TLDiE8Gs4cAEdG
	F+wulzjzg6hrOElxzvhNfrsAGlFEOXQsX2p1ChESp7I/E1p7lcquUNfYd02vPhtslf/HWXaAMOqSY
	SWJFrOy3V9+0YncFAVJQVTHNZQo9TH34YlqDPB2XggAtrn64FPi50KS2MdQZmz1CL8SQDkCTB8M4U
	sndQbgc3vJEv+6BYL18qQ09AZ3THIkcub1mxMm9v9WeeJCjryWRv1KWRVgCT+vVKL2eg5ye77XG+X
	LMkuSflkiyIEMaQwRs2PprmtDOoF2a7FxSmZCPKS3BnzNZR5fpda+aQnNUUNYXfdEpcPI/KGQnNdN
	1fCiS3uVbb+4/Mo7ep8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHORD-00DXVI-Qv; Tue, 08 Feb 2022 11:13:35 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHORA-00DXSK-Ap
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 11:13:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id bx2so20407555edb.11
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3G2225l3e7AAW7cvW9DSbSKu70gKYyiFP+/P2AbU0GE=;
 b=Xyf7gEeeFQZpkKXO8gzF2AgluqdrifnT/FgKVNNk/lOKTNzDZiaZpxWZkJBQ3wk8ue
 hYn6eA9FXNG9IBGN9B+GjYUHQ8714SRdBNzbQJ82JTECIlg3js0Ids8PtzlFJlwQ8/No
 KjSJpWys4J2GcMk8T8YisSEgyfTJXbUXne3m/y0TCeoQoimlXHHwP1M4P31cZ7kOgtbc
 +zWBrbmshVSmfUyRDLeErcgLx7SVrFU5Zk0tjgRWRfH+3NXn/PL8N0Wfp1ujODljr+4m
 cAdFJR6/y3QWMGHdJ/QVE6BBFoYdz9z3MzSn6nX0V+TefwaKjnvOZqYCVvi9JflBbb1S
 qJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3G2225l3e7AAW7cvW9DSbSKu70gKYyiFP+/P2AbU0GE=;
 b=04dE3ZndzMT+Qnp6Hy3rd4d4d8fKPsZz3NPBHEg/B0bFim9Kswhp48mZEW+yhQdW0Y
 AYcQoD3/QtE0hnXryn40qmjpMgAF02sq1FCa1h2CCDY41JOeYECA3HLvf6Y5yikXWAFE
 C/G/6+inALvosshZyB9xP1eclp5E6WJqbbUOyGitmZziGx6mpBF24tLeGjeUD7t03i8Y
 lb1BPmEChymyKhqELnRNz/wXeXxEcNw7GuhLn1LQS49eIpNthUaemN7bUPUVUSyL4fRI
 6peacX8vLTnaF8wJokb4DcG4OZID6ZTrUDTeJI8Fj9v/c6zGv/nvfukQEFmG92Ez0V74
 cWuQ==
X-Gm-Message-State: AOAM532PAb2QpJW19R8ripOv8UqXWp8GYjq3bZ72Az/Qt2FlhzRWYyNc
 KEkn1XyQpvfNzLOeAzg+D4++qB6sgmtur1XeUiZLiw==
X-Google-Smtp-Source: ABdhPJywJZL0jTPvvCbkGnYtFW82KoshEzkqB1HixUSDNK3JM1+qqwgc2BPOGxgMTLyu8AS04o5CLxS9fyGFvEJzrWk=
X-Received: by 2002:aa7:db49:: with SMTP id n9mr3902542edt.100.1644318809786; 
 Tue, 08 Feb 2022 03:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
In-Reply-To: <20220201120310.878267-1-maz@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Feb 2022 12:13:19 +0100
Message-ID: <CAMRc=Me=VTqTfa4=p3HOa4_NmE3W6h+YyPLZGKXZo6dqUoxWmg@mail.gmail.com>
Subject: Re: [PATCH 00/12] genirq: Move irqchip runtime PM over to irq domain
To: Marc Zyngier <maz@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_031332_399303_EFAD2072 
X-CRM114-Status: GOOD (  25.75  )
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

On Tue, Feb 1, 2022 at 1:03 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Our irq_chip data structure currently suffers from two problems:
>
> (1) the 'name' field is often dynamically populated with a reference
>     to the underlying HW (DT node dame, for example)
>
> (2) the 'parent_device' which is used to implement runtime PM is also
>     dynamically populated
>
> (3) there is at least one instance of a subsystem messing with the
>     internals of irq_chip structures (gpiochip_set_irq_hooks is
>     what I know about)
>
> These things mean that although the primary use of irq_chip is to only
> contain function pointers and other *static* information, the above
> two fields result in these structures being copied in a number of
> drivers. Eventually, it would be much better if the various drivers
> would use irq_chip as an 'ops' data structure (potentially made
> read-only), and keep the dynamic information somewhere more suitable.
>
> For (2) we already have the irqdomain structure that is designed to
> deal with the context in which interrupts are used, and it makes sense
> to move the 'parent_device' field over to this structure. This is what
> this small series is doing, with some minor cleanup on the way.
>
> (1) and (3) will be dealt in separate series (and I don't have a good
> solution for (3) yet).
>
> Thanks,
>
>         M.
>
> Marc Zyngier (12):
>   genirq: Allow the PM device to originate from irq domain
>   irqchip/gic: Move PM device over to irq domain
>   irqchip/renesas-intc-gpio: Move PM device over to irq domain
>   irqchip/renesas-irqc: Move PM device over to irq domain
>   irqchip/imx-intmux: Move PM device over to irq domain
>   gpio: mt7621: Kill parent_device usage
>   gpio: omap: Move PM device over to irq domain
>   gpio: rcar: Move PM device over to irq domain
>   gpio: tpmx86: Move PM device over to irq domain
>   pinctrl: npcm: Fix broken references to chip->parent_device
>   pinctrl: starfive: Move PM device over to irq domain
>   genirq: Kill irq_chip::parent_device
>
>  drivers/gpio/gpio-mt7621.c                |  1 -
>  drivers/gpio/gpio-omap.c                  |  7 ++++---
>  drivers/gpio/gpio-rcar.c                  |  2 +-
>  drivers/gpio/gpio-tqmx86.c                |  3 ++-
>  drivers/irqchip/irq-gic.c                 | 12 +++++------
>  drivers/irqchip/irq-imx-intmux.c          |  8 +++-----
>  drivers/irqchip/irq-renesas-intc-irqpin.c |  3 ++-
>  drivers/irqchip/irq-renesas-irqc.c        |  3 ++-
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 25 +++++++++++------------
>  drivers/pinctrl/pinctrl-starfive.c        |  3 ++-
>  include/linux/irq.h                       |  2 --
>  include/linux/irqdomain.h                 | 10 +++++++++
>  kernel/irq/chip.c                         | 20 +++++++++++++-----
>  13 files changed, 59 insertions(+), 40 deletions(-)
>
> --
> 2.30.2
>

The changes for GPIO are small so:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

You can take it through your tree and if there are any conflicts, I'll
just ask for an immutable branch.

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
