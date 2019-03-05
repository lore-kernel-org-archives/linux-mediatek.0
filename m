From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v5 1/9] clk: mediatek: Disable tuner_en before change
 PLL rate
Date: Tue, 5 Mar 2019 14:42:25 +0800
Message-ID: <1551768145.22671.1.camel@mtksdaap41>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com>
         <20190305050546.23431-3-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-3-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-03-05 at 13:05 +0800, Weiyi Lu wrote:
> From: Owen Chen <owen.chen@mediatek.com>
> 
> PLLs with tuner_en bit, such as APLL1, need to disable
> tuner_en before apply new frequency settings, or the new frequency
> settings (pcw) will not be applied.
> The tuner_en bit will be disabled during changing PLL rate
> and be restored after new settings applied.
> 
> Fixes: e2f744a82d725 (clk: mediatek: Add MT2712 clock support)
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-by: James Liao <jamesjj.liao@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-pll.c | 48 ++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index f54e4015b0b1..18842d660317 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -88,6 +88,32 @@ static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
>  	return ((unsigned long)vco + postdiv - 1) / postdiv;
>  }
>  
> +static void __mtk_pll_tuner_enable(struct mtk_clk_pll *pll)
> +{
> +	u32 r;
> +
> +	if (pll->tuner_en_addr) {
> +		r = readl(pll->tuner_en_addr) | BIT(pll->data->tuner_en_bit);
> +		writel(r, pll->tuner_en_addr);
> +	} else if (pll->tuner_addr) {
> +		r = readl(pll->tuner_addr) | AUDPLL_TUNER_EN;
> +		writel(r, pll->tuner_addr);
> +	}
> +}
> +
> +static void __mtk_pll_tuner_disable(struct mtk_clk_pll *pll)
> +{
> +	u32 r;
> +
> +	if (pll->tuner_en_addr) {
> +		r = readl(pll->tuner_en_addr) & ~BIT(pll->data->tuner_en_bit);
> +		writel(r, pll->tuner_en_addr);
> +	} else if (pll->tuner_addr) {
> +		r = readl(pll->tuner_addr) & ~AUDPLL_TUNER_EN;
> +		writel(r, pll->tuner_addr);
> +	}
> +}
> +
>  static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  		int postdiv)
>  {
> @@ -96,6 +122,9 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  
>  	pll_en = readl(pll->base_addr + REG_CON0) & CON0_BASE_EN;
>  
> +	/* disable tuner */
> +	__mtk_pll_tuner_disable(pll);
> +
>  	/* set postdiv */
>  	val = readl(pll->pd_addr);
>  	val &= ~(POSTDIV_MASK << pll->data->pd_shift);
> @@ -122,6 +151,9 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  	if (pll->tuner_addr)
>  		writel(con1 + 1, pll->tuner_addr);
>  
> +	/* restore tuner_en */
> +	__mtk_pll_tuner_enable(pll);
> +
>  	if (pll_en)
>  		udelay(20);
>  }
> @@ -228,13 +260,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>  	r |= pll->data->en_mask;
>  	writel(r, pll->base_addr + REG_CON0);
>  
> -	if (pll->tuner_en_addr) {
> -		r = readl(pll->tuner_en_addr) | BIT(pll->data->tuner_en_bit);
> -		writel(r, pll->tuner_en_addr);
> -	} else if (pll->tuner_addr) {
> -		r = readl(pll->tuner_addr) | AUDPLL_TUNER_EN;
> -		writel(r, pll->tuner_addr);
> -	}
> +	__mtk_pll_tuner_enable(pll);
>  
>  	udelay(20);
>  
> @@ -258,13 +284,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>  		writel(r, pll->base_addr + REG_CON0);
>  	}
>  
> -	if (pll->tuner_en_addr) {
> -		r = readl(pll->tuner_en_addr) & ~BIT(pll->data->tuner_en_bit);
> -		writel(r, pll->tuner_en_addr);
> -	} else if (pll->tuner_addr) {
> -		r = readl(pll->tuner_addr) & ~AUDPLL_TUNER_EN;
> -		writel(r, pll->tuner_addr);
> -	}
> +	__mtk_pll_tuner_disable(pll);
>  
>  	r = readl(pll->base_addr + REG_CON0);
>  	r &= ~CON0_BASE_EN;
