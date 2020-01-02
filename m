Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3226C2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 05:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F92215A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 05:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ltZvL4Bs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YTZxqUoh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F92215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGC/wlUqyD7e6B5IihUGxwOUDM4K5LYGgXXo/NLqu1Y=; b=ltZvL4BsWeoZMn
	kiwp3+mGKJ/UbJSzfiXLUaOLeugycvXcxPmhg6l0gNEfEvoKBBbESi0JWq1N4ZUz3N1Mey8ihtH6F
	fqHFoNz4geS4T256rYylqz1+wpekvKQcv1+QWt3i/2pTmFI+RLIqHK7oaSQrxBNtyTiqU7Z4qMBkf
	RuRZB9aA510hKirt2ChicPLPKV4+3DVSxrlvBpcGPTYYu1kMn78TF8sKfDaMhpU2Pok3aVEvTmu0+
	8HVi7zpto+Sb7fBnfCf9y32lakb5ofMfZk93P+PBF/oQ7MUaXwCqpqvM3vYh7kOxhTrzmG7R0ZAru
	Nhi3DnRPVdbnqbqzI9Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imtP6-0002gt-8Y; Thu, 02 Jan 2020 05:52:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imtOj-0002Fz-GL; Thu, 02 Jan 2020 05:51:55 +0000
X-UUID: d403925d4e8a4b3295edc1683f6339b0-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=liAsqoERlVzV16eU7Ey8lXTmLdhFwakvFYgHcIUZuPc=; 
 b=YTZxqUohcbXbmVZ//AxAp09pEsfCS3GqZ0la4JHRkXyFmhXcn1Y4VkiwcWzy+5G0I7DVQrbEneetkE+wC8BI+6Rj8LXqeggfcm8/fdXfCsngrsxykbqRdbC5928yLN7GAM/jhFnDBzkZ5BJt+s80BJvqTlwIQgjOCOD4ah//ezo=;
X-UUID: d403925d4e8a4b3295edc1683f6339b0-20200101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 705325237; Wed, 01 Jan 2020 21:51:51 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 21:47:01 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 2 Jan 2020 13:46:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 13:47:01 +0800
Message-ID: <1577943906.15116.4.camel@mhfsdcap03>
Subject: Re: [PATCH v6, 04/14] drm/mediatek: add mmsys private data for ddp
 path config
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 2 Jan 2020 13:45:06 +0800
In-Reply-To: <1577943184.24650.10.camel@mtksdaap41>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-5-git-send-email-yongqiang.niu@mediatek.com>
 <1577943184.24650.10.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_215153_555484_52EC7A37 
