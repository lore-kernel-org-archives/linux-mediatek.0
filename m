Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF16AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzDN9c2O/Cjc5ekvqSS/ms19kPx3pwjUInvHq2OPRr0=; b=HkV4EM3N363+YJ
	i9ZHS8uvgG8ViQY+DWTg6l/eqSr036uxQ2+rInPkfAOU4CQg6ynSTFJGGCRHTfmdNB5mBzR1JOBgX
	k075rePX05Vor2/g0KdKCxunvXXWIFnfznteOSIk4PudNksRppTowRJK9s+FpTCn1Q7EaoEBV0zda
	8AK+iPtP8nvjl1Tr2x+SD8tclrOFr665V5E5RsCtzlAJmX934YFOtHH0vDY56TviwR4R9W8QX31gJ
	DQS2lmCGtriSsnXBQa7nqEpK7/HQu27cp2xZOb1sJUIKrLerefbr0rcCzRRCJ6oE9xcTyYfAdk4zv
	YnloqhJFPEdaB2hfSwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc1K-000FKM-2q; Wed, 27 Apr 2022 07:23:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc18-000FIS-38; Wed, 27 Apr 2022 07:23:20 +0000
X-UUID: a92d8281df654b3aa5362f5aabbdcc3c-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:46ece5bd-0b59-4229-9993-7568973351d4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:900ede2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a92d8281df654b3aa5362f5aabbdcc3c-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 753052126; Wed, 27 Apr 2022 00:23:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 00:22:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 15:22:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 15:22:44 +0800
Message-ID: <9053a481cbe752b458997cff5f0fe7d3040fc22b.camel@mediatek.com>
Subject: Re: [PATCH v17 06/21] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Apr 2022 15:22:43 +0800
In-Reply-To: <eca7f22a-9a04-dd67-aaad-3cf64a909090@gmail.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-7-nancy.lin@mediatek.com>
 <eca7f22a-9a04-dd67-aaad-3cf64a909090@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_002318_169525_8E8BD145 
X-CRM114-Status: GOOD (  34.08  )
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

On Fri, 2022-04-22 at 13:37 +0200, Matthias Brugger wrote:
> 
> On 16/04/2022 04:07, Nancy.Lin wrote:
> > Add cmdq support for mtk-mmsys config API.
> > The mmsys config register settings need to take effect with the
> > other
> > HW settings(like OVL_ADAPTOR...) at the same vblanking time.
> > 
> > If we use CPU to write the mmsys reg, we can't guarantee all the
> > settings can be written in the same vblanking time.
> > Cmdq is used for this purpose. We prepare all the related HW
> > settings
> > in one cmdq packet. The first command in the packet is "wait stream
> > done",
> > and then following with all the HW settings. After the cmdq packet
> > is
> > flush to GCE HW. The GCE waits for the "stream done event" to
> > coming
> > and then starts flushing all the HW settings. This can guarantee
> > all
> > the settings flush in the same vblanking.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c       | 50 ++++++++++++++++++---
> > -----
> >   include/linux/soc/mediatek/mtk-mmsys.h | 15 +++++---
> >   2 files changed, 47 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 7b262cefef85..ea04aa2c3840 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -177,6 +177,7 @@ struct mtk_mmsys {
> >   	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
> >   	struct reset_controller_dev rcdev;
> >   	phys_addr_t io_start;
> > +	struct cmdq_client_reg cmdq_base;
> >   };
> >   
> >   static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> > @@ -280,46 +281,61 @@ static const struct reset_control_ops
> > mtk_mmsys_reset_ops = {
> >   	.reset = mtk_mmsys_reset,
> >   };
> >   
> > -static void mtk_mmsys_write_reg(struct device *dev, u32 offset,
> > u32 mask, u32 val)
> > +static void mtk_mmsys_write_reg(struct device *dev, u32 offset,
> > u32 mask, u32 val,
> > +				struct cmdq_pkt *cmdq_pkt)
> >   {
> >   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >   	u32 tmp;
> >   
> > -	tmp = readl(mmsys->regs + offset);
> > -	tmp = (tmp & ~mask) | val;
> > -	writel(tmp, mmsys->regs + offset);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	if (cmdq_pkt && mmsys->cmdq_base.size) {
> > +		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> > +				    mmsys->cmdq_base.offset + offset,
> > val,
> > +				    mask);
> 
> If we put here:
> 
>     return;
> }
> #endif
> 
> > +	} else {
> > +#endif
> > +		tmp = readl(mmsys->regs + offset);
> > +		tmp = (tmp & ~mask) | val;
> > +		writel(tmp, mmsys->regs + offset);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	}
> > +#endif
> 
> Then we can get rid of this IS_REACHABLE. Other then that patch looks
> good.
> 
> Matthias
> 

