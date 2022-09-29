Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BezZ9X3pRnqrrIV5W4mU7Fm7+UpqXNw5Ne/wkJ2icbA=; b=0lhVQXm7efJ+PJtK92NAqQrjGK
	miX/rNtckPh/BL6UukbfZXFye1vXg8HhABoxY0qfOgxLqXbmIYgog8Fgl2+WjVKTt6UWNmy9+sduk
	SzfudM3aOWlqMHXcq82TJoIVY/9BuH0sXNs/ZFN+q9zGRkBdVJPBSSWtZuw0UAky60cSTSjLRdVyz
	WcdDuOv8he0Fr8l6nwgWusKx0YXRy2iJSLv0rW3Me55s1JkFUzTp8w8Lu00BkU5DWdPGhzU4lcvlZ
	3xEGn70YvptW5sV8LJAD19//Waw+LmDIBuArlM89nc4OM4tWYQHY5L1ug1Pzt0tFG7HDNrydeqITA
	l/gMZKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odtHI-003ApQ-JL; Thu, 29 Sep 2022 13:08:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odtGh-003AbZ-Nk; Thu, 29 Sep 2022 13:08:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0234A66022B2;
	Thu, 29 Sep 2022 14:07:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664456876;
	bh=RjlWLo52J1xNwaKPgALSVeCL23CVX4BxrRKCP/uj7qE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ASQJa+WfH5MA04whKpSPfFrM9asKFZ0w37qUq5KY6Vyn+4MSq5fxxwlNcDA9Eq3gn
	 MkwpQXOK1Y8utihd3I10ocrMrGYJu1fK+hOSs8fYHsaqv0/CZ3FgyU70jAV12vIrM4
	 ST7fBC8YXl6JllVli27C5pjGErQEv12Veos3SPbplvOhZJ59ZjytlqzPMA9MtCVd9m
	 ph8vIw/QLXuDzE4tKaAn5T6eVlagZD1mHu3W+MbNvJWQnWgTWsW9BtUbXiRRnQG3+C
	 rD7e5eWdG/iQlXRuzk4poiV6kwFJ3cKHE48yI/ukWccvExJITDhXgR/IcSWKG86tDz
	 5BzVdK7o/j/cQ==
Message-ID: <7dff6595-f3e1-5a2e-0a81-2f3bf1903f12@collabora.com>
Date: Thu, 29 Sep 2022 15:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/4] clk: mediatek: Export PLL operations symbols
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 kuan-hsin.lee@mediatek.com, yu-chang.wang@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220929114624.16809-1-johnson.wang@mediatek.com>
 <20220929114624.16809-2-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929114624.16809-2-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_060800_081649_D7899AD1 
X-CRM114-Status: GOOD (  26.22  )
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

