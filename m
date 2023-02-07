Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD479C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTjQiyosWxthU58WlgDXThqF+F9aTUK0CMslx80hUwY=; b=OzLIq9U5xURiOFMMzApBIYlkTr
	7Zgotrf9cRIlNpumcnzL98LdI3rQuNvIgD+2I5NGfg/oztafIefBAoPHTTCkT59rBFppcoPrhdqNJ
	zJDI0Vw+N+amjN80UQoHrdHCD876VDk+SJLP078QsjZepBmfR0y1ay6TPCjM2CNMMx5WXqzdfNrlt
	raciJ5uyROVbsJphXCQJNuzMm2pqFXObGa2JXMD1J/yoII2NWFictpNybrPg3RFTCAoWamZ35XT4w
	hcSPUHjmuXLHoPpYYKmPfJ1FmbRBt4d3mDoGdckKOnvvQ+CbyaqExugk5YcWoNjxqGCe3eQCe7Mvm
	H+DTvpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHH4-00AxLR-9n; Tue, 07 Feb 2023 06:16:14 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHGo-00AxGL-F7
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:16:00 +0000
Received: by mail-vk1-xa33.google.com with SMTP id l20so7313082vkm.11
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YTjQiyosWxthU58WlgDXThqF+F9aTUK0CMslx80hUwY=;
        b=Xc7lweU8aAZbcFpCkRSu5sKNXsTPygGVdzDK1iKRJYctzI2Ct4LJTUmZS/GxSapZS/
         CWO303+bC3bUtepKEUhsg8ZgfX9ECndrkE8TmfW7yQOP4JeED3xsmX6qGZqHII2/e2fU
         7J0ZvkCUGrErw1hvGOLplhM1MxOwr/Qjc+7hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTjQiyosWxthU58WlgDXThqF+F9aTUK0CMslx80hUwY=;
        b=PLtBqvTmwvRZHBxjviHFFaCsfxLdLSqEWv0LiL8Zl/G2vAVR6GweHAfUKEkFb5fo6z
         rMsmQziIb2+m49AdiOdBaR+WjYfwAKe0uKlRWC2NZSEpWPrZjQ3STj+bM96/swM6QER6
         Q+lZnHaOT4r5eWtWLAEMIkJysuY6ZmpH/ftyxZnhqCjl4MkKy76BKyhjaad/aiSnwl3E
         Mv/a+Thhe4GcZj8A+hoU+/5ccUjQdU1SnwSyYf0b7hiAa02F7DQWPTF4DvmGMoz7sjMz
         M1TOzcT+Xfoyy5liP19bncyDPOTQgcF9gvK3692AixrFAy98D2gy23+dhZB3EoT8ldvF
         jnYg==
X-Gm-Message-State: AO0yUKXQCYfglYi7C3h7huCqXIVEeLfpq81pHwAl4l9fqP+TSBchFWcM
	Z10xyj0OMloST0DdbL+7oGjFSqrc6CeaKEWHRgPswg==
X-Google-Smtp-Source: AK7set8mjFUJySYXRimSiwIbHAy8wpkjAOcLOC+zyHxCXibLAi/1kue7IPAWcZTu+ytamq1HwE3isG1vaH6/UhR2pZk=
X-Received: by 2002:a1f:a757:0:b0:3ea:94ea:110b with SMTP id
 q84-20020a1fa757000000b003ea94ea110bmr246643vke.22.1675750556666; Mon, 06 Feb
 2023 22:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:15:45 +0800
Message-ID: <CAGXv+5Gg60-4B29V9cYUw7b1OVcZvU+w9qdiiBbt10LJsAJiCA@mail.gmail.com>
Subject: Re: [PATCH v1 05/45] clk: mediatek: mt2712: Migrate topckgen/mcucfg
 to mtk_clk_simple_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_221558_549780_91E90552 
