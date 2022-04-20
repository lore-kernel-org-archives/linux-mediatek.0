Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC3AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 02:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1CJRw6eAqjuddODESjKGgZzlToePWs0L3F9vpk7VqI=; b=OejePw6IojhreE
	bWNSEQ7SZNHEg96GkXICJye2HWpLu+XtbRgOctwSMCKeVa2yTpGTcxi92BbbDR7WvHeBxUVPfFrne
	hvVVdhU6uVo8MmYlZtI1PtAkqZzxzAjNhyAxkJPGVG4fRUt0nlaouuMYymTaGRdPjqqbMAsVGPTO2
	UNAvOk6NnpCX9b3PcdDFiCBNBoBmNWgeH/THa0otEf0AG5XeO89k3jex/m3NRfi00TaLJcjcM+U0N
	IpYhfe8dw1C6Y4Eex7FX5C9k0WC7AyqHhis8/EyNFvQ9YzeROaKod4zA9uUIKi13bbXVwsRxjqk3O
	YAl3/hr4RNVrH+8Ue+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngzxw-006wOE-D5; Wed, 20 Apr 2022 02:21:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngzxq-006wMM-Rh; Wed, 20 Apr 2022 02:21:10 +0000
X-UUID: c7cfb9db0fee4ba7ad5fc261ed24d7a1-20220419
X-UUID: c7cfb9db0fee4ba7ad5fc261ed24d7a1-20220419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1145894275; Tue, 19 Apr 2022 19:21:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 19:21:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 10:20:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 10:20:59 +0800
Message-ID: <a04e0a7e70e116c1155227b94c1c0f354e0dcc8f.camel@mediatek.com>
Subject: Re: [PATCH 5/7] clk: mediatek: reset: Revise structure to control
 reset register
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <yong.liang@mediatek.com>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 20 Apr 2022 10:20:59 +0800
In-Reply-To: <dc4277ce-cf80-7176-a71f-cb9f93411086@collabora.com>
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-6-rex-bc.chen@mediatek.com>
 <dc4277ce-cf80-7176-a71f-cb9f93411086@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_192106_957503_02EC20C3 
X-CRM114-Status: GOOD (  43.94  )
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

