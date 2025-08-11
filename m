Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7FDCA0EDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qbjd010BJhmH9ZDN3pJec/1rIrhnyz6/vYc8kP/j23s=; b=z1ELO7ijqc9ZR1hJRpi+cqs0mr
	V0awxix6aAR0ylF5bFj44Difbl9+oajOOomgVfodCs/jRLpOjQKZSxS3J1fD8iaTkDXBwqhG5dLLp
	c0UJlnEEJUXDmg4m26bfBWeGqfIQFIWFyzLKlJMM+a4gBUEuuOoXRDnBn7vk6uT2ki1cIkSHcQd2+
	dTL/P81gwL0AFY8lBQQiOvd8vfuTXn4P13wEGbfAg+P4YLzxg1i4mG+i5ugH++zDmD1Ve1Gw2DBd3
	Ngpa7UquFvOLy4r7lZZ7qtTga70r+QPocqofpU5RJmS2eVAtUHVq54frOB+6jzCX2kdcuAafewSoN
	8s6ctRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXVg-00000008p54-3k2v;
	Mon, 11 Aug 2025 18:44:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUxM-00000008JYG-01yL;
	Mon, 11 Aug 2025 16:01:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C994450E8;
	Mon, 11 Aug 2025 16:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A6AC4CEED;
	Mon, 11 Aug 2025 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928062;
	bh=Mt5Z9iaxEJqunSSWFhe3foZePTxEE32AzKMZx3Qr8RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyiP+pGKfJHAHSCkg/AuFQl20aYOw9VY+sW09ZDqrRnXl3qhO6kW3xwjReBD5Z32U
	 rc5u4QiD9di8rs5Y26pPKqgz3ObtPPTdetcOMRnY4L3JBnCvV8biR9qNn6DSikeOF7
	 VhE5sUJSpEKSYYri6ra4/Vt6YfnG4ukgWhyQSV/dITF7k1RhjSrtVsfcRLEij9Eys6
	 q9OGM68dgjgR0McTiVcrG5fpKLeSFSRz3ApxW9cooonoB2N5qjQ2mVUArcBqG3wBQ8
	 ehA3INw6J09SgYdPezVfIC1CQjP1rhvwV1/tDG6KwuSpPtIw0jol1Ml6Et91NjCKhR
	 E8uC2ag7Nqdxw==
Date: Mon, 11 Aug 2025 21:30:30 +0530
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
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <3rhp73jjlpcoutaj56pjhrjtjxugf2nghiygax6s3n47biwfr7@pdk5zorat5dh>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090104_087237_5B5873EA 
X-CRM114-Status: GOOD (  25.04  )
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

On Mon, Aug 11, 2025 at 11:17:52AM GMT, Brian Masney via B4 Relay wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.
> 
> This series is broken up into several categories:
> 
> - Patch 1 to clk/at91/peripheral is a bug fix for a return value.
> 
> - Patch 2 to clk/at91/peripheral wasn't straight forward like the other
>   drivers, so I'm explicitly calling this one out separately.
> 
> - Patch 3 adds a determine_rate() op and keeps the round_rate() in place
>   since this is needed by drivers/clk/actions/owl-composite.c and keeps
>   the tree bisectable. The deprecated round_rate() op is dropped in patch
>   113.
> 
> - Patches 4-70 are for drivers where there is no clk submaintainer
>   listed in the MAINTAINERS file. Patch 19 includes a minor fix so that
>   Coccinelle can be ran against a particular source file.
> 
> - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
>   for the driver.
> 
> - Patches 111-114 are for drivers that implement both round_rate() and
>   determine_rate(), so the round_rate() implementation is dropped.
> 
> Once all of my conversion patches across the various trees in the kernel
> have been merged, I will post a small series that removes the
> round_rate() op from the clk core and the documentation. Here's the
> other patch series that are currently in flight that need to be merged
> before we can remove round_rate() from the core.
> 

Please do not CC all reviewers/maintainers of individual clock controller
drivers to all patches, but only to the respective clock controller patches.
It just spams our inbox. CCing all of us in the cover letter is fine though.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

