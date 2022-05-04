Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A67C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 05:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPUrjYmOm2IdK17cy/0kLtML7PO9AgKby6GEp5zZPkQ=; b=UkZwk+O1RfsVxE
	bRm1RThIeHiBe6ycvi6a6p5L36m/cFWwl2QrZCVHUz69U6gXTcHl4bGG9ayMZ4/bpuhyYIK7SzUi3
	t82zr6BHePom2k/G5bb7G2WI/F0zbapLztRkVLw06RTUO3/7AssnjFzynUqS/aMxIESc0GLHxSybw
	BFOcRFBIDlcnRDqBzjK//nRim9jBt0Y5v0cMBKJ0tbWwSBmGzVFb7S1Q86yIh3xSyUQqOimDNQgzb
	Gx3/0XbNmzapVzrsrsVvzXM9KFqJW2SlcGvfLLZuUXHPFtMAYCD0kQXPdsHebtpFyHA0i/XrmjGRt
	5pQbreFwtNXVxsI7KnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm7bp-008q0y-Oh; Wed, 04 May 2022 05:31:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm7bm-008q0V-9S; Wed, 04 May 2022 05:31:32 +0000
X-UUID: 31aa71450d8b44149426d0f6c4415392-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:67d404e7-52d6-40f8-8390-34bfcbdca387, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:38b9a22f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 31aa71450d8b44149426d0f6c4415392-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 662056149; Tue, 03 May 2022 22:31:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 22:28:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 4 May 2022 13:28:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 13:28:11 +0800
Message-ID: <2ada19798841f09d1a5675a8e3fb56f56cb778c1.camel@mediatek.com>
Subject: Re: [PATCH v19 08/25] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 4 May 2022 13:28:11 +0800
In-Reply-To: <20220503102345.22817-9-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-9-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_223130_371043_10525140 
X-CRM114-Status: GOOD (  31.23  )
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

Hi, Nancy:

On Tue, 2022-05-03 at 18:23 +0800, Nancy.Lin wrote:
> Add cmdq support for mtk-mmsys config API.
> The mmsys config register settings need to take effect with the other
> HW settings(like OVL_ADAPTOR...) at the same vblanking time.
> 
> If we use CPU to write the mmsys reg, we can't guarantee all the
> settings can be written in the same vblanking time.
> Cmdq is used for this purpose. We prepare all the related HW settings
> in one cmdq packet. The first command in the packet is "wait stream
> done",
> and then following with all the HW settings. After the cmdq packet is
> flush to GCE HW. The GCE waits for the "stream done event" to coming
> and then starts flushing all the HW settings. This can guarantee all
> the settings flush in the same vblanking.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c       | 52 ++++++++++++++++++----
> ----
>  include/linux/soc/mediatek/mtk-mmsys.h | 15 ++++++--
>  2 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 199503dd544a..cd92db3d36fa 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -177,6 +177,7 @@ struct mtk_mmsys {
>  	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
>  	struct reset_controller_dev rcdev;
>  	phys_addr_t io_start;
> +	struct cmdq_client_reg cmdq_base;
>  };
>  
>  static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> @@ -191,10 +192,20 @@ static int mtk_mmsys_find_match_drvdata(struct
> mtk_mmsys *mmsys,
>  	return -EINVAL;
>  }
>  
> -static void mtk_mmsys_write_reg(struct mtk_mmsys *mmsys, u32 offset,
> u32 mask, u32 val)
> +static void mtk_mmsys_write_reg(struct mtk_mmsys *mmsys, u32 offset,
> u32 mask, u32 val,
> +				struct cmdq_pkt *cmdq_pkt)
>  {
>  	u32 tmp;
>  
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	if (cmdq_pkt && mmsys->cmdq_base.size) {
> +		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> +				    mmsys->cmdq_base.offset + offset,
> val,
> +				    mask);
> +		return;
> +	}
> +#endif

How do we process the condition that cmdq_pkt != 0 and mmsys-
>cmdq_base.size == 0? That means DRM driver want to use cmdq control
but mmsys does not support cmdq function. This maybe an error that
mmsys device node lose gce property. So I would like to print error
message in this case.

Regards,
CK

