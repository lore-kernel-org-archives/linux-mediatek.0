Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C10CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 06:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmqMFPNxN69y8pQBiJNuKc1tKqGDteqVuzt4yjfI12E=; b=ofSElqiIaDdjlB
	cO0K0JfMNkhSoMNqZb+ofY8BgO+7fcdGJDmIGzdbt8JrrPAwRAUIST7kP+4/hFlKZ9GvVbnHdaFa9
	+v+Myq2Zyzq78Z+fcGOSS2aYvHnGUrGOOunomYeQsHILl/AS23Z3N8NhLFi1JFZvAHeMU4MpYR2lH
	WXZfbKtrmlqDztdd5vk4pSLxuHErcpwpJWeOx6FYxyvO1PJNP7vyz83shJ05zCwE7Qzd0u03wRBXP
	N1lXJn1BR7iuP7h/bwAcuBSLPR5lPXJDsBxz/B64uzCZB6aFkIjGPWpTf5YZt7kxeIRCoE+cY8r4E
	57tUWEvI3i8Lz6PxpWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp2Ot-00Evr2-2n; Mon, 22 Nov 2021 06:01:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp2Of-00EvpP-O5
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 06:01:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id y26so75377264lfa.11
 for <linux-mediatek@lists.infradead.org>; Sun, 21 Nov 2021 22:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lPXukOaJl5aewiB+tCI8uXsfmVBy8r1+nyP7DOdvQ/I=;
 b=T0sZ5yCsFEiw3sdUaa2VGX+rlP0hKHXxHoRXTBJysWE6RUbA4x8Up2Yht2aoAYehfs
 17VEELLu9bZUtHpXN58nmPMVav1pYTDONPs5k+/bSmI+NO7WcZxvI6sFerjD+Nq9vmKe
 FIfENSun8DRQAmpf7xo9KMNivrFstSepFEneY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lPXukOaJl5aewiB+tCI8uXsfmVBy8r1+nyP7DOdvQ/I=;
 b=mP6MrRoJwuA+ywnMOucoWr7tJ54kbB1cTlxYvdI3ak/+C/xRQhnXZQ5KJDQnHvjn6H
 SS+/STTBao2IEpNX+EXaIbitwiZK1dhMc6Lb6tWdZuZ1EOctVbM2OUOZK5c/NICIhRER
 T/mLNe9s/xBuFXJfzFaAhIb1VgGAbMOAXlyrt1KKHCuT+ZMTx6j5ZDBcLTC6hyw3frSw
 2WfwNbGA40GyGen0X2sG5ED1CB9dhIn7by2mbpCpsM5HEGqcrBiugV8bHgGqSh1baXdK
 1b6JUQQzpbHccG/R7THENv8rsFnBL5Cc/RvROdQGMYiNfBLPNBS+p1k4HfxJ3EEmAAFx
 ckpg==
X-Gm-Message-State: AOAM530g9mYqZI+KMMJ9dZ1LmHis1DMqX4PvIGv761DgjBdGRrBggLfe
 BiciZGP6Z8d8z/punak03SAzcl5bssB60X/QxVkvVw==
X-Google-Smtp-Source: ABdhPJw/4SmeDZBqDYlqcwvrvqfgT1rRWVjSyyrA29RQ1IxdNpKIkQ3bM9bJaZXagVgfIgqxsMUBQ6Izq9VZc3teCzU=
X-Received: by 2002:a05:6512:2111:: with SMTP id
 q17mr53660326lfr.371.1637560903930; 
 Sun, 21 Nov 2021 22:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20211109034741.27083-1-chun-jie.chen@mediatek.com>
In-Reply-To: <20211109034741.27083-1-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 22 Nov 2021 14:01:32 +0800
Message-ID: <CAGXv+5H=ZVco7q3DLKNGJqDSZN-bDK3YPgFpN_Euc86+3TP56g@mail.gmail.com>
Subject: Re: [v1] clk: mediatek: Integrated vppsys with mtk-mmsys in MT8195
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_220145_804415_7ED0FD83 
X-CRM114-Status: GOOD (  26.17  )
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

