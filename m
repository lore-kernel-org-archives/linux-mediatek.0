Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FF8C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:26:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF0F205CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gYW2QkGB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kEHPy/5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF0F205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aw3VBA7nuyKIhtqMjoLsjNZ4MXMEcO3knepKmQawsfA=; b=gYW2QkGByb0oyUSG6lL7gP6r+
	wLfGdtIxSgWGhFqVJxNPgr5tII3hSM3gXJqf4Hnmc4VvQ97O4US8k08QKfxBDKxuhsY0aVTTxsaUp
	JGX/3eLT52dlsMNnN0OyoF8qPjCFsM73WfeSG4nhZl/Adcxwg8bUcbuzViJo0XDcHGsJsJ9zD547V
	jpeL+lwD20A9P3aRaBw64mlrXZ6CQ7uMYNsA23qGioOhe8ikPqXxS+mP1rCK7jZnIdKCZX7xPXFhj
	gZ/OSK9UmmWPNRwF5GiqOsNuYwQz4y3KCZBb/4HLjg5K8NFJgUyzGRgbSN48ad0hB0k3ujQwxNjVT
	5JNE9ausA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFELn-00043i-RH; Mon, 07 Sep 2020 10:26:15 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFELh-00040c-Ok
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 10:26:13 +0000
Received: by mail-ua1-x944.google.com with SMTP id e41so4009821uad.6
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 03:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AozzJXZUL22h+sKQZ059ls1ZeGArDktRdLkmygb6j+U=;
 b=kEHPy/5oC15OKB88KwjomCTjGDXuVbdoHHp/KjnfUHNjixAmkPO5iain7J/VCcsTKn
 x1BOYRDI2axsEtQT5hcb5Jw6PkthrUgHM0SY5DvRThY2DcsYpMRaQQk0ds9lja9NkzRY
 PH2XMfkdc4Bhwxg0iKrwXGI0b5PhLtPOvScQsPfeIbMW1EyxAkv8H/XglABmMObHphcH
 n7AlFcUa0ax6PkigvFLs3sPUtqdElHOR06iruiCM6S+cVuAtm283ysqv3MRZsEWp/6SN
 S8c5letuiGaNQOeCt+Ave+K6jWIy6JHorfDkw8YacPDr+MXogIUIhwWXZ0BjD9nTTSsp
 zB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AozzJXZUL22h+sKQZ059ls1ZeGArDktRdLkmygb6j+U=;
 b=PgtvgF91mC/Mq622VXRUftpG4dCCATZk2QMXZZrPv4BCuWHyLuxLca4vXevNPlqLJ/
 VppohAP9wlWK/+U5I0GDwhNjoh5YRTONJqlM06EW0OF1lRw6pWh22SbqHgVa2B39jFVg
 jOQbJ1oCZVhq9Zbp9aJzNXPk+xT2DDNDULYaqzkqY3ilcMpqyi5HpZ7ciBVuRGUPE1gN
 32mOPaw4KbV4AGhTOr9uBCHeDWtjvt/1aznzry1d6i50WvUfUaq+R7oID10AIIu/gTG5
 SQxbk4hiX31jj+VI7BuAJVgD6qyt0yyzYN6+Xk86oykWVZ1voAj2FF8BUetR6mXaYsCr
 bGng==
X-Gm-Message-State: AOAM533CqZFgcLsjCMvpuhXHSVB+Ibc76csuy9vKf5hd7g977//+910u
 dqedsaxo9I8HdmyfDlFVQNMuHZD+iKjVWsBYSMRpTA==
X-Google-Smtp-Source: ABdhPJy1eBqbsXfbOgOTKaIKV9d6z9pG4PRO7SQC+FwnjmOkT4mzyQi7YatfsHO8E9fzkaZ+4lehXIpuaB9Y6rBFcIo=
X-Received: by 2002:ab0:6f91:: with SMTP id f17mr10608318uav.129.1599474367924; 
 Mon, 07 Sep 2020 03:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
 <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
 <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
 <CAGb2v67dPaV9tP4piV9MHe9QeJAq0RyvOO3ypJ3ZBW1-ffpjKA@mail.gmail.com>
In-Reply-To: <CAGb2v67dPaV9tP4piV9MHe9QeJAq0RyvOO3ypJ3ZBW1-ffpjKA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 12:25:31 +0200
Message-ID: <CAPDyKFoNFEa4ssv3TXbj4KM0UGjJgcp3dtypwicxJ-bExBL28A@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Chen-Yu Tsai <wens@kernel.org>, Anand Moon <linux.amoon@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_062609_888578_67EAEA07 
X-CRM114-Status: GOOD (  25.09  )
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
 "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Lars Persson <lars.persson@axis.com>,
 "open list:OMAP2+ SUPPORT" <linux-omap@vger.kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
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
 Saiyam Doshi <saiyamdoshi.in@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "moderated list:BROADCOM BCM2835..." <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Douglas Anderson <dianders@chromium.org>,
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
 "open list:BROADCOM BCM281XX..." <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Anson Huang <Anson.Huang@nxp.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Robert Richter <rrichter@marvell.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>, Patrice Chotard <patrice.chotard@st.com>,
 Viresh Kumar <vireshk@kernel.org>, Jun Nie <jun.nie@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 7 Sep 2020 at 06:08, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> (Resent from kernel.org)
>
> On Mon, Sep 7, 2020 at 11:57 AM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Hi Martin.
> >
> > On Sat, 5 Sep 2020 at 03:24, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > Hi Douglas,
> > >
> > > On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > As per discussion [1], it seems like it should be quite safe to turn
> > > > on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> > > > give it a shot.  For some discussion about this flag, see the commit
> > > > message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> > > > probe").
> > > can this somehow change the order in which the MMC drivers end up loading?
> > > on Amlogic SoCs we have up to three MMC controllers, some SoCs even
> > > use two different MMC controller IPs (and therefore two different
> > > drivers).
> > > so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
> > > can that change with this patch?
> > >

Consistency has never been guaranteed. Just imagine one of the mmc
host drivers ending up lacking some of its resources during ->probe()
and returning -EPROBE_DEFER.

UUID/PARTID has been the only way.

> >
> > We could resolve this by setting up aliases for mmc nodes in the dts.

Yes, this is now possible due to the recently [1] applied patches for
supporting mmc aliases.

>
> Right now, only the dw_mmc driver family supports aliases for mmc nodes.

That's "mshc" specific (related to the old multiple slot support I
think), but not affecting the mmc aliases, which the mmc core now is
supporting.

So the mmc aliases are common for all mmc hosts. Please have a look at
the new OF parsing in mmc_alloc_host().

[...]

Kind regards
Uffe

[1]
https://patchwork.kernel.org/patch/11747669/
https://patchwork.kernel.org/patch/11747671/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
