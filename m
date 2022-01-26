Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCA8C2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1n27CV7bJnAaiS4nlbIS5Wl8B2YkBI8H00eryUuTPk=; b=gzjzdptuDuWQNe
	wEX0OFDsB8O4J6Dsu/QbEXY9c/TryGBmQCT+hsVpt5Ofu49M/23sazFRF+wwWCdEjU7YLlYX/IJs3
	o265+P5gkPoyoe59zGqj5r19ikYyu96vlp+h9G6c2ZEPC0Tbyc5sENHfV7rBM2uPXgqzbqrJ6qc++
	OEWbfzKTCvpl2E9wm2vaSjjGXS3cOhkh+78cTG4s+hRzmllyiZZQDxZskFDwXLQDlx2b/+U2KKsfM
	gHiQ7coQkjYguJ/7LYJBzmPluPGgAb+z9gfTOZinEvQapNlsxQnP5PYizrP8zTXbgD8aRKceS/SzZ
	GC9z/0fSkykaIiFBA9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcxL-00AauN-Dx; Wed, 26 Jan 2022 07:43:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcxI-00AatR-TA; Wed, 26 Jan 2022 07:43:02 +0000
X-UUID: c62e7ae717bf4cb4a46a41deaa99fd1e-20220126
X-UUID: c62e7ae717bf4cb4a46a41deaa99fd1e-20220126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1450470643; Wed, 26 Jan 2022 00:42:57 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 23:42:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 15:42:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 15:42:42 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 22/31] clk: mediatek: gate: Implement error handling in
 register API
Date: Wed, 26 Jan 2022 15:42:42 +0800
Message-ID: <20220126074242.18291-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-23-wenst@chromium.org>
References: <20220122091731.283592-23-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_234300_975576_3C0C2B21 
X-CRM114-Status: GOOD (  19.91  )
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

> The gate clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-gate.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
> index e8881ae1489a..631ff170b7b9 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -237,13 +237,26 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
> -			continue;
> +			goto err;
>  		}
>  
>  		clk_data->clks[gate->id] = clk;
>  	}
>  
>  	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_gate *gate = &clks[i];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
> +			continue;
> +
> +		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
> +		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	return PTR_ERR(clk);
>  }
>  
>  int mtk_clk_register_gates(struct device_node *node,
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
