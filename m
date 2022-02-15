Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7468DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoWhBqFma5QA0m9JuTpCWT3TE4+B0qQciM80kSeO1NM=; b=fksiYaLpFC+MTI
	QOUZ69PIhdPA9GVKRVTwsxpPlSp0OQ7hBrnYGWjMItP7RxGjSD2sh1xFdSONhJsKilE8uqwaeZviJ
	Cr71emHptYfIpvC5PwSA91B41QH4qSt0MdHGOgc+jEpcavdpiIebzEADmJ7eBrGdOqcky+tR/brdr
	FqnUiRALt/owqUiUC3E8vOwKFAt3Pl/wyd9tmIDkp733zhbrTNvxEJUBs5JVkN2ef0Xn2bGF3Qnip
	qFkFHL/rTaGc9do2mHRr1uN8s9TnNUg7kYqdWNqAjZHuZ6hi3jKtFbz/U8LyAUuobPmktpZRT0qvg
	41Fp4/weIGDTGnUfqkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrLy-000enO-MX; Tue, 15 Feb 2022 06:30:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrLl-000egK-S5; Tue, 15 Feb 2022 06:30:11 +0000
X-UUID: 9ae2ec49df454a749d77862d4cd23048-20220214
X-UUID: 9ae2ec49df454a749d77862d4cd23048-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 743586966; Mon, 14 Feb 2022 23:30:05 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:23:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 14:23:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:23:44 +0800
Message-ID: <8e8ee05a2cbc9f4754abcc4597f9fd9da18caf70.camel@mediatek.com>
Subject: Re: [PATCH v3 04/31] clk: mediatek: gate: Implement unregister API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:23:44 +0800
In-Reply-To: <20220208124034.414635-5-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-5-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223009_926195_81C9369D 
X-CRM114-Status: GOOD (  20.26  )
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
> The gate clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the gate type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 35
> +++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-gate.h |  3 +++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c
> b/drivers/clk/mediatek/clk-gate.c
> index e51cfd8c653c..ed1ad5535d41 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -193,6 +193,21 @@ static struct clk *mtk_clk_register_gate(const
> char *name,
>  	return clk;
>  }
>  
> +static void mtk_clk_unregister_gate(struct clk *clk)
> +{
> +	struct mtk_clk_gate *cg;
> +	struct clk_hw *hw;
> +
> +	hw = __clk_get_hw(clk);
> +	if (!hw)
> +		return;
> +
> +	cg = to_mtk_clk_gate(hw);
> +
> +	clk_unregister(clk);
> +	kfree(cg);
> +}
> +
>  int mtk_clk_register_gates_with_dev(struct device_node *node,
>  				    const struct mtk_gate *clks, int
> num,
>  				    struct clk_onecell_data *clk_data,
> @@ -244,4 +259,24 @@ int mtk_clk_register_gates(struct device_node
> *node,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
>  
> +void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
> +			      struct clk_onecell_data *clk_data)
> +{
> +	int i;
> +
> +	if (!clk_data)
> +		return;
> +
> +	for (i = num; i > 0; i--) {
> +		const struct mtk_gate *gate = &clks[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
> +			continue;
> +
> +		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
> +		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_gates);
> +
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-gate.h
> b/drivers/clk/mediatek/clk-gate.h
> index 3d75521ba20c..344adffb6578 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -55,4 +55,7 @@ int mtk_clk_register_gates_with_dev(struct
> device_node *node,
>  				    struct clk_onecell_data *clk_data,
>  				    struct device *dev);
>  
> +void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
> +			      struct clk_onecell_data *clk_data);
> +
>  #endif /* __DRV_CLK_GATE_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
