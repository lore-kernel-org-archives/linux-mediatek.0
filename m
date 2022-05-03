Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 02:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKJn56kL//6KWF2rdt9gKFKR7ognOjF1vlGGi0Secmk=; b=lTJyInMFj51avm
	AnsvEtXc7zm7JFQWC3KkafAK83dc73Hi79J2QnBJDAUKxpbJaiBFSvmuRzbtjpBEBtVLN/aRomNDp
	L35YbB1c+nDrQCjp7zOMu3DwIlk6SUnuWRdUI2X0ma5P2eilQ02FA2PZEgjpkTbWkoA3ap1PeQmyT
	SHf0ot6Lc7vl9zoao5Q8aeeqqHFUqr2e7xuieL1vx6a+Q9Lv37HxYZkze5UukZLiUmsnIpBzBUVtH
	b0kqVU3O7rH+nSqLsRFCF61Hai+q0yYZuWeRzdylqV3owjNSzLq+3p5Jv8eE7SNUhWu2xZo2KMg7H
	OyQ6eL26axAqG7FyYHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nliYj-003TSr-1l; Tue, 03 May 2022 02:46:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nliYf-003TQu-Q5; Tue, 03 May 2022 02:46:39 +0000
X-UUID: 90a66203c9e542aab03a000d19e8e5a3-20220502
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:44f92a0c-4fce-4c33-bd14-2cebe6bb8140, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:73a4792f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 90a66203c9e542aab03a000d19e8e5a3-20220502
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 22173206; Mon, 02 May 2022 19:46:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 May 2022 19:46:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 10:46:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 10:46:22 +0800
Message-ID: <0e01b8bbed83777e5babae4fb52b02eeaa6be931.camel@mediatek.com>
Subject: Re: [PATCH v18 05/21] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 3 May 2022 10:46:22 +0800
In-Reply-To: <3495576e99dae8aea9e5814849d896fe1dd8d831.camel@mediatek.com>
References: <20220428105408.11189-1-nancy.lin@mediatek.com>
 <20220428105408.11189-6-nancy.lin@mediatek.com>
 <3495576e99dae8aea9e5814849d896fe1dd8d831.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_194637_927759_98615A8C 
X-CRM114-Status: GOOD (  31.77  )
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

Hi CK,

Thanks for the review.

On Fri, 2022-04-29 at 16:40 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Thu, 2022-04-28 at 18:53 +0800, Nancy.Lin wrote:
> > Add four mmsys config APIs. The config APIs are used for config
> > mmsys reg. Some mmsys regs need to be set according to the
> > HW engine binding to the mmsys simultaneously.
> > 
> > 1. mtk_mmsys_merge_async_config: config merge async width/height.
> >    async is used for cross-clock domain synchronization.
> > 2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
> > 3. mtk_mmsys_mixer_in_config and mtk_mmsys_mixer_in_config:
> >    config mixer related settings.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    |  6 ++++
> >  drivers/soc/mediatek/mtk-mmsys.c       | 43
> > ++++++++++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-mmsys.h |  9 ++++++
> >  3 files changed, 58 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 51031d75e81e..5469073e3073 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -139,6 +139,12 @@
> >  #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> >  #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> > 0
> >  
> > +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> > +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
> > +#define MT8195_VDO1_HDR_TOP_CFG		0xd00
> > +#define MT8195_VDO1_MIXER_IN1_ALPHA	0xd30
> > +#define MT8195_VDO1_MIXER_IN1_PAD	0xd40
> 
> I would like to sort these by value.
> 
OK. I will refine it.

> > +
> >  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > =
> > {
> >  	{
> >  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 03c75a82c8d3..7b262cefef85 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -280,6 +280,49 @@ static const struct reset_control_ops
> > mtk_mmsys_reset_ops = {
> >  	.reset = mtk_mmsys_reset,
> >  };
> >  
> > +static void mtk_mmsys_write_reg(struct device *dev, u32 offset,
> > u32
> > mask, u32 val)
> > +{
> > +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> > +	u32 tmp;
> > +
> > +	tmp = readl(mmsys->regs + offset);
> > +	tmp = (tmp & ~mask) | val;
> > +	writel(tmp, mmsys->regs + offset);
> > +}
> 
> It looks like that mtk_mmsys_ddp_connect() and
> mtk_mmsys_ddp_disconnect() could call this function to simplify code.
> So I would like this function to be an independent patch which also
> simplify mtk_mmsys_ddp_connect() and mtk_mmsys_ddp_disconnect().
> 
> Regards,
> CK
> 
OK, I will separate the mtk_mmsys_write_reg function to another patch.

Regards,
Nancy

> > +
> > +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width, int height)
> > +{
> > +	mtk_mmsys_write_reg(dev, MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10
> > * idx,
> > +			    ~0, height << 16 | width);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
> > +
> > +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height)
> > +{
> > +	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> > +			    be_height << 16 | be_width);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
> > +
> > +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> > alpha_sel, u16 alpha,
> > +			       u8 mode, u32 biwidth)
> > +{
> > +	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_ALPHA + (idx -
> > 1) * 4, ~0,
> > +			    alpha << 16 | alpha);
> > +	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDR_TOP_CFG, BIT(19 +
> > idx),
> > +			    alpha_sel << (19 + idx));
> > +	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1)
> > * 4,
> > +			    GENMASK(31, 16) | GENMASK(1, 0), biwidth <<
> > 16 | mode);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
> > +
> > +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap)
> > +{
> > +	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1)
> > * 4, BIT(4),
> > +			    channel_swap << 4);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
> > +
> >  static int mtk_mmsys_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index b4388ba43341..fe620929b0f9 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -73,4 +73,13 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >  			      enum mtk_ddp_comp_id cur,
> >  			      enum mtk_ddp_comp_id next);
> >  
> > +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width, int height);
> > +
> > +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height);
> > +
> > +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> > alpha_sel, u16 alpha,
> > +			       u8 mode, u32 biwidth);
> > +
> > +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap);
> > +
> >  #endif /* __MTK_MMSYS_H */
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
