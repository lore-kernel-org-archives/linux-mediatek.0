Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82335C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhEJW88dUamcVlxz1ctqv2Q07xJfwW2/bNyU0rz8iQk=; b=URF2mJSrfiQKgSBwVjWYxHvwAh
	0WOBwcqYUS9C7DqpR03g37K1zKF2OGwNQkSI6Z+0/5t9DG8CuMkuvaK7nO4hyrR9E1PStUHRBcdBo
	nKb7sQTyrLO8DnxheP7L9XZ/5z1W+GiV42Uf7/kOBO+707NJB3G9qGOIM+P53r6kaFUz4cmPvvAqR
	+kMqtrIa5vfnJeRh9SRJIP8MnMPhdYr6Dxt5kqWVUCk8caA4GxKyDwj1DXuPWBI40NgjfGVedMJPR
	e5PvfFNJUgDOBLCh+UN5HiVT4q4AQ9NUzaIbSN0z+q9dF3Gwly46oMYAwOENahH3ZqxoOvk7IzzlA
	7wkUfUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHXp-00Azye-Sn; Tue, 07 Feb 2023 06:33:33 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHXf-00AzvW-Dr
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:33:24 +0000
Received: by mail-ua1-x936.google.com with SMTP id g12so2591461uae.6
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GhEJW88dUamcVlxz1ctqv2Q07xJfwW2/bNyU0rz8iQk=;
        b=JVvlH3kx8Is97sQFT4RvzJlTQ+zbkU+oBsvJYwzSnaP3fS0ixxmBSYWsPS20j3rhDl
         8+A047CYm0DGQ8NNgLgKYVcAglDhkECnCio+M69CZ/u6/4Fe+5N5VqBvuJachOs7H4VK
         WMq76TJmzWmDR89TxB7dhLP8cLGkKad2MXJf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhEJW88dUamcVlxz1ctqv2Q07xJfwW2/bNyU0rz8iQk=;
        b=Owharl965CWrXUNPdwCMK5Qb14cQyWMiNNuVyovP0ls7YJzK+541VfOexUgzgURXkt
         MT7xc/v4BcmFPC/VjEPZqPYTpN7RMCnf2mKoWYBCpMr6gD6F8nMCPdwntJ2X77dwIbkI
         umhv1x4o1hg9BoFv+hMZWnx7cArvdT8b5WKfeOC8Go+/mDquVICx4CuHQSedFjQetmko
         CiR4wfifz1TWGmIzrMfEj458q5gBNBijb1ELgCL10yTucCZIBC7r8JoZ+ajnT6M6yN58
         BY5YKwIFmnfmHVYUJcDlXz+B5qJk9YVAVTAFauzRZHhwLGsYXIvROhcoPitFscRfJfn8
         wDUw==
X-Gm-Message-State: AO0yUKXsMKqaD0khSBPn7VH5VFJIlnIsNQbgW68f5R/TkQXLV94eVNNE
	zNVFGC0Fg7ErOSCjsHFENrmuPOsOmlT64PT1t6syaw==
X-Google-Smtp-Source: AK7set+YKznaFHPKW5d8ydDKeXnKeXaGm6lSyKFulo85U5cVsQELhT7ZwYey65wdDhWkdey4zY8XvSZcd/FntPH7fcA=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr368876uar.55.1675751601965; Mon, 06 Feb
 2023 22:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:33:10 +0800
Message-ID: <CAGXv+5GfwY2+55UupTUNYVudg3-YDQtkkfhT=M53CJwdqG=ERg@mail.gmail.com>
Subject: Re: [PATCH v1 09/45] clk: mediatek: mt2712: Change to use
 module_platform_driver macro
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
X-CRM114-CacheID: sfid-20230206_223323_508096_66FE7CC8 
X-CRM114-Status: GOOD (  21.09  )
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
> Now that all of the clocks in clk-mt2712.c are using the common
> mtk_clk_simple_{probe,remove}() callbacks we can safely migrate
> to module_platform_driver.

Instead of splitting the conversion into a module among many patches,
I'd do it in one go. With one patch we get a working module instead
of a half-baked one half way through the series.

The subject could say "Convert X driver from builtin to module". And
instead of "migrate to module_platform_driver", the body could say
"convert to module by switching to module_platform_driver, and adding
missing MODULE_* statements". I believe this constitutes one logical
change. Maybe the accompanying Kconfig change should be included as
well?

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2712.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index c5fd76d1b9df..65c1cbcbd54e 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -1028,7 +1028,7 @@ static const struct of_device_id of_match_clk_mt2712_simple[] = {
>         { /* sentinel */ }
>  };
>
> -static struct platform_driver clk_mt2712_simple_drv = {
> +static struct platform_driver clk_mt2712_drv = {

Why the name change? If you do change the name, could you also change
the of match table's name as well to be consistent, and also mention
the change in the commit log?

I'd just leave it alone though.


ChenYu

>         .probe = mtk_clk_simple_probe,
>         .remove = mtk_clk_simple_remove,
>         .driver = {
> @@ -1036,10 +1036,4 @@ static struct platform_driver clk_mt2712_simple_drv = {
>                 .of_match_table = of_match_clk_mt2712_simple,
>         },
>  };
> -
> -static int __init clk_mt2712_init(void)
> -{
> -       return platform_driver_register(&clk_mt2712_simple_drv);
> -}
> -
> -arch_initcall(clk_mt2712_init);
> +module_platform_driver(clk_mt2712_drv);
> --
> 2.39.1
>

