Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494B4C6FA92
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHY+FiM06dlsyrt7Uuce8+/2PC7uc1ZlmHH/FL1QnX8=; b=QnaRrCyxkwlFHX/UT8EI+PwOwo
	UKoTzKtSAvj7oGLaWfFKo1RZ8LW/0fGJXSNLQ9OfFFeOPWXEjzb+9q0CVuNukHnPNDSbL7jIOYk0z
	9F/McYrb1mRY/NMWPu6FHf2cXr8XoCs0Y/u4TDzhQwNHApE7ZDchSfSULBJnqd5+M9b7/jxs4TXqB
	RvIPCaO2egK1l3j5shltOQpQkNJpcMN9OJAuV/TxzkPNog82vN1E2GwISN9PnIqfF+RROy5MV0QYA
	+IfXnLzuJeCz8V4c7LsP7C5MZPW3seJTjNANCWqjdLQX0KSK4mKra7IsjytmVv0lcykZgdluewuLq
	y5JEfYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obdZH-002oSq-Sq; Fri, 23 Sep 2022 07:57:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obdZE-002oRb-KD; Fri, 23 Sep 2022 07:57:50 +0000
X-UUID: 239a21e6a2aa49728249ff371bc46d6f-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rHY+FiM06dlsyrt7Uuce8+/2PC7uc1ZlmHH/FL1QnX8=;
	b=YwLIp7WTJggrXaaz2nOT8tmkZ4M+BAty+XN9/jiWUCw6St/1YqrHwbSFCcYpWcOnN98t5LueWlE9z5AFAKWIgp7cQ+bcGF+UBQ/jSUdXCcMZmZdpZKXYgz2jUBQIIaeak9K+JBsDlA6WxmMIy9BaXAxGSUJ2wjtyD06GQGpmj7Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:442d7537-619e-4e92-8be3-879e1bd6e743,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:3a9bfde3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 239a21e6a2aa49728249ff371bc46d6f-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1953991848; Fri, 23 Sep 2022 00:57:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 14:57:03 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Sep 2022 14:57:02 +0800
Message-ID: <2941a6e319e80c489bd2872efd836063f4984b86.camel@mediatek.com>
Subject: Re: [PATCH v8,2/3]drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>,
	Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
	<Jason-JH.Lin@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "airlied@linux.ie"
	<airlied@linux.ie>, Rex-BC Chen =?UTF-8?Q?=28=E9=99=B3=E6=9F=8F=E8=BE=B0=29?=
	<Rex-BC.Chen@mediatek.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>
Date: Fri, 23 Sep 2022 14:57:03 +0800
In-Reply-To: <a137c801f5263abaef8a13a14a1f4b24a5bcdf1b.camel@mediatek.com>
References: <1663850702-26529-1-git-send-email-xinlei.lee@mediatek.com>
	 <1663850702-26529-3-git-send-email-xinlei.lee@mediatek.com>
	 <a137c801f5263abaef8a13a14a1f4b24a5bcdf1b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_005748_679834_864C83DB 
X-CRM114-Status: GOOD (  32.21  )
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

On Fri, 2022-09-23 at 13:59 +0800, CK Hu (胡俊光) wrote:
> Hi, Xinlei:
> 
> From the code you modify, I do not understand why the title is
> "Adjust
> the dpi output format to MT8186". You just call mmsys driver function
> to set single edge or dual edge, but single edge or dual edge already
> exist in other SoC and is not special in MT8186. So I think you
> should
> change the title to 'Set dpi format in mmsys'
> 
> 
> On Thu, 2022-09-22 at 20:45 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Due to the mt8186  hardware changes, we need to modify the dpi
> > output 
> > format corresponding to the mmsys register(mmsys_base+0x400).
> > 
> 
> The below description is not related to this patch and it's common
> with
> mt8183, so I think we don't need below description.
> 
> > Because different sink ICs may support other output formats.
> > The current DRM architecture supports retrieving the output format
> > of
> > all bridges (eg dpi is implemented via DRM's .atomic_check and
> > .atomic_get_output_bus_fmts and .atomic_get_input_bus_fmts).
> > If no unified output format is found, the default soc format
> > (MEDIA_BUS_FMT_RGB888_2X12_LE in mt8186) is used.
> > 
> > Therefore, if there are other format sink ICs
> > (RGB888_DDR/RGB888_SDR)
> > in
> > the future, the sink IC needs to add the func implementation
> > mentioned
> > above needs to be added. 
> > And the drm architecture will select the appropriate format to
> > change
> > the dpi output.
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 630a4e301ef6..bd1870a8504a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> >  #include <linux/types.h>
> >  
> >  #include <video/videomode.h>
> > @@ -30,6 +31,7 @@
> >  #include "mtk_disp_drv.h"
> >  #include "mtk_dpi_regs.h"
> >  #include "mtk_drm_ddp_comp.h"
> > +#include "mtk_drm_drv.h"
> >  
> >  enum mtk_dpi_out_bit_num {
> >  	MTK_DPI_OUT_BIT_NUM_8BITS,
> > @@ -82,6 +84,7 @@ struct mtk_dpi {
> >  	struct pinctrl_state *pins_dpi;
> >  	u32 output_fmt;
> >  	int refcount;
> > +	struct device *mmsys_dev;
> >  };
> >  
> >  static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> > @@ -135,6 +138,7 @@ struct mtk_dpi_yc_limit {
> >   * @yuv422_en_bit: Enable bit of yuv422.
> >   * @csc_enable_bit: Enable bit of CSC.
> >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output
> > needs to be set in MMSYS.
> >   */
> >  struct mtk_dpi_conf {
> >  	unsigned int (*cal_factor)(int clock);
> > @@ -153,6 +157,7 @@ struct mtk_dpi_conf {
> >  	u32 yuv422_en_bit;
> >  	u32 csc_enable_bit;
> >  	u32 pixels_per_iter;
> > +	bool edge_cfg_in_mmsys;
> >  };
> >  
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> > u32 mask)
> > @@ -449,8 +454,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > *dpi)
> >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> >  			     dpi->output_fmt ==
> > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> >  			     EDGE_SEL : 0, EDGE_SEL);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_DDR_CON);
> >  	} else {
> >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > 0);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_SDR_CON);
> >  	}
> >  }
> >  
> > @@ -778,8 +787,10 @@ static int mtk_dpi_bind(struct device *dev,
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

Hi CK:

Thanks for your suggestion.

I will revise the next edition as you suggested.

Best Regards!
xinlei


