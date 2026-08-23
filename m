Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8479C5DF81
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2026 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz9a2/4b0H2hGIuQcX4i4J6vhXjz7a1tVe8/vJ1mK5k=; b=G1SZNgYnYPOA5CaQMkPlDT3cye
	XJgzl4GCFOOP5/r69XHsNpKjb4aT+nPGmGO7/jXft1quGOFYmLhiV+frNjCCkD2tEhokPh0uUZhmn
	TUti7GFm7jwIqaQ42pEFAwZKqKnexXV1UE9l1jzqOVK+DTRwi/uMQujTi9g0iGpMbcXyMiZ8wpGRU
	RO8OIIFxUxItAM7q4fp3rzXE+mdrplIivMvqOuLQEyGn6MbY/Mx35WjlQevXafDYOfy13RTskoFSo
	rQ5++cXFOKLpfENQWDFnayPLk9azlPAL3E1XuPwSGYQkWRHuRYWPzOxdlscuq6QCOUqycrCm4wjXm
	rdegK8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEqa-0000000FbDG-3SQ8;
	Sun, 23 Aug 2026 20:31:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEqX-0000000FbCp-1alD
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Aug 2026 20:31:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 944CB44044
	for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2026 20:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797211F0155C
	for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2026 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787517070;
	bh=Hz9a2/4b0H2hGIuQcX4i4J6vhXjz7a1tVe8/vJ1mK5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z9SR/CDW2+RChZ3knjritt88WVf6xuW1xAcW5680A4MsxFF1qx3Cyc2rapAylHwmY
	 i01kHvJ/Qt8Az6ftSP9Wlfop6xlECrhrEo73TxjT0/f/TMQve4hcix+HMncPTM1HJF
	 PaB7k9Vh9OJ+gqrSWVZQTIzVw2l2P5vSW5Kxn344fH7uIP+cOEvTizQYaQ/F5cUzA7
	 p+sPgYQkVyJ1IO3DrZBKDbMjn5pO1E6mwMBR6s32rJgu0EpbBk5Sz2CzP916HdHBSq
	 EsQUo4o2t5BYNwQt0xwWwIZl0XHOiTkx56XOJJ9rE7ywoOqP3O2l4SCAosPzB/PYLc
	 Yuaa9lHQxDn9A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so4799015e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2026 13:31:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrxQz7C1eq9Qd68POiPjy6TPWj1mLHd+LdADwU+0+g1ySjI6pxCflo68L8IlMnhPiSwUqDzP/3p/qCTy4D6nA==@lists.infradead.org
X-Gm-Message-State: AFuF++k3lE/mIg4Bxw4dM5RPFVoooiiRLgmybpPHEhDzq2sbr2acyJjo
	yRLdUoY5PN2AWld+ritWZSYH9lGJT0/gL4xxXoHlxH9J6wLCDzzyYTutPnYX8rrZsWqhzW6djF+
	Nk1S8VSLJWXDS8pz41tnarIAvKekmyic=
X-Received: by 2002:ac2:51c5:0:b0:5b3:12b1:be93 with SMTP id
 2adb3069b0e04-5b484736c8amr4269481e87.0.1787517068028; Sun, 23 Aug 2026
 13:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 23 Aug 2026 22:30:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLkYE8Fh_HpKPYjL0-ksVQA8f_iLRFNkPU5Jvq+ihay5ww@mail.gmail.com>
X-Gm-Features: AcwNN1U1aXPtuwFV8knvjn18BtYzZuPH0iZTVosQkZ_l23SVekgfIt7U_k24f4g
Message-ID: <CAD++jLkYE8Fh_HpKPYjL0-ksVQA8f_iLRFNkPU5Jvq+ihay5ww@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 21, 2026 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

OK I trust you on this one:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

