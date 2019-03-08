From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v5 6/9] clk: mediatek: Add flags support for mtk_gate data
Date: Fri, 8 Mar 2019 14:20:57 +0800
Message-ID: <CANMq1KDzSpc6sam5wgUZX_vD4200WPnVs5CxQuu-CSV69ffArQ@mail.gmail.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-8-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190305050546.23431-8-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, stable@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 5, 2019 at 1:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> On some Mediatek platforms, there are critical clocks of
> clock gate type.
> To register clock gate with flags CLK_IS_CRITICAL,
> we need to add the flags field in mtk_gate data and register APIs.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-and-tested-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/clk/mediatek/clk-gate.c | 5 +++--
>  drivers/clk/mediatek/clk-gate.h | 3 ++-
>  drivers/clk/mediatek/clk-mtk.c  | 3 ++-
>  drivers/clk/mediatek/clk-mtk.h  | 1 +
>  4 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
> index 934bf0e45e26..85daf826619a 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -157,7 +157,8 @@ struct clk *mtk_clk_register_gate(
>                 int clr_ofs,
>                 int sta_ofs,
>                 u8 bit,
> -               const struct clk_ops *ops)
> +               const struct clk_ops *ops,
> +               unsigned long flags)
>  {
>         struct mtk_clk_gate *cg;
>         struct clk *clk;
> @@ -168,7 +169,7 @@ struct clk *mtk_clk_register_gate(
>                 return ERR_PTR(-ENOMEM);
>
>         init.name = name;
> -       init.flags = CLK_SET_RATE_PARENT;
> +       init.flags = flags | CLK_SET_RATE_PARENT;
>         init.parent_names = parent_name ? &parent_name : NULL;
>         init.num_parents = parent_name ? 1 : 0;
>         init.ops = ops;
> diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
> index 72ef89b3ad7b..9f766dfe1d57 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -47,6 +47,7 @@ struct clk *mtk_clk_register_gate(
>                 int clr_ofs,
>                 int sta_ofs,
>                 u8 bit,
> -               const struct clk_ops *ops);
> +               const struct clk_ops *ops,
> +               unsigned long flags);
>
>  #endif /* __DRV_CLK_GATE_H */
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 9c0ae4278a94..35359e5397c7 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -130,7 +130,8 @@ int mtk_clk_register_gates(struct device_node *node,
>                                 gate->regs->set_ofs,
>                                 gate->regs->clr_ofs,
>                                 gate->regs->sta_ofs,
> -                               gate->shift, gate->ops);
> +                               gate->shift, gate->ops,
> +                               gate->flags);
>
>                 if (IS_ERR(clk)) {
>                         pr_err("Failed to register clk %s: %ld\n",
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 11b5517903d0..928905496c4b 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -158,6 +158,7 @@ struct mtk_gate {
>         const struct mtk_gate_regs *regs;
>         int shift;
>         const struct clk_ops *ops;
> +       unsigned long flags;
>  };
>
>  int mtk_clk_register_gates(struct device_node *node,
> --
> 2.18.0
>
