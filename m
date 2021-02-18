Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3197EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 02:00:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9347D64E42
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 02:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9347D64E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gOMC/Ine/6cOuWhyx+1LpOlyxs4HKpiJDBF7w4LZMik=; b=TLbg9+Ct6HnuU/pAQZsRG/3+5
	ngDcPTY8npvFVM5jNJil9HieyB0dKJxbMdzwHHshPVTjbcd5cv5EKKYD8G0c3V4y6ha49Ne6ISiZw
	VF0pE7apuOC7EZnqnqi9mdVr18UjI1vqn+CpmBKcwrCeC3oO1+CVOKdChWKLmsniS2TB5ezrt6Any
	Io/w+QrblJqjYpnEb/8fvia04YO84PF2ayYlyf5MgbCP9R2vmpy/1HpJFU4m9z/WwmVAi9RY1Db/1
	PslzCi0dn3JnP+WTNWuPKl5M7xQBBh/RWJCSjPBXWQ322XZyddW1qPd6dxxxbdC1ThMciLZhBieSA
	if13fgKCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCYbX-0000uV-Ib; Thu, 18 Feb 2021 01:59:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCYbT-0000tg-Rf; Thu, 18 Feb 2021 01:59:41 +0000
X-UUID: dbd245e69d5c4e27914e8a4851b8f2d3-20210217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YZYQMm57Fv4EFKstruSJa6i7mCgo3eCEf5swT5xmKoY=; 
 b=eojwOA9Ja6Uo/icsbfNJC7/b70CfIQMW2Q9KvHOuxPDP9CTxcNfxkTTCp9ZlvdVCgLhNc7jaIM0yo61gceXaR01ifpyMRQmF6Yz+QQQZgnCoUMqjnoK2dWJ1TBViF6vESnLfwznw9wME5sDqu9ZVRhThWgZxrZThSZeoaCBxSQ0=;
X-UUID: dbd245e69d5c4e27914e8a4851b8f2d3-20210217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1702726672; Wed, 17 Feb 2021 17:59:37 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Feb 2021 17:59:35 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 09:59:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Feb 2021 09:59:33 +0800
Message-ID: <1613613573.10714.27.camel@mtksdaap41>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 18 Feb 2021 09:59:33 +0800
In-Reply-To: <b16e4693-1dc6-e13c-3cc9-feb5005179dd@gmail.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
 <b16e4693-1dc6-e13c-3cc9-feb5005179dd@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_205940_129155_986ED8DE 
X-CRM114-Status: GOOD (  29.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-02-10 at 13:46 +0100, Matthias Brugger wrote:
> 
> On 22/12/2020 14:09, Weiyi Lu wrote:
> > Add MT8192 basic clock providers, include topckgen, apmixedsys,
> > infracfg and pericfg.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig      |    8 +
> >  drivers/clk/mediatek/Makefile     |    1 +
> >  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
> >  drivers/clk/mediatek/clk-mux.h    |   15 +
> >  4 files changed, 1350 insertions(+)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
> > 
> 
> [...]
> 
> > +static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
> > +{
> > +	struct clk_onecell_data *clk_data;
> > +	struct device_node *node = pdev->dev.of_node;
> > +	int r;
> > +
> > +	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> > +	if (!clk_data)
> > +		return -ENOMEM;
> > +
> > +	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> > +	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> > +	if (r)
> > +		return r;
> > +
> > +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +}
> > +
> > +static const struct of_device_id of_match_clk_mt8192[] = {
> > +	{
> > +		.compatible = "mediatek,mt8192-apmixedsys",
> > +		.data = clk_mt8192_apmixed_probe,
> > +	}, {
> > +		.compatible = "mediatek,mt8192-topckgen",
> > +		.data = clk_mt8192_top_probe,
> > +	}, {
> > +		.compatible = "mediatek,mt8192-infracfg",
> > +		.data = clk_mt8192_infra_probe,
> > +	}, {
> > +		.compatible = "mediatek,mt8192-pericfg",
> > +		.data = clk_mt8192_peri_probe,
> > +	}, {
> > +		/* sentinel */
> > +	}
> > +};
> > +
> > +static int clk_mt8192_probe(struct platform_device *pdev)
> > +{
> > +	int (*clk_probe)(struct platform_device *pdev);
> > +	int r;
> > +
> > +	clk_probe = of_device_get_match_data(&pdev->dev);
> > +	if (!clk_probe)
> > +		return -EINVAL;
> > +
> > +	r = clk_probe(pdev);
> > +	if (r)
> > +		dev_err(&pdev->dev, "could not register clock provider: %s: %d\n", pdev->name, r);
> > +
> > +	return r;
> > +}
> > +
> > +static struct platform_driver clk_mt8192_drv = {
> > +	.probe = clk_mt8192_probe,
> > +	.driver = {
> > +		.name = "clk-mt8192",
> > +		.of_match_table = of_match_clk_mt8192,
> > +	},
> > +};
> > +
> > +static int __init clk_mt8192_init(void)
> > +{
> > +	return platform_driver_register(&clk_mt8192_drv);
> > +}
> > +
> > +arch_initcall(clk_mt8192_init);
> 
> Do we really need all these clocks that early?
> Why don't we use CLK_OF_DECLARE_DRIVER() then and why do we initialize some
> clocks CLK_OF_DECLARE_DRIVER and other with arch_initcall?
> 
> I know that this is in other drivers for MediaTek SoCs, but that does not mean
> it's the right approach.
> 

I guess you mean CLK_OF_DECLARE() but not CLK_OF_DECLARE_DRIVER(), am I
correct?
I saw there had some discussion[1][2] about initializing these basic
clocks by CLK_OF_DECLARE() or the current implementation by arch_init().
Could I have more of your opinion on this discussion?
[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/1454665050-37776-5-git-send-email-jamesjj.liao@mediatek.com/
[2]
https://patchwork.kernel.org/project/linux-mediatek/patch/1460621514-65191-5-git-send-email-jamesjj.liao@mediatek.com/

As to CLK_OF_DECLARE_DRIVER(), we have to initialize the clocks earlier
for timer(clocksource) driver by this way.

> 
> > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> > index f5625f4..afbc7df 100644
> > --- a/drivers/clk/mediatek/clk-mux.h
> > +++ b/drivers/clk/mediatek/clk-mux.h
> > @@ -77,6 +77,21 @@ struct mtk_mux {
> >  			_width, _gate, _upd_ofs, _upd,			\
> >  			CLK_SET_RATE_PARENT)
> >  
> > +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
> > +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> > +			_upd_ofs, _upd, _flags)				\
> > +		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
> > +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> > +			0, _upd_ofs, _upd, _flags,			\
> > +			mtk_mux_clr_set_upd_ops)
> > +
> > +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
> > +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> > +			_upd_ofs, _upd)					\
> > +		MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
> > +			_mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
> > +			_width, _upd_ofs, _upd,	CLK_SET_RATE_PARENT)
> > +
> 
> Why can't we do something like:
> 
> #define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
> 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> 			_upd_ofs, _upd)					\
> 		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
> 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> 			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,			\
> 			mtk_mux_clr_set_upd_ops)
> 
> >  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
> >  				 struct regmap *regmap,
> >  				 spinlock_t *lock);
> > 

It could be, so I'll fix in next patch.

> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
