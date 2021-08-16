Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43850C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 03:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A726140B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 03:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9A726140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8yKMsSBi2XDJzv+22O3gQ1B037P3MkSJtXG31KuVxM=; b=0ZrhkjQGnC76hC
	CtSvRGmn+xKjfYE14rqWy1/kibDYX4Cn4Zsh6ZFGg/Gm92d/miirdotjt5Yq03HFdi7ovWcFk8ZtB
	9jG1rPPxNLu/GyFUqbLhtIEv509WcpaD/ZN3TaKaNVcc51hsRDU+8EBBBl/q05m2CwJVSagOymYb8
	kMQaU4s68guDMxx+bgvqpXT781re8rIFpM7d+cDPgTHOSTlJoEpznR1h1fE53KI5hpwI2pF2SkxWY
	5ZCEba+ZU1TiEtG4PZRd7iE9NtcOXouqmr88I3RR6m1E8vGY9gkgnfcAyHTEXWgotQdNJ0ZI5Di+t
	tzXT2h16WWQchqeFrMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFSqo-00G1pY-K3; Mon, 16 Aug 2021 02:59:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFSqj-00G1nr-Fv; Mon, 16 Aug 2021 02:59:45 +0000
X-UUID: ff0a6ecdf5da46a2a94d71d4c8c97c78-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pdR6dwqbpnomrUhBIANpqHPF0X+Zdr3TcUqb8NSkbXo=; 
 b=HYo4RgUfxyACvqnlnscSM8AtpRQsSouFyuhnxTinzHZwC1bw6jmy4z59cAWEm2gk2M0MCXVNNrzRPDxnSTa2VHim2rAzgE0rhFH+QiXz+BkwodFZzuZMK38Te89BagtLyMUEfjhH+iqV24P/zzNBuVK9yapHr8Pnx+n9u5IRqqI=;
X-UUID: ff0a6ecdf5da46a2a94d71d4c8c97c78-20210815
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1458776958; Sun, 15 Aug 2021 19:59:38 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 19:59:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 10:59:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 10:59:35 +0800
Message-ID: <46fabd02e7990acf8409762380ee0e33c9a6edc3.camel@mediatek.com>
Subject: Re: [PATCH v2 08/14] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 16 Aug 2021 10:59:35 +0800
In-Reply-To: <b71be855-b1a5-af6c-3000-59e6e42c0a79@gmail.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-9-nancy.lin@mediatek.com>
 <b71be855-b1a5-af6c-3000-59e6e42c0a79@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_195941_632467_06C56D6B 
X-CRM114-Status: GOOD (  38.15  )
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

Hi Matthias,

Thanks for the review.

On Fri, 2021-08-06 at 17:30 +0200, Matthias Brugger wrote:
> 
> On 22/07/2021 11:45, Nancy.Lin wrote:
> > Add mmsys config API.
> 
> This patch is doing a lot of things, it adds a "config" and it adds
> cmdq
> support. Please explain better in the commit message what the config
> is for.
> Please add comments to the different values of struct
> mtk_mmsys_config.
> 
OK, I will explain in more detail in the commit message.

> I understand that cmdq is optional, so please make addition to cmdq a
> separate
> patch.

OK, I will add cmdq support in another patch.


> I'm a bit puzzled about that fact, can you please explain who you get
> the HW to
> behave the same way when you write the same value and offset to
> mmsys-regs and
> via cmdq.
> 
> Thanks,
> Matthias

The mmsys config register settings need to take effect with the other
HW settings(like OVL_ADAPTOR...) at the same vblanking time.
If we use CPU to write the mmsys reg, we can't guarantee all the
settings can be written in the same vblanking time.
Cmdq is used for this purpose. We prepare all the related HW settings
in one cmdq packet. 
The first command in the packet is "wait stream done", and then
following with all the HW settings. After the cmdq packet is flush to
GCE HW.
The GCE waits for the "stream done event" to coming and then starts
flushing all the HW settings. This can guarantee all the settings flush
in the same vblanking. 

Regards,
Nancy

> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    | 38 ++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       | 50
> > ++++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.h       | 10 ++++++
> >  include/linux/soc/mediatek/mtk-mmsys.h | 18 ++++++++++
> >  4 files changed, 116 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 104ba575f765..4bdb2087250c 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -154,6 +154,18 @@
> >  #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT	(1 <<
> > 0)
> >  #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT	(2 <<
> > 0)
> >  
> > +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> > +#define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
> > +#define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
> > +#define MT8195_VDO1_MERGE3_ASYNC_CFG_WD	0xe60
> > +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
> > +#define MT8195_VDO1_HDR_TOP_CFG		0xd00
> > +#define MT8195_VDO1_MIXER_IN1_ALPHA	0xd30
> > +#define MT8195_VDO1_MIXER_IN2_ALPHA	0xd34
> > +#define MT8195_VDO1_MIXER_IN3_ALPHA	0xd38
> > +#define MT8195_VDO1_MIXER_IN4_ALPHA	0xd3c
> > +#define MT8195_VDO1_MIXER_IN4_PAD	0xd4c
> > +
> >  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > = {
> >  	{
> >  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > @@ -261,4 +273,30 @@ static const struct mtk_mmsys_routes
> > mmsys_mt8195_routing_table[] = {
> >  	}
> >  };
> >  
> > +static const struct mtk_mmsys_config mmsys_mt8195_config_table[] =
> > {
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 0,
> > MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 0,
> > MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 1,
> > MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 1,
> > MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 2,
> > MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 2,
> > MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 3,
> > MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> > +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 3,
> > MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> > +	{ MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0,
> > MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> > +	{ MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0,
> > MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 1,
> > MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(8, 0), 0},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 1,
> > MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(24, 16), 16},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 2,
> > MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(8, 0), 0},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 2,
> > MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(24, 16), 16},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 3,
> > MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(8, 0), 0},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 3,
> > MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(24, 16), 16},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 4,
> > MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(8, 0), 0},
> > +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 4,
> > MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(24, 16), 16},
> > +	{ MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, MT8195_VDO1_MIXER_IN4_PAD,
> > GENMASK(4, 4), 4},
> > +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 1, MT8195_VDO1_HDR_TOP_CFG,
> > GENMASK(20, 20), 20},
> > +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 2, MT8195_VDO1_HDR_TOP_CFG,
> > GENMASK(21, 21), 21},
> > +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 3, MT8195_VDO1_HDR_TOP_CFG,
> > GENMASK(22, 22), 22},
> > +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 4, MT8195_VDO1_HDR_TOP_CFG,
> > GENMASK(23, 23), 23},
> > +};
> > +
> >  #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 9e31aad6c5c8..d0f4a407f8f8 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -63,10 +63,13 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data = {
> >  	.clk_driver = "clk-mt8195-vdo1",
> >  	.routes = mmsys_mt8195_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > +	.config = mmsys_mt8195_config_table,
> > +	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
> >  };
> >  
> >  struct mtk_mmsys {
> >  	void __iomem *regs;
> > +	struct cmdq_client_reg cmdq_base;
> >  	const struct mtk_mmsys_driver_data *data;
> >  };
> >  
> > @@ -104,6 +107,47 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >  
> > +void mtk_mmsys_ddp_config(struct device *dev, enum
> > mtk_mmsys_config_type config,
> > +			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt)
> > +{
> > +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > +	const struct mtk_mmsys_config *mmsys_config = mmsys->data-
> > >config;
> > +	u32 reg_val;
> > +	u32 mask;
> > +	u32 offset;
> > +	int i;
> > +
> > +	if (!mmsys->data->num_configs)
> > +		return;
> > +
> > +	for (i = 0; i < mmsys->data->num_configs; i++)
> > +		if (config == mmsys_config[i].config && id ==
> > mmsys_config[i].id)
> > +			break;
> > +
> > +	if (i == mmsys->data->num_configs)
> > +		return;
> > +
> > +	offset = mmsys_config[i].addr;
> > +	mask = mmsys_config[i].mask;
> > +	reg_val = val << mmsys_config[i].shift;
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	if (cmdq_pkt && mmsys->cmdq_base.size) {
> > +		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> > +				    mmsys->cmdq_base.offset + offset,
> > reg_val,
> > +				    mask);
> > +	} else {
> > +#endif
> > +		u32 tmp = readl(mmsys->regs + offset);
> > +
> > +		tmp = (tmp & ~mask) | reg_val;
> > +		writel(tmp, mmsys->regs + offset);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	}
> > +#endif
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> > +
> >  static int mtk_mmsys_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -124,6 +168,12 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >  	}
> >  
> >  	mmsys->data = of_device_get_match_data(&pdev->dev);
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> > +	if (ret)
> > +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> > +#endif
> >  	platform_set_drvdata(pdev, mmsys);
> >  
> >  	clks = platform_device_register_data(&pdev->dev, mmsys->data-
> > >clk_driver,
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > b/drivers/soc/mediatek/mtk-mmsys.h
> > index a760a34e6eca..084b1f5f3c88 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > @@ -73,10 +73,20 @@ struct mtk_mmsys_routes {
> >  	u32 val;
> >  };
> >  
> > +struct mtk_mmsys_config {
> > +	enum mtk_mmsys_config_type config;
> > +	u32 id;
> > +	u32 addr;
> > +	u32 mask;
> > +	u32 shift;
> > +};
> > +
> >  struct mtk_mmsys_driver_data {
> >  	const char *clk_driver;
> >  	const struct mtk_mmsys_routes *routes;
> >  	const unsigned int num_routes;
> > +	const struct mtk_mmsys_config *config;
> > +	const unsigned int num_configs;
> >  };
> >  
> >  /*
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 338c71570aeb..ba3925661cc9 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -6,6 +6,10 @@
> >  #ifndef __MTK_MMSYS_H
> >  #define __MTK_MMSYS_H
> >  
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> > +
> >  enum mtk_ddp_comp_id;
> >  struct device;
> >  
> > @@ -54,6 +58,17 @@ enum mtk_ddp_comp_id {
> >  	DDP_COMPONENT_ID_MAX,
> >  };
> >  
> > +enum mtk_mmsys_config_type {
> > +	MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
> > +	MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
> > +	MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH,
> > +	MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT,
> > +	MMSYS_CONFIG_HDR_ALPHA_SEL,
> > +	MMSYS_CONFIG_MIXER_IN_ALPHA_ODD,
> > +	MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN,
> > +	MMSYS_CONFIG_MIXER_IN_CH_SWAP,
> > +};
> > +
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >  			   enum mtk_ddp_comp_id cur,
> >  			   enum mtk_ddp_comp_id next);
> > @@ -62,4 +77,7 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >  			      enum mtk_ddp_comp_id cur,
> >  			      enum mtk_ddp_comp_id next);
> >  
> > +void mtk_mmsys_ddp_config(struct device *dev, enum
> > mtk_mmsys_config_type config,
> > +			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt);
> > +
> >  #endif /* __MTK_MMSYS_H */
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
