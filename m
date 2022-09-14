Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B39C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 02:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz29hbtCnj94IC60Dk9+UEZ6unaBniJIUfo8u7nIr0I=; b=e4posqjLjCCaDCPGXpmseTZ6wJ
	lot241WMG86Alw6TEZ95MGbMBSARRDpp9QpNNtI8BySUSFRhD4/gS4U9sV07OJguNvqgoCFIeNQx5
	TIHqEjOzwqLw93Z5iNTq4KgGzeb4nAN6T3GGMd4AV1A0SPlJLEZlmBChblQUFYl1VLj5Pz9vDdWbi
	uK7EFgYF2Yl8v2nhU+SI+0OiuG9ygitVF3UEvnCBEarREkh66hszpEkZOBXBf7XMpu/VCXSv0gIXk
	tZUBGlhXY9K6RleyDm2vVd7MIz8FEcWqaVkzYoqat6VW331dKax637qGNblsuNbLia5jAi0NJWb7D
	yy2eEO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYIEl-004etZ-Of; Wed, 14 Sep 2022 02:34:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYIET-004eak-CP; Wed, 14 Sep 2022 02:34:39 +0000
X-UUID: 32dcb862a7ba4edfa06a222ffbad73e5-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rz29hbtCnj94IC60Dk9+UEZ6unaBniJIUfo8u7nIr0I=;
	b=Xo4nG0yneplxn3sgl+fdXj5rG4qY9qTwTI4GE0xwXcpnunSvnXN0YQKCyIwOyi5dONEr/mENJvnBVjFZEWg3B+vLFcX8XHh0+FMRYP9xKvV/g9Eto0KoN/B88X8PetDfWXuOq/IwHwx3vJ/Z6AAikeaDEBiaXWmDbP+vk7oj0O8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3823f6dd-516f-4d45-8c1c-0388df6ef48a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:dbac8e5d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 32dcb862a7ba4edfa06a222ffbad73e5-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1729266391; Tue, 13 Sep 2022 19:34:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:33:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:33:50 +0800
Message-ID: <280f4c879562c60f9da9ff7f086026f7d08922bd.camel@mediatek.com>
Subject: Re: [PATCH v3 4/9] drm/mediatek: Add gamma support different
 lut_size for other SoC
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 09:33:50 +0800
In-Reply-To: <97ac2b35-bb3b-360a-4078-f72146136a7f@collabora.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
	 <20220911153734.24243-5-jason-jh.lin@mediatek.com>
	 <97ac2b35-bb3b-360a-4078-f72146136a7f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_193438_378076_B629DAA8 
X-CRM114-Status: GOOD (  23.77  )
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

On Mon, 2022-09-12 at 12:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> > 1. Add mtk_drm_gamma_get_lut_size() and remove MTK_LUT_SIZE macro.
> > 2. Add lut_size to gamma driver data for different SoC.
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
> >   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 22
> > +++++++++++++++++++--
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 ++--
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++++++
> >   5 files changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index a83e5fbc8724..6a05bb56e693 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -51,6 +51,7 @@ void mtk_gamma_clk_disable(struct device *dev);
> >   void mtk_gamma_config(struct device *dev, unsigned int w,
> >   		      unsigned int h, unsigned int vrefresh,
> >   		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > +unsigned int mtk_gamma_get_lut_size(struct device *dev);
> >   void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state);
> >   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> > struct drm_crtc_state *state);
> >   void mtk_gamma_start(struct device *dev);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index f54a6a618348..e69d0b205b9a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -24,10 +24,12 @@
> >   #define DISP_GAMMA_LUT				0x0700
> >   
> >   #define LUT_10BIT_MASK				0x03ff
> > +#define LUT_SIZE_DEFAULT			512 /* for setting
> > gamma lut from AAL */
> >   
> >   struct mtk_disp_gamma_data {
> >   	bool has_dither;
> >   	bool lut_diff;
> > +	u16 lut_size;
> >   };
> >   
> >   /*
> > @@ -54,18 +56,32 @@ void mtk_gamma_clk_disable(struct device *dev)
> >   	clk_disable_unprepare(gamma->clk);
> >   }
> >   
> > +unsigned int mtk_gamma_get_size(struct device *dev)
> > +{
> > +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > +	unsigned int lut_size = LUT_SIZE_DEFAULT;
> > +
> > +	if (gamma && gamma->data)
> > +		lut_size = gamma->data->lut_size;
> > +
> > +	return lut_size;
> > +}
> > +
> >   void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
> > struct drm_crtc_state *state)
> >   {
> >   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> >   	bool lut_diff = false;
> > +	u16 lut_size = LUT_SIZE_DEFAULT;
> 
> This makes us get a double assignment in case gamma->data is
> populated.
> 
> >   	unsigned int i, reg;
> >   	struct drm_color_lut *lut;
> >   	void __iomem *lut_base;
> >   	u32 word;
> >   	u32 diff[3] = {0};
> >   
> > -	if (gamma && gamma->data)
> > +	if (gamma && gamma->data) {
> >   		lut_diff = gamma->data->lut_diff;
> > +		lut_size = gamma->data->lut_size;
> > +	}
> 
> ...you can avoid it like that:
> 
> } else {
> 	lut_size = LUT_SIZE_DEFAULT;
> }
> 
> 
> Regards,
> Angelo
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


