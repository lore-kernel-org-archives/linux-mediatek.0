Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF14C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVwIhXbfSzMMC9UUXiu52rBze4D6bzEi0adpegudidM=; b=cfG04vqXw3fZ72
	D/kHD3uV43+Fmarxwz8/vp955uyRWAtpxOY9Ta8ROAVUoLh2z56bnonOsVHwQutXtvFD+nJPYy7BL
	qoElaPRQ6gSTS0i/tAE9a4j8fFv+Isq5bSKpvW+qRQbPn2iNrBraL6UtkBn5iABZP/0J+GXqxYtHf
	X+ZuFw3m1QHJGwZNzXIxeKzdMFhAcgVfby2OScOXw7NoLi7N1QDVlB7cx1aYSEugEQ3UuRU6aSBEc
	Gon+VYNPapzcRbEUMYyG+a3m5zRxUqSH1egMDHfPMnumJanCRBgn2qL9cp01mr3kR/ZutugxLLN03
	KKsdZIcxqOcsh9PGoMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmDu-00FUXp-Bp; Thu, 17 Mar 2022 09:15:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmDh-00FUUr-F0; Thu, 17 Mar 2022 09:14:59 +0000
X-UUID: c5a10a00e253405685dab861929eb3ed-20220317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iW3a6TGZr9IJo38yl13xFT/NScQMH3jqoOZfFvCf7Do=; 
 b=J4Nsuait1YIlxTfLlkel2SH412C2BNfwzEddwe7iCIJ77CVSO7LCgRH98S3g0hY0RNYi5/cvELRXuF3aidimEzxyYqWhtKZ6f2i7xxmXkUocBRHYsOItPBjotByNCL8TaHvN4RKKoJZuxGN/vFtB1VkFA9BXhzn1ZD8EASGK4Mo=;
X-UUID: c5a10a00e253405685dab861929eb3ed-20220317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1360147000; Thu, 17 Mar 2022 02:14:51 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 02:14:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 17:14:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 17:14:42 +0800
Message-ID: <42ab6ee6bdad6157a9d24197cd9d0311da0423e7.camel@mediatek.com>
Subject: Re: [PATCH V4 6/6] spi: mediatek: support hclk
From: Leilk Liu <leilk.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Mark Brown" <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 17 Mar 2022 17:14:42 +0800
In-Reply-To: <e3facd86-9e93-bda7-b6dd-c18f1660466a@collabora.com>
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
 <20220315032411.2826-7-leilk.liu@mediatek.com>
 <e3facd86-9e93-bda7-b6dd-c18f1660466a@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_021457_542703_4637D596 
X-CRM114-Status: GOOD (  24.06  )
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

