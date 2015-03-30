From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/6] clk: mediatek: Add initial common clock support for
 Mediatek SoCs.
Date: Mon, 30 Mar 2015 20:31:38 +0200
Message-ID: <20150330183138.GG9742@pengutronix.de>
References: <1427737245-4064-1-git-send-email-s.hauer@pengutronix.de>
 <1427737245-4064-3-git-send-email-s.hauer@pengutronix.de>
 <1427738146.14276.20.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427738146.14276.20.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Mar 30, 2015 at 10:55:46AM -0700, Joe Perches wrote:
> On Mon, 2015-03-30 at 19:40 +0200, Sascha Hauer wrote:
> > This patch adds common clock support for Mediatek SoCs, including plls,
> > muxes and clock gates.
> 
> trivia:
> 
> > diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
> 
> > +static int mtk_cg_bit_is_cleared(struct clk_hw *hw)
> > +{
> []
> > +	return val == 0;
> > +}
> > +
> > +static int mtk_cg_bit_is_set(struct clk_hw *hw)
> > +{
> []
> > +	return val != 0;
> > +}
> 
> These functions may be better returning a bool

The return type of these functions is forced by function prototype in
struct clk_ops.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
