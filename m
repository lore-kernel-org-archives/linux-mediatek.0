Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8697AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xsPNQe5mjlwLnpvGJXXhuYnEU/i143azYMTHQ518Jc=; b=MpbrHqrcqNbUTj
	PQj9b/3+udl1esmgbr5qf3tJbQVRDXgkCAG005R5Ap/zn43YzprWliTFElc+ueJyVYs7vkOBbLepE
	lbLXpEXyp74tiksFlNEIdMrDHHuHhnf4+jjCFD1tsAfsz48bTFNnexxNF2oMdvV4ENcWhnF47CiCf
	N5c7084Npr4AheBokhjLWxDA9F0TYckD4JE16BvRxuV0r1b5IJaByyIVk5FNEsSsIW2f+Y4NsmkhQ
	TCx0lBINvbXxcq33f0hw+TrxBwtjv+O1/rhdKjtoChbDo/Jt0pVW729Jyjl8f5jDNrkpw4kPlwePc
	TJO2bpDSgXHEeOei8d2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwlk7-009oCY-04; Mon, 13 Dec 2021 13:51:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwljS-009nqt-QZ
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 13:51:14 +0000
Received: by mail-ed1-x52d.google.com with SMTP id l25so52689174eda.11
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JA6W9bf1908WD6cfFb6AhPYhGreRD1L3ZPU1ovM0YAo=;
 b=JR+DaCc5q3x/nJ52dLl6r+4FwSEv9WD0p7h6CAvJzuCN4LA6+wkAYifxMiKmhtGPMC
 FTN/0x8gYKn6C0DH+DPrgH6lH2w+WJEIfGDy1/YzVD0zU202RDccLQt46z8yx/mv5SEQ
 orFijgywNSCXDOJ/OPyq3mvh5NlrdflBnU+13ax6fE2dt0FQGfzQsQKPQMlWf12X6gYS
 H/d+nrvTinlxhp9IzxuZ3LhRXaM+23FWY9lMgayxh0hvEqluoQhfJStRiFE2+rfIOnQF
 Iw8LA3Ko152lC8tyud5LtFSKXRrJ7LmTPR7MzT1Pb8/drF5Zj0ygRhSQOmk3y0qr4lHt
 19ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JA6W9bf1908WD6cfFb6AhPYhGreRD1L3ZPU1ovM0YAo=;
 b=G6YiJ0YGfWSaVdqTlxIBYECYWot1ZQp2iMQH0IFGwYNRr5Kfkpi6A0m7hYOaxXL26u
 yEheZstq7B3rCk+4nLkhjrZiNvFwX5ZM8TuOD6rxB70bDjpg7VwxeL2Tt9sUZaMF7mFc
 enEsTwmi/l+zOZShkpwXG1DslEv++QZWrAJI6dEHOiylxWQf8xx75pI0JiiHrP/XnGRr
 XEb4ayrZlUCNW8wnJGrZoSC49sI0Ae+t2uFWyMBJZmQKPRsVSYkZRHF89UXilHpntw3i
 /ngD6SPqlHI21PbpUo2nNqv8ryMicSITCzQkLcCuarQ5sLos6+1mXsePYcZ/qz5pD3BJ
 8I5A==
X-Gm-Message-State: AOAM530RaiWQrMR1J+PyL5RF4vZWWlTlvzLaKo6/cxaXJ96BSPW8JXEH
 GT1c30GqmN9Z93dRVMyMz3PmPoK7t53IEzIrKDHvHQ==
X-Google-Smtp-Source: ABdhPJyUfRonKaOMYp5CA3+4Qguk6GD9f9+ENkQJ7XEThNqMIaIY/ZVhde1IxmgVdguaMtUOm8hj/b6kBh4NcjdyhEI=
X-Received: by 2002:a05:6402:354e:: with SMTP id
 f14mr63951085edd.245.1639403467922; 
 Mon, 13 Dec 2021 05:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 Dec 2021 14:50:57 +0100
Message-ID: <CAMRc=Meve=W3yvPmakFap-s6cOY1GUq7c1VjJE2dEH4f0+shag@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in
 the drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, 
 Baruch Siach <baruch@tkos.co.il>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Jianqun Xu <jay.xu@rock-chips.com>, 
 Alexandru Ardelean <aardelean@deviqon.com>, Thierry Reding <treding@nvidia.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-power <linux-power@fi.rohmeurope.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, 
 linux-unisoc@lists.infradead.org, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
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
X-CRM114-CacheID: sfid-20211213_055110_895519_AC794EF6 
X-CRM114-Status: GOOD (  11.69  )
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
>
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

If there are no objections, I am willing to apply this to give it some
time in next and get the work on dropping the OF APIs from gpiolib
going.

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
