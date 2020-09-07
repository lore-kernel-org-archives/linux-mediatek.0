Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3231CC43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:29:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C528F206E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YRpAMe/H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQQtOtMz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C528F206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nKTIvpDtKxnSD8RzCYFyYy5sGI4mJFYY5jda3z1Uva8=; b=YRpAMe/HZPg+bKA2idCiHYyJr
	18CnVGqrKw2UjDRPNEB7TrVx6lVABWUOdNRWmok0u/UHDfAcN0NNxQT0efeSL0XsyqDj0HiKeR+i2
	eoeMEi3QJ4W7sCb7ZCg52dS/XseZ2Freon+Cw+phndrRZU8CYU6FBFpr1D1TZbdnhQp8w59gekPnk
	ka1qGKhN32WoeDIwwTEQcwsHD8moPbSx+KBCSTTG5BR053cD8kxZesKYISKHn69bWJmH5AbnHDNyf
	4KxRO5BvgdniO94ERFNGaKRrw+Wa7ZypqEJpjUtg7PmLYQj7xhO9gEhwMZ+52K7lkJwXqyZ3hMHQv
	mmnZ3FRag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFGGU-0002lt-VG; Mon, 07 Sep 2020 12:28:55 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFGGR-0002kA-Cy
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 12:28:52 +0000
Received: by mail-ua1-x943.google.com with SMTP id o14so1221569ual.11
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8iVJ2Y8DEp3E0XkrRL3vpRQ7yO+SYLZGU2xwg3pZn7w=;
 b=uQQtOtMz9h++aYiUpsU46MiJXh7DHCcguAo/zJU+YS89m53bIsw6fdvtT/tTOunUyR
 JJBiFLggFSuqeEl8r29jqfLHoAxfIBpkSm4q4BV1wLUnhcEg5BhKtw4yN9E3KWnlQi5Q
 rCpJseHbu1nV0RKPbba4IW2CSH1ZbVbSELCGxUJCzfawo7q5fo02iJXwGc7JPE8tkB4q
 RNrmFl7UapRVJ4X+zZHU2t2qQDe2KMqFrTt1qU1mQ/xsI6rXnxItRXjcEJnYkUO0DNyF
 eGUgMMDfflC6QbVhVustSwl2/RbNWfSaweZxAisnFopk4/vjCZaqjr03ExUXBskH+JSu
 107Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8iVJ2Y8DEp3E0XkrRL3vpRQ7yO+SYLZGU2xwg3pZn7w=;
 b=q12MYegCvB0BcIUW2OPWwxqHvyjsSEZbQDccppysABzdsN6eADNyKjZfy1PreZBaF5
 ZwILV8EdNoooQRI8LgHesZjDAvHuds0W7jSDgxQWwMOpSltKO6EOMhY7jL/tYa57oeoI
 JcwIiw7gVp2TCsb4DuGBCe+AIIT1dUFgBf7pbQZbiQNiKB8EoDYRfK4QSyXnAsnJOHLZ
 VbCMq9NsPv+9zuiHAr7yPw24qw0zHKFvqsg7w/IuIkhkzhlV4bieP4TEcK6V4MBrYBMG
 MPTRlUEBZ+C1sezpI6p2ICR25bX1CV6x2fDXIAbZMhLaxZCBnevoTyBZBiS25hQpgQf3
 BIUw==
X-Gm-Message-State: AOAM532YzLs24FUgtCA7Y3WqSzAaSKmhi1j8HblYA3McZtbpmLn74TZ1
 feRgI4mXedKaXOCTio8gfeAeVr01u/HkDuAMqcJ70Q==
X-Google-Smtp-Source: ABdhPJy6I2uvtSFaZhO3P4JEWmrE8eH+U+1Xn5WxmNVFnMTl2QPXi6bmEQ1vz+4fPNN/0nIdBxJ7hVghl+1FhXG+hRM=
X-Received: by 2002:ab0:4041:: with SMTP id h59mr8011331uad.19.1599481728409; 
 Mon, 07 Sep 2020 05:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 14:28:12 +0200
