Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E3FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+ZKPKDp2bsPmcYILGLo90RMa0PV+MFQlp9vjp4Z+As=; b=X6nQIzXs5PlbxF
	MGB/3p8qFZNcsJLmY2DtxQq3NmL3c2nJ35CESSOxK3j49Hc5U6tQj3YkFra21mXTsC6idIvO7pq+L
	OG4GkNPQoDY1aaC1/oOZsn9bSlh1rDvy1YnIoR9CO0XJE+7TVkShCmSnulQNnv6Y2s1dH21yUQFuC
	FTjJGFJ2sZjxVS0x407GlKSldl3FUGRP67mVEZ61b+edRNrldZjK3vpQSARnD5nitssiTLV0uBXc2
	MF/UZbC4Ttz8yRxt/FVdb6zS1aEGZGpq7Jcmm1y4J3RpTawrUkZTshftQdz250X8kt+dg4R7Y+I6+
	ZIbZwHHH4QGFPJslBqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxVAc-001897-Fl; Wed, 15 Dec 2021 14:22:14 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxV7e-00166k-KO; Wed, 15 Dec 2021 14:19:11 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="236771189"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="236771189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 06:17:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="567937520"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 06:16:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mxV4Z-006d5b-Tn; Wed, 15 Dec 2021 16:15:59 +0200
Date: Wed, 15 Dec 2021 16:15:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-actions@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 - <patches@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Sean Wang <sean.wang@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Baruch Siach <baruch@tkos.co.il>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Gross <agross@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, arm-soc <soc@kernel.org>
Subject: Re: [PATCH v1 1/2] pinctrl: Get rid of duplicate of_node assignment
 in the drivers
Message-ID: <Ybn4ny0YY/Sbld+Q@smile.fi.intel.com>
References: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_061910_731326_B83AA52B 
X-CRM114-Status: GOOD (  15.36  )
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

On Wed, Dec 15, 2021 at 11:28:34AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 13, 2021 at 5:40 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > GPIO library does copy the of_node from the parent device of
> > the GPIO chip, there is no need to repeat this in the individual
> > drivers. Remove these assignment all at once.
> >
> > For the details one may look into the of_gpio_dev_init() implementation.

> >  drivers/pinctrl/renesas/pinctrl-rza2.c     | 1 -
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, there is v2 with this patch w/o changes. I take a liberty to
extrapolate the tags to it. I need to send a v3 in case Linus hasn't
taken the first patch before it happens.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
