From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1] clk: mediatek: fix clk-gate flag setting
Date: Fri, 12 Apr 2019 15:49:30 +0200
Message-ID: <ab8f6023-95b6-ccb7-e0fb-a7123d51a99c@gmail.com>
References: <20190412033027.3516-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412033027.3516-1-weiyi.lu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 12/04/2019 05:30, Weiyi Lu wrote:
> CLK_SET_RATE_PARENT would be dropped.
> Merge two flag setting together to correct the error.
> 
> Fixes: 5a1cc4c27ad2 ("clk: mediatek: Add flags to mtk_gate")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Good catch.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/clk/mediatek/clk-gate.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
> index 9628d4e7690b..85daf826619a 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -169,11 +169,10 @@ struct clk *mtk_clk_register_gate(
>  		return ERR_PTR(-ENOMEM);
>  
>  	init.name = name;
> -	init.flags = CLK_SET_RATE_PARENT;
> +	init.flags = flags | CLK_SET_RATE_PARENT;
>  	init.parent_names = parent_name ? &parent_name : NULL;
>  	init.num_parents = parent_name ? 1 : 0;
>  	init.ops = ops;
> -	init.flags = flags;
>  
>  	cg->regmap = regmap;
>  	cg->set_ofs = set_ofs;
> 
