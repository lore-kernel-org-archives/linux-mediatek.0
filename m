Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4657BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Sg9d40Iyhsxnl4XA0r15nKc3FEvDOkUcLrGdwE3PJ8=; b=DzLhpvzgPeBZHU/MwJuw0VcLHY
	+rBfUIJgRengU0yeywQuhTxy2FnXqrW7DOEkvcxJw/cKGwNCFFbwEMQax8zuCrm485F/tVOowKzso
	piG0NlDhob15IqgeRB9nRUtFrq/z19ia6JNOsy5q0gQHFbyHyhlgzWk+VzpYIQvE1t2BM+pcO3phm
	RWgghu0wCqOKk1pT1ht6HhmAvOBjqogzaIfYP5Nkk5rqLwWEKre4Zh84yo5kKCF/J6aubDOEmx+uC
	UW5ejyE61oq/Fp2MyO6v+ADJxfbUVvc46WnCjjvHRlorGT7TACHfv+gbCvJfC311Whjlm29GPP/Lz
	lWfbh26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVUN-00H6eB-Oj; Mon, 14 Nov 2022 09:10:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPc-00H3SA-Br; Mon, 14 Nov 2022 09:05:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AC7E60F67;
	Mon, 14 Nov 2022 09:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA65C433C1;
	Mon, 14 Nov 2022 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668416750;
	bh=D7WS1/Iq9HsSGiJfZeeNpWeUbfN2wCTKHRwR1waF5b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gu23KWX+hkd2VrW8L8cgRL+RvzQoNmHr4ZHYqyx7b9ggw62j+4gl+srj7mMWbYEWO
	 eMq9AeoWeTXuHN/JCWdPJOC4s9/SfymP7ivydCT3Rc5lzvj0XxUfCGvOXg+FUovve3
	 mBjFDbEU8fbv5pZjeBcZG4yoTG+UTWC2w0hMhrdGaf5jiuivlIjmg6M0icdu4BayDd
	 QORZ6I5Y6XZL3p7KDrZaQgns3WiyBQD5S5uJ7AJ3isJBuf/JmKGDVf410NdJ4z5Krb
	 lm/rhmS+2/v3szQ2Sg6geE8bZDNcFgYVQt+IzZj3PeuYYzaH8viYNnTeheDKRc95zq
	 VsYSZrpR3L72Q==
Date: Mon, 14 Nov 2022 09:05:34 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Maxime Ripard <maxime@cerno.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Lechner <david@lechnology.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-stm32@st-md-mailman.stormreply.com,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
Message-ID: <Y3IE3ta8hLLUcu7H@google.com>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
 <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
 <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
 <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010552_524881_E3E4F38D 
X-CRM114-Status: GOOD (  37.44  )
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

On Fri, 11 Nov 2022, Linus Walleij wrote:

> On Thu, Nov 10, 2022 at 2:05 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > > > hook, but doesn't provide a determine_rate implementation.
> > > > >
> > > > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > > > change the parent of a clock. However, the most likely candidate to
> > > > > trigger that parent change is a call to clk_set_rate(), with
> > > > > determine_rate() figuring out which parent is the best suited for a
> > > > > given rate.
> > > > >
> > > > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > > > used, and it doesn't look like there's any obvious user for that clock.
> > > >
> > > > If I recall correctly, that is the use case we did target for these
> > > > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
> > >
> > > Hm I am trying to get that driver to work ... from time to time.
> > > It's just that ALSA SoC DT has changed to much that it turns out
> > > into a complete rewrite :/
> > >
> > > So in sound/soc/ux500/mop500_ab8500.c
> > > I see this:
> > >
> > >         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
> > >         if (status)
> > > (...)
> > >
> > > and there is elaborate code to switch between "SYSCLK" and
> > > "ULPCLK" (ulta-low power clock). Just like you say... however
> > > a clock named SYSCLK or ULPCLK does not appear in the
> > > code in drivers/clk/ux500 or any DT bindings so... it seems to
> > > be non-working for the time being.
> >
> > It's definitely not working, but the corresponding clocks ("ulpclk",
> > "intclk", "audioclk", etc) are being registered in ab8500_reg_clks().
> >
> > What seems to be missing is a DT conversion for these clocks, so they
> > can be consumed properly. Right?
> 
> Yeps that and a few more things, I have a scratch rewrite here:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git/log/?h=ux500-audio-rewrite
> 
> I remember Lee said he had audio working with the mainline kernel
> on Snowball at one point, unfortunately I think that was before we
> started with the DT conversions and then we probably broke it.

That was also 100 years ago. :)

But yes, it used to work at one point.

-- 
Lee Jones [李琼斯]