On Tue, 2022-04-19 at 12:46 +0200, AngeloGioacchino Del Regno wrote:
> Il 18/04/22 15:21, Rex-BC Chen ha scritto:
> > Replace the structure "struct mtk_reset" to reset.h, and rename it
> > as
> > "mtk_clk_rst_data". We use it to input the resset register data and
> > store reset controller device.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701-eth.c |  9 +++-
> >   drivers/clk/mediatek/clk-mt2701-g3d.c |  9 +++-
> >   drivers/clk/mediatek/clk-mt2701-hif.c |  9 +++-
> >   drivers/clk/mediatek/clk-mt2701.c     | 19 +++++++-
> >   drivers/clk/mediatek/clk-mt2712.c     | 19 +++++++-
> >   drivers/clk/mediatek/clk-mt7622-eth.c |  9 +++-
> >   drivers/clk/mediatek/clk-mt7622-hif.c | 19 +++++++-
> >   drivers/clk/mediatek/clk-mt7622.c     | 19 +++++++-
> >   drivers/clk/mediatek/clk-mt7629-eth.c |  9 +++-
> >   drivers/clk/mediatek/clk-mt7629-hif.c | 19 +++++++-
> >   drivers/clk/mediatek/clk-mt8135.c     | 19 +++++++-
> >   drivers/clk/mediatek/clk-mt8173.c     | 19 +++++++-
> >   drivers/clk/mediatek/clk-mt8183.c     | 10 ++++-
> >   drivers/clk/mediatek/reset.c          | 62 +++++++++++++---------
> > -----
> >   drivers/clk/mediatek/reset.h          | 12 +++++-
> >   15 files changed, 209 insertions(+), 53 deletions(-)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c
> > b/drivers/clk/mediatek/clk-mt2701-eth.c
> > index 71257714e6a6..16fc4a50d513 100644
> > --- a/drivers/clk/mediatek/clk-mt2701-eth.c
> > +++ b/drivers/clk/mediatek/clk-mt2701-eth.c
> > @@ -36,6 +36,13 @@ static const struct mtk_gate eth_clks[] = {
> >   	GATE_ETH(CLK_ETHSYS_CRYPTO, "crypto_clk", "ethif_sel", 29),
> >   };
> >   
> > +static struct mtk_clk_rst_data clk_rst_data = {
> 
> static const struct mtk_clk_rst_data clk_rst_data[] = {
> 
> ...because this is initialization data that is never supposed to
> change, and
> in the init function of reset.c, you should never modify this struct.
> 
> > +	.supported = true,
> 
> It would make no sense to call mtk_clk_register_rst_ctrl() if the
> resets
> are not supported, so this .supported member is useless and should be
> removed.

Hello Angelo,

Yes, you are right. I will remove is.

> 
> I will avoid commenting on patch 7/7 and will say it here: I know
> that on that
> patch you're checking for this one but, especially if this reset data
> becomes a
> const you can, at that point, simply check if anything has been
> assigned to it
> so that if it's not NULL, we implicitly know that said clock
> controller instance
> supports resets, and we register them:
> 
> int mtk_clk_simple_probe(...)
> {
> 	.. blah blah ..
> 
> 	if (mcd->rst)
> 		r = mtk_clk_register_rst_ctrl(....)
> 	return r;
> }
> 
> 
> > +	.version = MTK_RST_V1,
> > +	.reg_num = 1,
> > +	.reg_ofs = 0x34,
> > +};
> > +
> >   static const struct of_device_id of_match_clk_mt2701_eth[] = {
> >   	{ .compatible = "mediatek,mt2701-ethsys", },
> >   	{}
> 
> ..snip..
> 
> > diff --git a/drivers/clk/mediatek/clk-mt2701.c
> > b/drivers/clk/mediatek/clk-mt2701.c
> > index c1100a20c7ed..a8ac3d11ced6 100644
> > --- a/drivers/clk/mediatek/clk-mt2701.c
> > +++ b/drivers/clk/mediatek/clk-mt2701.c
> > @@ -735,6 +735,21 @@ static const struct mtk_fixed_factor
> > infra_fixed_divs[] = {
> >   	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
> >   };
> >   
> 
> For increased readability, perhaps it's a good idea to do something
> like...
> 

OK, I will do this.

> > +static struct mtk_clk_rst_data clk_rst_data[] = {
> > +	{
> 
> 	{	/* infrasys */
> 
> > +		.supported = true,
> > +		.version = MTK_RST_V1,
> > +		.reg_num = 2,
> > +		.reg_ofs = 0x30,
> > +	},
> 
> 	{	/* pericfg */
> 
> > +	{
> > +		.supported = true,
> > +		.version = MTK_RST_V1,
> > +		.reg_num = 2,
> > +		.reg_ofs = 0x0,
> > +	},
> > +};
> > +
> >   static struct clk_onecell_data *infra_clk_data;
> >   
> >   static void __init mtk_infrasys_init_early(struct device_node
> > *node)
> 
> ..snip...
> 
> > diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c
> > b/drivers/clk/mediatek/clk-mt7622-hif.c
> > index 6be894299ae3..a10ecc5b88a1 100644
> > --- a/drivers/clk/mediatek/clk-mt7622-hif.c
> > +++ b/drivers/clk/mediatek/clk-mt7622-hif.c
> > @@ -76,6 +76,21 @@ static const struct mtk_gate pcie_clks[] = {
> >   	GATE_PCIE(CLK_SATA_PM_EN, "sata_pm_en", "univpll2_d4", 30),
> >   };
> >   
> > +static struct mtk_clk_rst_data clk_rst_data[] = {
> > +	{
> > +		.supported = true,
> > +		.version = MTK_RST_V1,
> > +		.reg_num = 1,
> > +		.reg_ofs = 0x34,
> > +	},
> 
> I get that the intention here is to separate the reset data between
> ssusbsys
> and pciesys, but both entries are declaring the exact same... since
> (as pointed out
> earlier) this should be a const, you can use the same entry for both.
> 

OK, I will do this using new definition of structure.

> > +	{
> > +		.supported = true,
> > +		.version = MTK_RST_V1,
> > +		.reg_num = 1,
> > +		.reg_ofs = 0x34,
> > +	},
> > +};
> > +
> >   static int clk_mt7622_ssusbsys_init(struct platform_device *pdev)
> >   {
> >   	struct clk_onecell_data *clk_data;
> 
> ..snip..
> 
> 
> > diff --git a/drivers/clk/mediatek/reset.c
> > b/drivers/clk/mediatek/reset.c
> > index 2a55e8bf6b28..709ae54efc18 100644
> > --- a/drivers/clk/mediatek/reset.c
> > +++ b/drivers/clk/mediatek/reset.c
> 
> ..snip..
> 
> > @@ -117,21 +123,15 @@ int mtk_clk_register_rst_ctrl(struct
> > device_node *np,
> >   		return -EINVAL;
> >   	}
> >   
> > -	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > -	if (!data)
> > -		return -ENOMEM;
> > -
> > -	data->regmap = regmap;
> > -	data->regofs = reg_ofs;
> > -	data->rcdev.owner = THIS_MODULE;
> > -	data->rcdev.nr_resets = reg_num * 32;
> > -	data->rcdev.ops = rst_op[version];
> > -	data->rcdev.of_node = np;
> 
> 
> Here's a cleaner version of this:
> 
> int mtk_clk_register_rst_ctrl(struct device *dev,
> 			      const struct mtk_clk_rst_desc *rst_desc)
> {
> 	....some code....
> 
> 	struct mtk_reset_data *mtk_reset;
> 
> 	mtk_reset = devm_kzalloc(dev, sizeof(*mtk_reset), GFP_KERNEL)
> 	if (!mtk_reset)
> 		return -ENOMEM;
> 
> 	mtk_reset->desc = rst_desc;
> 	mtk_reset->regmap = regmap;
> 	mtk_reset->rcdev.owner = .... blah blah
> 
> 	ret = devm_reset_controller_register(dev, &mtk_reset->rcdev);
> 	if (ret)
> 		return ret;
> 
> ....so if you use the devm_* variant, you don't need patch 6/7, as
> unregistering
> the reset controller will be taken care of by devm actions.
> 
> Besides, this is most probably not the case but remember that if you
> need to
> perform more operations to unregister this reset controller, you can
> always
> add a custom devm action with function devm_add_action_or_reset(dev,
> func, parm).
> 
> 

Yes, I have noticed that. But for some clock drivers, they only provide
device_node.
I will add a new register function using device.

> > +	clk_rst->regmap = regmap;
> > +	clk_rst->rcdev.owner = THIS_MODULE;
> > +	clk_rst->rcdev.nr_resets = clk_rst->reg_num * 32;
> > +	clk_rst->rcdev.ops = rst_op[clk_rst->version];
> > +	clk_rst->rcdev.of_node = np;
> >   
> > -	ret = reset_controller_register(&data->rcdev);
> > +	ret = reset_controller_register(&clk_rst->rcdev);
> >   	if (ret) {
> >   		pr_err("could not register reset controller: %d\n",
> > ret);
> > -		kfree(data);
> >   		return -EINVAL;
> >   	}
> >   
> > diff --git a/drivers/clk/mediatek/reset.h
> > b/drivers/clk/mediatek/reset.h
> > index 0af77531b918..851a29c92440 100644
> > --- a/drivers/clk/mediatek/reset.h
> > +++ b/drivers/clk/mediatek/reset.h
> > @@ -6,6 +6,7 @@
> >   #ifndef __DRV_CLK_MTK_RESET_H
> >   #define __DRV_CLK_MTK_RESET_H
> >   
> > +#include <linux/reset-controller.h>
> >   #include <linux/types.h>
> >   
> >   enum mtk_reset_version {
> > @@ -14,7 +15,16 @@ enum mtk_reset_version {
> >   	MTK_RST_MAX,
> >   };
> >   
> > +struct mtk_clk_rst_data {
> > +	struct reset_controller_dev rcdev;
> > +	struct regmap *regmap;
> > +	bool supported;
> > +	u8 version;
> > +	u32 reg_num;
> > +	u16 reg_ofs;
> > +};
> 
> ...so here you'd have something like:
> 
> struct mtk_clk_rst_desc {
> 	u8 version;
> 	u32 reg_num;
> 	u16 reg_ofs;
> };
> 
> struct mtk_reset_data {
> 	struct regmap *regmap;
> 	struct reset_controller_dev rcdev;
> 	const struct mtk_clk_rst_desc *desc;
> };
> 

OK. Thanks for your suggestion.

BRs,
Rex

> 
> Cheers,
> Angelo
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