X-CRM114-Status: GOOD (  20.18  )
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that the common mtk_clk_simple_{probe,remove}() functions can deal
> with divider clocks it is possible to migrate more clock drivers to it:
> in this case, it's about topckgen.
> While at it, also perform a fast migration for mcucfg.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/mediatek/clk-mt2712.c | 127 +++++-------------------------
>  1 file changed, 21 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index 94f8fc2a4f7b..db20c46e088b 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -36,14 +36,11 @@ static const struct mtk_fixed_clk top_fixed_clks[] = {
>         FIXED_CLK(CLK_TOP_CVBSPLL, "cvbspll", NULL, 108000000),
>  };
>
> -static const struct mtk_fixed_factor top_early_divs[] = {
> +static const struct mtk_fixed_factor top_divs[] = {
>         FACTOR(CLK_TOP_SYS_26M, "sys_26m", "clk26m", 1,
>                 1),
>         FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "sys_26m", 1,
>                 2),
> -};
> -
> -static const struct mtk_fixed_factor top_divs[] = {
>         FACTOR(CLK_TOP_ARMCA35PLL, "armca35pll_ck", "armca35pll", 1,
>                 1),
>         FACTOR(CLK_TOP_ARMCA35PLL_600M, "armca35pll_600m", "armca35pll_ck", 1,
> @@ -1295,114 +1292,30 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>         return r;
>  }
>
> -static struct clk_hw_onecell_data *top_clk_data;
> -
> -static void clk_mt2712_top_init_early(struct device_node *node)
> -{
> -       int r, i;
> -
> -       if (!top_clk_data) {
> -               top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> -
> -               for (i = 0; i < CLK_TOP_NR_CLK; i++)
> -                       top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> -       }
> -
> -       mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
> -                       top_clk_data);
> -
> -       r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
> -       if (r)
> -               pr_err("%s(): could not register clock provider: %d\n",
> -                       __func__, r);
> -}
> -
> -CLK_OF_DECLARE_DRIVER(mt2712_topckgen, "mediatek,mt2712-topckgen",
> -                       clk_mt2712_top_init_early);
> -
> -static int clk_mt2712_top_probe(struct platform_device *pdev)
> -{
> -       int r, i;
> -       struct device_node *node = pdev->dev.of_node;
> -       void __iomem *base;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base)) {
> -               pr_err("%s(): ioremap failed\n", __func__);
> -               return PTR_ERR(base);
> -       }
> -
> -       if (!top_clk_data) {
> -               top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> -       } else {
> -               for (i = 0; i < CLK_TOP_NR_CLK; i++) {
> -                       if (top_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
> -                               top_clk_data->hws[i] = ERR_PTR(-ENOENT);
> -               }
> -       }
> -
> -       mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
> -                       top_clk_data);
> -       mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
> -                       top_clk_data);
> -       mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> -       mtk_clk_register_composites(&pdev->dev, top_muxes,
> -                                   ARRAY_SIZE(top_muxes), base,
> -                                   &mt2712_clk_lock, top_clk_data);
> -       mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
> -                       &mt2712_clk_lock, top_clk_data);
> -       mtk_clk_register_gates(&pdev->dev, node, top_clks,
> -                              ARRAY_SIZE(top_clks), top_clk_data);
> -
> -       r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
> -
> -       if (r != 0)
> -               pr_err("%s(): could not register clock provider: %d\n",
> -                       __func__, r);
> -
> -       return r;
> -}
> -
> -static int clk_mt2712_mcu_probe(struct platform_device *pdev)
> -{
> -       struct clk_hw_onecell_data *clk_data;
> -       int r;
> -       struct device_node *node = pdev->dev.of_node;
> -       void __iomem *base;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base)) {
> -               pr_err("%s(): ioremap failed\n", __func__);
> -               return PTR_ERR(base);
> -       }
> -
> -       clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
> -
> -       r = mtk_clk_register_composites(&pdev->dev, mcu_muxes,
> -                                       ARRAY_SIZE(mcu_muxes), base,
> -                                       &mt2712_clk_lock, clk_data);
> -       if (r)
> -               dev_err(&pdev->dev, "Could not register composites: %d\n", r);
> -
> -       r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -
> -       if (r != 0)
> -               pr_err("%s(): could not register clock provider: %d\n",
> -                       __func__, r);
> +static const struct mtk_clk_desc topck_desc = {
> +       .clks = top_clks,
> +       .num_clks = ARRAY_SIZE(top_clks),
> +       .fixed_clks = top_fixed_clks,
> +       .num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
> +       .factor_clks = top_divs,
> +       .num_factor_clks = ARRAY_SIZE(top_divs),
> +       .composite_clks = top_muxes,
> +       .num_composite_clks = ARRAY_SIZE(top_muxes),
> +       .divider_clks = top_adj_divs,
> +       .num_divider_clks = ARRAY_SIZE(top_adj_divs),
> +       .clk_lock = &mt2712_clk_lock,

At some point maybe we should look into splitting up the locks to one
per block, or converting everything to regmap.

ChenYu

