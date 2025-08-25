Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABCECA0FED
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhmTco/+pfZomsKPmTIqpbaNgvOB3vqm+YVy6eeXWTk=; b=txzXCtkrlOilnKsDeNj7Z47+K5
	1+JBptu8jw45ESgStSVJHOjPD5T4PeC+REx3GWUiF1VhwpuzMkfxqpNmHFVkDQ3c5rbKchSG8DyXn
	Zh2IE969yQHJsAy4qv/nTaF7BNJXzcESTg9hjF9B6tY0F4Srg58JwEOnACaBqgWgSro37Tcc0cBm4
	gmlxE2/EKVUyn1AC19aAIdBQoBuO6NlcRdtq1cVepnq0zb5v2YngRXLT/BI5JB8nii69ndfbEirS0
	SZmfZkisAHX7CvBzMJx9GyEY6ZGoL7W9NdL1dbRBB+MkSIX0bOXeWxHIhTo2BgLIfoRCYvh2hyLmX
	NK+KWQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXm-00000008Zx8-2rQO;
	Mon, 25 Aug 2025 15:55:39 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYwv-00000008Tyu-09hA;
	Mon, 25 Aug 2025 15:17:34 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 05C6212FB459;
	Mon, 25 Aug 2025 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1756135050; bh=1D+OO1Z+2hy3PuE7cQ3HZhhpy2c1X8740B+Ft/pujPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrW4njwdTos7Tr4D/hJWJfzXOiEf+SRDsAo4Ry/JJOyWw3h955TVHky0fTmZIMc6b
	 l6HICNWR7CusICgbxTme1oFf2gCXZ0ld9o3r6i+RPGR/fbOiERLbFTfKgGWXgrQsxZ
	 6tpMcjGI0yEaC2KCaMwFx16QGYsGVgEc2q7UhryAL7TuopvR9SP+oFRN9uZqDB87Oa
	 ZRJ64Oujs0ftwCrSLWRrMWSAgZUNvurIGuMkzqRAh9EeFQZTPOqJzJ7VcHnR2Uw9Dj
	 07MvAkU27F1Qxx+h3HKk0DSKuCRQ7v0QHfBj5pxg/8yHIT0c4AorBN9bGUK+uxQaG0
	 RyA+s94fkFtBg==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUnVeC3OP1Yt; Mon, 25 Aug 2025 08:17:28 -0700 (PDT)
Received: from ketchup (unknown [117.171.64.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 9CF6712FB435;
	Mon, 25 Aug 2025 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1756135048; bh=1D+OO1Z+2hy3PuE7cQ3HZhhpy2c1X8740B+Ft/pujPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbzP8DhBaP3scQswWTdz5ACYHQ4v/MZQMcqpn0puVv3NztnWZ9pb0nNcTuNgThLe6
	 UTWPEb4p9AoOb1GbiOYD7lF6F38zGqG/lgWkPfd9bKqI1XZJDIn4C4UJki7Lj7iYKB
	 MOL+BfMvxNc7F/jqvSgeLFL4tC6yjuuz2cvWV21gIOar+KZPS/n8KHH5XAaoqkPmrC
	 q+np6SgnoazpMdVzPSJaatTZSlIOov+HfEt0O6fh1/o/Gmnxhy288PLt8u6rkW0KUj
	 rFs299O5KC4mHBhvhdmvnTLT81m2MaYEUoztmIvwYua4Pp3hB/WkMuCgjNFsakwFXX
	 tkMsfI3899c5w==
Date: Mon, 25 Aug 2025 15:17:00 +0000
From: Haylen Chu <heylenay@4d2.org>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
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
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 049/114] clk: spacemit: ccu_ddn: convert from
 round_rate() to determine_rate()
Message-ID: <aKx-bEJr9uvYUZVA@ketchup>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-49-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-49-b3bf97b038dc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_081733_415054_FE1216C0 
X-CRM114-Status: GOOD (  20.96  )
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

On Mon, Aug 11, 2025 at 11:18:41AM -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/spacemit/ccu_ddn.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Haylen Chu <heylenay@4d2.org>

Thanks for cleaning it up, I should have done this when submitting the
driver.

Best regards,
Haylen Chu

> diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
> index be311b045698e95a688a35858a8ac1bcfbffd2c7..02b68ea84db9bd3ecdde41f8013c48263edbd917 100644
> --- a/drivers/clk/spacemit/ccu_ddn.c
> +++ b/drivers/clk/spacemit/ccu_ddn.c
> @@ -39,13 +39,16 @@ static unsigned long ccu_ddn_calc_best_rate(struct ccu_ddn *ddn,
>  	return ccu_ddn_calc_rate(prate, *num, *den);
>  }
>  
> -static long ccu_ddn_round_rate(struct clk_hw *hw, unsigned long rate,
> -			       unsigned long *prate)
> +static int ccu_ddn_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
>  {
>  	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
>  	unsigned long num, den;
>  
> -	return ccu_ddn_calc_best_rate(ddn, rate, *prate, &num, &den);
> +	req->rate = ccu_ddn_calc_best_rate(ddn, req->rate,
> +					   req->best_parent_rate, &num, &den);
> +
> +	return 0;
>  }
>  
>  static unsigned long ccu_ddn_recalc_rate(struct clk_hw *hw, unsigned long prate)
> @@ -78,6 +81,6 @@ static int ccu_ddn_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  const struct clk_ops spacemit_ccu_ddn_ops = {
>  	.recalc_rate	= ccu_ddn_recalc_rate,
> -	.round_rate	= ccu_ddn_round_rate,
> +	.determine_rate = ccu_ddn_determine_rate,
>  	.set_rate	= ccu_ddn_set_rate,
>  };
> 
> -- 
> 2.50.1
> 
> 