Il 29/09/22 13:46, Johnson Wang ha scritto:
> Export PLL operations and register functions for different type
> of clock driver used.
> 
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-pll.c | 84 ++++++++++++++--------------------
>   drivers/clk/mediatek/clk-pll.h | 56 +++++++++++++++++++++++
>   2 files changed, 90 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 54e6cfd29dfc..a4eca5fd539c 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -27,37 +27,10 @@
>   
>   #define AUDPLL_TUNER_EN		BIT(31)
>   
> -#define POSTDIV_MASK		0x7
> -
>   /* default 7 bits integer, can be overridden with pcwibits. */
>   #define INTEGER_BITS		7
>   
> -/*
> - * MediaTek PLLs are configured through their pcw value. The pcw value describes
> - * a divider in the PLL feedback loop which consists of 7 bits for the integer
> - * part and the remaining bits (if present) for the fractional part. Also they
> - * have a 3 bit power-of-two post divider.
> - */
> -
> -struct mtk_clk_pll {
> -	struct clk_hw	hw;
> -	void __iomem	*base_addr;
> -	void __iomem	*pd_addr;
> -	void __iomem	*pwr_addr;
> -	void __iomem	*tuner_addr;
> -	void __iomem	*tuner_en_addr;
> -	void __iomem	*pcw_addr;
> -	void __iomem	*pcw_chg_addr;
> -	void __iomem	*en_addr;
> -	const struct mtk_pll_data *data;
> -};
> -
> -static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
> -{
> -	return container_of(hw, struct mtk_clk_pll, hw);
> -}
> -
> -static int mtk_pll_is_prepared(struct clk_hw *hw)
> +int mtk_pll_is_prepared(struct clk_hw *hw)
>   {
>   	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>   
> @@ -161,8 +134,8 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>    * @fin:	The input frequency
>    *
>    */
> -static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
> -		u32 freq, u32 fin)
> +void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
> +			 u32 freq, u32 fin)
>   {
>   	unsigned long fmin = pll->data->fmin ? pll->data->fmin : (1000 * MHZ);
>   	const struct mtk_pll_div_table *div_table = pll->data->div_table;
> @@ -198,8 +171,8 @@ static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
>   	*pcw = (u32)_pcw;
>   }
>   
> -static int mtk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> -		unsigned long parent_rate)
> +int mtk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +		     unsigned long parent_rate)
>   {
>   	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>   	u32 pcw = 0;
> @@ -211,8 +184,7 @@ static int mtk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>   	return 0;
>   }
>   
> -static unsigned long mtk_pll_recalc_rate(struct clk_hw *hw,
> -		unsigned long parent_rate)
> +unsigned long mtk_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>   {
>   	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>   	u32 postdiv;
> @@ -227,8 +199,8 @@ static unsigned long mtk_pll_recalc_rate(struct clk_hw *hw,
>   	return __mtk_pll_recalc_rate(pll, parent_rate, pcw, postdiv);
>   }
>   
> -static long mtk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -		unsigned long *prate)
> +long mtk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +			unsigned long *prate)
>   {
>   	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>   	u32 pcw = 0;
> @@ -239,7 +211,7 @@ static long mtk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>   	return __mtk_pll_recalc_rate(pll, *prate, pcw, postdiv);
>   }
>   
> -static int mtk_pll_prepare(struct clk_hw *hw)
> +int mtk_pll_prepare(struct clk_hw *hw)
>   {
>   	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>   	u32 r;
> @@ -273,7 +245,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>   	return 0;
>   }
>   
> -static void mtk_pll_unprepare(struct clk_hw *hw)
> +void mtk_pll_unprepare(struct clk_hw *hw)
>   {
>   	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>   	u32 r;
> @@ -301,7 +273,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>   	writel(r, pll->pwr_addr);
>   }
>   
> -static const struct clk_ops mtk_pll_ops = {
> +const struct clk_ops mtk_pll_ops = {
>   	.is_prepared	= mtk_pll_is_prepared,
>   	.prepare	= mtk_pll_prepare,
>   	.unprepare	= mtk_pll_unprepare,
> @@ -310,18 +282,15 @@ static const struct clk_ops mtk_pll_ops = {
>   	.set_rate	= mtk_pll_set_rate,
>   };
>   
> -static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
> -		void __iomem *base)
> +struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
> +					const struct mtk_pll_data *data,
> +					void __iomem *base,
> +					const struct clk_ops *pll_ops)
>   {
> -	struct mtk_clk_pll *pll;
>   	struct clk_init_data init = {};
>   	int ret;
>   	const char *parent_name = "clk26m";
>   
> -	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> -	if (!pll)
> -		return ERR_PTR(-ENOMEM);
> -
>   	pll->base_addr = base + data->reg;
>   	pll->pwr_addr = base + data->pwr_reg;
>   	pll->pd_addr = base + data->pd_reg;
> @@ -343,7 +312,7 @@ static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
>   
>   	init.name = data->name;
>   	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
> -	init.ops = &mtk_pll_ops;
> +	init.ops = pll_ops;
>   	if (data->parent_name)
>   		init.parent_names = &data->parent_name;
>   	else
> @@ -360,7 +329,22 @@ static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
>   	return &pll->hw;
>   }
>   
> -static void mtk_clk_unregister_pll(struct clk_hw *hw)
> +struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
> +				    void __iomem *base)
> +{
> +	struct mtk_clk_pll *pll;
> +	struct clk_hw *hw;
> +
> +	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
> +
> +	return hw;
> +}
> +
> +void mtk_clk_unregister_pll(struct clk_hw *hw)
>   {
>   	struct mtk_clk_pll *pll;
>   
> @@ -423,8 +407,8 @@ int mtk_clk_register_plls(struct device_node *node,
>   }
>   EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
>   
> -static __iomem void *mtk_clk_pll_get_base(struct clk_hw *hw,
> -					  const struct mtk_pll_data *data)
> +__iomem void *mtk_clk_pll_get_base(struct clk_hw *hw,
> +				   const struct mtk_pll_data *data)
>   {
>   	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>   
> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
> index fe3199715688..e87ab08eea9b 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -7,6 +7,7 @@
>   #ifndef __DRV_CLK_MTK_PLL_H
>   #define __DRV_CLK_MTK_PLL_H
>   
> +#include <linux/clk-provider.h>
>   #include <linux/types.h>
>   
>   struct clk_ops;
> @@ -20,6 +21,7 @@ struct mtk_pll_div_table {
>   
>   #define HAVE_RST_BAR	BIT(0)
>   #define PLL_AO		BIT(1)
> +#define POSTDIV_MASK	0x7

While moving this, can you please also fixup declaring this mask as GENMASK()?

#define POSTDIV_MASK	GENMASK(2, 0)

>   
>   struct mtk_pll_data {
>   	int id;
> @@ -48,10 +50,64 @@ struct mtk_pll_data {
>   	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>   };
>   
> +/*
> + * MediaTek PLLs are configured through their pcw value. The pcw value describes
> + * a divider in the PLL feedback loop which consists of 7 bits for the integer
> + * part and the remaining bits (if present) for the fractional part. Also they
> + * have a 3 bit power-of-two post divider.
> + */
> +
> +struct mtk_clk_pll {
> +	struct clk_hw	hw;
> +	void __iomem	*base_addr;
> +	void __iomem	*pd_addr;
> +	void __iomem	*pwr_addr;
> +	void __iomem	*tuner_addr;
> +	void __iomem	*tuner_en_addr;
> +	void __iomem	*pcw_addr;
> +	void __iomem	*pcw_chg_addr;
> +	void __iomem	*en_addr;
> +	const struct mtk_pll_data *data;
> +};
> +
> +

Please drop this extra newline.

Thanks,
Angelo

