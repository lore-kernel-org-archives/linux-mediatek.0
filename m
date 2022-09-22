Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D1C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqqkY6RZhAE3rVrcrjKRkGBIvR8+LloWLVFXuX7uZ70=; b=Qr/qH7oqAOR9xhxQyNHPAJhKge
	MJPK01VGNOIHS9u1gAxBGIii3dtqnYu8EdWNmcAkBMLd1E5j8rCb7ihyHEM9CRzx09hzd3E3BW5ZM
	MtdV00s/p737v9eqWFHKEXNidFQj9kKIWRDWAfshx1LWbnEn6N4t/XMSiwd3RiFZzLttL0ZkyUTdH
	82KwPTlByZkA6VsPI05S4O0Yc6VDvTI096hGhAMVIfOSdo25WAI6MVbLLTnxyQ2U3GSnzmCubk8b0
	gis8KhvmYnJL3fZfj1++urUsAhQW653GugDEXJbIaVwH2k2i85wd/TL5goEQd122GVcrPKQQOzCIa
	PG92zVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obH6v-00Dz94-Fz; Thu, 22 Sep 2022 07:59:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obH6j-00Dz5y-79; Thu, 22 Sep 2022 07:58:55 +0000
X-UUID: 26cfd61ea52d46439064d2876e9c2011-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=yqqkY6RZhAE3rVrcrjKRkGBIvR8+LloWLVFXuX7uZ70=;
	b=Mq0cKBmfX2SB5b8qMFRUIA24KVVH2JH3Xa/lbxg0ZbBCctPWxZ/2L6a6FlkikzCyFPxJeOJ/psFpX5SAuhG0/AeRV73wMbXsQQvNK5cUdCFrGTwe5meZ0c9h51B8vsGSr2InEqu1QUE7v8x6IvXezuanYxOhiNd0ew+Xgd5xRzw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5f5c5c14-6d70-43aa-a9fb-50752128595e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2106dde3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 26cfd61ea52d46439064d2876e9c2011-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 188234597; Thu, 22 Sep 2022 00:58:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 15:58:07 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 22 Sep 2022 15:58:06 +0800
Message-ID: <a37c3cbdec21bef6a72a9ffc7334fa4ab99d512d.camel@mediatek.com>
Subject: Re: [PATCH v7,1/3] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <rex-bc.chen@mediatek.com>,
	<ck.hu@mediatek.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 22 Sep 2022 15:58:07 +0800
In-Reply-To: <1663831764-18169-2-git-send-email-xinlei.lee@mediatek.com>
References: <1663831764-18169-1-git-send-email-xinlei.lee@mediatek.com>
	 <1663831764-18169-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_005853_274843_ACE33118 
X-CRM114-Status: GOOD (  22.03  )
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

On Thu, 2022-09-22 at 15:29 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> The difference between MT8186 and other ICs is that when modifying
> the
> output format, we need to modify the mmsys_base+0x400 register to
> take
> effect.
> So when setting the dpi output format, we need to call mmsys_func to
> set
> it to MT8186 synchronously.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 32
> ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  9 ++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..536005d1cc55 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,14 @@
>  #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>  #define __SOC_MEDIATEK_MT8186_MMSYS_H
>  
> +/* Values for DPI configuration in MMSYS address space */
> +#define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> +#define DPI_FORMAT_MASK					0x3
> +#define DPI_RGB888_SDR_CON				0
> +#define DPI_RGB888_DDR_CON				1
> +#define DPI_RGB565_SDR_CON				2
> +#define DPI_RGB565_DDR_CON				3
> +
>  #define MT8186_MMSYS_OVL_CON			0xF04
>  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>  #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 06d8e83a2cb5..0857806206dc 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -227,6 +227,38 @@ void mtk_mmsys_ddp_disconnect(struct device
> *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32
> offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> +{
> +	switch (val) {
> +	case MTK_DPI_RGB888_DDR_CON:
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK,
> DPI_RGB888_DDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_SDR_CON:
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK,
> DPI_RGB565_SDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_DDR_CON:
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK,
> DPI_RGB565_DDR_CON);
> +		break;
> +	default:
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev),
> MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK,
> DPI_RGB888_DDR_CON);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
> +
>  static int mtk_mmsys_reset_update(struct reset_controller_dev
> *rcdev, unsigned long id,
>  				  bool assert)
>  {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index 59117d970daf..b85f66db33e1 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -9,6 +9,13 @@
>  enum mtk_ddp_comp_id;
>  struct device;
>  
> +enum mtk_dpi_out_format_con {
> +	MTK_DPI_RGB888_SDR_CON,
> +	MTK_DPI_RGB888_DDR_CON,
> +	MTK_DPI_RGB565_SDR_CON,
> +	MTK_DPI_RGB565_DDR_CON
> +};
> +
>  enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_AAL0,
>  	DDP_COMPONENT_AAL1,
> @@ -65,4 +72,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next);
>  
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
> +
>  #endif /* __MTK_MMSYS_H */

Hi matthias:

Sorry I didn't notice that this one has been applied in the v6
version. 
I will submit a diff patch based on the v6 patch later.

Best Regards!
Xineli


