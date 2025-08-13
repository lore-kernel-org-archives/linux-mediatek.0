Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9DACA0EE0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Aug 2025 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeW3w+muABU56lk8AynPRRMO7XtEP4qDrJkq+5Lwhw0=; b=sYg1z0upq9RputtxlcdkWAd41C
	EmuXDF68L+kqR7jOtdbMFpT2S8LrhkHmfJnguJWBfmFiCcaN0U6rD9KSYekeluq6lQqar0rj2B4L8
	0VUpeHn30yG7jNmCJNGQQBExsbGKCSFZFgiPfCySPiYvs2Q5qG6OZ59Ov+lIRPzD0vz+W/tmDtA2c
	dLGGp0GIxiPbo+gL6U1TnRjj1tPahjqQ66+Ix0aO8DqHAHNvpX/ouMG7fg1d+x20vij1l5iU0K6kD
	f3KKsqqa1YOn/VDRuBDPVcDSXhGGRKB3thJCtzEiHtiIJz01oDNUCPE38VRgnVC/T2Adcfk5/1Ooo
	au/iKFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7Sp-0000000DBW6-1SlZ;
	Wed, 13 Aug 2025 09:08:07 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7Sm-0000000DBUq-3KPJ;
	Wed, 13 Aug 2025 09:08:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9806843283;
	Wed, 13 Aug 2025 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755076079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeW3w+muABU56lk8AynPRRMO7XtEP4qDrJkq+5Lwhw0=;
	b=RBcxly02YqHg6yIG6IVGb6L0wWxwyXgbzexV7fz5MW/s00R1yXLzqz8R0Q4Hp6XCzFEgKy
	aJQuxXVY2VuM3LcR+HuKLiDTJxPk7hPeIic299sk4PSxG2ekcA+2ZeJQZ9DJMqGpdiEK55
	dlmn2pZocXR5RTpeMH7mXYpDsa1p5LBc6yeLbl5BB9RJI44aKGy2UdQyipWgEiGweTT6Zs
	yKZjMHYwq/2e6TLrhQ1n/5tSh0xMWWU8ZMi+8EvpkTaKYRbcurnOinRJ6WojpOPIpt9hGK
	EGL3JqryRCMP/IrQCvVCa6eDAFIGmMSS2+OxScw07Z8iZPtIZg8PP1xYwoncfg==
Date: Wed, 13 Aug 2025 11:07:45 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Cc: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Alex Helms
 <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 106/114] clk: versaclock5: convert from round_rate() to
 determine_rate()
Message-ID: <20250813110745.63523645@booty>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-106-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	<20250811-clk-for-stephen-round-rate-v1-106-b3bf97b038dc@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeehffejffekudfhkeeklefgjeeuheekffelheejgfeijeehieelkedttdfhjedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkeelpdhrtghpthhtohepuggvvhhnuhhllhdosghmrghsnhgvhidrrhgvughhrghtrdgtohhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsmhgrshhnvgihsehrvgguhhgrthdrtghomhdprhgtphhtthhopehmthhurhhqu
 hgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtoheptghrihhsthhirghnrdhmrghruhhsshhisegrrhhmrdgtohhmpdhrtghpthhtohepuhhnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtohepihhnohgthhhirghmrgesghhmrghilhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_020804_970707_3056456E 
X-CRM114-Status: GOOD (  10.15  )
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

On Mon, 11 Aug 2025 11:19:38 -0400
Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

