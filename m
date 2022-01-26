Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014AAC28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKl/tQVAng5c08RgnE4uAaYSeGR3jLjMBBr3pUjYaiE=; b=S2b2SjJ3l74Iwi
	Blj1oIwFyxmpEG1oUCkSktcyLked+4AUXbzyJh0542gXyWvCT84Pelmejh1Segs/3RjVnltTum8W8
	oKSfop+4b4J5cBxOyuC2WO7kjosGNjzkUpJ11IOOFSl+ohEKfrvp7e052R4ZwlXcYGeB2chv/JVkd
	HINwh5azgenOsETHfcZVik6u/RRapUhmRYxkS6tEXXGRE6DEKE97RD/RFLbqVWbTL5ab6yzNrlBSA
	M9ky8yD5FsmoyqyiWja1IiVrbUrKzBeJZK/fXaJHB6qjAz+NJjHlZdDxztQLDFKfheyRg6euc/eDk
	fz1TqCGDBb4yPRss2RVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdZv-00Ahk5-HE; Wed, 26 Jan 2022 08:22:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdZs-00Ahj9-A4; Wed, 26 Jan 2022 08:22:53 +0000
X-UUID: 8b611a2c64fb4a819e0e5c20167abb82-20220126
X-UUID: 8b611a2c64fb4a819e0e5c20167abb82-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 665835342; Wed, 26 Jan 2022 01:22:49 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:19:12 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 16:19:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:19:10 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 27/31] clk: mediatek: Unregister clks in
 mtk_clk_simple_probe() error path
Date: Wed, 26 Jan 2022 16:19:09 +0800
Message-ID: <20220126081909.7300-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-28-wenst@chromium.org>
References: <20220122091731.283592-28-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_002252_382265_2D66C392 
X-CRM114-Status: GOOD (  17.78  )
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

> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of mtk_clk_simple_probe() to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mtk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index e1977c8e130a..6d0b8842971b 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -434,12 +434,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  	if (r)
> -		goto free_data;
> +		goto unregister_clks;
>  
>  	platform_set_drvdata(pdev, clk_data);
>  
>  	return r;
>  
> +unregister_clks:
> +	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
>  free_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
