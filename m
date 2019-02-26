From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 01/12] clk: mediatek: Disable tuner_en before change
 PLL rate
Date: Tue, 26 Feb 2019 16:59:30 +0100
Message-ID: <41aed6f5-8794-ddf5-d5c2-17ee82e33db3@gmail.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com>
 <20190201083016.25856-3-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190201083016.25856-3-weiyi.lu@mediatek.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



On 01/02/2019 09:30, Weiyi Lu wrote:
> From: Owen Chen <owen.chen@mediatek.com>
> 
> PLLs with tuner_en bit, such as APLL1, need to disable
> tuner_en before apply new frequency settings, or the new frequency
> settings (pcw) will not be applied.
> The tuner_en bit will be disabled during changing PLL rate
> and be restored after new settings applied.
> Another minor change is to correct the macro name of pcw change bit
> to CON1_PCW_CHG because PCW_CHG(BIT31) is on CON1.
> 
> Fixes: e2f744a82d725 (clk: mediatek: Add MT2712 clock support)
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index f54e4015b0b1..f0ff5f535c7e 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -27,7 +27,7 @@
>  #define CON0_BASE_EN		BIT(0)
>  #define CON0_PWR_ON		BIT(0)
>  #define CON0_ISO_EN		BIT(1)
> -#define CON0_PCW_CHG		BIT(31)
> +#define CON1_PCW_CHG		BIT(31)
>  
>  #define AUDPLL_TUNER_EN		BIT(31)
>  
> @@ -93,9 +93,31 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  {
>  	u32 con1, val;
>  	int pll_en;
> +	u32 tuner_en = 0;
> +	u32 tuner_en_mask;
> +	void __iomem *tuner_en_addr = NULL;
>  
>  	pll_en = readl(pll->base_addr + REG_CON0) & CON0_BASE_EN;
>  
> +	/* disable tuner */
> +	if (pll->tuner_en_addr) {
> +		tuner_en_addr = pll->tuner_en_addr;
> +		tuner_en_mask = BIT(pll->data->tuner_en_bit);
> +	} else if (pll->tuner_addr) {
> +		tuner_en_addr = pll->tuner_addr;
> +		tuner_en_mask = AUDPLL_TUNER_EN;
> +	}
> +
> +	if (tuner_en_addr) {
> +		val = readl(tuner_en_addr);
> +		tuner_en = val & tuner_en_mask;
> +
> +		if (tuner_en) {
> +			val &= ~tuner_en_mask;
> +			writel(val, tuner_en_addr);
> +		}
> +	}
> +

Why don't we use a flag here, it would make the code easier to understand.
I think it would also help if you put this code in a separate function.

Regards,
Matthias


>  	/* set postdiv */
>  	val = readl(pll->pd_addr);
>  	val &= ~(POSTDIV_MASK << pll->data->pd_shift);
> @@ -116,12 +138,19 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  	con1 = readl(pll->base_addr + REG_CON1);
>  
>  	if (pll_en)
> -		con1 |= CON0_PCW_CHG;
> +		con1 |= CON1_PCW_CHG;
>  
>  	writel(con1, pll->base_addr + REG_CON1);
>  	if (pll->tuner_addr)
>  		writel(con1 + 1, pll->tuner_addr);
>  
> +	/* restore tuner_en */
> +	if (tuner_en_addr && tuner_en) {
> +		val = readl(tuner_en_addr);
> +		val |= tuner_en_mask;
> +		writel(val, tuner_en_addr);
> +	}
> +
>  	if (pll_en)
>  		udelay(20);
>  }
> 
