Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95565C5DF87
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvXny4Uzt3tUYS9bpKHRNKA1xycDne4ixBPlCcMH+lk=; b=bQo13VuKzzJF9BhACQREBiwp7I
	0yD3qGahWM6ZkaoK6Lh3kU53PSWieRQP63KY7wjz/DrrIlyE8uu+YJnceeWJqr+kTe2GYEd6oo72I
	Qv7RB8wKtoWGbvDMLSeer8T19TulvgTExH/4SANH5DoYZTB1zciq/CTffXtfm6FPgOJgmTnIC9QiY
	drtM8jAC7DaGmifQPcNrN63/fumeXbOf3ORk7NrdNY1ZojEfdBSvpr7OOkGCXMNwYVrBBp9jOiWcC
	CvDIzTbxNEC0fxcejlRRu3rNs1fpHfkNwcaJ8OdsTHnIYewU8N3LCsUwW9ilMi2fhlvUAZvlPD+Pw
	MA7EXD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNRE-0000000DBsh-2IsX;
	Fri, 21 Aug 2026 11:29:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNRC-0000000DBsG-1XtR
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 11:29:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A904F165C
	for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 04:29:25 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55C953F763
	for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 04:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787311769; bh=rReboDtVWR+LchIn66VCIiRA4RrsNZEU4pEK04rnFMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhnclExCvn8RSb9jmyrbu6n5rFUHQhBKclqpY0k+grwY7M1gsB6pmIu+0GkBEMPK+
	 /CsSfUP2GvON5x7fYYhArgKFgvFbA5+lvJtjr3Kp5wTdrJoJiTkI8wn3UaNIfpsjDe
	 xpOaICW9HKymZNCzycdj7VidPzcYStz83SoAG4ko=
Date: Fri, 21 Aug 2026 12:28:01 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 40/45] clk: versatile: Make sure clk_init_data is fully
 initialized
Message-ID: <aog2QXT_86BrtvTs@e142607>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <7c480e73222bb51982fb82dc0cc6cd503f2e8b92.1787239813.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c480e73222bb51982fb82dc0cc6cd503f2e8b92.1787239813.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_042930_517077_E718DF85 
X-CRM114-Status: GOOD (  24.63  )
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

On Fri, Aug 21, 2026 at 10:53:50AM +0200, Geert Uytterhoeven wrote:
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Compile-tested only.
> ---
>  drivers/clk/versatile/clk-icst.c         | 2 +-
>  drivers/clk/versatile/clk-sp810.c        | 2 +-
>  drivers/clk/versatile/clk-vexpress-osc.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
> index 6bd3db54dd229d28..97a1bfd6cf0ed995 100644
> --- a/drivers/clk/versatile/clk-icst.c
> +++ b/drivers/clk/versatile/clk-icst.c
> @@ -360,8 +360,8 @@ struct clk *icst_clk_setup(struct device *dev,
>  {
>  	struct clk *clk;
>  	struct clk_icst *icst;
> -	struct clk_init_data init;
>  	struct icst_params *pclone;
> +	struct clk_init_data init = {};
>  
>  	icst = kzalloc_obj(*icst);
>  	if (!icst)
> diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
> index b0e69686f7a9a93e..28e5c0cf1fda38e4 100644
> --- a/drivers/clk/versatile/clk-sp810.c
> +++ b/drivers/clk/versatile/clk-sp810.c
> @@ -86,7 +86,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
>  	const char *parent_names[2];
>  	int num = ARRAY_SIZE(parent_names);
>  	char name[12];
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	static int instance;
>  	int i;
>  	bool deprecated;
> diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
> index 9adbf5c33bd1cada..72e872ec6b7c9b47 100644
> --- a/drivers/clk/versatile/clk-vexpress-osc.c
> +++ b/drivers/clk/versatile/clk-vexpress-osc.c
> @@ -64,7 +64,7 @@ static const struct clk_ops vexpress_osc_ops = {
>  
>  static int vexpress_osc_probe(struct platform_device *pdev)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	struct vexpress_osc *osc;
>  	u32 range[2];
>  	int ret;
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

