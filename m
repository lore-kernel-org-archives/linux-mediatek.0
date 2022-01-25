Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B1FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErYk/ymNxi2w7qExnNBd1TYdwj+GNQ3kueqD5L3bD74=; b=j+8M5h/5xTPh1G
	qM2APvThz4GXjWLt1sFMM1Wx4qlir7RhCIH0ak/VL/AgQdQUBY63FKOM+YFfVq10EeSCtrs82l+AQ
	AuisSfUa1xv+QTvknpR7yCZAwwWRMk2eVkyjkkKqc7seFK+Nkg9qMw8U4YQkclTWTC4uh94YqZTZF
	SM0Xg/omOMIBh4FFI8StZ0NTa/Sc9rGsdRwAV4YhYIFSlIt9RaFNAgyicslv/7jEUhOOno1k7guGq
	9g8aCkcUJZJWw3JaIpAEosYNvuQcK8Wx6L0EQK/7rRQjZh/VVOWAlvcsa6Jnc7JVeRObD9WNVB9JK
	PMSAgKZI7vcoD7MLsgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCPPK-008uS7-IB; Tue, 25 Jan 2022 17:15:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCPMV-008t97-6D; Tue, 25 Jan 2022 17:12:10 +0000
X-UUID: 987ddbc9c980451eb14b7bd96d130eb4-20220125
X-UUID: 987ddbc9c980451eb14b7bd96d130eb4-20220125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 286279271; Tue, 25 Jan 2022 10:12:03 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 09:12:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 01:11:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 01:11:48 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 06/31] clk: mediatek: cpumux: Implement unregister API
Date: Wed, 26 Jan 2022 01:11:48 +0800
Message-ID: <20220125171148.31102-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-7-wenst@chromium.org>
References: <20220122091731.283592-7-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_091207_263022_A274A836 
X-CRM114-Status: GOOD (  19.31  )
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

> The cpumux clk type within the MediaTek clk driver library only has
> a register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the cpumux type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-cpumux.c | 31 +++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-cpumux.h |  3 +++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
> index cab5095416b6..99a819e3673f 100644
> --- a/drivers/clk/mediatek/clk-cpumux.c
> +++ b/drivers/clk/mediatek/clk-cpumux.c
> @@ -77,6 +77,21 @@ mtk_clk_register_cpumux(const struct mtk_composite *mux,
>  	return clk;
>  }
>  
> +static void mtk_clk_unregister_cpumux(struct clk *clk)
> +{
> +	struct mtk_clk_cpumux *cpumux;
> +	struct clk_hw *hw;
> +
> +	hw = __clk_get_hw(clk);
> +	if (!hw)
> +		return;
> +
> +	cpumux = to_mtk_clk_cpumux(hw);
> +
> +	clk_unregister(clk);
> +	kfree(cpumux);
> +}
> +
>  int mtk_clk_register_cpumuxes(struct device_node *node,
>  			      const struct mtk_composite *clks, int num,
>  			      struct clk_onecell_data *clk_data)
> @@ -106,4 +121,20 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
>  	return 0;
>  }
>  
> +void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> +				 struct clk_onecell_data *clk_data)
> +{
> +	int i;
> +
> +	for (i = num; i > 0; i--) {
> +		const struct mtk_composite *mux = &clks[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
> +			continue;
> +
> +		mtk_clk_unregister_cpumux(clk_data->clks[mux->id]);
> +		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
> +	}
> +}
> +
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
> index 2aaf1afd4e5f..fda7770fd803 100644
> --- a/drivers/clk/mediatek/clk-cpumux.h
> +++ b/drivers/clk/mediatek/clk-cpumux.h
> @@ -19,4 +19,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
>  			      const struct mtk_composite *clks, int num,
>  			      struct clk_onecell_data *clk_data);
>  
> +void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> +				 struct clk_onecell_data *clk_data);
> +
>  #endif /* __DRV_CLK_CPUMUX_H */
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
