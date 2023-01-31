Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DF2C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ay4JjzFOi8u8tMMqeo9ypRaHpCzMeD1s8ySg55sDfvA=; b=fwug4HN0Ixk4KGLXB7YyHzBS0p
	rSEQetA6wbyQOT+OzWOwMUavud0CEiSxQcbOlaGQOg+W/gnQHy9WbVxhW749jZCemWz/lHr8IbyZV
	GdYn+hpoclXF2TGGayWJxk/4lmRh0AL2Zd4YTtlARJlmLe/NfqUxG1IvFr3sKpTVsDI0zrb6HDxaM
	dv5p5xGkkK/xeVklqj8IS/lkLrSoadVKUUYmIaTauak2iCxtolWgHLZdkgV5FvR5ibzkcnjAGTvAO
	lXH8le2CYrJ6cGIxTRO8WhyFqoQpudJxNqSTdX/MEKr9VUtOZAY7toRjJdxwHTo92FJo1xGXhZ47n
	Q2XHv6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnvt-007Qot-LR; Tue, 31 Jan 2023 10:32:09 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnHP-0078qV-43
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:50:21 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id 187so15424071vsv.10
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ay4JjzFOi8u8tMMqeo9ypRaHpCzMeD1s8ySg55sDfvA=;
        b=X7qkWyQt8Nmpyd8tODNC6MVvJAs6pPWPg4+UGaJtcp92pV5yFejhXVMlk9N6Ne0O/x
         sJDx+ymPit1ElxTDAPp2M2NaD+94yYbcjDeTJeHkBQndJoaPQzDoh/O0k5kga8a0/02c
         rvzmD7VHZTbrwQPOdYeJNYWMApcfFEkMQ96vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ay4JjzFOi8u8tMMqeo9ypRaHpCzMeD1s8ySg55sDfvA=;
        b=3rmqwISL6S/n1c3cUtDSptMvXhkHhm+L2sOiaO6XnkE4J6gkU7T2FY4P1b/t+hXwdi
         67iZ3aQ3qCBe6PkGugizf2o5fhtHsHT/j9w9rJqV8raNpLpNDHK+xBfuyiigzIOpVOEl
         2haT3es9diqSxkbpl6+zpIdvLnp+NzZ45aW7sDKg0mAQviHoRVSkUY4Gqdr+S8omJ3qR
         4UpzdsdEEh1wFI33f3gFHvT+oTVkIP+UaF6eOjzuxPHs+KTRNpvejP4zDnMFOx9Xd6PG
         VmWDPLINUNBnUvsJgij2enewtWM6w+VwfsOGMWztFDZWD7jS8ByFXUzpQ/ENgQMMCLkq
         9RlQ==
X-Gm-Message-State: AO0yUKWLFbYQ2DuT/SzokxRasRkSOPisbfVnZklMKmIKeaSEGGxhPOxK
	TiaK5a7ABP2uoOZDfNG4Z+JRg71tOSL7VFQE7y3P4A==
X-Google-Smtp-Source: AK7set+/qcQFjgwbi+Ocj+LtBVuICC7AYNVeLlyhaPp038xPLhOSZqARwYUNLiyEVrFfSwlzmO4Suik/9e/bTguM2EY=
X-Received: by 2002:a67:d294:0:b0:3ed:89c7:4bd2 with SMTP id
 z20-20020a67d294000000b003ed89c74bd2mr2766641vsi.26.1675158616078; Tue, 31
 Jan 2023 01:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20230118031509.29834-1-moudy.ho@mediatek.com> <20230118031509.29834-4-moudy.ho@mediatek.com>
In-Reply-To: <20230118031509.29834-4-moudy.ho@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Jan 2023 17:50:05 +0800
Message-ID: <CAGXv+5Gid0xT=Ru0G3d-z+ED_wKWpGYSbhwiFXRv5jqJL0vC_A@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_015019_239343_F2A0998E 
X-CRM114-Status: GOOD (  23.69  )
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

On Wed, Jan 18, 2023 at 11:16 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> MT8195 VPPSYS0/1 will be probed by the compatible name in
> the mtk-mmsys driver and then probe its own clock driver as
> a platform driver.
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8195-vpp0.c | 58 +++++++++++++++++++-------
>  drivers/clk/mediatek/clk-mt8195-vpp1.c | 58 +++++++++++++++++++-------
>  2 files changed, 86 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> index bf2939c3a023..6d5800f69f6c 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -86,26 +86,54 @@ static const struct mtk_gate vpp0_clks[] = {
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

mtk_alloc_clk_data() API changed a couple releases back. So:

          struct clk_hw_onecell_data

> +       int r;
>
> -static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
> -       {
> -               .compatible = "mediatek,mt8195-vppsys0",
> -               .data = &vpp0_desc,
> -       }, {
> -               /* sentinel */
> -       }
> -};
> +       clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r = mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);

API changed.

> +       if (r)
> +               goto free_vpp0_data;
> +
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);

              of_clk_add_provider(node, of_clk_hw_onecell_get, clk_data);

Same for the other driver.


ChenYu

> +       if (r)
> +               goto unregister_gates;
> +
> +       platform_set_drvdata(pdev, clk_data);
> +
> +       return r;
> +
> +unregister_gates:
> +       mtk_clk_unregister_gates(vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> +free_vpp0_data:
> +       mtk_free_clk_data(clk_data);
> +       return r;
> +}
> +
> +static int clk_mt8195_vpp0_remove(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +       of_clk_del_provider(node);
> +       mtk_clk_unregister_gates(vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> +       mtk_free_clk_data(clk_data);
> +
> +       return 0;
> +}
>
>  static struct platform_driver clk_mt8195_vpp0_drv = {
> -       .probe = mtk_clk_simple_probe,
> -       .remove = mtk_clk_simple_remove,
> +       .probe = clk_mt8195_vpp0_probe,
> +       .remove = clk_mt8195_vpp0_remove,
>         .driver = {
>                 .name = "clk-mt8195-vpp0",
> -               .of_match_table = of_match_clk_mt8195_vpp0,
>         },
>  };
>  builtin_platform_driver(clk_mt8195_vpp0_drv);
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> index ffd52c762890..3b88c69e96c9 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> @@ -84,26 +84,54 @@ static const struct mtk_gate vpp1_clks[] = {
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
> +               goto unregister_gates;
> +
> +       platform_set_drvdata(pdev, clk_data);
> +
> +       return r;
> +
> +unregister_gates:
> +       mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
> +free_vpp1_data:
> +       mtk_free_clk_data(clk_data);
> +       return r;
> +}
> +
> +static int clk_mt8195_vpp1_remove(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +       of_clk_del_provider(node);
> +       mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
> +       mtk_free_clk_data(clk_data);
> +
> +       return 0;
> +}
>
>  static struct platform_driver clk_mt8195_vpp1_drv = {
> -       .probe = mtk_clk_simple_probe,
> -       .remove = mtk_clk_simple_remove,
> +       .probe = clk_mt8195_vpp1_probe,
> +       .remove = clk_mt8195_vpp1_remove,
>         .driver = {
>                 .name = "clk-mt8195-vpp1",
> -               .of_match_table = of_match_clk_mt8195_vpp1,
>         },
>  };
>  builtin_platform_driver(clk_mt8195_vpp1_drv);
> --
> 2.18.0
>