On Tue, 2022-03-15 at 10:37 +0100, AngeloGioacchino Del Regno wrote:
> Il 15/03/22 04:24, Leilk Liu ha scritto:
> > this patch adds hclk support.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >   drivers/spi/spi-mt65xx.c | 85 ++++++++++++++++++++++++++++++++---
> > -----
> >   1 file changed, 69 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> > index 8958c3fa4fea..d4a602e78aa7 100644
> > --- a/drivers/spi/spi-mt65xx.c
> > +++ b/drivers/spi/spi-mt65xx.c
> > @@ -130,7 +130,7 @@ struct mtk_spi {
> >   	u32 state;
> >   	int pad_num;
> >   	u32 *pad_sel;
> > -	struct clk *parent_clk, *sel_clk, *spi_clk;
> > +	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
> >   	struct spi_transfer *cur_transfer;
> >   	u32 xfer_len;
> >   	u32 num_xfered;
> > @@ -1252,25 +1252,38 @@ static int mtk_spi_probe(struct
> > platform_device *pdev)
> >   		goto err_put_master;
> >   	}
> >   
> > +	mdata->spi_hclk = devm_clk_get(&pdev->dev, "hclk");
> > +	if (!IS_ERR(mdata->spi_hclk)) {
> 
> What you're doing here can be simplified by using
> devm_clk_get_optional() instead.
> Please use that.

Hi AngeloGioacchino, thanks for your suggestion, I'll fix it.

> 
> > +		ret = clk_prepare_enable(mdata->spi_hclk);
> > +		if (ret < 0) {
> > +			dev_err(&pdev->dev, "failed to enable hclk
> > (%d)\n", ret);
> > +			goto err_put_master;
> > +		}
> > +	}
> > +
> >   	ret = clk_prepare_enable(mdata->spi_clk);
> >   	if (ret < 0) {
> >   		dev_err(&pdev->dev, "failed to enable spi_clk (%d)\n",
> > ret);
> > -		goto err_put_master;
> > +		goto err_disable_spi_hclk;
> >   	}
> >   
> >   	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
> >   	if (ret < 0) {
> >   		dev_err(&pdev->dev, "failed to clk_set_parent (%d)\n",
> > ret);
> > -		clk_disable_unprepare(mdata->spi_clk);
> > -		goto err_put_master;
> > +		goto err_disable_spi_clk;
> >   	}
> >   
> >   	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
> >   
> > -	if (mdata->dev_comp->no_need_unprepare)
> > +	if (mdata->dev_comp->no_need_unprepare) {
> >   		clk_disable(mdata->spi_clk);
> > -	else
> > +		if (!IS_ERR(mdata->spi_hclk))
> > +			clk_disable(mdata->spi_hclk);
> > +	} else {
> >   		clk_disable_unprepare(mdata->spi_clk);
> > +		if (!IS_ERR(mdata->spi_hclk))
> > +			clk_disable_unprepare(mdata->spi_hclk);
> > +	}
> >   
> >   	pm_runtime_enable(&pdev->dev);
> >   
> > @@ -1310,6 +1323,11 @@ static int mtk_spi_probe(struct
> > platform_device *pdev)
> >   
> >   err_disable_runtime_pm:
> >   	pm_runtime_disable(&pdev->dev);
> > +err_disable_spi_clk:
> > +	clk_disable_unprepare(mdata->spi_clk);
> > +err_disable_spi_hclk:
> > +	if (!IS_ERR(mdata->spi_hclk))
> 
> When using devm_clk_get_optional(), you can simply omit this check,
> since it will
> be impossible to reach this point with an error pointer stored in
> spi_hclk.
OK, I'll fix it.

> 
> > +		clk_disable_unprepare(mdata->spi_hclk);
> >   err_put_master:
> >   	spi_master_put(master);
> >   
> > @@ -1325,8 +1343,11 @@ static int mtk_spi_remove(struct
> > platform_device *pdev)
> >   
> >   	mtk_spi_reset(mdata);
> >   
> > -	if (mdata->dev_comp->no_need_unprepare)
> > +	if (mdata->dev_comp->no_need_unprepare) {
> >   		clk_unprepare(mdata->spi_clk);
> > +		if (!IS_ERR(mdata->spi_hclk))
> > +			clk_unprepare(mdata->spi_hclk);
> > +	}
> >   
> >   	return 0;
> >   }
> > @@ -1342,8 +1363,11 @@ static int mtk_spi_suspend(struct device
> > *dev)
> >   	if (ret)
> >   		return ret;
> >   
> > -	if (!pm_runtime_suspended(dev))
> > +	if (!pm_runtime_suspended(dev)) {
> >   		clk_disable_unprepare(mdata->spi_clk);
> > +		if (!IS_ERR(mdata->spi_hclk))
> > +			clk_disable_unprepare(mdata->spi_hclk);
> > +	}
> >   
> >   	return ret;
> >   }
> > @@ -1360,11 +1384,23 @@ static int mtk_spi_resume(struct device
> > *dev)
> >   			dev_err(dev, "failed to enable spi_clk (%d)\n",
> > ret);
> >   			return ret;
> >   		}
> > +
> > +		if (!IS_ERR(mdata->spi_hclk)) {
> 
> Since you will be using devm_clk_get_optional(), you can also omit
> this check.
OK, I'll fix it.

> 
> > +			clk_prepare_enable(mdata->spi_hclk);
> 
> There's a typo. ret = clk_prepare_enable....
OK, I'll fix it.

> 
> > +			if (ret < 0) {
> > +				dev_err(dev, "failed to enable spi_hclk
> > (%d)\n", ret);
> > +				clk_disable_unprepare(mdata->spi_clk);
> > +				return ret;
> > +			}
> > +		}
> >   	}
> >   
> >   	ret = spi_master_resume(master);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> >   		clk_disable_unprepare(mdata->spi_clk);
> > +		if (!IS_ERR(mdata->spi_hclk))
> 
> Same here and everywhere else, no error check if you set this as
> optional clock.
OK, I'll fix it.

> 
> > +			clk_disable_unprepare(mdata->spi_hclk);
> > +	}
> >   
> >   	return ret;
> >   }
> > @@ -1376,10 +1412,15 @@ static int mtk_spi_runtime_suspend(struct
> > device *dev)
> >   	struct spi_master *master = dev_get_drvdata(dev);
> >   	struct mtk_spi *mdata = spi_master_get_devdata(master);
> >   
> > -	if (mdata->dev_comp->no_need_unprepare)
> > +	if (mdata->dev_comp->no_need_unprepare) {
> >   		clk_disable(mdata->spi_clk);
> > -	else
> > +		if (!IS_ERR(mdata->spi_hclk))
> > +			clk_disable(mdata->spi_hclk);
> > +	} else {
> >   		clk_disable_unprepare(mdata->spi_clk);
> > +		if (!IS_ERR(mdata->spi_hclk))
> > +			clk_disable_unprepare(mdata->spi_hclk);
> > +	}
> >   
> >   	return 0;
> >   }
> > @@ -1390,13 +1431,25 @@ static int mtk_spi_runtime_resume(struct
> > device *dev)
> >   	struct mtk_spi *mdata = spi_master_get_devdata(master);
> >   	int ret;
> >   
> > -	if (mdata->dev_comp->no_need_unprepare)
> > +	if (mdata->dev_comp->no_need_unprepare) {
> >   		ret = clk_enable(mdata->spi_clk);
> > -	else
> > +		if (!IS_ERR(mdata->spi_hclk))
> > +			clk_enable(mdata->spi_hclk);
> > +	} else {
> >   		ret = clk_prepare_enable(mdata->spi_clk);
> > -	if (ret < 0) {
> > -		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
> > -		return ret;
> > +		if (ret < 0) {
> > +			dev_err(dev, "failed to enable spi_clk (%d)\n",
> > ret);
> > +			return ret;
> > +		}
> > +
> > +		if (!IS_ERR(mdata->spi_hclk)) {
> > +			ret = clk_prepare_enable(mdata->spi_hclk);
> > +			if (ret < 0) {
> > +				dev_err(dev, "failed to enable spi_hclk
> > (%d)\n", ret);
> > +				clk_disable_unprepare(mdata->spi_clk);
> > +				return ret;
> > +			}
> > +		}
> >   	}
> >   
> >   	return 0;
> > 
> 
> 
> Regards,
> Angelo
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
