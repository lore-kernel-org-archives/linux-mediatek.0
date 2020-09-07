Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FFBC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 04:05:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87ACC21534
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 04:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wdcs8uHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87ACC21534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vMPrpSWO3h2X6UD1CFTgsTbGHrHMNSigWMJTljp4DDk=; b=Wdcs8uHZ4lXKYJo/Ucw+k0OYN
	uQrndpzL2X19EmQYEhRi6LBN6wxrOlhthPWMjyqx3ZD5teg1mKGH/yuc3N+dOXAFj7gdTbSpPCV61
	XWVCNPmZ6JyTYRrYlDWxlIp0EUmollYXGtE7P5Vhqg78AsMQUKB081AwzBju1IGi9Vk4Y7aKhIIIk
	xoZj/f1OZqdDGGyN1PZT8dbV8aMVBjI5JZ7ljbfFSANOaCwjlDsa1UbEsHHRXT02NC31POkGyBFob
	6BOjBJw9c0nYg34fx/I8cos23Qr3C/U3edd31QYkYikHOzCe/WhxlJdD9dmt0GhFzJ1FPNqbVRplb
	eMLl0u6uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kF8P7-0007U4-VH; Mon, 07 Sep 2020 04:05:18 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kF8P3-0007TF-GW; Mon, 07 Sep 2020 04:05:15 +0000
Received: by mail-lf1-f68.google.com with SMTP id u27so6732620lfm.13;
 Sun, 06 Sep 2020 21:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVTRnwHT0ZnDLhJu0EOE7eABaLeVlG6E4x1hUJwJd80=;
 b=r/33ZopUYrCCcIWutiTM/cyhjGOiWYuLBRScmNjxUiP4SSv/U3Wi7n04eEwUP2r4pf
 fyngJObxyt+sKpeE4E/0fWRWqY22NZmzhNG3wSyCzjTUHOvc2cA7U60OO+kqLm+0f7JL
 40GzNVw9zPiRrItsAHp4mICeni1Ox1f5BgzSmh4YXwsmYDKV2qfaWikuOpsi0Cbt2gId
 LiIMN4wSSMFnmEVdjLOlwTdnZX0v11RpNo7jimFqXK17iE5BlIZCaLaTJArYSWXobdiT
 CApNvPAe+t2MIEjVfPlJh07zSejf9ckiNgF9iY9IngMhVH5/tfAmTnIx3Da/geyVpP6U
 75hw==
X-Gm-Message-State: AOAM533WXkeh1d05YV4F95yGpodj7J+cWJEoTk/cgqIR4NGbHdn/SbKB
 FcbmweXbLqJX7Wy9x3zakWWfEHpunnt2ByuJ
X-Google-Smtp-Source: ABdhPJwMEpZ7jfuf4r/YgXjY0mbNK1OKTP/hB09LBD17nntsqDdGtmWMMRT+XSEYi+tt1lQfUPtpbQ==
X-Received: by 2002:a19:942:: with SMTP id 63mr9124227lfj.23.1599451509879;
 Sun, 06 Sep 2020 21:05:09 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id s3sm5930165ljd.44.2020.09.06.21.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Sep 2020 21:05:09 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id y11so6783978lfl.5;
 Sun, 06 Sep 2020 21:05:07 -0700 (PDT)
X-Received: by 2002:a2e:83cf:: with SMTP id s15mr9643337ljh.47.1599451506843; 
 Sun, 06 Sep 2020 21:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232441.2694866-1-dianders@chromium.org>
 <CAFBinCBcbEpHX7eUbznuDo6oKO_9JrOK2w+Bx1=e-bwuS609bw@mail.gmail.com>
 <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
In-Reply-To: <CANAwSgTv2ZAvPKG2aChs8NwZL32TF+MtcaFbehQWWSf_TFXF6A@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Sep 2020 12:04:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66URSyd4WPkM6bJ9wTeZdT-GwS+-R5UymywNxa7HW8pfg@mail.gmail.com>
Message-ID: <CAGb2v66URSyd4WPkM6bJ9wTeZdT-GwS+-R5UymywNxa7HW8pfg@mail.gmail.com>
Subject: Re: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host
 drivers
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_000513_559939_2BBD3F59 
X-CRM114-Status: GOOD (  24.58  )
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
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra@vger.kernel.org,
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
 linux-aspeed@lists.ozlabs.org, Yangtao Li <tiny.windzz@gmail.com>,
 Hu Ziji <huziji@marvell.com>, Thierry Reding <thierry.reding@gmail.com>,
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
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Douglas Anderson <dianders@chromium.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ricky Wu <ricky_wu@realtek.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Al Cooper <alcooperx@gmail.com>,
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

On Mon, Sep 7, 2020 at 11:57 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin.
>
> On Sat, 5 Sep 2020 at 03:24, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Douglas,
> >
> > On Fri, Sep 4, 2020 at 1:25 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > As per discussion [1], it seems like it should be quite safe to turn
> > > on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
> > > give it a shot.  For some discussion about this flag, see the commit
> > > message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> > > probe").
> > can this somehow change the order in which the MMC drivers end up loading?
> > on Amlogic SoCs we have up to three MMC controllers, some SoCs even
> > use two different MMC controller IPs (and therefore two different
> > drivers).
> > so far the MMC controller naming (/dev/mmcblk* etc.) was consistent -
> > can that change with this patch?
> >
>
> We could resolve this by setting up aliases for mmc nodes in the dts.

Right now, only the dw_mmc driver family supports aliases for mmc nodes.

> > apologies if this has been discussed and answered anywhere
> >
> >
> > Best regards,
> > Martin
>
> Best regards
> -Anand

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
