Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11714C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ck1BFgYQUoxfjthSY0Z/ICMvhRDs51HkE0D/E51e4wU=; b=TGiHw8Wc4aj1QWf1eNmxe5MRhC
	t7QEVI7i1IyMAWJNwFfRMyKoqATlHqS2PKV+eiiNDHActKtGrEXWBmIdeh2LNfcfIwr3dgcd6Uv1a
	F/EwX1R+5Q8fV3pmpk/cGiDEJoBp49dAWuyuccY402e/fHH46+L9TP/glE5V3p8LOAADz8c4suLSW
	kdnLGbYrJEWRygP0Y78jB+dKrxW2v769OqnSdmMnZ5KvxK8o664w3a1QLxRzBmTfjump1AqfuvrHC
	N20I/oqWO76oxF1nABPohSvelDEpLWPap8JpN8p/m6EGJW7RKvAyMtxto+lqaz7wu/Vkaojl+a4M8
	FTsXROaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot663-005X6n-9Z; Thu, 10 Nov 2022 11:51:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot5ua-005R9F-ME
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 11:40:03 +0000
Received: by mail-ed1-x530.google.com with SMTP id x2so2668894edd.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ck1BFgYQUoxfjthSY0Z/ICMvhRDs51HkE0D/E51e4wU=;
        b=cLoqN/9Hw4WN89uoDoxpq9Ce/Ps341RBpybWaA/Ttn7dX0XjEZSpQMeE/cLupilSy+
         h9M/AwRJwi+wD3lcUZtgCbl5J3Y1/4+a+UG987xrzyBKVQSsdTGx1Fm9p56BVwQCgeqw
         ImbNP+V0cuLG09qZBqDEVWEBH4JmnDYapBzy20rI0QOEnuyEvU41wtqwWtHQ/Ku+SIq6
         z/iAwWeg98cPs684u3jM1bZkrHRFlxBeM553WE2HZydhyBqAswoiUSyHfbMc8MScHPVp
         jTxj/0bSYX2PEajd6PNI/IV0ZBru+l7g17Wn1GCvWMrBI6s8qLNSd3U7dwQx3hiin+sp
         LiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ck1BFgYQUoxfjthSY0Z/ICMvhRDs51HkE0D/E51e4wU=;
        b=q2Q+I/FYVKBJr/X4WfZNH+/a8LbqDaRQpODIqVHH5An/do8saK6bgBSKuAWAFqArjX
         Op0pZiuJ0iPQHUmzOpoLk43Gmh6y8BtgOrqpHaVjsuGMuxInAgQ1njhsQxNXa0fejsmI
         83e7GvIcE1rk8ao+ivV2oNbDImu7CukG1eqA5nB1cq0GJbWDzG8bOo6lkivA5OFfu0Pe
         DYyuaubbeVdnf4dfWs/ijz5WWKz15C8WTkHxY+RkUed+UcxRl8YTHRRvnysF4kk0N/GK
         noaigUDU9JQstDVeCKsZPscZVQV9vhI48sMfiwryGu/7Mow+HiIyrjNUMRyn4JL4IpdR
         NQUQ==
X-Gm-Message-State: ACrzQf1d8uG1jEmySonsz4ZxbvEs95Y3nsVAxB431BLpdKND1uQsIEcB
	PlQuEmdnsHqSKXJbHtO6IUlIepxziu2c5fUzniLsyQ==
X-Google-Smtp-Source: AMsMyM6KPfAGNVILTJIJybxZbWNcNW1j294XPOEkghGZsATADMyuAh5FXMGRYiA9Y0UOLTHKSZCe9zdW3Mb4U369XWo=
X-Received: by 2002:a05:6402:4002:b0:463:bc31:2604 with SMTP id
 d2-20020a056402400200b00463bc312604mr2100488eda.32.1668080397979; Thu, 10 Nov
 2022 03:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech> <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
In-Reply-To: <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Nov 2022 12:39:46 +0100
Message-ID: <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Samuel Holland <samuel@sholland.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Vinod Koul <vkoul@kernel.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Sekhar Nori <nsekhar@ti.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Lechner <david@lechnology.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-stm32@st-md-mailman.stormreply.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-clk@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, 
	linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_034000_811369_E3B19072 
X-CRM114-Status: GOOD (  23.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
> >
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
>
> If I recall correctly, that is the use case we did target for these
> types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.

Hm I am trying to get that driver to work ... from time to time.
It's just that ALSA SoC DT has changed to much that it turns out
into a complete rewrite :/

So in sound/soc/ux500/mop500_ab8500.c
I see this:

        status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
        if (status)
(...)

and there is elaborate code to switch between "SYSCLK" and
"ULPCLK" (ulta-low power clock). Just like you say... however
a clock named SYSCLK or ULPCLK does not appear in the
code in drivers/clk/ux500 or any DT bindings so... it seems to
be non-working for the time being.

Yours,
Linus Walleij

