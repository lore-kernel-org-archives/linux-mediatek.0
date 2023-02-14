Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E50C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 14:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN4EhS6Vt0kOT1pnaNUz+aKfIkXHdM3S3O5QpYZFC90=; b=WSuqeqKFy1ImmGVRvDsRmNFbUV
	PQh21J5aLHB9fxIELTS1SmN0sJyjDQpdOa0Ybz0z3Y2dbCWCXxYke1M9xWjYc0rrrs0iyR6HCH96u
	WENYKimJwUEX5Sj0+Jyb80aiHoTSLPLi7eWx4WSkyl2kB+Nt4G6bpOBHm2rsC647YRDVBEEPXVVSv
	AAm1cWxEGKWJAV3NTMXBE3gFZA7CcVxImLi9ln414e0lHySxQtDg31H8xjCzQpIrfZ4H7tpG5HAHo
	5zDj6wY2Jbu4IBnJmSqKg+apr5ZMqXZ5yjXpocenGGVAsN2TkZ28bvODzNay0j+aCbxmf8z5zOSoe
	VWLGJ/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwEk-002848-DG; Tue, 14 Feb 2023 14:24:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvqy-001ulP-G2; Tue, 14 Feb 2023 14:00:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 19D6BB81D57;
	Tue, 14 Feb 2023 14:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B0EC433A0;
	Tue, 14 Feb 2023 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676383213;
	bh=mBTD57A30/LvcZnwFqjcP9HsmHOnRFYQxkmV8hVd5Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEcUGLmTTaI9Iqgb81PXHajzB0u+y2Sc3bj5iiwGhYrmyPgN2k5j/7WkEKPX88o/g
	 JpBdwhZ/YckttBYaOVYZs50doO8ujqXMZdFjYC/9M7PF6RNLjcWFTVA3u26WsYVrZ0
	 Ro8HmkWRC+x53l7iw9+m2qxR9/8M4FpBhY2I2O6spbVITzhZzmqnKj6zPkwy2pvfbJ
	 MBUyl79rOhYdEugYO3+V3Jo1tgj+x16XmD0mppJ3VDGP86WHP7jxUUt+wmXE6MPC+q
	 aYZ03abiyTbHFKuKlZwtR41bR9m0xHIQy7cIR3ryTr53B30n2FftrHA9jLjaZl4AJ+
	 hHv5tEQFycgxw==
Date: Tue, 14 Feb 2023 19:30:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Eddie Hung =?utf-8?B?KOa0quato+mRqyk=?= <Eddie.Hung@mediatek.com>
Subject: Re: [PATCH v8] phy: mediatek: tphy: add debugfs files
Message-ID: <Y+uT6VoJra+056zj@matsya>
References: <20230210085827.7970-1-chunfeng.yun@mediatek.com>
 <Y+ZjPYDEbC9iblsj@matsya>
 <4e5d86502cc6b2278d7079dfca688af63bbcb523.camel@mediatek.com>
 <eec940a49f4f9ec9e5bd7ad763e436d34b42be22.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eec940a49f4f9ec9e5bd7ad763e436d34b42be22.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_060016_872309_9A909263 
