Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83609C2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 07:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2i3NVrap5oAFP41xvLJaVQHrGzcuYz/fsA1XId1lv9I=; b=K7sVj1QwDwLj5e
	qShm6Ep9mNYvybBbPx3hEIcoX9HTY8do8gBzGtkKxNnO5i35CkEZyLGwUXveKYPFQ+D/4NFd6fB2N
	zekrurXWLiN63qUoYto1fzoU6gUiqn26nfAMtowKloxqnttouXomRUSRuQD3ZorDugKEAXnpVtfa7
	6pbZoC84JQjlim6VpZMnbewt39++m3GZIvgqiFf7rdU5UmySqQWlXZFhi85hGwLBwE8pp+PkfRGLO
	EXq9b/+8cShCoa5o/vgbnBpGgCQlu1gZYuOCH6C7teUgnUqu1uES6TAw5ZvFK7vRuYJIGQ/6XWGnA
	abfoZ8pC57SbChUPdziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcVC-00ARup-L0; Wed, 26 Jan 2022 07:13:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcV9-00ARtX-U1; Wed, 26 Jan 2022 07:13:57 +0000
X-UUID: 9e939d29a36e4d4fad877e19f338b55f-20220126
X-UUID: 9e939d29a36e4d4fad877e19f338b55f-20220126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1563888255; Wed, 26 Jan 2022 00:13:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 23:13:51 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 15:13:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 15:13:49 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 19/31] clk: mediatek: Add mtk_clk_simple_remove()
Date: Wed, 26 Jan 2022 15:13:49 +0800
Message-ID: <20220126071349.1118-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-20-wenst@chromium.org>
References: <20220122091731.283592-20-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_231356_008617_93783A41 
X-CRM114-Status: GOOD (  19.51  )
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

> In commit c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to
> simplify clock providers"), a generic probe function was added to
> simplify clk drivers that only needed to support clk gates. However due
> to the lack of unregister APIs, a corresponding remove function was not
> added.
> 
> Now that the unregister APIs have been implemented, add aforementioned
> remove function to make it complete.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 2150ed8678e0..cd76e1d80242 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -369,6 +369,8 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>  	if (r)
>  		goto free_data;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return r;
>  
>  free_data:
> @@ -376,4 +378,17 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> +int mtk_clk_simple_remove(struct platform_device *pdev)
> +{
> +	const struct mtk_clk_desc *mcd = of_device_get_match_data(&pdev->dev);
> +	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +	struct device_node *node = pdev->dev.of_node;
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
> +
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 3c3a934f53cd..4fa658f5d934 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -202,5 +202,6 @@ struct mtk_clk_desc {
>  };
>  
>  int mtk_clk_simple_probe(struct platform_device *pdev);
> +int mtk_clk_simple_remove(struct platform_device *pdev);
>  
>  #endif /* __DRV_CLK_MTK_H */
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
