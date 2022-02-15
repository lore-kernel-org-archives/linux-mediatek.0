Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Az3cVTynRxVxj1w4PwiKSD5GCHALWpUFgzHcbQSh2BM=; b=NI4nQ+vAvv2jiq
	75Dwfz8Zgn31NhmK5dXatXZu9UOA28HU312Rl0c+/dBTxgFDaboOEzLGU+x49H2cgihlTUAdc/N8G
	Ja8oo33TO59+aV0IbBwKhDjVZqdZeZng29uzSUyNnkanZXwYQ/a1c3Ub9k7pWLUUCMYOaLlRc6cQC
	k/dX3a/XD4c+L/WZMjyytOJcEC168MyeZASFoCYmiBTJHstc5xoYXuZeAna5AnbjsdGQNUUYjCT2S
	N55QV1gFY2p+S6O78mY8NXSnioxq/F/b/ASfRVi4U+/44cNcAD4b/BfpSoOAKGGucCrIzO3sRb0mK
	pObY4JmsuGqJf32lHvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJszy-001b8g-Ha; Tue, 15 Feb 2022 08:15:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrzY-0012N6-5u; Tue, 15 Feb 2022 07:11:17 +0000
X-UUID: fe6f35a24f004dbcbed69e3a248fba1b-20220215
X-UUID: fe6f35a24f004dbcbed69e3a248fba1b-20220215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1283231010; Tue, 15 Feb 2022 00:11:13 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:11:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 15:11:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 15:11:10 +0800
Message-ID: <f489a150d8c1c6dbb1f4162d3d53c7b9f92ab6fd.camel@mediatek.com>
Subject: Re: [PATCH v3 27/31] clk: mediatek: Unregister clks in
 mtk_clk_simple_probe() error path
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 15:11:10 +0800
In-Reply-To: <20220208124034.414635-28-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-28-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_231116_260367_479B742C 
X-CRM114-Status: GOOD (  17.08  )
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

On Tue, 2022-02-08 at 20:40 +0800, Chen-Yu Tsai wrote:
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of mtk_clk_simple_probe() to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index 8f15e9de742e..0e027be0d5fc 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -439,12 +439,14 @@ int mtk_clk_simple_probe(struct platform_device
> *pdev)
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get,
> clk_data);
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
