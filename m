Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E8DC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKptmBLuOQg1RM4zVHa29163pPmBL0D399wKsCGeJf8=; b=iqLiQv19ujJhy3feoIXgItSaju
	Rx7ip1Bnk0IQO/JdY94rNEgtBJJCjm6hs5WrFF08OYluZyzn892oPEGEKb86fyTvs/Zn2WUf4GDXv
	kj8ajx8ZgP9z9VBA/USRZn6pUewImWueyk7qLIRq2DYVusjMgKLCafPtkMNHQiq0AXdZNqCWBmVxT
	avtKR/YGnA3PubthotiRN0VAafQXo4q1n7DRhqWafcuQFoYS/gfEYh4c27nRRF2uR7+ysnvjHWB7/
	orYctd5Ml2WzHqMuRF90PO26JUjzmZhakUqfxAySTy6zsAh4AVJ9PBxClCHtkwIXHSvVFmd52Q9Hf
	8nLkFR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAmD-007IjZ-0K; Fri, 30 Dec 2022 08:30:05 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAaW-007DTv-Dr
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:18:02 +0000
Received: by mail-ua1-x92c.google.com with SMTP id ay42so4661617uab.6
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UKptmBLuOQg1RM4zVHa29163pPmBL0D399wKsCGeJf8=;
        b=LvNoP9vLe6bcqAB3jeW57I2iLYWVxxrHHxAE39uHilcHZ6iInZxn9iXNpVYI6S6hbs
         uqsm6uaQKXnYhhYQF6xbVj2/Ja/3HTtor48an7kltiVPUAVGykta8SDU3e5xXlf9Zaru
         Led7+q/PlqhI5FT3ZPnIlOHDStqgRUxpeIF9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKptmBLuOQg1RM4zVHa29163pPmBL0D399wKsCGeJf8=;
        b=dYu0hGK4X/DACx17bQjDVYMdvZaH0h5EnZmM6fe+j6h0SD8UkoG/QuDDxRmjyyb+X/
         ZWAM/H3SWOFpWZeIuLsbj48ndl02vV8aTOs7jw4O+7Cs5AS59d90ELdbYfxJO8kYSnnY
         3xuAc4F0/R0ZvTNPEFiOsewtC7V8dcDXq7J39sioGuj8Shz1ZobXPl5Xt5azT5WCwGNG
         plpxvoub/+hjdNdLiM2aL7AwMWGFDfPRAplHZozyUEOFJD4kCVmSKxiNP+4XJoUDvAFk
         ZbLy44X5zQBWB1tXn4D3SEy2QMlfOSVVqx6gsRk8Xnav0HPSaX45zm6/5uLzbGZPnwIX
         PJVA==
X-Gm-Message-State: AFqh2krsrROx+ZSrg1qGrK2kOFeErgjy804cgd6bopLoFxhHpvnoH7ZB
	USHWiAiG98zhzT9FkdjClCAZijev7LZ+JjVlTnB6ew==
X-Google-Smtp-Source: AMrXdXvVoiFEJpFzEVXeUJXm4MP1RYdUzBiiTLiLJOdYxjRbC1msIGJnP7BIg5ubV8Sk8yKBy18sm6YwSacIh59ToeA=
X-Received: by 2002:a9f:386b:0:b0:419:1620:be75 with SMTP id
 q40-20020a9f386b000000b004191620be75mr2823546uad.78.1672388275999; Fri, 30
 Dec 2022 00:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-17-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:17:45 +0800
Message-ID: <CAGXv+5GR7ef8pTVDHa20QH4hBv2rMAqoY2MjKqK5QRdbFdfDKw@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] clk: mediatek: mt8186: Join top_adj_div and top_muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_001800_581365_6FC6121F 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like done for MT8192, join the two to register them in one shot, as
> there's no point in doing that separately from one another.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8186-topckgen.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
> index d05143891b69..63befb1f492d 100644
> --- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
> +++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
> @@ -669,9 +669,6 @@ static struct mtk_composite top_muxes[] = {
>         MUX(CLK_TOP_APLL_I2S4_MCK_SEL, "apll_i2s4_mck_sel", apll_mck_parents, 0x0320, 19, 1),
>         MUX(CLK_TOP_APLL_TDMOUT_MCK_SEL, "apll_tdmout_mck_sel", apll_mck_parents,
>                 0x0320, 20, 1),
> -};
> -
> -static const struct mtk_composite top_adj_divs[] = {
>         DIV_GATE(CLK_TOP_APLL12_CK_DIV0, "apll12_div0", "apll_i2s0_mck_sel",
>                         0x0320, 0, 0x0328, 8, 0),
>         DIV_GATE(CLK_TOP_APLL12_CK_DIV1, "apll12_div1", "apll_i2s1_mck_sel",
> @@ -747,26 +744,19 @@ static int clk_mt8186_topck_probe(struct platform_device *pdev)
>         if (r)
>                 goto unregister_muxes;
>
> -       r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
> -                                       &mt8186_clk_lock, clk_data, &pdev->dev);
> -       if (r)
> -               goto unregister_composite_muxes;
> -
>         r = clk_mt8186_reg_mfg_mux_notifier(&pdev->dev,
>                                             clk_data->hws[CLK_TOP_MFG]->clk);
>         if (r)
> -               goto unregister_composite_divs;
> +               goto unregister_composite_muxes;
>
>         r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>         if (r)
> -               goto unregister_composite_divs;
> +               goto unregister_composite_muxes;
>
>         platform_set_drvdata(pdev, clk_data);
>
>         return r;
>
> -unregister_composite_divs:
> -       mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
>  unregister_composite_muxes:
>         mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
>  unregister_muxes:
> @@ -787,7 +777,6 @@ static int clk_mt8186_topck_remove(struct platform_device *pdev)
>
>         of_clk_del_provider(node);
>         mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
> -       mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);

Wrong line? Not sure how this would've compiled.

>         mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), clk_data);
>         mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
>         mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), clk_data);
> --
> 2.39.0
>

