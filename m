Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A59C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oC9RW8rhwlUQCZQ7jn3slAo3CITNgXdJ/Nsapytp5aU=; b=tSGgW7416QaMUE
	KaWKJIo2vfZqgsdQQuNFN/gT9S+EcVQ4/o6aLGXToB9VoNrEed8niW0MbGOpfY2HnfF1o41FK/g5z
	qaCCDPsCqi09Q0C6VTOjOSvdjHLfNdLEVTbFxXT/AF6+qz3o4RGG1zewZrrfF+Qlu9D4jQbGRMo0V
	aC8XseY+Ym4NJAvWqOEk1zSw3QZf41WKNvv09ffMoIJaWIsgBGvkb0kB3q4Ww9cxwVeet+cKwhiiE
	SuyDwp2aiu22q+t589XttJtsKxavrs0CF0tIUksra68o5fyc53kjvvQIwZIYa0rxi1/Tmx6AOXWzD
	We53aJNo98kaQt1xR67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nryhy-00BVtD-Cj; Fri, 20 May 2022 09:14:06 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryhj-00BVis-27
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:13:53 +0000
Received: by mail-ej1-x62f.google.com with SMTP id m20so14414253ejj.10
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hRRyXBAMdaUQcvr7P130WMrTlU9twmxBI/F4JADwZX4=;
 b=GTNJaeW179p1zmS6cE+Rq8JDZaXGEzd1s6G8CvRfw7WyaBFPvXVlhFA5ZzZNu9/Kty
 29hATcLJx5y0J0GEvNM6SPTOzueFpYPpP6w5ncZvR/j+Pjzusy6xlDY7DDPZhqrSwkyu
 K0ha34MMbNpb3QENfHzsWuu5yrCDbL3Qx2wR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hRRyXBAMdaUQcvr7P130WMrTlU9twmxBI/F4JADwZX4=;
 b=pwTaVMRQjfiXgiZ1lmivj6YzVMUc4W0W3wYMDrUcYUwDFVh2Yq/x8nWFMtQAmntuw1
 DDBnWXHsLfa8J0EvYxygkUdiH0ZQe6oOMt8bCRX81oRbcrlKMZu788bXCIEdQ0B01pSn
 bxYCwGbLrRY+LXcQO1LrH7yVhIsP0xUmKkJ3UAWVPTylKGgDqK1f1ghVzndBX2ozYYiC
 Zzk04gG69nq9h4exJ4lXWfmoNkigJZ5z5LMNp4v2Y/w9YtX1I1BNPIR2lS/smcXiKlyt
 oeE0zCB/JmJPRT+P/tL8RtbAhbHzUxXYM+O0JieHFhDlaPT8k0F6qQVKlLQA4mmb0n/4
 r6Sw==
X-Gm-Message-State: AOAM531Sp3rcQ7i0KtC3iNgUoC+KYz95lcmq5PxyFO0Z/rSAZX6l7wKM
 5hyVU415AbWy09RNPB8m5FgfpEAgG7yu97Ff3gttgA==
X-Google-Smtp-Source: ABdhPJyF3XzL3rcQv+7nwk+LUAnyEDcuvUKsXjTn90VIqxdjucSROEdkQRcR74cEFJ8tWDimKVn3EFHzznO4N5Ec2Bg=
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr7587780ejy.546.1653038025359; Fri, 20
 May 2022 02:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-7-y.oudjana@protonmail.com>
In-Reply-To: <20220519134728.456643-7-y.oudjana@protonmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 May 2022 17:13:34 +0800
Message-ID: <CAGXv+5Gws-YHkKzUUuQeVdVVtqyCrv1HfS+wdNvwsTGVJaPR+g@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: mediatek: Add support for other clock types in
 simple probe/remove
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Miles Chen <miles.chen@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_021351_163505_C16A739A 
X-CRM114-Status: GOOD (  23.89  )
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