Message-ID: <CAPDyKFqTjFUaqx6phBGdPuv6hz8dsevsO_UhoOhFT+oOFrhFjA@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Douglas Anderson <dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_082851_641007_6FCBC260 
X-CRM114-Status: GOOD (  30.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 Lars Persson <lars.persson@axis.com>, linux-omap <linux-omap@vger.kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Hu Ziji <huziji@marvell.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>, Pierre Ossman <pierre@ossman.eu>,
 Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:BROADCOM BCM2835..." <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ricky Wu <ricky_wu@realtek.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Chen-Yu Tsai <wens@csie.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>,
 Anson Huang <Anson.Huang@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>, Vinod Koul <vkoul@kernel.org>,
 Robert Richter <rrichter@marvell.com>, Viresh Kumar <vireshk@kernel.org>,
 Jun Nie <jun.nie@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 4 Sep 2020 at 01:25, Douglas Anderson <dianders@chromium.org> wrote:
>
> As per discussion [1], it seems like it should be quite safe to turn
> on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> give it a shot.  For some discussion about this flag, see the commit
> message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe").
>
> I've broken this series into chunks based on LTS kernel releases to
> attempt to make it easier if someone wanted to cherry-pick it to an
> older kernel.  While these cherry-picks won't be conflict free, there
> should only be trivial context conflicts and no problems with drivers
> that are totally missing.  This is a bit of a compromise between a
> 1-big patch and a many-part patch series.
>
> I have only tested this on a rk3399-kevin (sdhci-of-arasan) and a
> rk3288-veyron (dw_mmc-rockchip) device and only lightly.  If this
> patch causes anyone problems those drivers should be marked with
> PROBE_FORCE_SYNCHRONOUS, debugged, and then go back to prefer
> asynchronous.  Any problems are likely just a hidden bug that has been
> exposed by this change.
>
> NOTE: in theory, it'd be nice if there was a KConfig option that we
> could flip that would turn on async probe everywhere (except for those
> that opt out by adding PROBE_FORCE_SYNCHRONOUS).  My hope is that by
> adding this flag in more places it will become clear that this flag is
> working reliably and easier to move over when we're ready.
>
> While coccinelle is too difficult for my feeble brain, I managed to
> whip up a pretty terrible python script to help with this.  For your
> edification:
>
> import os
> import sys
> import re
>
> for filename in os.listdir("."):
>     found_plat = False
>     found_driver = False
>     output = []
>     for line in open(filename, "r").readlines():
>         output.append(line)
>
>         if "struct platform_driver" in line:
>             found_plat = True
>         if found_plat and re.search(r"\t\.driver\s*=\s*{", line):
>             found_driver = True
>             found_plat = False
>         mo = re.search(r"(\s*)\.name(\s*)=", line)
>         if found_driver and mo:
>             if mo.group(2) == " ":
>                 space = " "
>             elif mo.group(2) == "\t":
>                 # Best we can do
>                 space = " "
>             elif mo.group(2).startswith("\t"):
>                 # Guess that removing one tab is right
>                 space = mo.group(2)[1:]
>             else:
>                 # Guess it's all spaces
>                 space = mo.group(2)[7:] + " "
>
>             output.append("%s.probe_type%s= PROBE_PREFER_ASYNCHRONOUS,\n" % (mo.group(1), space))
>             found_driver = False
>
>     open(filename, "w").write("".join(output))
>
> [1] https://lore.kernel.org/r/CAPDyKFq31bucJhP9hp1HSqh-qM2uNGHgDoyQpmbJf00nEf_T4Q@mail.gmail.com/
>
>
> Douglas Anderson (6):
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.9
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.19
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v5.4
>   mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that are newer than 5.4
>
>  drivers/mmc/host/alcor.c                      | 1 +
>  drivers/mmc/host/android-goldfish.c           | 1 +
>  drivers/mmc/host/atmel-mci.c                  | 1 +
>  drivers/mmc/host/au1xmmc.c                    | 1 +
>  drivers/mmc/host/bcm2835.c                    | 1 +
>  drivers/mmc/host/cavium-octeon.c              | 1 +
>  drivers/mmc/host/davinci_mmc.c                | 1 +
>  drivers/mmc/host/dw_mmc-bluefield.c           | 1 +
>  drivers/mmc/host/dw_mmc-exynos.c              | 1 +
>  drivers/mmc/host/dw_mmc-hi3798cv200.c         | 1 +
>  drivers/mmc/host/dw_mmc-k3.c                  | 1 +
>  drivers/mmc/host/dw_mmc-pltfm.c               | 1 +
>  drivers/mmc/host/dw_mmc-rockchip.c            | 1 +
>  drivers/mmc/host/dw_mmc-zx.c                  | 1 +
>  drivers/mmc/host/jz4740_mmc.c                 | 1 +
>  drivers/mmc/host/meson-gx-mmc.c               | 1 +
>  drivers/mmc/host/meson-mx-sdhc-mmc.c          | 1 +
>  drivers/mmc/host/meson-mx-sdio.c              | 1 +
>  drivers/mmc/host/moxart-mmc.c                 | 1 +
>  drivers/mmc/host/mtk-sd.c                     | 1 +
>  drivers/mmc/host/mvsdio.c                     | 1 +
>  drivers/mmc/host/mxcmmc.c                     | 1 +
>  drivers/mmc/host/mxs-mmc.c                    | 1 +
>  drivers/mmc/host/omap.c                       | 1 +
>  drivers/mmc/host/omap_hsmmc.c                 | 1 +
>  drivers/mmc/host/owl-mmc.c                    | 1 +
>  drivers/mmc/host/pxamci.c                     | 1 +
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 +
>  drivers/mmc/host/rtsx_pci_sdmmc.c             | 1 +
>  drivers/mmc/host/rtsx_usb_sdmmc.c             | 1 +
>  drivers/mmc/host/s3cmci.c                     | 1 +
>  drivers/mmc/host/sdhci-acpi.c                 | 1 +
>  drivers/mmc/host/sdhci-bcm-kona.c             | 1 +
>  drivers/mmc/host/sdhci-brcmstb.c              | 1 +
>  drivers/mmc/host/sdhci-cadence.c              | 1 +
>  drivers/mmc/host/sdhci-cns3xxx.c              | 1 +
>  drivers/mmc/host/sdhci-dove.c                 | 1 +
>  drivers/mmc/host/sdhci-esdhc-imx.c            | 1 +
>  drivers/mmc/host/sdhci-esdhc-mcf.c            | 1 +
>  drivers/mmc/host/sdhci-iproc.c                | 1 +
>  drivers/mmc/host/sdhci-milbeaut.c             | 1 +
>  drivers/mmc/host/sdhci-of-arasan.c            | 1 +
>  drivers/mmc/host/sdhci-of-aspeed.c            | 2 ++
>  drivers/mmc/host/sdhci-of-at91.c              | 1 +
>  drivers/mmc/host/sdhci-of-dwcmshc.c           | 1 +
>  drivers/mmc/host/sdhci-of-esdhc.c             | 1 +
>  drivers/mmc/host/sdhci-of-hlwd.c              | 1 +
>  drivers/mmc/host/sdhci-of-sparx5.c            | 1 +
>  drivers/mmc/host/sdhci-omap.c                 | 1 +
>  drivers/mmc/host/sdhci-pic32.c                | 1 +
>  drivers/mmc/host/sdhci-pxav2.c                | 1 +
>  drivers/mmc/host/sdhci-pxav3.c                | 1 +
>  drivers/mmc/host/sdhci-s3c.c                  | 1 +
>  drivers/mmc/host/sdhci-sirf.c                 | 1 +
>  drivers/mmc/host/sdhci-spear.c                | 1 +
>  drivers/mmc/host/sdhci-sprd.c                 | 1 +
>  drivers/mmc/host/sdhci-st.c                   | 1 +
>  drivers/mmc/host/sdhci-tegra.c                | 1 +
>  drivers/mmc/host/sdhci-xenon.c                | 1 +
>  drivers/mmc/host/sdhci_am654.c                | 1 +
>  drivers/mmc/host/sdhci_f_sdh30.c              | 1 +
>  drivers/mmc/host/sh_mmcif.c                   | 1 +
>  drivers/mmc/host/sunxi-mmc.c                  | 1 +
>  drivers/mmc/host/tmio_mmc.c                   | 1 +
>  drivers/mmc/host/uniphier-sd.c                | 1 +
>  drivers/mmc/host/usdhi6rol0.c                 | 1 +
>  drivers/mmc/host/wbsd.c                       | 1 +
>  drivers/mmc/host/wmt-sdmmc.c                  | 1 +
>  69 files changed, 70 insertions(+)
>
> --
> 2.28.0.526.ge36021eeef-goog
>

An interesting idea about a patch per LTS release. I think it makes
perfect sense in this type of case.

Let's give this a shot in next and see how it goes. So, applied for
next, thanks!

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
