Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE52C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 01:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DzADj1vzZYUP0DxBdrbcPGRcgmYH9CSPiwf+1ISYBg=; b=RY8vKL4KXv0a5V
	7/NuBs/ZAm7MkuovdLe/UfS7otAqG7y7raYPeX72zfcYkcJGB6JZ8E63TIhKMS6S3QgqrzjlWN9Iu
	Ny7652nQP4pMR7Qok+QiIO09XDe3b1CgyiP2Ur6/tMA8+tEN/OQ3BHkxDorOHznB94ITG0qqYXmI8
	GoRWZfoDqR3USICXRs0ISpPk/GyYSvApwUr0x8BHqcpzBqkLE0Ltwz2LdUBb6jOMi94tC90m342VM
	UmRheV59OS9BG6w17+807c4FOmRK7XWni09lo238eM4+CEpeIRTdrwCp+IFPabzY3fPYm/jaVne/p
	IwxFcUWD7ghbmMj+2IoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHcCN-00FwSB-OO; Wed, 09 Feb 2022 01:55:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHcCA-00FwNl-Ot; Wed, 09 Feb 2022 01:55:00 +0000
X-UUID: da998103d7d94b0f8739964f39aa6be6-20220208
X-UUID: da998103d7d94b0f8739964f39aa6be6-20220208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 771932219; Tue, 08 Feb 2022 18:54:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 17:54:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Feb 2022 09:54:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Feb 2022 09:54:53 +0800
Message-ID: <caebc48b7704f5e90a7513e9857644fea29b39a6.camel@mediatek.com>
Subject: Re: [v2 3/3] clk: mediatek: Integrate vppsys with mtk-mmsys in MT8195
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 9 Feb 2022 09:54:53 +0800
In-Reply-To: <e5ca60a0-4fee-0d6b-0714-77dc51f5a7cf@collabora.com>
References: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
 <20220110005902.27148-4-chun-jie.chen@mediatek.com>
 <e5ca60a0-4fee-0d6b-0714-77dc51f5a7cf@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_175458_847915_3FB1A68F 
X-CRM114-Status: GOOD (  31.59  )
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

On Mon, 2022-01-10 at 22:36 +0800, AngeloGioacchino Del Regno wrote:
> Il 10/01/22 01:59, Chun-Jie Chen ha scritto:
> > Integrate vpp0 and vpp1 with mtk-mmsys driver which
> > will populate device by platform_device_register_data
> > to start vppsys clock driver.
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> Hello Chun-Jie,
> 
> I agree with this series and I would be happy to give you my R-b, but
> this patch will make these clocks to *never* probe in in the targeted
> kernel version.
> 
> You forgot to mention that this patch will break vpp0/vpp1 clocks
> entirely
> unless applied on top of patch series [1].
> 
> Please, either mention that said series is *required* for this one to
> work
> as expected, or move series [1], patches 6 and 7 to this series
> instead;
> since the MDP3 driver will need quite a while to get merged, I would
> suggest
> to move the patches here, as to get something "complete" to merge.
> 
> [1]: 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=568283__;!!CTRNKA9wMg0ARbw!wmrogRswnz6kpeUHCcHn5KDCMwLDf-hiX-e2cPQgx_5-V6YnB_dAbRZRayxp0K_Jbu00$
>  
> 

Thanks for your reminder, I only mention the dependence patch in v1,
but forgot it in v2.


