Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531BBC5DF9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEMIXlW7UB4hHdDf5XWpYKY9mKhf7DDvl0I5DYYVcWI=; b=nOzsKegjwB6kOcy0yAunHJIrFO
	7r6EvNleZW5ubEMv7oD2Qb+j8RwSWDF6w6STvBT7qHXAEz0ADKXP4GQxM3F/4OF4EnPWb6qmxy0LM
	Bp4AedyDqmNH3+dk+dsePMLK+82z2SsjD8FR9qT9d7kY6W0DjCUD2/Z7oX3l8LErdc9aWAa8ONY6k
	trRdF13eA4DbLY97KifJjy8W9FUWZsWLvEwtyUlwvItqTm+32Hcvp79JUCXAN8tjs0mBJFI/1Xt8h
	hs/v3XeD76FD5+HH/jKDL9M95/f6PzB/8n00PZGYuwejf0q8LM1cPZPq31bBrAVRysYK9EXxcKV5x
	T21T5Zeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybWF-0000000HNbi-37NK;
	Mon, 24 Aug 2026 20:43:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybWF-0000000HNbR-0mvX
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 20:43:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8504943D34
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 20:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340A51F01567
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 20:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787604226;
	bh=LEMIXlW7UB4hHdDf5XWpYKY9mKhf7DDvl0I5DYYVcWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nMOOR726iilXzB8QwTQCM71Ch8G02Vaajd2yCMS4m+O5Esok3z5r0gV3VttHfuCHb
	 4g2AVRstZRMVo0Y6IUYR3j6owkp/ou4a00Y2jiJj33Ircz9/0ZpfuUV/cRNDW+23QA
	 1GluzBOVjcse336a1OdBAHZT0wEvicCM/X7+pFIs19JxWLEeAHFX5XHwBkJOCMnYSD
	 7EecCoxv1MdHvEeVrFiBCP2J2hmtiUbnaXyV6jAhIcHSP+Hj2REll4VSXfnTULnFm4
	 epNc025JmInkZuyFP/+OYoPczOeQmlLrLlbyatcAst3s47t2gWtNNzp5Yr+0MydxwS
	 v3L7qXsOPK1hg==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7ee4399c423so3714176a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 13:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZQVMsiKk+Wox0omMBtSmQ1J881TMJqwzJMsmGIs+uMScI22TfZfvM5/6rm+PPPIDA6ePLb4Ip5coVKIjwIQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k9Q6i6XjOjFWbh4gt1aA2DL/8x2MgsmjFBmsmm6ubd4T+hrrwL
	MuaG3fcBkNQrFHHiCNrIYiK6eY6sH37edAycfA5BlL3PgDq2fES713Kfvd5QMgQjb/4DF26ARsE
	2pcbTKP7Sb3wnFLcj4T2WQGNReLMMuR4=
X-Received: by 2002:a05:6820:200b:b0:6b0:4fbc:aecf with SMTP id
 006d021491bc7-6b190476525mr1271968eaf.24.1787604225387; Mon, 24 Aug 2026
 13:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <7c480e73222bb51982fb82dc0cc6cd503f2e8b92.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <7c480e73222bb51982fb82dc0cc6cd503f2e8b92.1787239813.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 24 Aug 2026 22:43:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBhKLYHeK8-oHfUO1tEyz4TjwxHJgGYANRgtFunc=AYA@mail.gmail.com>
X-Gm-Features: AcwNN1XWcFJ59Pf1hWO2vZEK8dV4kl2H2cgk-aSr89WZDKQWMFn5rql_SFN6T_E
Message-ID: <CAD++jLkBhKLYHeK8-oHfUO1tEyz4TjwxHJgGYANRgtFunc=AYA@mail.gmail.com>
Subject: Re: [PATCH 40/45] clk: versatile: Make sure clk_init_data is fully initialized
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

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

