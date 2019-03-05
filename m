From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v5 7/9] clk: mediatek: Add configurable pcw_chg_reg to
 mtk_pll_data
Date: Tue, 5 Mar 2019 14:47:49 +0800
Message-ID: <1551768469.22671.5.camel@mtksdaap41>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com>
         <20190305050546.23431-9-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-9-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-03-05 at 13:05 +0800, Weiyi Lu wrote:
> In previous MediaTek PLL design, it assumes the pcw change control
> is always on the CON1 register.
> However, the pcw change bit on MT8183 was moved onto CON0 because
> the the PCW length of audio PLLs are extended to 32-bit.
> Add configurable pcw_chg_reg to set the pcw change control register
> address or using the default control register CON1 if without
> setting in pll data.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-by: James Liao <jamesjj.liao@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mtk.h |  1 +
>  drivers/clk/mediatek/clk-pll.c | 17 +++++++++++------
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 928905496c4b..37ae944548e9 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -221,6 +221,7 @@ struct mtk_pll_data {
>  	int pcwibits;
>  	uint32_t pcw_reg;
>  	int pcw_shift;
> +	uint32_t pcw_chg_reg;
>  	const struct mtk_pll_div_table *div_table;
>  	const char *parent_name;
>  };
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 67aaa3082d9b..65cee1d6c400 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -27,7 +27,7 @@
>  #define CON0_BASE_EN		BIT(0)
>  #define CON0_PWR_ON		BIT(0)
>  #define CON0_ISO_EN		BIT(1)
> -#define CON0_PCW_CHG		BIT(31)
> +#define PCW_CHG_MASK		BIT(31)
>  
>  #define AUDPLL_TUNER_EN		BIT(31)
>  
> @@ -51,6 +51,7 @@ struct mtk_clk_pll {
>  	void __iomem	*tuner_addr;
>  	void __iomem	*tuner_en_addr;
>  	void __iomem	*pcw_addr;
> +	void __iomem	*pcw_chg_addr;
>  	const struct mtk_pll_data *data;
>  };
>  
> @@ -122,7 +123,7 @@ static void __mtk_pll_tuner_disable(struct mtk_clk_pll *pll)
>  static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  		int postdiv)
>  {
> -	u32 con1, val;
> +	u32 chg, val;
>  	int pll_en;
>  
>  	pll_en = readl(pll->base_addr + REG_CON0) & CON0_BASE_EN;
> @@ -147,14 +148,14 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  	val |= pcw << pll->data->pcw_shift;
>  	writel(val, pll->pcw_addr);
>  
> -	con1 = readl(pll->base_addr + REG_CON1);
> +	chg = readl(pll->pcw_chg_addr);
>  
>  	if (pll_en)
> -		con1 |= CON0_PCW_CHG;
> +		chg |= PCW_CHG_MASK;
>  
> -	writel(con1, pll->base_addr + REG_CON1);
> +	writel(chg, pll->pcw_chg_addr);
>  	if (pll->tuner_addr)
> -		writel(con1 + 1, pll->tuner_addr);
> +		writel(val + 1, pll->tuner_addr);
>  
>  	/* restore tuner_en */
>  	__mtk_pll_tuner_enable(pll);
> @@ -329,6 +330,10 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
>  	pll->pwr_addr = base + data->pwr_reg;
>  	pll->pd_addr = base + data->pd_reg;
>  	pll->pcw_addr = base + data->pcw_reg;
> +	if (data->pcw_chg_reg)
> +		pll->pcw_chg_addr = base + data->pcw_chg_reg;
> +	else
> +		pll->pcw_chg_addr = pll->base_addr + REG_CON1;
>  	if (data->tuner_reg)
>  		pll->tuner_addr = base + data->tuner_reg;
>  	if (data->tuner_en_reg)
