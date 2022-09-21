Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AF9C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+RYld1az5rAHD+UhhQ+OjODHmdk7/9nZ0vdYJZ7ifY=; b=oih2XxL/YutKz7W7dGtP+uGAxr
	JHDZhWqI8S38cI9MH8sDeHbxib2ZG9C+PoR3lzwZLjpPGdXJtyMP9DYSo5LdNAQf84ffGeuo3O3pH
	D/98Ul+VQ+mQ0G60K8cqXYDdxeQnHVRFnsyDeN+RjSbPBlliJ9NOKu9OV48n/YqCWEiWMhkP5tnce
	cHgq0gaxo24GBDjzEZhAlxiwVCRXiovBSmp7VeTpqup03NsIEgVrpXoCmV/r/smh4xBqfl1AuP+uO
	Nf5pC5jW5Tm0fA78j9GHW7tKK6aNKSkbQM3EjNoclE/61iyD69+r9aQKE68TaZDn22QY+/wbjHQEP
	mYIgWjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0j9-00BaQC-IH; Wed, 21 Sep 2022 14:29:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0iw-00BaLZ-W2; Wed, 21 Sep 2022 14:29:16 +0000
X-UUID: 612cf7241b62440695c6fc2cb7a6f221-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=F+RYld1az5rAHD+UhhQ+OjODHmdk7/9nZ0vdYJZ7ifY=;
	b=O1RktJJ6eGL4VSj4cxXllXi0y8yAv13QuvCG85uuwYfDVE7ca9UGVzn3/N5FY+bZSk63KXlc4WBLaZME9PtlnVOywfkBRy0IlCe0rU2RtgBxuc09ouepC2XqM2ipoqR5hvzvATMUHvjtX9PDGDHlBSSbppph/za9rvKOSsRz3/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6d017258-6428-4d52-9252-2b95441ca7cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:71422ef7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 612cf7241b62440695c6fc2cb7a6f221-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 412718955; Wed, 21 Sep 2022 07:29:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 21:39:00 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 21:39:00 +0800
Message-ID: <ed30c8505f49d8186d5b8a3c52d9cf0ca5f86537.camel@mediatek.com>
Subject: Re: [PATCH v6,2/3] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <matthias.bgg@gmail.com>,
	<jason-jh.lin@mediatek.com>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <p.zabel@pengutronix.de>,
	<airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jitao.shi@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 21 Sep 2022 21:39:00 +0800
In-Reply-To: <6c3de76f1ecf5fb0f4e96469738d383e89cb0eca.camel@mediatek.com>
References: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
	 <1663161662-1598-3-git-send-email-xinlei.lee@mediatek.com>
	 <6c3de76f1ecf5fb0f4e96469738d383e89cb0eca.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_072915_055593_03BAA25B 
X-CRM114-Status: GOOD (  31.11  )
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

On Wed, 2022-09-21 at 09:35 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Wed, 2022-09-14 at 21:21 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi output needs to adjust the output format to dual edge for
> > MT8186.
> > The bridge ic on MT8186 uses the output format of
> > RGB888_dual_edge. 
> 
> I think different sink ic may support different output format, so
> query
> the sink information to decide which outout format.
> 
> > Due
> > to hardware changes, we need to modify the output format
> > corresponding
> > to the mmsys register.
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Nís F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index fb0b79704636..6e02f02f163c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> >  #include <linux/types.h>
> >  
> >  #include <video/videomode.h>
> > @@ -28,6 +29,7 @@
> >  #include "mtk_disp_drv.h"
> >  #include "mtk_dpi_regs.h"
> >  #include "mtk_drm_ddp_comp.h"
> > +#include "mtk_drm_drv.h"
> >  
> >  enum mtk_dpi_out_bit_num {
> >  	MTK_DPI_OUT_BIT_NUM_8BITS,
> > @@ -58,6 +60,11 @@ enum mtk_dpi_out_color_format {
> >  	MTK_DPI_COLOR_FORMAT_YCBCR_422
> >  };
> >  
> > +enum mtk_dpi_out_format_con {
> > +	MTK_DPI_RGB888_DDR_CON,
> > +	MTK_DPI_RGB565_SDR_CON
> > +};
> > +
> >  struct mtk_dpi {
> >  	struct drm_encoder encoder;
> >  	struct drm_bridge bridge;
> > @@ -80,6 +87,7 @@ struct mtk_dpi {
> >  	struct pinctrl_state *pins_dpi;
> >  	u32 output_fmt;
> >  	int refcount;
> > +	struct device *mmsys_dev;
> >  };
> >  
> >  static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> > @@ -133,6 +141,7 @@ struct mtk_dpi_yc_limit {
> >   * @yuv422_en_bit: Enable bit of yuv422.
> >   * @csc_enable_bit: Enable bit of CSC.
> >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output
> > needs to be set in MMSYS.
> >   */
> >  struct mtk_dpi_conf {
> >  	unsigned int (*cal_factor)(int clock);
> > @@ -151,6 +160,7 @@ struct mtk_dpi_conf {
> >  	u32 yuv422_en_bit;
> >  	u32 csc_enable_bit;
> >  	u32 pixels_per_iter;
> > +	bool edge_cfg_in_mmsys;
> >  };
> >  
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> > u32 mask)
> > @@ -447,6 +457,8 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > *dpi)
> >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> >  			     dpi->output_fmt ==
> > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> >  			     EDGE_SEL : 0, EDGE_SEL);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_DDR_CON);
> 
> Why do you set a DPI driver defined value MTK_DPI_RGB888_DDR_CON into
> mmsys driver? I think you should set a value which mmsys driver
> understand.
> 
> Regards,
> CK
> 
> >  	} else {
> >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > 0);
> >  	}
> > @@ -776,8 +788,10 @@ static int mtk_dpi_bind(struct device *dev,
> > struct device *master, void *data)
> >  {
> >  	struct mtk_dpi *dpi = dev_get_drvdata(dev);
> >  	struct drm_device *drm_dev = data;
> > +	struct mtk_drm_private *priv = drm_dev->dev_private;
> >  	int ret;
> >  
> > +	dpi->mmsys_dev = priv->mmsys_dev;
> >  	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
> >  				      DRM_MODE_ENCODER_TMDS);
> >  	if (ret) {
> 
> 
Hi CK:

Thanks for your review.

Yes, different sink ICs may support other output formats. 
The current DRM architecture supports retrieving the output formats of
all bridges (implemented through .atomic_check &
.atomic_get_output_bus_fmts & .atomic_get_input_bus_fmts in dpi).
If no unified output format is found It will use the default format
output of soc (MEDIA_BUS_FMT_RGB888_2X12_LE is used in mt8186).

The difference between MT8186 and other ICs is that when modifying the
output format, we need to modify the mmsys_base + 0x400 register to
take effect. 
Therefore, if there are other format sink ICs (RGB888_DDR/RGB888_SDR)
in the future, the sink IC needs to add the func implementation
mentioned above needs to be added. 
And the drm architecture will select the appropriate format to change
the dpi output.

I will put the registers that control mmsys in mtk-mmsys.h in the next
release.

Best Regards!
Xinlei


