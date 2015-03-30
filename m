From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/6] clk: mediatek: Add initial common clock support for
 Mediatek SoCs.
Date: Mon, 30 Mar 2015 10:55:46 -0700
Message-ID: <1427738146.14276.20.camel@perches.com>
References: <1427737245-4064-1-git-send-email-s.hauer@pengutronix.de>
	 <1427737245-4064-3-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427737245-4064-3-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2015-03-30 at 19:40 +0200, Sascha Hauer wrote:
> This patch adds common clock support for Mediatek SoCs, including plls,
> muxes and clock gates.

trivia:

> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c

> +static int mtk_cg_bit_is_cleared(struct clk_hw *hw)
> +{
[]
> +	return val == 0;
> +}
> +
> +static int mtk_cg_bit_is_set(struct clk_hw *hw)
> +{
[]
> +	return val != 0;
> +}

These functions may be better returning a bool

> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
[]
> +struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
> +{
[]
> +	for (i = 0; i < clk_num; ++i)
[]
> +void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> +		struct clk_onecell_data *clk_data)
> +{
> +	for (i = 0; i < num; i++) {

Please use consistent postfix ++ style
