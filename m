Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDC8CA0FE7
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mtiwDK4jWguygsxq9N8p1S8EGssFjVJjnvQOaAbf4g=; b=w6hANMGyvqQ8bBO9q4lYXx3ags
	EB281WBjBvIYn6QImw7iuQLGD+8HgbRWgvQDgkV63WtQaFtRrrVSqUEJs0l8Gw9YMUtK/Tnetq5ZN
	m1ZwjBZNmwVmE+p42QVazVQztCEB++wVGEWgvSrYP2ZT1HVghEzW+ZpgBAoCL5cg5OHmqIHKbLLZR
	k201bQKgQKIJHrfnpXrlPtRkamgKSF/JOeB5QYQLA6MS5CNoBUXMnTyRdSE4XKfUBjiEEAYecQz9d
	zMX+u1mH8AJBY9IzWRwcWt1VplVSIGum12SaxMy1HBhXFc6VcoBkXdmMl+5Ucsbs5QtVzbO1Mmwgk
	Yo+Tz+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqffA-00000009xE9-0UQE;
	Mon, 25 Aug 2025 22:27:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfbm-00000009wXy-3pZQ;
	Mon, 25 Aug 2025 22:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82F14434CE;
	Mon, 25 Aug 2025 22:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2B5C4CEED;
	Mon, 25 Aug 2025 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756160639;
	bh=C8dCcIKDdLsDA62THkA9YNFeAbhvDEtzivsFsYtysoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eFrzhgcpB4xSQ+04CnDToPC6BbaXLfZhYIA5I/BavZfky4LVkNeiBm33bKCwjfNMR
	 7Xb6TL3pLhbQUnBSeoZywHVCHtHEMtbySuCz757jR5LLWGzGIAWc2BOMQnJKu/GTDD
	 OqBmH7dyMmZk1RARABrqGFKsw9O9AnWfe1iHh5N4qj7JtCSjVfAJPlNBoDQzAapk03
	 krEs+vWhYgzabnk0EG5oW4LBwfNFqc1Pw+++S7/1krPhye3Fbxfwd3gAuIyFq598JK
	 pyPcrlbN+zCcku+7kEqoKnQ115oGGgQBsZT2rIXqlg87fc1FYNe8a8EqRPk1p8C1S+
	 DRCnOZhIQCHAQ==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
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
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
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
	Qin Jian <qinjian@cqplus1.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Brian Masney <bmasney@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com,
	linux-actions@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	soc@lists.linux.dev
Subject: Re: (subset) [PATCH 000/114] clk: convert drivers from deprecated round_rate() to determine_rate()
Date: Tue, 26 Aug 2025 06:23:38 +0800
Message-ID: <175616003525.79746.16402526303339008811.b4-ty@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_152410_991902_55B0C250 
X-CRM114-Status: GOOD (  11.85  )
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


On Mon, 11 Aug 2025 11:17:52 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.
> 
> This series is broken up into several categories:
> 
> [...]

Thanks, Applied to SpacemiT's SoC tree at "k1/clk-for-6.18" branch

[049/114] clk: spacemit: ccu_ddn: convert from round_rate() to determine_rate()
          https://github.com/spacemit-com/linux/commit/b4a7b0d2c4485d11d37dec721709660f3967efcf
[050/114] clk: spacemit: ccu_mix: convert from round_rate() to determine_rate()
          https://github.com/spacemit-com/linux/commit/56737edda7db58549550776092da12fe03600399
[051/114] clk: spacemit: ccu_pll: convert from round_rate() to determine_rate()
          https://github.com/spacemit-com/linux/commit/d02c71cba7bba453d233a49497412ddbf2d44871

Best regards,
-- 
Yixun Lan


