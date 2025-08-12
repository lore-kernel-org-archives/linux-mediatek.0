Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F6ECA0EC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QR5Rwk5xYJiAVFY+3V9RxtdNdC7oDybFHY7DxZwFtg=; b=qhRlnVhGargQE2AemtZxoB6t6Z
	G4IOzJK2xMijflEG84j2o6SspsLLIaGLdj3/il8fCg2ZSHgs6FcEAeLeybD/KUcp2WQg9eDAd4eqp
	y/WT1t77AQ/CgkAWkwJhj9/+nNs0EYKkG1Jy6ZNvR+2XmMYQLurT8xz9/SJhGOqpaC77XPtiOt3fq
	yUZ/rmgF8rfsvt6sbJnDR5yf1bfN9IDER832o9W7l0X4yKI1gj+8Nzr2DvApnSBEdAZqDqiB55lUC
	JXNQZwdTJBsrsLI6M0UGMugvb2pDG2Q4EDZ7qnn1PC1EmEFtgjzRZJGM6E3jZ8CZjyp6qUN+XZq2f
	c4l9OhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluan-0000000Bn3d-2Jas;
	Tue, 12 Aug 2025 19:23:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulr5m-0000000BBQo-1sh0;
	Tue, 12 Aug 2025 15:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C95534433E;
	Tue, 12 Aug 2025 15:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284FDC4CEF0;
	Tue, 12 Aug 2025 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755013153;
	bh=iGUpF1C71k7qo9/61ohvQv5Z7z5laJQcZjUsXmHz/vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiZpRdpDhra8HQLi6oTJvzINkJJSuv23n4QKhmL0GdIDFfOjMCDM1OqYhcWHHq3TI
	 L28O5b3iPN5wVc9EXSMe1wiMP/NajukL3ql7pF4a85lv1fNAUZsV+TlMAAvN2rrzmr
	 wRMnMSseO6nd8/EPTJY79HOmJ9zeY5vY0LS0u24hUa3icUGD8uDqDLMHMPTvWLEQv1
	 l7Tw7lcXGU5Rs7ZD4eklupowdOLUecuU8uOFa6RlUoRtZfGlD+/8Ge0Ca3RaSQaoYZ
	 h2ClWJH1Q8I12fZ++utjNSDaO59Bx51zYgkj3Rxo8YY8S6cPtFbxYBa0hRIu+GN5Me
	 k5jWalHFpopnQ==
Date: Tue, 12 Aug 2025 21:08:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 079/114] clk: bm1880: convert from round_rate() to
 determine_rate()
Message-ID: <tcl4eqicuqcptnbo4mcvjhacxkh2gh344k2bdrwfjbqflxspy7@x24np6pxjacf>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-79-b3bf97b038dc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_083914_530348_16EF596B 
X-CRM114-Status: GOOD (  22.13  )
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

On Mon, Aug 11, 2025 at 11:19:11AM GMT, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 

Once this patch gets merged, the 'Coccinelle semantic patch on the cover letter
of this series' becomes irrelevant. I'd suggest to either include the script
here or do not mention it at all.

- Mani

> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk-bm1880.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
> index 002f7360b1c6c6e3058606a0808115b48fd3147a..dac190bc6e19a6dd4be413ea52d41f74934a1aa9 100644
> --- a/drivers/clk/clk-bm1880.c
> +++ b/drivers/clk/clk-bm1880.c
> @@ -608,8 +608,8 @@ static unsigned long bm1880_clk_div_recalc_rate(struct clk_hw *hw,
>  	return rate;
>  }
>  
> -static long bm1880_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -				      unsigned long *prate)
> +static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
>  {
>  	struct bm1880_div_hw_clock *div_hw = to_bm1880_div_clk(hw);
>  	struct bm1880_div_clock *div = &div_hw->div;
> @@ -621,13 +621,18 @@ static long bm1880_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
>  		val = readl(reg_addr) >> div->shift;
>  		val &= clk_div_mask(div->width);
>  
> -		return divider_ro_round_rate(hw, rate, prate, div->table,
> -					     div->width, div->flags,
> -					     val);
> +		req->rate = divider_ro_round_rate(hw, req->rate,
> +						  &req->best_parent_rate,
> +						  div->table,
> +						  div->width, div->flags, val);
> +
> +		return 0;
>  	}
>  
> -	return divider_round_rate(hw, rate, prate, div->table,
> -				  div->width, div->flags);
> +	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> +				       div->table, div->width, div->flags);
> +
> +	return 0;
>  }
>  
>  static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -665,7 +670,7 @@ static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  static const struct clk_ops bm1880_clk_div_ops = {
>  	.recalc_rate = bm1880_clk_div_recalc_rate,
> -	.round_rate = bm1880_clk_div_round_rate,
> +	.determine_rate = bm1880_clk_div_determine_rate,
>  	.set_rate = bm1880_clk_div_set_rate,
>  };
>  
> 
> -- 
> 2.50.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

