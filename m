Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB48C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Npj+eav/NNRJXW1oLHw5GAQfEv0gLK6b77rIEa7TYQQ=; b=3PalkulrJTZAx5
	EAjTe+xF5jyqmWTBbxYqic4SvTeeEk6vDjMn0xZLPc0ErwgeTRGoHMH6RxsuOqjc6b/pQziOvrTqN
	vszcAwu0/CDi5EtBXSnZd5SntmYnGJxqUaVNjL7qq13hMkgutoo2PTuPCLLChsnRqRtTy1IuhsXGh
	lzpv7iYJ0hyP4MOWGffXSPWJVh5m76Vacqm7LAiH4Q4sNVrUSu78indvGPWAZpV6hXSIUEhDSVRbE
	6lX5c9+4GLC1Pr+Cqc/jWUiQndpkX/D0gcDGj2DQs6hbinqHegQE7XD7Hlv7D0VOLCWLnJg/CnVYm
	zyQ7dqRidnBt9+0+L/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlX4-00GA0v-UU; Fri, 22 Apr 2022 05:08:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlWQ-00G9jP-7R; Fri, 22 Apr 2022 05:08:00 +0000
X-UUID: ee6b38c66ba44e8fb035420dd8537500-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:69ae122e-5209-4010-8e1d-206a73c157ac, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:9fbd90f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ee6b38c66ba44e8fb035420dd8537500-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1151682705; Thu, 21 Apr 2022 22:07:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:01:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 13:01:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 13:01:25 +0800
Message-ID: <60f3595612dba17e5cb115e468e39b7ca551d027.camel@mediatek.com>
Subject: Re: [PATCH V2 04/12] clk: mediatek: reset: Merge and revise reset
 register function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 13:01:25 +0800
In-Reply-To: <a2341eae-3a3a-ca26-8ce7-a4ba9219566c@collabora.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-5-rex-bc.chen@mediatek.com>
 <a2341eae-3a3a-ca26-8ce7-a4ba9219566c@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_220758_299531_6247BA2C 
X-CRM114-Status: GOOD (  26.50  )
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

On Thu, 2022-04-21 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > Merge the reset register function of simple and set_clr into one
> > function.
> > - Input the version number to determine which version we will use.
> > - Rename reset register function to "mtk_clk_register_rst_ctrl"
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
> >   drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
> >   drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
> >   drivers/clk/mediatek/clk-mt2701.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt2712.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
> >   drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
> >   drivers/clk/mediatek/clk-mt7622.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
> >   drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
> >   drivers/clk/mediatek/clk-mt8135.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt8173.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt8183.c     |  3 ++-
> >   drivers/clk/mediatek/clk-mtk.h        | 13 ++++++----
> >   drivers/clk/mediatek/reset.c          | 35 ++++++++++++--------
> > -------
> >   15 files changed, 44 insertions(+), 45 deletions(-)
> > 
> 
> ..snip..
> 
> > diff --git a/drivers/clk/mediatek/reset.c
> > b/drivers/clk/mediatek/reset.c
> > index 6574b19daf0f..8e42deee80a3 100644
> > --- a/drivers/clk/mediatek/reset.c
> > +++ b/drivers/clk/mediatek/reset.c
> > @@ -65,14 +65,23 @@ static const struct reset_control_ops
> > mtk_reset_ops_set_clr = {
> >   	.reset = mtk_reset_set_clr,
> >   };
> >   
> > -static void mtk_register_reset_controller_common(struct
> > device_node *np,
> > -			unsigned int num_regs, int regofs,
> > -			const struct reset_control_ops *reset_ops)
> > +static const struct reset_control_ops *rst_op[MTK_RST_MAX] = {
> > +	[MTK_RST_SIMPLE] = &reset_simple_ops,
> > +	[MTK_RST_SET_CLR] = &mtk_reset_ops_set_clr,
> > +};
> 
> I don't think that we really need this to go to .rodata to get an
> improvement
> in boot times in the order of nanoseconds....
> 
> > +
> > +void mtk_clk_register_rst_ctrl(struct device_node *np,
> > +			       u32 reg_num, u16 reg_ofs, u8 version)
> >   {
> >   	struct mtk_reset *data;
> >   	int ret;
> >   	struct regmap *regmap;
> >   
> > +	if (version >= MTK_RST_MAX) {
> > +		pr_err("Error version number: %d\n", version);
> > +		return;
> > +	}
> > +
> >   	regmap = device_node_to_regmap(np);
> >   	if (IS_ERR(regmap)) {
> >   		pr_err("Cannot find regmap for %pOF: %pe\n", np,
> > regmap);
> > @@ -84,10 +93,10 @@ static void
> > mtk_register_reset_controller_common(struct device_node *np,
> >   		return;
> >   
> >   	data->regmap = regmap;
> > -	data->regofs = regofs;
> > +	data->regofs = reg_ofs;
> >   	data->rcdev.owner = THIS_MODULE;
> > -	data->rcdev.nr_resets = num_regs * 32;
> > -	data->rcdev.ops = reset_ops;
> > +	data->rcdev.nr_resets = reg_num * 32;
> > +	data->rcdev.ops = rst_op[version];
> >   	data->rcdev.of_node = np;
> 
> ...hence, I would prefer to see something like:
> 
> 	switch (version) {
> 	case MTK_RST_SIMPLE:
> 		data->rcdev.ops = &reset_simple_ops;
> 		break;
> 	case MTK_RST_SET_CLR:
> 		data->rcdev.ops = &mtk_reset_ops_set_clr;
> 		break;
> 	default:
> 		pr_err("Unknown reset version %d\n", version);
> 		return;
> 	}
> 
> Like that, you'd also replace that if branch at the beginning where
> you
> do the reset version sanity check.
> If you don't want to allocate a struct mtk_reset before running this
> switch,
> you can also declare a `struct reset_control_ops *rcops = NULL;`
> locally and
> then assign `data->rcdev.ops = rcops;` later: that would also be
> acceptable.
> 
> Cheers,
> Angelo

Hello Angelo,

I will do this in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
