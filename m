Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 04:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvFXyQhSoxmtKgagxllTKdD8KYWB4QQoHDDDBsk2tuc=; b=SOIQI7yTu0prQd
	fGM0azxBM3y5XAjiHtqC03MyJeFbZrK6tOEiQpksVJr5Hgp9U3loUT13mu7CHvnJz8hY8W+x9vurC
	KQ6DwtDXBQ+SvHmpdnthMEMxGDQ909aylkmgWWYzbs8BJsWYqvh1d/5Pz+RlJIZmoHhhRGs+H6Gdf
	be6gDWMydECCMXYAhe3m7WjXMOfu8WlD8Y9jiPpJ1COLYUfz8OLPHZPic90MGDh+JbxbB5m5y/a50
	nbhJ0zx8No102087PHB2c6YTZhjsFbYBht1d2njz1YrsBtoEumpVQfBgtR0X0l51TBPerQ2761Tdl
	errQrDKasVC/bfuJto5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsGiN-00FSR8-1O; Sat, 21 May 2022 04:27:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsGiB-00FSOQ-PK; Sat, 21 May 2022 04:27:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4813B82ECD;
 Sat, 21 May 2022 04:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B92C385A5;
 Sat, 21 May 2022 04:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653107248;
 bh=VR2e2nGywKJO8BXGBw7bDB50ksSQe7j9hsFNTsbScHo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=rQtOWkLe4RREd5CSnrIlDauiRGtpW4gIDDk8Hu4bg6ROvhBQKh1NWU50VKus7fduU
 TZa3rxoZikGUUAsMh4tXjyAxlCkK9/aC0TOt6pknNei9PQ2F2WPXMs01zGk5ydQW4l
 pdv5mrATPOVaa+dzTGql53SDZMnJ/cBIPm49xF1jK5hv1+ffzaXfKTNfCtiO6yP0Vf
 WBH5sl+go4s6b7Rl0tnwa0NuvDN8kY4kN7tEGmNi4+/ly1sxrz6l8CvZK+Y+alQfjV
 JBGV66UaC83Nw6z7JwfyuxGn+/x21RPviW9hl5OhG5LbcVn8TwKan8tt5B33nrD3KZ
 p1iYsCqUBkJ7g==
MIME-Version: 1.0
In-Reply-To: <20220520094323.754971-5-wenst@chromium.org>
References: <20220520094323.754971-1-wenst@chromium.org>
 <20220520094323.754971-5-wenst@chromium.org>
Subject: Re: [PATCH 4/4] clk: mediatek: mt8183: Add clk mux notifier for MFG
 mux
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Fri, 20 May 2022 21:27:26 -0700
User-Agent: alot/0.10
Message-Id: <20220521042728.80B92C385A5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_212732_005405_7162950A 
X-CRM114-Status: GOOD (  15.08  )
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

Quoting Chen-Yu Tsai (2022-05-20 02:43:23)
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 8a755fadebb5..afef3738396e 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1217,6 +1219,25 @@ static int clk_mt8183_top_probe(struct platform_device *pdev)
>         mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
>                 top_clk_data);
>  
> +       /* Register mux notifier for MFG mux */

This comment sort of indicates it should be another function for this
block called "register mfg mux notifier".

> +       mfg_mux_nb = devm_kzalloc(&pdev->dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
> +       if (!mfg_mux_nb)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ARRAY_SIZE(top_muxes); i++)
> +               if (top_muxes[i].id == CLK_TOP_MUX_MFG)
> +                       break;
> +       if (i == ARRAY_SIZE(top_muxes))
> +               return -EINVAL;
> +
> +       mfg_mux_nb->mux = &top_muxes[i];
> +       mfg_mux_nb->bypass_index = 0; // Bypass to 26M crystal

Use /* these types of comments */

> +       ret = devm_mtk_clk_mux_notifier_register(&pdev->dev,
> +                                                top_clk_data->hws[CLK_TOP_MUX_MFG]->clk,
> +                                                mfg_mux_nb);
> +       if (ret)
> +               return ret;
> +
>         return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