Hi,

On Tue, Nov 9, 2021 at 11:47 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Integrated vpp0 and vpp1 with mtk-mmsys driver which
> will populate device by platform_device_register_data
> to start vppsys clock driver.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
> This patch is based on v5.15-rc7 and [1].
>
> Due to the modification in [2], the vppsys clock driver will be trigger
> from mmsys driver
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=546235
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20211020071448.14187-7-roy-cw.yeh@mediatek.com/
> ---
>  drivers/clk/mediatek/clk-mt8195-vpp0.c | 39 +++++++++++++++++---------
>  drivers/clk/mediatek/clk-mt8195-vpp1.c | 39 +++++++++++++++++---------
>  2 files changed, 50 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> index c3241466a8d0..c7fec35db1e6 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -86,25 +86,36 @@ static const struct mtk_gate vpp0_clks[] = {
>         GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "top_wpe_vpp", 3),
>  };
>
> -static const struct mtk_clk_desc vpp0_desc = {
> -       .clks = vpp0_clks,
> -       .num_clks = ARRAY_SIZE(vpp0_clks),
> -};
> +static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_onecell_data *clk_data;
> +       int r;
>
> -static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
> -       {
> -               .compatible = "mediatek,mt8195-vppsys0",
> -               .data = &vpp0_desc,

So we typically ask that old DT bindings have to be continuously supported.
I'm not sure if that applies in this case since no MT8195 devices have been
released to the public.

Assuming it's OK to not support it anymore, please also add a patch to remove
the VPPSYS compatible strings from the DT bindings.

> -       }, {
> -               /* sentinel */
> -       }
> -};
> +       clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r = mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> +       if (r)
> +               goto free_vpp0_data;
> +
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r)
> +               goto free_vpp0_data;
> +
> +       return r;
> +
> +free_vpp0_data:
> +       mtk_free_clk_data(clk_data);

This is probably a bad idea given that clk_data is still used and could
be referenced through the registered clocks if of_clk_add_provider were
the function to fail.

> +       return r;
> +}
>
>  static struct platform_driver clk_mt8195_vpp0_drv = {
> -       .probe = mtk_clk_simple_probe,
> +       .probe = clk_mt8195_vpp0_probe,
>         .driver = {
>                 .name = "clk-mt8195-vpp0",
> -               .of_match_table = of_match_clk_mt8195_vpp0,
>         },
>  };
>  builtin_platform_driver(clk_mt8195_vpp0_drv);
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> index ce0b9a40a179..40ec8c26ede6 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> @@ -84,25 +84,36 @@ static const struct mtk_gate vpp1_clks[] = {
>         GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_26M, "vpp1_vpp_split_26m", "clk26m", 26),
>  };
>
> -static const struct mtk_clk_desc vpp1_desc = {
> -       .clks = vpp1_clks,
> -       .num_clks = ARRAY_SIZE(vpp1_clks),
> -};
> +static int clk_mt8195_vpp1_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_onecell_data *clk_data;
> +       int r;
>
> -static const struct of_device_id of_match_clk_mt8195_vpp1[] = {
> -       {
> -               .compatible = "mediatek,mt8195-vppsys1",
> -               .data = &vpp1_desc,
> -       }, {
> -               /* sentinel */
> -       }
> -};
> +       clk_data = mtk_alloc_clk_data(CLK_VPP1_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r = mtk_clk_register_gates(node, vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
> +       if (r)
> +               goto free_vpp1_data;
> +
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r)
> +               goto free_vpp1_data;
> +
> +       return r;
> +
> +free_vpp1_data:
> +       mtk_free_clk_data(clk_data);
> +       return r;
> +}
>
>  static struct platform_driver clk_mt8195_vpp1_drv = {
> -       .probe = mtk_clk_simple_probe,
> +       .probe = clk_mt8195_vpp1_probe,
>         .driver = {
>                 .name = "clk-mt8195-vpp1",
> -               .of_match_table = of_match_clk_mt8195_vpp1,
>         },
>  };
>  builtin_platform_driver(clk_mt8195_vpp1_drv);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
