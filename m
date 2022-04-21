Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 05:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y4fECLlCCZ1wFkJrmmKlkg9cwUHmSHETrLRViIHSGc=; b=VorY3hfPGlGqqu
	JLdXh0ddwmh3drFo0mx4jvP/WPxLq2Gdy9s1JXInlFERAmhS9uTvkxPG+1nKMhB2aXQHDE8mpojCz
	RhHgIbWXvnZ4MiERCzUpOKGchPN+9v/LhWKGNx0kx5bsNd7vYPXKctl90WT7HgZg/nRBpYwgUec+h
	fQ6dBpfUVLRkZLrUYmtYddvNGeJBSeQgaVVw3XPNT0kQ3h9L8WDMzc1Knln9qP6by2zSMNAOZ793x
	05OlQlDkzMFhq4OnoidgeuS49px/R+a2p7KirmR1g9H/qtQIqx9wpPh42m7YuiJg5TetdYD1Zj8d6
	ALo67azIaFyyS2QuQR1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhPUc-00Baac-Cs; Thu, 21 Apr 2022 05:36:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhPUZ-00Baa3-L5; Thu, 21 Apr 2022 05:36:37 +0000
X-UUID: 9fce78e471ae4a23896b02f8123b47aa-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d7514812-8840-4045-aa1a-283ef30e6991, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:16b99aef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9fce78e471ae4a23896b02f8123b47aa-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 638027548; Wed, 20 Apr 2022 22:36:29 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 22:36:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 13:36:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Apr 2022 13:36:14 +0800
Message-ID: <8c42fd4345063a9a538b0c28342171616c9d0b02.camel@mediatek.com>
Subject: Re: [PATCH V2 09/12] clk: mediatek: reset: Add support for input
 offset and bit from DT
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 21 Apr 2022 13:36:14 +0800
In-Reply-To: <20220420130527.23200-10-rex-bc.chen@mediatek.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-10-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_223635_722851_DA2B0F7D 
X-CRM114-Status: GOOD (  25.25  )
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

On Wed, 2022-04-20 at 21:05 +0800, Rex-BC Chen wrote:
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
>  drivers/clk/mediatek/reset.c | 24 ++++++++++++++++++++++++
>  drivers/clk/mediatek/reset.h |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/reset.c
> b/drivers/clk/mediatek/reset.c
> index 1173111af3ab..dbe812062bf5 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -59,6 +59,20 @@ static const struct reset_control_ops
> mtk_reset_ops_set_clr = {
>  	.reset = mtk_reset_set_clr,
>  };
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
>  static const struct reset_control_ops *rst_op[MTK_RST_MAX] = {
>  	[MTK_RST_SIMPLE] = &reset_simple_ops,
>  	[MTK_RST_SET_CLR] = &mtk_reset_ops_set_clr,
> @@ -98,6 +112,11 @@ int mtk_clk_register_rst_ctrl(struct device_node
> *np,
>  	data->rcdev.ops = rst_op[desc->version];
>  	data->rcdev.of_node = np;
>  
> +	if (desc->version == MTK_RST_SET_CLR) {
> +		data->rcdev.of_reset_n_cells = max(desc->reset_n_cells, 
> 1);
> +		data->rcdev.of_xlate = reset_xlate;
> +	}
> +
>  	ret = reset_controller_register(&data->rcdev);
>  	if (ret) {
>  		pr_err("could not register reset controller: %d\n",
> ret);
> @@ -143,6 +162,11 @@ int mtk_clk_register_rst_ctrl_with_dev(struct
> device *dev,
>  	data->rcdev.of_node = np;
>  	data->rcdev.dev = dev;
>  
> +	if (desc->version == MTK_RST_SET_CLR) {
> +		data->rcdev.of_reset_n_cells = max(desc->reset_n_cells, 
> 1);
> +		data->rcdev.of_xlate = reset_xlate;
> +	}
> +
>  	ret = devm_reset_controller_register(dev, &data->rcdev);
>  	if (ret)
>  		dev_err(dev, "could not register reset controller:
> %d\n", ret);
> diff --git a/drivers/clk/mediatek/reset.h
> b/drivers/clk/mediatek/reset.h
> index 30559bf45f7e..4cfc281fc50d 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -19,6 +19,7 @@ struct mtk_clk_rst_desc {
>  	u8 version;
>  	u32 reg_num;
>  	u16 reg_ofs;
> +	int reset_n_cells;
>  };
>  
>  struct mtk_clk_rst_data {

Hello all,

I think reset_xlate can also support for MTK_RST_SIMPLE.
If this patch is acceptable, I will modify for MTK_RST_SIMPLE in next
version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
