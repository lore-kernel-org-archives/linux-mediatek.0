Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E874C432C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 03:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F12206DC
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 03:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eP7gHWCC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i5z0BJM5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F12206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9nRPzK389IrbHbzYVL79G4Gk2STkGbj93s+hyoqFxg=; b=eP7gHWCCmPKqWw
	y70UWmw6z2KyXZ2dnlYtHcQ1fyJipep4dYUBKuiTttbXehVF6SNFytrFsDOexwAQQPD+3QPmEvNlQ
	meaP+M42/U8Aut3O9eX+6APozBRcGtta5gb1wUO4ChHuTo2Kx4CadvrkkzVlS8G03ZcnB0gJ2q7b9
	nMJNxGpMi+Qi0Ir4qaYAEwcVd9oTRJTrj89xAekFae2teRY2R2FIJC245xhvE1Ez6Fkztv1DOb/7p
	NKlfS02avaufYQt9QLrtsgMY++hJy3tkFU9Cxn7CYdMEroQhmCluAsW55OgqAjlPO/VbzMtgHIAG4
	teKEmghFZGjax54bL7GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibyxX-0006vl-M1; Tue, 03 Dec 2019 03:34:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibyxR-0006qH-Cm; Tue, 03 Dec 2019 03:34:39 +0000
X-UUID: 1d13ed885f664f5cbe3bcf4b82673030-20191202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YYdvdLxaz+GrtaamZIqTRrwxovn6ou6aNFueL+5BIUI=; 
 b=i5z0BJM5zG4zTt49S9eba3RZRo3J16IO1cT51iOotJ7V7VOk4r9TcmgBrG2k0Ox1LfKEh12NscTYLiSd2o4guGqTVRysbIUsZS0A8Bn6eSvX6qFAs/WJwT7g5NPiWmcdZj2YKzcMcJgVTVCuaS+iKmCWl1ZAWYmKag+1C/NeLW0=;
X-UUID: 1d13ed885f664f5cbe3bcf4b82673030-20191202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 765615208; Mon, 02 Dec 2019 19:34:31 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 19:35:12 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 11:34:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 11:34:08 +0800
Message-ID: <1575344068.627.2.camel@mtksdaap41>
Subject: Re: [PATCH v1 5/6] drm/mediatek: support CMDQ interface in ddp
 component
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Tue, 3 Dec 2019 11:34:28 +0800
In-Reply-To: <1575341763.19788.3.camel@mtksdaap41>
References: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
 <20191128024238.9399-6-bibby.hsieh@mediatek.com>
 <1575341763.19788.3.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_193437_446307_FA460B28 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: drinkcat@chromium.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Tue, 2019-12-03 at 10:56 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Thu, 2019-11-28 at 10:42 +0800, Bibby Hsieh wrote:
> > The CMDQ (Command Queue) in MT8183 is used to help
> > update all relevant display controller registers
> > with critical time limation.
> > This patch add cmdq interface in ddp_comp interface,
> > let all ddp_comp interface can support cpu/cmdq function
> > at the same time.
> > 
> > Signed-off-by: YT Shen <yt.shen@mediatek.com>
> > Signed-off-by: CK Hu <ck.hu@mediatek.com>
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  65 ++++++-----
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 ++++---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  11 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 120 ++++++++++++++------
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  55 ++++++---
> >  6 files changed, 190 insertions(+), 111 deletions(-)
> > 
> 

[snip]

> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index ec55c7488cc3..5b0a3d48dfa6 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -69,25 +69,30 @@ enum mtk_ddp_comp_id {
> >  };
> >  
> >  struct mtk_ddp_comp;
> > -
> > +struct cmdq_pkt;
> >  struct mtk_ddp_comp_funcs {
> >  	void (*config)(struct mtk_ddp_comp *comp, unsigned int w,
> > -		       unsigned int h, unsigned int vrefresh, unsigned int bpc);
> > +		       unsigned int h, unsigned int vrefresh,
> > +		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> >  	void (*start)(struct mtk_ddp_comp *comp);
> >  	void (*stop)(struct mtk_ddp_comp *comp);
> >  	void (*enable_vblank)(struct mtk_ddp_comp *comp, struct drm_crtc *crtc);
> >  	void (*disable_vblank)(struct mtk_ddp_comp *comp);
> >  	unsigned int (*supported_rotations)(struct mtk_ddp_comp *comp);
> >  	unsigned int (*layer_nr)(struct mtk_ddp_comp *comp);
> > -	void (*layer_on)(struct mtk_ddp_comp *comp, unsigned int idx);
> > -	void (*layer_off)(struct mtk_ddp_comp *comp, unsigned int idx);
> > +	void (*layer_on)(struct mtk_ddp_comp *comp, unsigned int idx,
> > +			 struct cmdq_pkt *cmdq_pkt);
> > +	void (*layer_off)(struct mtk_ddp_comp *comp, unsigned int idx,
> > +			  struct cmdq_pkt *cmdq_pkt);

layer_on() and layer_off() looks useless, so I would like you just
remove this interface in another patch.

Regards,
CK

> >  	int (*layer_check)(struct mtk_ddp_comp *comp,
> >  			   unsigned int idx,
> >  			   struct mtk_plane_state *state);
> >  	void (*layer_config)(struct mtk_ddp_comp *comp, unsigned int idx,
> > -			     struct mtk_plane_state *state);
> > +			     struct mtk_plane_state *state,
> > +			     struct cmdq_pkt *cmdq_pkt);
> >  	void (*gamma_set)(struct mtk_ddp_comp *comp,
> > -			  struct drm_crtc_state *state);
> > +			  struct drm_crtc_state *state,
> > +			  struct cmdq_pkt *cmdq_pkt);
> >  	void (*bgclr_in_on)(struct mtk_ddp_comp *comp);
> >  	void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
> >  };
> > @@ -99,14 +104,17 @@ struct mtk_ddp_comp {
> >  	struct device *dev;
> >  	enum mtk_ddp_comp_id id;
> >  	const struct mtk_ddp_comp_funcs *funcs;
> > +	resource_size_t regs_pa;
> > +	u8 subsys;
> >  };
> >  
> >  static inline void mtk_ddp_comp_config(struct mtk_ddp_comp *comp,
> >  				       unsigned int w, unsigned int h,
> > -				       unsigned int vrefresh, unsigned int bpc)
> > +				       unsigned int vrefresh, unsigned int bpc,
> > +				       struct cmdq_pkt *cmdq_pkt)
> >  {
> >  	if (comp->funcs && comp->funcs->config)
> > -		comp->funcs->config(comp, w, h, vrefresh, bpc);
> > +		comp->funcs->config(comp, w, h, vrefresh, bpc, cmdq_pkt);
> >  }
> >  
> >  static inline void mtk_ddp_comp_start(struct mtk_ddp_comp *comp)
> > @@ -152,17 +160,19 @@ static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *comp)
> >  }
> >  
> >  static inline void mtk_ddp_comp_layer_on(struct mtk_ddp_comp *comp,
> > -					 unsigned int idx)
> > +					 unsigned int idx,
> > +					 struct cmdq_pkt *cmdq_pkt)
> >  {
> >  	if (comp->funcs && comp->funcs->layer_on)
> > -		comp->funcs->layer_on(comp, idx);
> > +		comp->funcs->layer_on(comp, idx, cmdq_pkt);
> >  }
> >  
> >  static inline void mtk_ddp_comp_layer_off(struct mtk_ddp_comp *comp,
> > -					  unsigned int idx)
> > +					  unsigned int idx,
> > +					  struct cmdq_pkt *cmdq_pkt)
> >  {
> >  	if (comp->funcs && comp->funcs->layer_off)
> > -		comp->funcs->layer_off(comp, idx);
> > +		comp->funcs->layer_off(comp, idx, cmdq_pkt);
> >  }
> >  
> >  static inline int mtk_ddp_comp_layer_check(struct mtk_ddp_comp *comp,
> > @@ -176,17 +186,19 @@ static inline int mtk_ddp_comp_layer_check(struct mtk_ddp_comp *comp,
> >  
> >  static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
> >  					     unsigned int idx,
> > -					     struct mtk_plane_state *state)
> > +					     struct mtk_plane_state *state,
> > +					     struct cmdq_pkt *cmdq_pkt)
> >  {
> >  	if (comp->funcs && comp->funcs->layer_config)
> > -		comp->funcs->layer_config(comp, idx, state);
> > +		comp->funcs->layer_config(comp, idx, state, cmdq_pkt);
> >  }
> >  
> >  static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
> > -				     struct drm_crtc_state *state)
> > +				     struct drm_crtc_state *state,
> > +				     struct cmdq_pkt *cmdq_pkt)
> >  {
> >  	if (comp->funcs && comp->funcs->gamma_set)
> > -		comp->funcs->gamma_set(comp, state);
> > +		comp->funcs->gamma_set(comp, state, cmdq_pkt);
> >  }
> >  
> >  static inline void mtk_ddp_comp_bgclr_in_on(struct mtk_ddp_comp *comp)
> > @@ -209,6 +221,13 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
> >  int mtk_ddp_comp_register(struct drm_device *drm, struct mtk_ddp_comp *comp);
> >  void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
> >  void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
> > -		    unsigned int CFG);
> > -
> > +		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt);
> > +enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
> > +void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> > +		   struct mtk_ddp_comp *comp, unsigned int offset);
> > +void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> > +			   struct mtk_ddp_comp *comp, unsigned int offset);
> > +void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> > +			struct mtk_ddp_comp *comp, unsigned int offset,
> > +			unsigned int mask);
> >  #endif /* MTK_DRM_DDP_COMP_H */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