> > ---
> >   drivers/clk/mediatek/clk-mt8195-vpp0.c | 42 +++++++++++++++++--
> > -------
> >   drivers/clk/mediatek/clk-mt8195-vpp1.c | 42 +++++++++++++++++--
> > -------
> >   2 files changed, 56 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> > b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> > index c3241466a8d0..68c375bfce8b 100644
> > --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> > +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> > @@ -86,25 +86,39 @@ static const struct mtk_gate vpp0_clks[] = {
> >   	GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC,
> > "vpp0_warp1_mdp_dl_async", "top_wpe_vpp", 3),
> >   };
> >   
> > -static const struct mtk_clk_desc vpp0_desc = {
> > -	.clks = vpp0_clks,
> > -	.num_clks = ARRAY_SIZE(vpp0_clks),
> > -};
> > +static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node = dev->parent->of_node;
> > +	struct clk_onecell_data *clk_data;
> > +	int r;
> >   
> > -static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
> > -	{
> > -		.compatible = "mediatek,mt8195-vppsys0",
> > -		.data = &vpp0_desc,
> > -	}, {
> > -		/* sentinel */
> > -	}
> > -};
> > +	clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> > +	if (!clk_data)
> > +		return -ENOMEM;
> > +
> > +	r = mtk_clk_register_gates(node, vpp0_clks,
> > ARRAY_SIZE(vpp0_clks), clk_data);
> > +	if (r)
> > +		goto free_vpp0_data;
> > +
> > +	r = of_clk_add_provider(node, of_clk_src_onecell_get,
> > clk_data);
> > +	if (r)
> > +		goto unregister_clk;
> > +
> > +	return r;
> > +
> > +unregister_clk:
> > +	mtk_clk_unregister(clk_data);
> > +
> > +free_vpp0_data:
> > +	mtk_free_clk_data(clk_data);
> > +	return r;
> > +}
> >   
> >   static struct platform_driver clk_mt8195_vpp0_drv = {
> > -	.probe = mtk_clk_simple_probe,
> > +	.probe = clk_mt8195_vpp0_probe,
> >   	.driver = {
> >   		.name = "clk-mt8195-vpp0",
> > -		.of_match_table = of_match_clk_mt8195_vpp0,
> >   	},
> >   };
> >   builtin_platform_driver(clk_mt8195_vpp0_drv);
> > diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> > b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> > index ce0b9a40a179..237077c60f54 100644
> > --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> > +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> > @@ -84,25 +84,39 @@ static const struct mtk_gate vpp1_clks[] = {
> >   	GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_26M, "vpp1_vpp_split_26m",
> > "clk26m", 26),
> >   };
> >   
> > -static const struct mtk_clk_desc vpp1_desc = {
> > -	.clks = vpp1_clks,
> > -	.num_clks = ARRAY_SIZE(vpp1_clks),
> > -};
> > +static int clk_mt8195_vpp1_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node = dev->parent->of_node;
> > +	struct clk_onecell_data *clk_data;
> > +	int r;
> >   
> > -static const struct of_device_id of_match_clk_mt8195_vpp1[] = {
> > -	{
> > -		.compatible = "mediatek,mt8195-vppsys1",
> > -		.data = &vpp1_desc,
> > -	}, {
> > -		/* sentinel */
> > -	}
> > -};
> > +	clk_data = mtk_alloc_clk_data(CLK_VPP1_NR_CLK);
> > +	if (!clk_data)
> > +		return -ENOMEM;
> > +
> > +	r = mtk_clk_register_gates(node, vpp1_clks,
> > ARRAY_SIZE(vpp1_clks), clk_data);
> > +	if (r)
> > +		goto free_vpp1_data;
> > +
> > +	r = of_clk_add_provider(node, of_clk_src_onecell_get,
> > clk_data);
> > +	if (r)
> > +		goto unregister_clk;
> > +
> > +	return r;
> > +
> > +unregister_clk:
> > +	mtk_clk_unregister(clk_data);
> > +
> > +free_vpp1_data:
> > +	mtk_free_clk_data(clk_data);
> > +	return r;
> > +}
> >   
> >   static struct platform_driver clk_mt8195_vpp1_drv = {
> > -	.probe = mtk_clk_simple_probe,
> > +	.probe = clk_mt8195_vpp1_probe,
> >   	.driver = {
> >   		.name = "clk-mt8195-vpp1",
> > -		.of_match_table = of_match_clk_mt8195_vpp1,
> >   	},
> >   };
> >   builtin_platform_driver(clk_mt8195_vpp1_drv);
> > 
> 
> 
> -- 
> AngeloGioacchino Del Regno
> Software Engineer
> 
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
