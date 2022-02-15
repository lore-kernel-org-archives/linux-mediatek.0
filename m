Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E1DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7UPODXm9KTc69DAfwmNXzXDI+uHjvL3WXIbk0MXaio=; b=p8f56saAOhw8T7
	+D7pSPULtFIBnUPxMJUuq+ycR8/fpholEMheLY58rPgiK2RZDKGJ3Oj0k65yAJvAHtVqFBr4Uc1Uj
	99Ks0Xx4t/2wqcOJ9VO9BGLMIQF9FW7CNcKCEIkX+/KCxsE0R0I9QXnyPu9n2dyFOWkM+i7kCulg6
	1+BVSGdeMU35T8UwbKBS0gus319dD7o6zmHY8TzsGfIGp6cJ14Bd9N3M14MZfqJaTGFeyeNMtqv5o
	ks19r4O8ajvgsdtYSegEBBbZsb2fDS1u5xwrMduf030Q/yhFMDEho4cE6ZKrCTYUeZXsnbBsZ77Xm
	s7YAoZoSaAvYXpzRJXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrCJ-000aEn-8D; Tue, 15 Feb 2022 06:20:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrC5-000a7J-ID; Tue, 15 Feb 2022 06:20:11 +0000
X-UUID: 68a718639c3149d794442a111b4df886-20220214
X-UUID: 68a718639c3149d794442a111b4df886-20220214
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1301164393; Mon, 14 Feb 2022 23:20:04 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:20:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 14:20:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:20:01 +0800
Message-ID: <e4c71a67d682e4f8f6234651871afc5b36ebf1c6.camel@mediatek.com>
Subject: Re: [PATCH v3 02/31] clk: mediatek: gate: Consolidate gate type clk
 related code
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:20:01 +0800
In-Reply-To: <20220208124034.414635-3-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-3-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_222009_653924_420456F5 
X-CRM114-Status: GOOD (  28.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-02-08 at 20:40 +0800, Chen-Yu Tsai wrote:
> Right now some bits of the gate type clk code are in clk-gate.[ch],
> but
> other bits are in clk-mtk.[ch]. This is different from the cpumux and
> mux type clks, for which all of the code are found in the same files.
> 
> Move the functions that register multiple clks from a given list,
> mtk_clk_register_gates_with_dev() and mtk_clk_register_gates(), to
> clk-gate.[ch] to consolidate all the code for the gate type clks.
> 
> This commit only moves code with minor whitespace fixups to correct
> the code style. Further improvements, such as internalizing various
> functions and structures will be done in later commits.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 53
> ++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/clk-gate.h | 25 ++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.c  | 51 -------------------------------
>  drivers/clk/mediatek/clk-mtk.h  | 25 ----------------
>  4 files changed, 77 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c
> b/drivers/clk/mediatek/clk-gate.c
> index 5d88b428565b..54921768bfba 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -11,9 +11,9 @@
>  #include <linux/slab.h>
>  #include <linux/delay.h>
>  #include <linux/clkdev.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  
> -#include "clk-mtk.h"
>  #include "clk-gate.h"
>  
>  static u32 mtk_get_clockgating(struct clk_hw *hw)
> @@ -182,4 +182,55 @@ struct clk *mtk_clk_register_gate(
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_gate);
>  
> +int mtk_clk_register_gates_with_dev(struct device_node *node,
> +				    const struct mtk_gate *clks, int
> num,
> +				    struct clk_onecell_data *clk_data,
> +				    struct device *dev)
> +{
> +	int i;
> +	struct clk *clk;
> +	struct regmap *regmap;
> +
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	regmap = device_node_to_regmap(node);
> +	if (IS_ERR(regmap)) {
> +		pr_err("Cannot find regmap for %pOF: %pe\n", node,
> regmap);
> +		return PTR_ERR(regmap);
> +	}
> +
> +	for (i = 0; i < num; i++) {
> +		const struct mtk_gate *gate = &clks[i];
> +
> +		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id]))
> +			continue;
> +
> +		clk = mtk_clk_register_gate(gate->name, gate-
> >parent_name,
> +					    regmap,
> +					    gate->regs->set_ofs,
> +					    gate->regs->clr_ofs,
> +					    gate->regs->sta_ofs,
> +					    gate->shift, gate->ops,
> +					    gate->flags, dev);
> +
> +		if (IS_ERR(clk)) {
> +			pr_err("Failed to register clk %s: %pe\n",
> gate->name, clk);
> +			continue;
> +		}
> +
> +		clk_data->clks[gate->id] = clk;
> +	}
> +
> +	return 0;
> +}
> +
> +int mtk_clk_register_gates(struct device_node *node,
> +			   const struct mtk_gate *clks, int num,
> +			   struct clk_onecell_data *clk_data)
> +{
> +	return mtk_clk_register_gates_with_dev(node, clks, num,
> clk_data, NULL);
> +}
> +EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
> +
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-gate.h
> b/drivers/clk/mediatek/clk-gate.h
> index 3c3329ec54b7..432b571d23b3 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -43,6 +43,22 @@ struct clk *mtk_clk_register_gate(
>  		unsigned long flags,
>  		struct device *dev);
>  
> +struct mtk_gate_regs {
> +	u32 sta_ofs;
> +	u32 clr_ofs;
> +	u32 set_ofs;
> +};
> +
> +struct mtk_gate {
> +	int id;
> +	const char *name;
> +	const char *parent_name;
> +	const struct mtk_gate_regs *regs;
> +	int shift;
> +	const struct clk_ops *ops;
> +	unsigned long flags;
> +};
> +
>  #define GATE_MTK_FLAGS(_id, _name, _parent, _regs, _shift,	\
>  			_ops, _flags) {				\
>  		.id = _id,					\
> @@ -57,4 +73,13 @@ struct clk *mtk_clk_register_gate(
>  #define GATE_MTK(_id, _name, _parent, _regs, _shift, _ops)		
> \
>  	GATE_MTK_FLAGS(_id, _name, _parent, _regs, _shift, _ops, 0)
>  
> +int mtk_clk_register_gates(struct device_node *node,
> +			   const struct mtk_gate *clks, int num,
> +			   struct clk_onecell_data *clk_data);
> +
> +int mtk_clk_register_gates_with_dev(struct device_node *node,
> +				    const struct mtk_gate *clks, int
> num,
> +				    struct clk_onecell_data *clk_data,
> +				    struct device *dev);
> +
>  #endif /* __DRV_CLK_GATE_H */
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index 519a461cbb6f..0c5db3c71fdd 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -106,57 +106,6 @@ void mtk_clk_register_factors(const struct
> mtk_fixed_factor *clks,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
>  
> -int mtk_clk_register_gates_with_dev(struct device_node *node,
> -		const struct mtk_gate *clks,
> -		int num, struct clk_onecell_data *clk_data,
> -		struct device *dev)
> -{
> -	int i;
> -	struct clk *clk;
> -	struct regmap *regmap;
> -
> -	if (!clk_data)
> -		return -ENOMEM;
> -
> -	regmap = device_node_to_regmap(node);
> -	if (IS_ERR(regmap)) {
> -		pr_err("Cannot find regmap for %pOF: %pe\n", node,
> regmap);
> -		return PTR_ERR(regmap);
> -	}
> -
> -	for (i = 0; i < num; i++) {
> -		const struct mtk_gate *gate = &clks[i];
> -
> -		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id]))
> -			continue;
> -
> -		clk = mtk_clk_register_gate(gate->name, gate-
> >parent_name,
> -				regmap,
> -				gate->regs->set_ofs,
> -				gate->regs->clr_ofs,
> -				gate->regs->sta_ofs,
> -				gate->shift, gate->ops, gate->flags,
> dev);
> -
> -		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %pe\n",
> gate->name, clk);
> -			continue;
> -		}
> -
> -		clk_data->clks[gate->id] = clk;
> -	}
> -
> -	return 0;
> -}
> -
> -int mtk_clk_register_gates(struct device_node *node,
> -		const struct mtk_gate *clks,
> -		int num, struct clk_onecell_data *clk_data)
> -{
> -	return mtk_clk_register_gates_with_dev(node,
> -		clks, num, clk_data, NULL);
> -}
> -EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
> -
>  struct clk *mtk_clk_register_composite(const struct mtk_composite
> *mc,
>  		void __iomem *base, spinlock_t *lock)
>  {
> diff --git a/drivers/clk/mediatek/clk-mtk.h
> b/drivers/clk/mediatek/clk-mtk.h
> index 0ff289d93452..bdec7dc5e07a 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -150,31 +150,6 @@ void mtk_clk_register_composites(const struct
> mtk_composite *mcs,
>  		int num, void __iomem *base, spinlock_t *lock,
>  		struct clk_onecell_data *clk_data);
>  
> -struct mtk_gate_regs {
> -	u32 sta_ofs;
> -	u32 clr_ofs;
> -	u32 set_ofs;
> -};
> -
> -struct mtk_gate {
> -	int id;
> -	const char *name;
> -	const char *parent_name;
> -	const struct mtk_gate_regs *regs;
> -	int shift;
> -	const struct clk_ops *ops;
> -	unsigned long flags;
> -};
> -
> -int mtk_clk_register_gates(struct device_node *node,
> -			const struct mtk_gate *clks, int num,
> -			struct clk_onecell_data *clk_data);
> -
> -int mtk_clk_register_gates_with_dev(struct device_node *node,
> -		const struct mtk_gate *clks,
> -		int num, struct clk_onecell_data *clk_data,
> -		struct device *dev);
> -
>  struct mtk_clk_divider {
>  	int id;
>  	const char *name;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
