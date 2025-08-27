Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47DECA0FED
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Aug 2025 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEi4KHPE8AzGV7/VdtMwUpZTtWKTmsvl1cXRiwtTyD4=; b=FXzNY9Pa/Qt/mlF3rg+q/OZaB1
	cyYmTur83Lz/ovB4cEFsFZW0lF6tOuwunQAFYTZA7G/jrzdSn5X7O1MOJhL3S1z5vM9QXO2P2QMHC
	0USrCiY79hthhP7rpw3FEaMS2AJ3peSScRqbLTHWx8UcXSVWGgUKMUKzU3e9+I0ggLoFgVNuFycbv
	YDSAt8g7vGG7kczxCWCtx/8ApZLFDpPUTaOeOzGfZv76+qewgGhRliDMhZDBwprnewxL1u5NZKeel
	BQSLttWAzHmq+aU23MDBE8e31lY8fVLa+oZGpA9kL81ogOcmew3N0cv8lhFeBocFjusMqaNehQQQp
	FcF1Wj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIUF-0000000G4dK-10we;
	Wed, 27 Aug 2025 15:54:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGXn-0000000Fdbr-0g0A;
	Wed, 27 Aug 2025 13:50:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D431D2720;
	Wed, 27 Aug 2025 06:50:20 -0700 (PDT)
Received: from bogus (unknown [10.57.57.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11B23F694;
	Wed, 27 Aug 2025 06:50:11 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:49:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
Message-ID: <20250827-abstract-maize-tanuki-d1bdcb@sudeepholla>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
 <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
 <aK8EbcEHz3Yzpa1W@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK8EbcEHz3Yzpa1W@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_065031_274456_F47B4858 
X-CRM114-Status: GOOD (  31.65  )
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

On Wed, Aug 27, 2025 at 09:13:17AM -0400, Brian Masney wrote:
> On Wed, Aug 27, 2025 at 03:09:33PM +0800, Peng Fan wrote:
> > Hi Brian, Sudeep, Cristian
> > 
> > On Mon, Aug 11, 2025 at 11:19:44AM -0400, Brian Masney via B4 Relay wrote:
> > >From: Brian Masney <bmasney@redhat.com>
> > >
> > >This driver implements both the determine_rate() and round_rate() clk
> > >ops, and the round_rate() clk ops is deprecated. When both are defined,
> > >clk_core_determine_round_nolock() from the clk core will only use the
> > >determine_rate() clk ops, so let's remove the round_rate() clk ops since
> > >it's unused.
> > >
> > >Signed-off-by: Brian Masney <bmasney@redhat.com>
> > >---
> > > drivers/clk/clk-scmi.c | 30 ------------------------------
> > > 1 file changed, 30 deletions(-)
> > >
> > >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > >index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19c0f15f777bb8c51 100644
> > >--- a/drivers/clk/clk-scmi.c
> > >+++ b/drivers/clk/clk-scmi.c
> > >@@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > > 	return rate;
> > > }
> > > 
> > >-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > >-				unsigned long *parent_rate)
> > >-{
> > 
> > I see the point of round_rate is not used if determine_rate is there.
> > But reading the code of round_rate, It might be better to rename
> > scmi_clk_round_rate to scmi_clk_determine_rate.
> > 
> > Anyway, need Sudeep and Cristian to comment.
> 
> In this case, yes the round_rate implementation is filled out, whereas
> the determine_rate lets the firmware handle it, and
> scmi_clk_recalc_rate() will later populate the rate the clock is running
> at.
> 
> I can convert round_rate over to determine_rate in this case, however it
> would be a change to what's there now, and risks a regression. Here's
> the relevant code from drivers/clk/clk.c where the determine_rate and
> round_rate ops are called:

I am inclined towards this. Determine rate was added recently when the
clock parent support was added IIUC, so I don't think it should regress
anything.

> 
>     static int clk_core_determine_round_nolock(struct clk_core *core,
>                                                struct clk_rate_request *req)
>     {
>     	...
>             if (clk_core_rate_is_protected(core)) {
>                     req->rate = core->rate;
>             } else if (core->ops->determine_rate) {
>                     return core->ops->determine_rate(core->hw, req);
>             } else if (core->ops->round_rate) {
>                     rate = core->ops->round_rate(core->hw, req->rate,
>                                                  &req->best_parent_rate);
>     	...
> 
> If Sudeep / Cristian want the round rate converted to determine rate in
> this driver, then I can do that in a v2.
> 

Yes please. Also please post it independent if it doesn't have to be in
the series. To many in cc and lots of patches to respin all.

-- 
Regards,
Sudeep

