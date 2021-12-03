Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsXo6x9S67AY9Fx5iaPHBuvQTBUkdzk0IoPeUlYsd4A=; b=yoWXxaa+2/v6aE
	biSE3Lpv/dJyamRF/dY0VlTVeG4coumonohX6xTC1y2vrqV8OYcV7eQJOMVektFGrzA38Ym2VXzY2
	4WCJwhRA5BT6zCfU+/ZfC2Q4CF8MygPK/C7ULaQ417Mmae0SOt7MWxjGH/ZA72VUToBDI5UGf/Dvg
	U5AddESkLh8MYodgL7LZ0nABfEfTk+eFY7iI8Tw/kwvJdocRA0nmY2PSZ2+8Xvud0ujWkwWlmsoBT
	a+CeyulkHDXfp5C5MGmQZyhb7zzrrTon2OEBn0DgDVVWxokO40Y9loqXpUumCom3y63j5KZ7VwYb6
	rCJ7R5ZIUOcq/+VzYx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt489-00Erz2-Rw; Fri, 03 Dec 2021 08:41:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt47x-00ErvQ-Bs
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 08:41:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id l25so8366818eda.11
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 00:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uLBHn9jsbKV7jZYY7Dm+t8lPDQRTZnoOfAaLgWh49GU=;
 b=LsIAHi4O7+rAKszJKyJ/QwZwolqgX7Xp85HCfWi/OAlf7oOjExVQVB3A1uF6oJMxXi
 gPosTZ3PyRq9IbJKMX4ESqDGYZZYcom4XQ8JtyMRl5tOE7xlwAkd4FpJbONadp6pWo7I
 oUoB99whrPg0HGUqiRetXBExiz97qDkf5NdxXb1GpetgxbWitUxWw81WWVuMwB7DeHg4
 F4fsE0Im8ySC6EvPdTGuYxXIdnTwT10W+OMVEHRanF7YSviRe6CvO4rDs/Sfax7qLy0G
 GQ8KIQPRWvs0w82uwlN5lRnk2skx92g4UPLasKF6asjvNdNubK/yYeFyTDsn7OcD+219
 BK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uLBHn9jsbKV7jZYY7Dm+t8lPDQRTZnoOfAaLgWh49GU=;
 b=yP4R65uK+r1hfxxp1KNCBibthC84DlCIFLOsV2be5D631vJFF8oAcxJwpUtRhHSAiv
 Lvc4eajBDzeZFTMRchkvb6X9iduIoPIZOXFO0zNUJ0PclcWMoYDsYgZaJ/gwDTCkaLLN
 Ia6k1dQGsBqUVnPOZp1UgDFD2VfDYR9gHRko+jJ35fqCLvU4R/5Ejys+oNz28Et2YmjE
 1Vu1y42evf78ZxvEwYSGnSftVt822TV68w8IVXSRA1NMuygyph8xPGGg/2MLwFqi39zt
 G4RS3jpCCih0eLk5uAoNeA4mIfYf0E3ZUi9d3rI/4L+6OuJNYTsgf6Mt2XXxShJ96mzY
 vlkg==
X-Gm-Message-State: AOAM533t6dMIArpItD1/aUnXHHK+zqjBy+xTE1e9j9ThSIxxb3kO9/0j
 j50BEvPExy5ci4OaTiX+R/Z5k5BbLHTewdhL5uY2BQ==
X-Google-Smtp-Source: ABdhPJzNHiauf+pMC5f/US+c9OIXcWbcKMNg90ABw6xCvQOgNu83JV2BIOiQy03TdGH6uVMTEr4y57dSuqO0jiYbpps=
X-Received: by 2002:a17:907:75f0:: with SMTP id
 jz16mr22268827ejc.77.1638520866276; 
 Fri, 03 Dec 2021 00:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Dec 2021 09:40:55 +0100
Message-ID: <CAMRc=Md-TKUETLzf41D2KeQODac153_AumMTW4928XfJ70GRxQ@mail.gmail.com>
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
 linux-pwm@vger.kernel.org, 
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-unisoc@lists.infradead.org, 
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
X-CRM114-CacheID: sfid-20211203_004109_437616_2FEFA4AC 
X-CRM114-Status: GOOD (  13.84  )
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

I have a bad feeling about this but I've gone through the drivers in
this patch and it seems like you don't update any of the drivers that
use multiple child OF nodes so I can't really point out any obvious
bug.

I have another change I'm working on that's related, let me send it shortly.

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