On Thu, May 19, 2022 at 9:50 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Simple probe/remove functions currently support gates only. Add
> PLLs, fixed clocks, fixed factors and muxes to support most
> clock controllers. struct mtk_clk_desc now takes descriptions
> for all of these clocks, and only the ones set will be registered.
> Most clock controllers will only use a subset of the types
> supported.

I assume this mostly benefits the apmixedsys (PLL) and topckgen
(mix of dividers and muxes and gates) drivers.

I plan on introducing |struct clk_hw *| based clk_parent_data for internal
clock parents. This will require parent clocks be registered before child
clocks. Depending on the hardware, registration of different clock types
would need to be interweaved, and we would end up losing any benefits this
patch brings.

I would hold off on this patch until we have a clearer picture of what
needs to be done. At least two or three clock drivers that can use this
should be introduced or converted

> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
> Dependencies:
> - clk: mediatek: Move to struct clk_hw provider APIs (series)
>   https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/
> - Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
>   https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
> - Export required symbols to compile clk drivers as module (single patch)
>   https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/
>
>  drivers/clk/mediatek/clk-mtk.c | 88 +++++++++++++++++++++++++++++-----
>  drivers/clk/mediatek/clk-mtk.h | 17 ++++++-
>  2 files changed, 92 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 3382802663f4..df1209d5b6fb 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -15,8 +15,10 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include "clk-mtk.h"
>  #include "clk-gate.h"
> +#include "clk-mtk.h"
> +#include "clk-mux.h"
> +#include "clk-pll.h"
>
>  struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
>  {
> @@ -434,20 +436,55 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>         if (!clk_ctrl)
>                 return -ENOMEM;
>
> -       clk_ctrl->clk_data = mtk_alloc_clk_data(mcd->num_clks);
> +       clk_ctrl->clk_data = mtk_alloc_clk_data(mcd->num_plls
> +                                             + mcd->num_fixed_clks
> +                                             + mcd->num_factors
> +                                             + mcd->num_muxes
> +                                             + mcd->num_gates);

There are also dividers and composite clocks.

ChenYu

>         if (!clk_ctrl->clk_data) {
>                 r = -ENOMEM;
>                 goto free_clk_ctrl;
>         }
>
> -       r = mtk_clk_register_gates_with_dev(node, mcd->clks, mcd->num_clks,
> -                                           clk_ctrl->clk_data, &pdev->dev);
> -       if (r)
> -               goto free_clk_data;
> +       if (mcd->plls) {
> +               r = mtk_clk_register_plls(node, mcd->plls, mcd->num_plls,
> +                                         clk_ctrl->clk_data);
> +               if (r)
> +                       goto free_clk_data;
> +       }
> +
> +       if (mcd->fixed_clks) {
> +               r = mtk_clk_register_fixed_clks(mcd->fixed_clks, mcd->num_fixed_clks,
> +                                               clk_ctrl->clk_data);
> +               if (r)
> +                       goto unregister_plls;
> +       }
> +
> +       if (mcd->factors) {
> +               r = mtk_clk_register_factors(mcd->factors, mcd->num_factors,
> +                                            clk_ctrl->clk_data);
> +               if (r)
> +                       goto unregister_fixed_clks;
> +       }
> +
> +       if (mcd->muxes) {
> +               spin_lock_init(&clk_ctrl->mux_lock);
> +               r = mtk_clk_register_muxes(mcd->muxes, mcd->num_muxes, node,
> +                                          &clk_ctrl->mux_lock, clk_ctrl->clk_data);
> +               if (r)
> +                       goto unregister_factors;
> +       }
> +
> +       if (mcd->gates) {
> +               r = mtk_clk_register_gates_with_dev(node, mcd->gates, mcd->num_gates,
> +                                                   clk_ctrl->clk_data, &pdev->dev);
> +               if (r)
> +                       goto unregister_muxes;
> +       }
>
>         r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_ctrl->clk_data);
>         if (r)
> -               goto unregister_clks;
> +               goto unregister_gates;
>
>         platform_set_drvdata(pdev, clk_ctrl);
>
> @@ -457,14 +494,30 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>                                                                mcd->rst_desc);
>                 if (IS_ERR(clk_ctrl->rst_data)) {
>                         r = PTR_ERR(clk_ctrl->rst_data);
> -                       goto unregister_clks;
> +                       goto unregister_clk_provider;
>                 }
>         }
>
>         return r;
>
> -unregister_clks:
> -       mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_ctrl->clk_data);
> +unregister_clk_provider:
> +       of_clk_del_provider(node);
> +unregister_gates:
> +       if (mcd->gates)
> +               mtk_clk_unregister_gates(mcd->gates, mcd->num_gates, clk_ctrl->clk_data);
> +unregister_muxes:
> +       if (mcd->muxes)
> +               mtk_clk_unregister_muxes(mcd->muxes, mcd->num_muxes, clk_ctrl->clk_data);
> +unregister_factors:
> +       if (mcd->factors)
> +               mtk_clk_unregister_factors(mcd->factors, mcd->num_factors, clk_ctrl->clk_data);
> +unregister_fixed_clks:
> +       if (mcd->fixed_clks)
> +               mtk_clk_unregister_fixed_clks(mcd->fixed_clks, mcd->num_fixed_clks,
> +                                             clk_ctrl->clk_data);
> +unregister_plls:
> +       if (mcd->plls)
> +               mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_ctrl->clk_data);
>  free_clk_data:
>         mtk_free_clk_data(clk_ctrl->clk_data);
>  free_clk_ctrl:
> @@ -480,9 +533,22 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
>         struct device_node *node = pdev->dev.of_node;
>
>         of_clk_del_provider(node);
> +
>         if (clk_ctrl->rst_data)
>                 mtk_unregister_reset_controller(clk_ctrl->rst_data);
> -       mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_ctrl->clk_data);
> +
> +       if (mcd->gates)
> +               mtk_clk_unregister_gates(mcd->gates, mcd->num_gates, clk_ctrl->clk_data);
> +       if (mcd->muxes)
> +               mtk_clk_unregister_muxes(mcd->muxes, mcd->num_muxes, clk_ctrl->clk_data);
> +       if (mcd->factors)
> +               mtk_clk_unregister_factors(mcd->factors, mcd->num_factors, clk_ctrl->clk_data);
> +       if (mcd->fixed_clks)
> +               mtk_clk_unregister_fixed_clks(mcd->fixed_clks, mcd->num_fixed_clks,
> +                                             clk_ctrl->clk_data);
> +       if (mcd->plls)
> +               mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_ctrl->clk_data);
> +
>         mtk_free_clk_data(clk_ctrl->clk_data);
>         kfree(clk_ctrl);
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index fa092bca97c8..23bce98bca20 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -13,6 +13,9 @@
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>
> +#include "clk-gate.h"
> +#include "clk-mux.h"
> +#include "clk-pll.h"
>  #include "reset.h"
>
>  #define MAX_MUX_GATE_BIT       31
> @@ -191,12 +194,22 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
>
>  struct mtk_simple_clk_controller {
>         struct clk_hw_onecell_data *clk_data;
> +       spinlock_t mux_lock;
>         struct mtk_clk_rst_data *rst_data;
>  };
>
>  struct mtk_clk_desc {
> -       const struct mtk_gate *clks;
> -       size_t num_clks;
> +       const struct mtk_pll_data *plls;
> +       size_t num_plls;
> +       const struct mtk_fixed_clk *fixed_clks;
> +       size_t num_fixed_clks;
> +       const struct mtk_fixed_factor *factors;
> +       size_t num_factors;
> +       const struct mtk_mux *muxes;
> +       size_t num_muxes;
> +       const struct mtk_gate *gates;
> +       size_t num_gates;
> +
>         const struct mtk_clk_rst_desc *rst_desc;
>  };
>
> --
> 2.36.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
