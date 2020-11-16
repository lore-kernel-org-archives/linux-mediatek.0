Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651AAC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 09:24:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71F02224F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 09:24:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xgY7ZehI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gXltbHYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D71F02224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4vPFiuULc5a29r99jyb2snBo2zmAa6dHw9ctJbrUGg4=; b=xgY7ZehISKf91b3TrDC8SM6vn
	g1kGraToMogwOJocgFk7OFICswnlcw3nw1v448mdHO3litYgZXwdKdrSGgR0orgfhRlq0HTGq9FSR
	6zpbk8DJEIyN3t/odP6qQ9aLwITQH/sJjo63uA2UkpaDcV8tpHVZIlengFryCp8Soa1JP+hyO8r19
	yQccg+hF/Nwd3ec/7BhxZ0W2dtv4iK2Jvr+3Q1Xqlc2KUr9cgYcX0BQu8Cqv62WRkMeXj7Dk6qzWq
	y3+ch6L7jB3VXz9Vg/lyPXCjSmsa+ErczUQz2Q9jmBV9IZYnYUF+qatltm4yqycG7pX+Md3sOGcSU
	SdRX8fMNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keakg-0002NH-EI; Mon, 16 Nov 2020 09:24:46 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keakc-0002M1-N2
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 09:24:43 +0000
Received: by mail-pg1-x544.google.com with SMTP id e21so12664245pgr.11
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 01:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+yksa/L/+O/IgdR91ydcBfWFIPXBuS75+yDTd5UP+s=;
 b=gXltbHYZFSKk18EC26Ru7n9PknIiEOdJ2O+cT/vCIPlOHUCfJqi9YdOqw7xsvSNoBg
 MVzBkiImO+1jrabMHyeelgBpZjgoxB68Jzf8D6yRLpUwFtwof81LxHJBtIohMEyf9EC2
 YW6iKO56lePLu4l1zmeBAtINBrLJzg5odeOXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+yksa/L/+O/IgdR91ydcBfWFIPXBuS75+yDTd5UP+s=;
 b=IspnmNiWqLHdIHViP4f0euFcPoJ0neNKLoHym0iVugUUTyYd+z5wQF/Z/oKK0TC0qz
 GtPGAr5Jk6IR5ZRJupuMs7LVA125mdLuUVJsWev8LXPAmxbcLNf7xD8vwq5eHEH9kStM
 nsStCHvu53FK4NZijU/azwuKUWOKlM79fDwoJa9odXGslczn3Y8K2e/lnxOwSC8nnVKS
 XDBsK1Vulziwlgu1M5jHcljeVMKC3QM7Tiec2vMS8K3NIw9BqCWLSeHGP7jTtNLCtCoW
 0axKd1E/hNeoYS0Dpj7+PqkSJWghB3xObMX8uN3Ya1gB5Pfum6iCo8otb3QmvkFb9F55
 G0BA==
X-Gm-Message-State: AOAM533zuHSi7C9ggoFPXXAjyEeEe6Apju9xktcH8pxh7W/6YUbxSTVe
 T7afBNDu1An1vGSe9CoDquN3wvmTtPO8YvhfjjHUHw==
X-Google-Smtp-Source: ABdhPJxnG8c6YKbLRbp3hBZ10giLjivBjhq+YC6gIMq+1Ad5c5KvK5LrvLXI/LpkaZc2VBbaRYxZE9YglNEVs/M6lNY=
X-Received: by 2002:a65:4905:: with SMTP id p5mr11516053pgs.299.1605518678986; 
 Mon, 16 Nov 2020 01:24:38 -0800 (PST)
MIME-Version: 1.0
References: <1605084902-13151-1-git-send-email-bayi.cheng@mediatek.com>
 <1605084902-13151-2-git-send-email-bayi.cheng@mediatek.com>
In-Reply-To: <1605084902-13151-2-git-send-email-bayi.cheng@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 16 Nov 2020 17:24:28 +0800
Message-ID: <CAATdQgCk6cmD35AQ_pHvotA+Mh8tEiYnHkQVzr5L7ZrpU18z1Q@mail.gmail.com>
Subject: Re: [PATCH v1] spi: spi-mtk-nor: add axi clock control for MT8192
 spi-nor
To: Bayi Cheng <bayi.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_042442_788250_1E0AB914 
X-CRM114-Status: GOOD (  20.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 4:55 PM Bayi Cheng <bayi.cheng@mediatek.com> wrote:
>
> From: bayi cheng <bayi.cheng@mediatek.com>
>
> MT8192 spi-nor is an independent sub system, we need extra control axi
> bus clock for it. Add support for the additional axi clock to allow it
> to be configured appropriately.
>
> Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>

Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/spi/spi-mtk-nor.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index b97f26a..bf2d0f9 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -103,6 +103,7 @@ struct mtk_nor {
>         dma_addr_t buffer_dma;
>         struct clk *spi_clk;
>         struct clk *ctlr_clk;
> +       struct clk *axi_clk;
>         unsigned int spi_freq;
>         bool wbuf_en;
>         bool has_irq;
> @@ -672,6 +673,7 @@ static void mtk_nor_disable_clk(struct mtk_nor *sp)
>  {
>         clk_disable_unprepare(sp->spi_clk);
>         clk_disable_unprepare(sp->ctlr_clk);
> +       clk_disable_unprepare(sp->axi_clk);
>  }
>
>  static int mtk_nor_enable_clk(struct mtk_nor *sp)
> @@ -688,6 +690,13 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
>                 return ret;
>         }
>
> +       ret = clk_prepare_enable(sp->axi_clk);
> +       if (ret) {
> +               clk_disable_unprepare(sp->spi_clk);
> +               clk_disable_unprepare(sp->ctlr_clk);
> +               return ret;
> +       }
> +
>         return 0;
>  }
>
> @@ -746,7 +755,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
>         struct spi_controller *ctlr;
>         struct mtk_nor *sp;
>         void __iomem *base;
> -       struct clk *spi_clk, *ctlr_clk;
> +       struct clk *spi_clk, *ctlr_clk, *axi_clk;
>         int ret, irq;
>         unsigned long dma_bits;
>
> @@ -762,6 +771,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
>         if (IS_ERR(ctlr_clk))
>                 return PTR_ERR(ctlr_clk);
>
> +       axi_clk = devm_clk_get_optional(&pdev->dev, "axi");
> +       if (IS_ERR(axi_clk))
> +               return PTR_ERR(axi_clk);
> +
>         dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
>         if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
>                 dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
> @@ -794,6 +807,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
>         sp->dev = &pdev->dev;
>         sp->spi_clk = spi_clk;
>         sp->ctlr_clk = ctlr_clk;
> +       sp->axi_clk = axi_clk;
>         sp->high_dma = (dma_bits > 32);
>         sp->buffer = dmam_alloc_coherent(&pdev->dev,
>                                 MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
> --
> 1.9.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