X-CRM114-Status: GOOD (  40.20  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13-02-23, 08:22, Chunfeng Yun (云春峰) wrote:
> On Mon, 2023-02-13 at 16:21 +0800, chunfeng yun wrote:
> > On Fri, 2023-02-10 at 21:01 +0530, Vinod Koul wrote:
> > > On 10-02-23, 16:58, Chunfeng Yun wrote:
> > > > These debugfs files are mainly used to make eye diagram test
> > > > easier,
> > > > especially helpful to do HQA test for a new IC without efuse
> > > > enabled.
> > > > 
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > > v8: abandon patch to create phy debug root file
> > > >     /sys/kernel/debug/phy/ suggested by Vinod
> > > 
> > > Sorry that was not my suggestion
> > 
> > Sorry, I misunderstood you means
> > > 
> > > > 
> > > > v6~v7: no changes
> > > > 
> > > > v5: using common debugfs config CONFIG_DEBUG_FS
> > > > 
> > > > v4: fix build warning of sometimes uninitialized variable
> > > > 
> > > > v3: fix typo of "debugfs" suggested by AngeloGioacchino
> > > > 
> > > > v2: add CONFIG_PHY_MTK_TPHY_DEBUGFS suggested by AngeloGioacchino
> > > > ---
> > > >  drivers/phy/mediatek/phy-mtk-tphy.c | 405
> > > > +++++++++++++++++++++++++++-
> > > >  1 file changed, 404 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > index e906a82791bd..65a95c3726bf 100644
> > > > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > @@ -7,6 +7,7 @@
> > > >  
> > > >  #include <dt-bindings/phy/phy.h>
> > > >  #include <linux/clk.h>
> > > > +#include <linux/debugfs.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/iopoll.h>
> > > >  #include <linux/mfd/syscon.h>
> > > > @@ -264,6 +265,8 @@
> > > >  
> > > >  #define TPHY_CLKS_CNT	2
> > > >  
> > > > +#define USER_BUF_LEN(count) min_t(size_t, 8, (count))
> > > > +
> > > >  enum mtk_phy_version {
> > > >  	MTK_PHY_V1 = 1,
> > > >  	MTK_PHY_V2,
> > > > @@ -310,6 +313,7 @@ struct mtk_phy_instance {
> > > >  	struct clk_bulk_data clks[TPHY_CLKS_CNT];
> > > >  	u32 index;
> > > >  	u32 type;
> > > > +	struct dentry *dbgfs;
> > > >  	struct regmap *type_sw;
> > > >  	u32 type_sw_reg;
> > > >  	u32 type_sw_index;
> > > > @@ -332,10 +336,391 @@ struct mtk_tphy {
> > > >  	const struct mtk_phy_pdata *pdata;
> > > >  	struct mtk_phy_instance **phys;
> > > >  	int nphys;
> > > > +	struct dentry *dbgfs_root;
> > > >  	int src_ref_clk; /* MHZ, reference clock for slew rate
> > > > calibrate */
> > > >  	int src_coef; /* coefficient for slew rate calibrate */
> > > >  };
> > > 
> > > I asked the struct dentry *debugfs be part of struct phy. Debugfs
> > > would
> > > be created by core but rather than exported, it should be populated
> > > in
> > > phy and you can use it here in the driver
> > > 
> > > >  
> > 
> > Ok, I'll do the following steps:
> > 
> > 0. put a struct dentry *debugfs in struct phy;
> > 1. define a static struct dentry *phy_debugfs_root in phy-core.c,
> > then
> >    create a root directory (/sys/kernel/debug/phy/) for phy
> > subsystem 
> > in phy_core_init();
> > 2. create directory for each phy under the root directory
> > (/sys/kernel/debug/phy/);
> >    this step has two ways:
> >    A: create the directory @debugfs of struct phy in phy_create() by
> > default;

That sounds good to me

> >    B: provide some api for user to create/destory the directory
> > @debugfs or others when need;
> > 3. add private debugfs files in @debugfs of struct phy;
> > 
> > For the case in tphy driver, it provides some struct phy, the driver
> > may want to create debugfs files which not belongs to any struct phy
> > in
> > the root directory (/sys/kernel/debug/phy/), then need provide a api.
> > 
> >    Do you have any suggestions?
> >    Which way do you prefer to use in step 2?
> > 
> >    Thanks a lot;
> > 
> > > <skip>
> > > > +
> > > >  static struct platform_driver mtk_tphy_driver = {
> > > >  	.probe		= mtk_tphy_probe,
> > > > +	.remove		= mtk_tphy_remove,
> > > >  	.driver		= {
> > > >  		.name	= "mtk-tphy",
> > > >  		.of_match_table = mtk_tphy_id_table,
> > > > -- 
> > > > 2.18.0
> > > 
> > > 

-- 
~Vinod