X-CRM114-Status: GOOD (  18.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-02 at 13:33 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> > This patch add mmsys private data for ddp path config
> > all these register offset and value will be different in future SOC
> > add these define into mmsys private data
> > 	u32 ovl0_mout_en;
> > 	u32 rdma1_sout_sel_in;
> > 	u32 rdma1_sout_dsi0;
> > 	u32 dpi0_sel_in;
> > 	u32 dpi0_sel_in_rdma1;
> > 	u32 dsi0_sel_in;
> > 	u32 dsi0_sel_in_rdma1;
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 63 ++++++++++++++++++++++++---------
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  6 ++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  3 ++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  3 ++
> >  5 files changed, 63 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index e47cf84..9aacbcf 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -44,6 +44,7 @@ struct mtk_drm_crtc {
> >  	bool				pending_planes;
> >  
> >  	struct regmap			*config_regs;
> > +	const struct mtk_mmsys_reg_data *mmsys_reg_data;
> >  	struct mtk_disp_mutex		*mutex;
> >  	unsigned int			ddp_comp_nr;
> >  	struct mtk_ddp_comp		**ddp_comp;
> > @@ -283,6 +284,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> >  	DRM_DEBUG_DRIVER("mediatek_ddp_ddp_path_setup\n");
> >  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> >  		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
> > +					 mtk_crtc->mmsys_reg_data,
> >  					 mtk_crtc->ddp_comp[i]->id,
> >  					 mtk_crtc->ddp_comp[i + 1]->id);
> >  		mtk_disp_mutex_add_comp(mtk_crtc->mutex,
> > @@ -340,6 +342,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
> >  	mtk_disp_mutex_disable(mtk_crtc->mutex);
> >  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> >  		mtk_ddp_remove_comp_from_path(mtk_crtc->config_regs,
> > +					      mtk_crtc->mmsys_reg_data,
> >  					      mtk_crtc->ddp_comp[i]->id,
> >  					      mtk_crtc->ddp_comp[i + 1]->id);
> >  		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
> > @@ -649,6 +652,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  		return -ENOMEM;
> >  
> >  	mtk_crtc->config_regs = priv->config_regs;
> > +	mtk_crtc->mmsys_reg_data = priv->data->reg_data;
> >  	mtk_crtc->ddp_comp_nr = path_len;
> >  	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
> >  						sizeof(*mtk_crtc->ddp_comp),
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > index f99f89a1..ea0ce32 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > @@ -168,6 +168,16 @@ struct mtk_ddp {
> >  	const struct mtk_ddp_data	*data;
> >  };
> >  
> > +struct mtk_mmsys_reg_data {
> > +	u32 ovl0_mout_en;
> > +	u32 rdma1_sout_sel_in;
> > +	u32 rdma1_sout_dpi0;
> > +	u32 dpi0_sel_in;
> > +	u32 dpi0_sel_in_rdma1;
> > +	u32 dsi0_sel_in;
> > +	u32 dsi0_sel_in_rdma1;
> 
> This patch looks like a combination of two patches. One is a bug fix
> that dsi0_sel_in and dsi0_sel_in_rdma1 are different in MT8173 and
> MT2701. And the other is that ovl0_mout_en, rdma1_sout_sel_in,
> rdma1_sout_dpi0, dpi0_sel_in, dpi0_sel_in_rdma1 are different in MT8183.
> 
> Regards,
> CK

i will split this into more patches in next version
> 
> > +};
> > +
> >  static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> >  	[DDP_COMPONENT_BLS] = MT2701_MUTEX_MOD_DISP_BLS,
> >  	[DDP_COMPONENT_COLOR0] = MT2701_MUTEX_MOD_DISP_COLOR,
> > @@ -246,17 +256,34 @@ struct mtk_ddp {
> >  	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
> >  };
> >  
> > -static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > +const struct mtk_mmsys_reg_data mt2701_mmsys_reg_data = {
> > +	.ovl0_mout_en = DISP_REG_CONFIG_DISP_OVL_MOUT_EN,
> > +	.dsi0_sel_in = DISP_REG_CONFIG_DSI_SEL,
> > +	.dsi0_sel_in_rdma1 = DSI_SEL_IN_RDMA,
> > +};
> > +
> > +const struct mtk_mmsys_reg_data mt8173_mmsys_reg_data = {
> > +	.ovl0_mout_en = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
> > +	.rdma1_sout_sel_in = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
> > +	.rdma1_sout_dpi0 = RDMA1_SOUT_DPI0,
> > +	.dpi0_sel_in = DISP_REG_CONFIG_DPI_SEL_IN,
> > +	.dpi0_sel_in_rdma1 = DPI0_SEL_IN_RDMA1,
> > +	.dsi0_sel_in = DISP_REG_CONFIG_DSIE_SEL_IN,
> > +	.dsi0_sel_in_rdma1 = DSI0_SEL_IN_RDMA1,
> > +};
> > +
> > +static unsigned int mtk_ddp_mout_en(const struct mtk_mmsys_reg_data *data,
> > +				    enum mtk_ddp_comp_id cur,
> >  				    enum mtk_ddp_comp_id next,
> >  				    unsigned int *addr)
> >  {
> >  	unsigned int value;
> >  
> >  	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> > +		*addr = data->ovl0_mout_en;
> >  		value = OVL0_MOUT_EN_COLOR0;
> >  	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> > -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> > +		*addr = data->ovl0_mout_en;
> >  		value = OVL_MOUT_EN_RDMA;
> >  	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> >  		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > @@ -298,8 +325,8 @@ static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
> >  		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DSI3;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -		value = RDMA1_SOUT_DPI0;
> > +		*addr = data->rdma1_sout_sel_in;
> > +		value = data->rdma1_sout_dpi0;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> >  		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> >  		value = RDMA1_SOUT_DPI1;
> > @@ -325,7 +352,8 @@ static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
> >  	return value;
> >  }
> >  
> > -static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > +static unsigned int mtk_ddp_sel_in(const struct mtk_mmsys_reg_data *data,
> > +				   enum mtk_ddp_comp_id cur,
> >  				   enum mtk_ddp_comp_id next,
> >  				   unsigned int *addr)
> >  {
> > @@ -335,14 +363,14 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
> >  		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> >  		value = COLOR0_SEL_IN_OVL0;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -		value = DPI0_SEL_IN_RDMA1;
> > +		*addr = data->dpi0_sel_in;
> > +		value = data->dpi0_sel_in_rdma1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> >  		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> >  		value = DPI1_SEL_IN_RDMA1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -		value = DSI0_SEL_IN_RDMA1;
> > +		*addr = data->dsi0_sel_in;
> > +		value = data->dsi0_sel_in_rdma1;
> >  	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> >  		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> >  		value = DSI1_SEL_IN_RDMA1;
> > @@ -389,7 +417,8 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
> >  	return value;
> >  }
> >  
> > -static unsigned int mtk_ddp_sout_sel(enum mtk_ddp_comp_id cur,
> > +static unsigned int mtk_ddp_sout_sel(const struct mtk_mmsys_reg_data *data,
> > +				     enum mtk_ddp_comp_id cur,
> >  				     enum mtk_ddp_comp_id next,
> >  				     unsigned int *addr)
> >  {
> > @@ -409,35 +438,37 @@ static unsigned int mtk_ddp_sout_sel(enum mtk_ddp_comp_id cur,
> >  }
> >  
> >  void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
> > +			      const struct mtk_mmsys_reg_data *reg_data,
> >  			      enum mtk_ddp_comp_id cur,
> >  			      enum mtk_ddp_comp_id next)
> >  {
> >  	unsigned int addr, value;
> >  
> > -	value = mtk_ddp_mout_en(cur, next, &addr);
> > +	value = mtk_ddp_mout_en(reg_data, cur, next, &addr);
> >  	if (value)
> >  		regmap_update_bits(config_regs, addr, value, value);
> >  
> > -	value = mtk_ddp_sout_sel(cur, next, &addr);
> > +	value = mtk_ddp_sout_sel(reg_data, cur, next, &addr);
> >  	if (value)
> >  		regmap_update_bits(config_regs, addr, value, value);
> >  
> > -	value = mtk_ddp_sel_in(cur, next, &addr);
> > +	value = mtk_ddp_sel_in(reg_data, cur, next, &addr);
> >  	if (value)
> >  		regmap_update_bits(config_regs, addr, value, value);
> >  }
> >  
> >  void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
> > +				   const struct mtk_mmsys_reg_data *reg_data,
> >  				   enum mtk_ddp_comp_id cur,
> >  				   enum mtk_ddp_comp_id next)
> >  {
> >  	unsigned int addr, value;
> >  
> > -	value = mtk_ddp_mout_en(cur, next, &addr);
> > +	value = mtk_ddp_mout_en(reg_data, cur, next, &addr);
> >  	if (value)
> >  		regmap_update_bits(config_regs, addr, value, 0);
> >  
> > -	value = mtk_ddp_sel_in(cur, next, &addr);
> > +	value = mtk_ddp_sel_in(reg_data, cur, next, &addr);
> >  	if (value)
> >  		regmap_update_bits(config_regs, addr, value, 0);
> >  }
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> > index 01ff8b6..75fa56e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> > @@ -11,11 +11,17 @@
> >  struct regmap;
> >  struct device;
> >  struct mtk_disp_mutex;
> > +struct mtk_mmsys_reg_data;
> > +
> > +extern const struct mtk_mmsys_reg_data mt2701_mmsys_reg_data;
> > +extern const struct mtk_mmsys_reg_data mt8173_mmsys_reg_data;
> >  
> >  void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
> > +			      const struct mtk_mmsys_reg_data *reg_data,
> >  			      enum mtk_ddp_comp_id cur,
> >  			      enum mtk_ddp_comp_id next);
> >  void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
> > +				   const struct mtk_mmsys_reg_data *reg_data,
> >  				   enum mtk_ddp_comp_id cur,
> >  				   enum mtk_ddp_comp_id next);
> >  
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index f69af42..e3293cf8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -185,6 +185,7 @@ static int mtk_atomic_commit(struct drm_device *drm,
> >  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> >  	.ext_path = mt2701_mtk_ddp_ext,
> >  	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
> > +	.reg_data = &mt2701_mmsys_reg_data,
> >  	.shadow_register = true,
> >  	.clk_drv_name = "clk-mt2701-mm",
> >  };
> > @@ -196,6 +197,7 @@ static int mtk_atomic_commit(struct drm_device *drm,
> >  	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
> >  	.third_path = mt2712_mtk_ddp_third,
> >  	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
> > +	.reg_data = &mt8173_mmsys_reg_data,
> >  	.clk_drv_name = "clk-mt2712-mm",
> >  };
> >  
> > @@ -204,6 +206,7 @@ static int mtk_atomic_commit(struct drm_device *drm,
> >  	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
> >  	.ext_path = mt8173_mtk_ddp_ext,
> >  	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
> > +	.reg_data = &mt8173_mmsys_reg_data,
> >  	.clk_drv_name = "clk-mt8173-mm",
> >  };
> >  
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > index 8fe9136..9d87441 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > @@ -7,6 +7,7 @@
> >  #define MTK_DRM_DRV_H
> >  
> >  #include <linux/io.h>
> > +#include "mtk_drm_ddp.h"
> >  #include "mtk_drm_ddp_comp.h"
> >  
> >  #define MAX_CRTC	3
> > @@ -28,6 +29,8 @@ struct mtk_mmsys_driver_data {
> >  	const enum mtk_ddp_comp_id *third_path;
> >  	unsigned int third_len;
> >  
> > +	const struct mtk_mmsys_reg_data *reg_data;
> > +
> >  	bool shadow_register;
> >  	const char *clk_drv_name;
> >  };
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
