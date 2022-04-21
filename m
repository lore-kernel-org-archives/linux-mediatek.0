Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F91C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaZrfxq8yIJ2SNRTQ5g3BJ90WmxThvAgZnRGmoVy0ks=; b=I/1eyrYCw8Yy9g
	HhP/zLRv5gfyvuVd3/lZFpMStwLY0kFCvreiBZsoxPGKbl6P9Fb8rhzl8n7+bynxAZN2KVUNodyFu
	s9eaAFK2JXluE1e8XuP/3Ocaoo6d1hpDITxOGmwZu/GvTPuBYKAWkvixUfXrqPIMPIR8Li0B58E7P
	2dxnvyuun5akErp1dCtOquzjfzPbMRE1KdOxTcOl6X7LAawQiPdWzAk2jRkIb3YAcuanKSLvHeiZK
	gvW766unpucYIaQ6y9Hs7VjgCttOlx7EkDWaRq4Jtk2qlwsf/uagJah0tV2y7VY+Hh6ykRH0wGV0w
	0yz6LClsdDYr8b2BdCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSnt-00CbDV-9Y; Thu, 21 Apr 2022 09:08:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSmx-00Cai6-3H; Thu, 21 Apr 2022 09:07:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 338501F45278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532066;
 bh=Ok2xpcEn5emFMgKWShnHgzIgT6cNmeF1Ydap3fmSPDQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RQ2rb4G0p8u/U/mVG9b1DXMed38LBPMOONrHbW2IdK5YXhRY/vdeTQw32yN2O/OK+
 PNPRjKT9Oh1ZMC2NXs33SgcApxZVhCRgTVA67ShZTQpZa7ye4YzUNEr3cUkiEOiW4A
 twkkOCDvW3N5XHPJ1/5fr8PvU+6WX+apqeuwCar+RMe1Fnuxop9zK/K4iNstZanx7O
 nKwKd9C5wt/A08OjVuF+FS1GJi8kbYE2ZsrX04M28ciqfoHD8L9aDRUSP0ELCSmgQt
 Sbl7V09aG4ATVE/iZsimAvMMoUn2znspR3YWHOSA1OLrh0iTdwuIc6ayyD4cUIDP/D
 YIc9Ia7m6KZ5w==
Message-ID: <b9839f51-fef1-c54a-3024-674209987f13@collabora.com>
Date: Thu, 21 Apr 2022 11:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 09/12] clk: mediatek: reset: Add support for input
 offset and bit from DT
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-10-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-10-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020747_326581_1002CC25 
X-CRM114-Status: GOOD (  20.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> To use the clock reset function easier, we implement the of_xlate.
> This function is only adopted in version MTK_SET_CLR because of
> the method of id calculation.
> 
> There is no impact for original use. If the argument number is not
> larger than 1, it will return original id.
> 
> With this implementation if we want to set offset 0x120 and bit 16,
> we can just write something like "resets = <&infra_rst 0x120 16>;".
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/reset.c | 24 ++++++++++++++++++++++++
>   drivers/clk/mediatek/reset.h |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 1173111af3ab..dbe812062bf5 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -59,6 +59,20 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
>   	.reset = mtk_reset_set_clr,
>   };
>   
> +static int reset_xlate(struct reset_controller_dev *rcdev,
> +		       const struct of_phandle_args *reset_spec)
> +{
> +	unsigned int offset, bit;
> +
> +	if (reset_spec->args_count <= 1)
> +		return reset_spec->args[0];
> +
> +	offset = reset_spec->args[0];
> +	bit = reset_spec->args[1];
> +
> +	return (offset >> 4) * 32 + bit;
> +}
> +
>   static const struct reset_control_ops *rst_op[MTK_RST_MAX] = {
>   	[MTK_RST_SIMPLE] = &reset_simple_ops,
>   	[MTK_RST_SET_CLR] = &mtk_reset_ops_set_clr,
> @@ -98,6 +112,11 @@ int mtk_clk_register_rst_ctrl(struct device_node *np,
>   	data->rcdev.ops = rst_op[desc->version];
>   	data->rcdev.of_node = np;
>   
> +	if (desc->version == MTK_RST_SET_CLR) {

...following my previous advice to use switch(version), this would fit in
just fine :-)

Everything else looks ok.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
