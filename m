Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335B8C83F2C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0epdMrGvIaocozD28WN92DhFdwnzjDxG6GkFKqitp5c=; b=d/Hc5z99FUM72BbtE9vFlke29n
	a3mBbL5+jjac8z+uGZYPmQbYZpkF4t2hLK37aepcgv4m/YlRUja2uUtrjnxDqnWXylQ5jTgpxr+9y
	xHzWqKXkSKxh0/+9thQKLfFC/BovnWyePjB9SLoscMKhyHiu3vDouFglGMe2qXmh82NjnboKQ28O8
	hcMMifoxP5LK5o4obrIlcb8UwhzXCn7kzh3P2rDCm1GNbIKokoNe77N4Xh1jyzwHYrLonjSYzPXmO
	/Ej84xJrmkl5E6Nd6thOPdvWUF30bIzOb9s5DCjTb0bPoczIh/f4dklChX1dqjzBBLalUo3yybPfg
	fdNwSAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6Bl-003hYP-2a;
	Mon, 04 Sep 2023 09:48:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6Bi-003hRs-2r
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 09:48:08 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so189019566b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Sep 2023 02:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693820884; x=1694425684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0epdMrGvIaocozD28WN92DhFdwnzjDxG6GkFKqitp5c=;
        b=h5tePqs69u7ZOan6x5yF2B4OScPzJRj+dq8SyrCpUUi9/6GlOxA1YxBj1DssKO7igZ
         ql+/dqsq4W63RjAKniL/RDRSuu2tfHHZl5yLK32P2o0m9868WcAeKVXixrkr0bIIpti4
         TZztd3mSaz144NgdcUJD5oauTOncg6+l8/Nu6+9nqUye4QfQTiWSxAWkALadv2teRN21
         11T4osqfUBfph4w7ujnTmKyabaXJM5puOsUy3cJVEaqLBfOqczhBuyUVhvOhm2ldRe+y
         RYJJ5gvhHw5H9+MycGCOvY8GOjwdTxD8h1xmevwqEFjLUCtQJJUzXmnUnxJeAPo7Nr/L
         585Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693820884; x=1694425684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0epdMrGvIaocozD28WN92DhFdwnzjDxG6GkFKqitp5c=;
        b=CuPIoyi4ARRqI8dj+1N91ffIyAMtKv0e+J+Mmu+lx3pcRIfv1GXnhz9Oi3yH7KqCWD
         8JjaKOZC5Qieu3cipaQMg5NPxEniFj2z4eKM4eA1T8HKxeJMuO2jvTtPzTCR45V7I+eY
         SBM5TA5T4U1V/5MCKT20is5pDuCIieC//muaJH8m920YNqH9QUp+L9s8tVp72zF7WCtr
         uj+sLNs/suoR95YIGgCV12lB59y3uAcxXPqZVKUUkgrRMyKTlQ0BV3dy+lCeRW1SF3vn
         vQMOGoHhI7WXX728lnUJ5vYiD5gQIz6KnDDQVntramWa7fIVd9+RLSJ5KmxJTTHgora8
         6tiA==
X-Gm-Message-State: AOJu0YxzKCbnMonA8EpEg/lXATg012nm4PpZg7gqRM1dQri+qyKvpvQT
	3j8d6AXRHvkUf7OohrrtCQTGvg==
X-Google-Smtp-Source: AGHT+IHqDjTOUN8MmVWa39gr2DF/D9xBYWMBEA79M3UTLu7/Zx3QJrUK2Da+M+QFZ4HycCUSamyMuw==
X-Received: by 2002:a17:907:9619:b0:99d:decd:3dde with SMTP id gb25-20020a170907961900b0099ddecd3ddemr8877234ejc.18.1693820883978;
        Mon, 04 Sep 2023 02:48:03 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:8020:2b3e:29eb:352d:d92e])
        by smtp.gmail.com with ESMTPSA id g20-20020a1709067c5400b00999bb1e01dfsm5867619ejp.52.2023.09.04.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 02:48:03 -0700 (PDT)
Date: Mon, 4 Sep 2023 11:48:02 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@chromium.org,
	frank.li@vivo.com, robh@kernel.org, jamesjj.liao@mediatek.com,
	shunli.wang@mediatek.com, erin.lo@mediatek.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: clk-mt2701: Add check for
 mtk_alloc_clk_data
Message-ID: <20230904094802.6fasingt4m4yked3@blmsp>
References: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_024806_921449_4E91982E 
X-CRM114-Status: GOOD (  18.70  )
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

On Fri, Sep 01, 2023 at 10:46:58AM +0800, Jiasheng Jiang wrote:
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
> 
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

> ---
>  drivers/clk/mediatek/clk-mt2701.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
> index c81f3e33ce56..12d9560eb4ba 100644
> --- a/drivers/clk/mediatek/clk-mt2701.c
> +++ b/drivers/clk/mediatek/clk-mt2701.c
> @@ -667,6 +667,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
> +	if (!clk_data)
> +		return -ENOMEM;
>  
>  	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
>  								clk_data);
> @@ -747,6 +749,8 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
>  
>  	if (!infra_clk_data) {
>  		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
> +		if (!infra_clk_data)
> +			return;
>  
>  		for (i = 0; i < CLK_INFRA_NR; i++)
>  			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> @@ -774,6 +778,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
>  
>  	if (!infra_clk_data) {
>  		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
> +		if (!infra_clk_data)
> +			return -ENOMEM;
>  	} else {
>  		for (i = 0; i < CLK_INFRA_NR; i++) {
>  			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
> @@ -890,6 +896,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk_data = mtk_alloc_clk_data(CLK_PERI_NR);
> +	if (!clk_data)
> +		return -ENOMEM;
>  
>  	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
>  			       ARRAY_SIZE(peri_clks), clk_data);
> -- 
> 2.25.1
> 

