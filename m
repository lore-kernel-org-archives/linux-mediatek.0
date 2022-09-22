Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B17C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlFFt+8JUiF9TxvoDduJb9HlFvBvHyC9oT+Nlc30tp4=; b=bE+zJZyVZWt4EC0mfYsT4oxvR9
	9DXkpZI7m45q+6li6/bHgvGlmInAI2/moASP0+QvimGi4DsuOl4FJ2xS1BP4GafNi1ueMKJO6cvNn
	Ch6Pk56lSHgMpx/dy1zE7W48E0oNAafQLIT7yswJqofQCjxjsuMlhhxPwRNOtysBY4KvuopPDIi1g
	63oUfct7toNDp/006omnOVkF6qresYgSjCn6aMmr5WnfJC5v/QaYVyWTF5WiPyhAAkerFfw8uG1NR
	E/3l/ywndRMhdc+4kwTwDvvlWS51a68lgUyfzEUZhtXiOqSi2PZVGTpQLUb+52rBWx4QeSRT0kBo3
	WGcVvuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obLM0-00FOBR-6z; Thu, 22 Sep 2022 12:30:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obLLo-00FO9A-EI; Thu, 22 Sep 2022 12:30:46 +0000
X-UUID: ba5a44450c2b4c45a02c11d43133d29e-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tlFFt+8JUiF9TxvoDduJb9HlFvBvHyC9oT+Nlc30tp4=;
	b=JfBTWuuNe73pXjXLi6Kk2Nv4hghvDqcTpIbnQh3bT7NhFPQ9Dm1hYQ3uXmHbZg3yvQpJcdwUxr0Ym7WmsExbV6u+k1SrPCmDo7rbqmIu09xktHj1AADxaGJmDIVm7WXBA2Zi/C+THdtojkuAWbEQEInpKReMPfyU3/WNqk6400o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:85363dda-4d4e-4ade-a51d-35bb6481f894,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:1512b006-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ba5a44450c2b4c45a02c11d43133d29e-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 170211463; Thu, 22 Sep 2022 05:30:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 20:00:02 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 22 Sep 2022 20:00:02 +0800
Message-ID: <3406c2d59ef8aa9a9f8714d2c64bfa7ae4dd5850.camel@mediatek.com>
Subject: Re: [PATCH v7,1/3] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <ck.hu@mediatek.com>, <p.zabel@pengutronix.de>,
	<airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 22 Sep 2022 20:00:02 +0800
In-Reply-To: <02bcd7f8-488a-75ec-badb-e62944c3d4e8@collabora.com>
References: <1663831764-18169-1-git-send-email-xinlei.lee@mediatek.com>
	 <1663831764-18169-2-git-send-email-xinlei.lee@mediatek.com>
	 <02bcd7f8-488a-75ec-badb-e62944c3d4e8@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_053045_304500_664C9927 
X-CRM114-Status: GOOD (  30.71  )
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

On Thu, 2022-09-22 at 10:16 +0200, AngeloGioacchino Del Regno wrote:
> Il 22/09/22 09:29, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > The difference between MT8186 and other ICs is that when modifying
> > the
> > output format, we need to modify the mmsys_base+0x400 register to
> > take
> > effect.
> > So when setting the dpi output format, we need to call mmsys_func
> > to set
> > it to MT8186 synchronously.
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++++
> >   drivers/soc/mediatek/mtk-mmsys.c       | 32
> > ++++++++++++++++++++++++++
> >   include/linux/soc/mediatek/mtk-mmsys.h |  9 ++++++++
> >   3 files changed, 49 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > b/drivers/soc/mediatek/mt8186-mmsys.h
> > index eb1ad9c37a9c..536005d1cc55 100644
> > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > @@ -3,6 +3,14 @@
> >   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> >   #define __SOC_MEDIATEK_MT8186_MMSYS_H
> >   
> > +/* Values for DPI configuration in MMSYS address space */
> > +#define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> > +#define DPI_FORMAT_MASK					0x3
> 
> This is GENMASK(1, 0)
> 
> > +#define DPI_RGB888_SDR_CON				0
> > +#define DPI_RGB888_DDR_CON				1
> > +#define DPI_RGB565_SDR_CON				2
> > +#define DPI_RGB565_DDR_CON				3
> > +
> >   #define MT8186_MMSYS_OVL_CON			0xF04
> >   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> >   #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 06d8e83a2cb5..0857806206dc 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -227,6 +227,38 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >   
> > +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32
> > offset, u32 mask, u32 val)
> > +{
> > +	u32 tmp;
> > +
> > +	tmp = readl_relaxed(mmsys->regs + offset);
> > +	tmp = (tmp & ~mask) | val;
> > +	writel_relaxed(tmp, mmsys->regs + offset);
> > +}
> > +
> > +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> > +{
> > +	switch (val) {
> 
> You're not handling the MTK_DPI_RGB888_SDR_CON case.
> 
> > +	case MTK_DPI_RGB888_DDR_CON: > +		mtk_mmsys_update_bi
> > ts(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> 
> Are there any other (future, past, present) MTK SoCs having a MMSYS
> DPI_OUTPUT_FORMAT register?
> 
> I don't like seeing this kind of model-agnostic function in a not
> model-agnostic
> driver, especially when this is only because of a register address.
> That would change if no other future (or present) MediaTek SoCs have
> this register.
> 
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB888_DDR_CON);
> > +		break;
> > +	case MTK_DPI_RGB565_SDR_CON:
> > +		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB565_SDR_CON);
> > +		break;
> > +	case MTK_DPI_RGB565_DDR_CON:
> > +		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB565_DDR_CON);
> > +		break;
> 
> This goes here...
> 
> 	case MTK_DPI_RGB888_DDR_CON:
> > +	default:
> > +		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> > +				      DPI_FORMAT_MASK,
> > DPI_RGB888_DDR_CON);
> > +		break;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
> > +
> >   static int mtk_mmsys_reset_update(struct reset_controller_dev
> > *rcdev, unsigned long id,
> >   				  bool assert)
> >   {
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 59117d970daf..b85f66db33e1 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -9,6 +9,13 @@
> >   enum mtk_ddp_comp_id;
> >   struct device;
> >   
> > +enum mtk_dpi_out_format_con {
> > +	MTK_DPI_RGB888_SDR_CON,
> > +	MTK_DPI_RGB888_DDR_CON,
> > +	MTK_DPI_RGB565_SDR_CON,
> > +	MTK_DPI_RGB565_DDR_CON
> > +};
> > +
> >   enum mtk_ddp_comp_id {
> >   	DDP_COMPONENT_AAL0,
> >   	DDP_COMPONENT_AAL1,
> > @@ -65,4 +72,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >   			      enum mtk_ddp_comp_id cur,
> >   			      enum mtk_ddp_comp_id next);
> >   
> > +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
> > +
> >   #endif /* __MTK_MMSYS_H */
> 
> 

Hi Angelo:

Thanks for your review!

1. I will modify the macro definition to use GENMASK(1, 0).
2. At present, only mt8186 needs to modify the register of mmsys
synchronously when changing the output format. 
   Other ICs do not need it, because the MT8186 DPI has been modified
on the hardware.
   And the software needs to cooperate with the modification of the
hardware before it is used. Reserved register for mmsys_base+0x400.
3. will add all of the settings to mtk_mmsys_ddp_dpi_fmt_config.

Best Regards!
xinlei