> +
>  	tmp = readl_relaxed(mmsys->regs + offset);
>  	tmp = (tmp & ~mask) | val;
>  	writel_relaxed(tmp, mmsys->regs + offset);
> @@ -210,7 +221,8 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>  
>  	for (i = 0; i < mmsys->data->num_routes; i++)
>  		if (cur == routes[i].from_comp && next ==
> routes[i].to_comp)
> -			mtk_mmsys_write_reg(mmsys, routes[i].addr,
> routes[i].mask, routes[i].val);
> +			mtk_mmsys_write_reg(mmsys, routes[i].addr,
> routes[i].mask, routes[i].val,
> +					    NULL);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>  
> @@ -224,42 +236,46 @@ void mtk_mmsys_ddp_disconnect(struct device
> *dev,
>  
>  	for (i = 0; i < mmsys->data->num_routes; i++)
>  		if (cur == routes[i].from_comp && next ==
> routes[i].to_comp)
> -			mtk_mmsys_write_reg(mmsys, routes[i].addr,
> routes[i].mask, 0);
> +			mtk_mmsys_write_reg(mmsys, routes[i].addr,
> routes[i].mask, 0, NULL);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> width, int height)
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> width, int height,
> +				  struct cmdq_pkt *cmdq_pkt)
>  {
>  	mtk_mmsys_write_reg(dev_get_drvdata(dev),
> MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
> -			    ~0, height << 16 | width);
> +			    ~0, height << 16 | width, cmdq_pkt);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
>  
> -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> be_height)
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> be_height,
> +			   struct cmdq_pkt *cmdq_pkt)
>  {
>  	mtk_mmsys_write_reg(dev_get_drvdata(dev),
> MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> -			    be_height << 16 | be_width);
> +			    be_height << 16 | be_width, cmdq_pkt);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
>  
>  void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> alpha_sel, u16 alpha,
> -			       u8 mode, u32 biwidth)
> +			       u8 mode, u32 biwidth, struct cmdq_pkt
> *cmdq_pkt)
>  {
>  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>  
>  	mtk_mmsys_write_reg(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx -
> 1) * 4, ~0,
> -			    alpha << 16 | alpha);
> +			    alpha << 16 | alpha, cmdq_pkt);
>  	mtk_mmsys_write_reg(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 +
> idx),
> -			    alpha_sel << (19 + idx));
> +			    alpha_sel << (19 + idx), cmdq_pkt);
>  	mtk_mmsys_write_reg(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx -
> 1) * 4,
> -			    GENMASK(31, 16) | GENMASK(1, 0), biwidth <<
> 16 | mode);
> +			    GENMASK(31, 16) | GENMASK(1, 0),
> +			    biwidth << 16 | mode, cmdq_pkt);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
>  
> -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> bool channel_swap)
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> bool channel_swap,
> +				     struct cmdq_pkt *cmdq_pkt)
>  {
>  	mtk_mmsys_write_reg(dev_get_drvdata(dev),
> MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
> -			    BIT(4), channel_swap << 4);
> +			    BIT(4), channel_swap << 4, cmdq_pkt);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
>  
> @@ -272,9 +288,9 @@ static int mtk_mmsys_reset_update(struct
> reset_controller_dev *rcdev, unsigned l
>  	spin_lock_irqsave(&mmsys->lock, flags);
>  
>  	if (assert)
> -		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), 0);
> +		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), 0, NULL);
>  	else
> -		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), BIT(id));
> +		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, 
> BIT(id), BIT(id), NULL);
>  
>  	spin_unlock_irqrestore(&mmsys->lock, flags);
>  
> @@ -364,6 +380,12 @@ static int mtk_mmsys_probe(struct
> platform_device *pdev)
>  		mmsys->data = match_data->drv_data[0];
>  	}
>  
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> +	if (ret)
> +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> +#endif
> +
>  	platform_set_drvdata(pdev, mmsys);
>  
>  	clks = platform_device_register_data(&pdev->dev, mmsys->data-
> >clk_driver,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index fe620929b0f9..7a73305390ba 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -6,6 +6,10 @@
>  #ifndef __MTK_MMSYS_H
>  #define __MTK_MMSYS_H
>  
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
>  enum mtk_ddp_comp_id;
>  struct device;
>  
> @@ -73,13 +77,16 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next);
>  
> -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> width, int height);
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> width,
> +				  int height, struct cmdq_pkt
> *cmdq_pkt);
>  
> -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> be_height);
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> be_height,
> +			   struct cmdq_pkt *cmdq_pkt);
>  
>  void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> alpha_sel, u16 alpha,
> -			       u8 mode, u32 biwidth);
> +			       u8 mode, u32 biwidth, struct cmdq_pkt
> *cmdq_pkt);
>  
> -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> bool channel_swap);
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> bool channel_swap,
> +				     struct cmdq_pkt *cmdq_pkt);
>  
>  #endif /* __MTK_MMSYS_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
