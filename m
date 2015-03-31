From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 2/6] clk: mediatek: Add initial common clock support for Mediatek
 SoCs.
Date: Mon, 30 Mar 2015 18:21:18 -0700
Message-ID: <20150331012118.7930.69028@quantum>
References: <1427737245-4064-1-git-send-email-s.hauer@pengutronix.de>
 <1427737245-4064-3-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427737245-4064-3-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

Quoting Sascha Hauer (2015-03-30 10:40:41)
> +static void mtk_pll_set_rate_regs(struct clk_hw *hw, u32 pcw,
> +               int postdiv)
> +{
> +       struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +       u32 con1, pd, val;
> +       int pll_en;
> +
> +       /* set postdiv */
> +       pd = readl(pll->pd_addr);
> +       pd &= ~(0x7 << pll->data->pd_shift);

Hi Sascha,

I found a couple of magic numbers in here. Can we replace these with
some descriptive constant?

Regards,
Mike