Thanks for your suggestion. I will refine it in the next revision.

Regards,
Nancy

> >   }
> >   
> > -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width, int height)
> > +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width,
> > +				  int height, struct cmdq_pkt
> > *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10
> > * idx,
> > -			    ~0, height << 16 | width);
> > +			    ~0, height << 16 | width, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
> >   
> > -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height)
> > +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height,
> > +			   struct cmdq_pkt *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> > -			    be_height << 16 | be_width);
> > +			    be_height << 16 | be_width, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
> >   
> >   void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> > alpha_sel, u16 alpha,
> > -			       u8 mode, u32 biwidth)
> > +			       u8 mode, u32 biwidth, struct cmdq_pkt
> > *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_ALPHA + (idx -
> > 1) * 4, ~0,
> > -			    alpha << 16 | alpha);
> > +			    alpha << 16 | alpha, cmdq_pkt);
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDR_TOP_CFG, BIT(19 +
> > idx),
> > -			    alpha_sel << (19 + idx));
> > +			    alpha_sel << (19 + idx), cmdq_pkt);
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1)
> > * 4,
> > -			    GENMASK(31, 16) | GENMASK(1, 0), biwidth <<
> > 16 | mode);
> > +			    GENMASK(31, 16) | GENMASK(1, 0),
> > +			    biwidth << 16 | mode, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
> >   
> > -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap)
> > +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap,
> > +				     struct cmdq_pkt *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1)
> > * 4, BIT(4),
> > -			    channel_swap << 4);
> > +			    channel_swap << 4, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
> >   
> > @@ -377,6 +393,12 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   		mmsys->data = match_data->drv_data[0];
> >   	}
> >   
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> > +	if (ret)
> > +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> > +#endif
> > +
> >   	platform_set_drvdata(pdev, mmsys);
> >   
> >   	clks = platform_device_register_data(&pdev->dev, mmsys->data-
> > >clk_driver,
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index fe620929b0f9..7a73305390ba 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -6,6 +6,10 @@
> >   #ifndef __MTK_MMSYS_H
> >   #define __MTK_MMSYS_H
> >   
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> > +
> >   enum mtk_ddp_comp_id;
> >   struct device;
> >   
> > @@ -73,13 +77,16 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >   			      enum mtk_ddp_comp_id cur,
> >   			      enum mtk_ddp_comp_id next);
> >   
> > -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width, int height);
> > +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width,
> > +				  int height, struct cmdq_pkt
> > *cmdq_pkt);
> >   
> > -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height);
> > +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height,
> > +			   struct cmdq_pkt *cmdq_pkt);
> >   
> >   void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> > alpha_sel, u16 alpha,
> > -			       u8 mode, u32 biwidth);
> > +			       u8 mode, u32 biwidth, struct cmdq_pkt
> > *cmdq_pkt);
> >   
> > -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap);
> > +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap,
> > +				     struct cmdq_pkt *cmdq_pkt);
> >   
> >   #endif /* __MTK_MMSYS_H */
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0pXxTj2b3mnxU4EoC9pD9oDKrMfP94xbd8LbZmH458oNOSzit_MOSnjS6RhGvUhR$
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
