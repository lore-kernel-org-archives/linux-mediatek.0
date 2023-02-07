Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3657C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL5RDYzyjIW0mBHFqtPQ+SR8w2nC8B8+flvI5fBxZgw=; b=Z0gUnHEeFsxDwP9VzDbdNK4Wed
	j7WkBuaQdZhtYMYO5qFeSwIQfNUrN4qPf7Azk6JGo3aTI3GHXLi2baypY+xbzTiyhpj5jfm3UId7X
	FRULScDE4afCvAOx3WvY5blQYtijfLa8KuVguIp/sN7LLBBGBg5Ytg+lVjj0phpg2lYMwXmQAiQOq
	sphFmq9tOM8dqgNUazvt6VmcFuol4eOCWa1RLv4ZMgTDordjPT03MYXNQfWIyv1RvjZ4fM06d8APt
	GvaNSiG/WLmU9ZfPr1AUlZSaJuca18OX3KBuWT0ssMa3eqRhre/xnfyBTVeQjq/1Nvceu3P/8eo8K
	E2s89WWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHHq-00Axeb-RH; Tue, 07 Feb 2023 06:17:02 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHHo-00AxcI-AT
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:17:01 +0000
Received: by mail-vs1-xe31.google.com with SMTP id k4so15189798vsc.4
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BL5RDYzyjIW0mBHFqtPQ+SR8w2nC8B8+flvI5fBxZgw=;
        b=IuIPBVpgZ08hpK4xFIoKrvp98G7sGXKJZSPnLTiDktVAWL9NFTimGFlEOvkINklzzR
         telGKhbhhmE+xk6vt37eV3miAfiOsAR+oVKDxq9wj992ZlhH444eFPLUIkkNrMwJJGaO
         DYdfR3VLzz74L2mKpy/3al2NNCiHwl02TdcHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BL5RDYzyjIW0mBHFqtPQ+SR8w2nC8B8+flvI5fBxZgw=;
        b=WdpFFQqwaAf4SHpnfhmIPBaHY7GIEf8GWR6pfKfwq6Yh57MSjmO1JsdRfOovvilZkm
         ukL6Az7pd+/ADDWQhPrh6mtVArRfDXIZKHJm86TCJatRR2q4g5S4oIqDUk5+2k+jclMY
         4o6ph2F7Bsf7pQyTcz0PY2gi9wxVvBby9JipQtvJiYtc4KsprPVs+cthSFQtl6bF8gkz
         2P811kvXQQlfKDM615OTPK007Em13YoTYG3BMiQCLd6Zgcg3nFNCme5IGo38wKdWkK88
         oSY0yvdpnnsvAO1kCyJcGmgDt+j1VuZyKBr8syv9fXDSqOAxWcjqA27hMWN21h2rr+pi
         gDpQ==
X-Gm-Message-State: AO0yUKWuXmzwDIHOdycET6p8PB0KRz6fxaMNjF+ibqAIeOOdWIA5rZBA
	RWBJOLQlt1lTAJX8HMZhxCydVUwILq6SIYLDECCNSZJz+YJWN569
X-Google-Smtp-Source: AK7set9i8K1ex1GvgvpZt6KGbhoq9sUGJc6ymsZdnVtxGQNh9dKmWUVTJu+n4uH1wjcaZNmg0kj24+MMLo54M70VIbY=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr549289vsv.85.1675750617274; Mon, 06 Feb
 2023 22:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:16:46 +0800
Message-ID: <CAGXv+5HVNSFyBncAepAhghHsjRdY=XyzsRY0Htm1KcRE7U9dfg@mail.gmail.com>
Subject: Re: [PATCH v1 07/45] clk: mediatek: mt2712: Add error handling to clk_mt2712_apmixed_probe()
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
X-CRM114-CacheID: sfid-20230206_221700_383160_F9F12D0A 
X-CRM114-Status: GOOD (  16.13  )
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
> This function was completely missing error handling: add it.
>

Fixes tag?

Code looks OK. So once the tag is added,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2712.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index ce28ee47f5cf..8aa361f0fa13 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -1091,15 +1091,25 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>         struct device_node *node = pdev->dev.of_node;
>
>         clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
>
> -       mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +       r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +       if (r)
> +               goto free_clk_data;
>
>         r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +       if (r) {
> +               dev_err(&pdev->dev, "Cannot register clock provider: %d\n", r);
> +               goto unregister_plls;
> +       }
>
> -       if (r != 0)
> -               pr_err("%s(): could not register clock provider: %d\n",
> -                       __func__, r);
> +       return 0;
>
> +unregister_plls:
> +       mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +free_clk_data:
> +       mtk_free_clk_data(clk_data);
>         return r;
>  }
>
> --
> 2.39.1
>

