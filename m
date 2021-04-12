Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE35C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:06:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0796135C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE0796135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6K0IkPxpA/tdGC3azRTze7cOl5pvIjhTu8awbTrvz2s=; b=MlgvHiN6EKCW4rZBBfF1UMD5K
	5dNxy/+XY9DrZ875ZNXs/IzZsDL1dqTV1HrK4aefvE20gQaECPbsRPnkJulMtG/nHtoy3hpAiZ6I9
	R7iz6FUhQx1PbzT25cGzYP9jncsYNK/+bRw/grMAO41gy+2w3kqgONa1Jl3eVcKp/QeOecpFATs1t
	pvxBnLAl1VnFU2x15N4WyBBrP+8lJ9iYHwfdxk1l6zyoSVh+V+erQQfYwyC2taFxmR/YHrICsmkhH
	nE19j0DWcpVE8QonyvIQvpY4Q/ieFJbjWqrU8etiEPpXJj83/nTnjQatVCQGrRME9JdV5yf2VDKn0
	7q6ovRzcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVsVz-006D3G-Ip; Mon, 12 Apr 2021 09:05:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsVw-006D2d-J8; Mon, 12 Apr 2021 09:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=nxVXVJ8vQJsktVMC5IOMAtKUWuGPOhkaTBIlEw7fk0U=; b=GxQquhfq50qubUST5A/qHwdxqC
 4glE6pEZBesZ0okQwBNTFpQC5RSuwutn6FrFFdfkDsQ06R2sIEzTA/mAoYyj7OlbNhCZIVlXGNo9d
 k1URuxUSSyYLUw6LxbckWTnofcwvvpjopXwoPNw1TZYY/8skemL3ZtW47owqak/cdfZcvrHJUHoMI
 rUWSCm649C51YFLYZsSleuDXyvdXbhiIRFlJGqnG9L7y+lNH5lAU7QEI1r05+ln+CkiM1cc8jfFYw
 0bpxIJjM+LIwvMX7rP0SWm8g3i5/eSzBMtXgk5tF2Pgr8sE4amvb94vvmQCppJoiSrjoC9Px/J2eG
 UvoXsyog==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsVt-0061Jq-0S; Mon, 12 Apr 2021 09:05:47 +0000
X-UUID: f9fc0b612a5a484fb0c542be47e2ad2a-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nxVXVJ8vQJsktVMC5IOMAtKUWuGPOhkaTBIlEw7fk0U=; 
 b=Xb4/2VUro+JRUF8tk0V9W9R49T9NxidfcrH1w2YAWu4OfyyISxBAkFAOpX2rysyJx783Vjfe6iPZIirUo6EfkwcKCRHJrrbULIHcLbJuJqfl0LEMLbvHWSH+Y0c1JhrzTYizvmuZ9flwyPxkeXtpG1wWb/YWO9xM4RJnylRxygA=;
X-UUID: f9fc0b612a5a484fb0c542be47e2ad2a-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1043259307; Mon, 12 Apr 2021 02:05:43 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 02:05:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 17:05:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 17:05:29 +0800
Message-ID: <1618218330.16010.13.camel@mtksdaap41>
Subject: Re: [PATCH v1, 3/3] drm/mediatek: gamma set with cmdq
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Apr 2021 17:05:30 +0800
In-Reply-To: <1618217129.9080.5.camel@mhfsdcap03>
References: <1618209347-10816-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618209347-10816-4-git-send-email-yongqiang.niu@mediatek.com>
 <1618216127.12699.4.camel@mtksdaap41> <1618217129.9080.5.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC4AE128241CC894884240A6A99D87BA6FE31408A987B06BD2CFC36BD64511392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_020545_088356_8E691422 
X-CRM114-Status: GOOD (  29.68  )
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

Hi, Yongqiang:

On Mon, 2021-04-12 at 16:45 +0800, Yongqiang Niu wrote:
> On Mon, 2021-04-12 at 16:28 +0800, CK Hu wrote:
> > Hi, Yongqiang:
> > 
> > On Mon, 2021-04-12 at 14:35 +0800, Yongqiang Niu wrote:
> > > gamma lut set in vsync active will caused display flash issue
> > > set gamma lut with cmdq 
> > 
> > In MT8173, it's ok to set gammma out of vblank period. Why do you
> > setting gamma in vblank in this patch?
> > 
> > Regards,
> > CK
> > 
> 
> mtk drm driver code has changed many since mt8173, there is no one test
> this in the newest version for mt8173.
> 
> and this issue is random.
> https://partnerissuetracker.corp.google.com/u/1/issues/153842418
> 
> and not all platform will set gamma lut.
> some project platform will not set gamma lut from chrome os
> (crhome os set gamma lut may be with some special panel, like AUO
> B116XTN02.3 in
> https://partnerissuetracker.corp.google.com/u/1/issues/153842418
> )
> 


I could not see the page in partnelissuetracker, If this patch fix some
bug, describe the bug in commit message. It's better that information
include how to reproduce this bug and what kind of error happen. More
information would help us to understand why setting in vblank would fix
this bug.

Regards,
CK

> > > 
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_aal.c     |  4 ++--
> > >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  7 ++++---
> > >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 11 ++++++-----
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 +++++++++++-------
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 +++++---
> > >  5 files changed, 28 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > index 64b4528..c8e178e 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > @@ -59,12 +59,12 @@ void mtk_aal_config(struct device *dev, unsigned int w,
> > >  	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
> > >  }
> > >  
> > > -void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
> > > +void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> > >  
> > >  	if (aal->data && aal->data->has_gamma)
> > > -		mtk_gamma_set_common(aal->regs, state);
> > > +		mtk_gamma_set_common(aal->regs, &aal->cmdq_reg, state, cmdq_pkt);
> > >  }
> > >  
> > >  void mtk_aal_start(struct device *dev)
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > index 86c3068..c2e7dcb 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > @@ -14,7 +14,7 @@
> > >  void mtk_aal_config(struct device *dev, unsigned int w,
> > >  		    unsigned int h, unsigned int vrefresh,
> > >  		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > > -void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
> > > +void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt);
> > >  void mtk_aal_start(struct device *dev);
> > >  void mtk_aal_stop(struct device *dev);
> > >  
> > > @@ -50,8 +50,9 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > >  		      unsigned int h, unsigned int vrefresh,
> > >  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > > -void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
> > > -void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
> > > +void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt);
> > > +void mtk_gamma_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +			  struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt);
> > >  void mtk_gamma_start(struct device *dev);
> > >  void mtk_gamma_stop(struct device *dev);
> > >  
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > index 3ebf91e..99a4ff3 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > @@ -55,7 +55,8 @@ void mtk_gamma_clk_disable(struct device *dev)
> > >  	clk_disable_unprepare(gamma->clk);
> > >  }
> > >  
> > > -void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
> > > +void mtk_gamma_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +			  struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	unsigned int i, reg;
> > >  	struct drm_color_lut *lut;
> > > @@ -65,23 +66,23 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
> > >  	if (state->gamma_lut) {
> > >  		reg = readl(regs + DISP_GAMMA_CFG);
> > >  		reg = reg | GAMMA_LUT_EN;
> > > -		writel(reg, regs + DISP_GAMMA_CFG);
> > > +		mtk_ddp_write(cmdq_pkt, reg, cmdq_reg, regs, DISP_GAMMA_CFG);
> > >  		lut_base = regs + DISP_GAMMA_LUT;
> > >  		lut = (struct drm_color_lut *)state->gamma_lut->data;
> > >  		for (i = 0; i < MTK_LUT_SIZE; i++) {
> > >  			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
> > >  				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
> > >  				((lut[i].blue >> 6) & LUT_10BIT_MASK);
> > > -			writel(word, (lut_base + i * 4));
> > > +			mtk_ddp_write(cmdq_pkt, word, cmdq_reg, regs, (lut_base + i * 4));
> > >  		}
> > >  	}
> > >  }
> > >  
> > > -void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
> > > +void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state, struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > >  
> > > -	mtk_gamma_set_common(gamma->regs, state);
> > > +	mtk_gamma_set_common(gamma->regs, &gamma->cmdq_reg, state, cmdq_pkt);
> > >  }
> > >  
> > >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index 8b0de90..73428f0 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -423,6 +423,15 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
> > >  		}
> > >  		mtk_crtc->pending_async_planes = false;
> > >  	}
> > > +
> > > +	if (crtc->state->color_mgmt_changed) {
> > > +		int i;
> > > +
> > > +		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> > > +			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state, cmdq_handle);
> > > +			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
> > > +		}
> > > +	}
> > >  }
> > >  
> > >  static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> > > @@ -464,7 +473,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > >  	if (mtk_crtc->cmdq_client) {
> > >  		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
> > > -		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> > > +		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, 2 * PAGE_SIZE);
> > >  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> > >  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
> > >  		mtk_crtc_ddp_config(crtc, cmdq_handle);
> > > @@ -616,15 +625,10 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > >  				      struct drm_atomic_state *state)
> > >  {
> > >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > > -	int i;
> > >  
> > >  	if (mtk_crtc->event)
> > >  		mtk_crtc->pending_needs_vblank = true;
> > > -	if (crtc->state->color_mgmt_changed)
> > > -		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> > > -			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
> > > -			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
> > > -		}
> > > +
> > >  	mtk_drm_crtc_hw_config(mtk_crtc);
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > > index bb914d9..bffa58d 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > > @@ -60,7 +60,8 @@ struct mtk_ddp_comp_funcs {
> > >  			     struct mtk_plane_state *state,
> > >  			     struct cmdq_pkt *cmdq_pkt);
> > >  	void (*gamma_set)(struct device *dev,
> > > -			  struct drm_crtc_state *state);
> > > +			  struct drm_crtc_state *state,
> > > +			  struct cmdq_pkt *cmdq_pkt);
> > >  	void (*bgclr_in_on)(struct device *dev);
> > >  	void (*bgclr_in_off)(struct device *dev);
> > >  	void (*ctm_set)(struct device *dev,
> > > @@ -160,10 +161,11 @@ static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
> > >  }
> > >  
> > >  static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
> > > -				     struct drm_crtc_state *state)
> > > +				     struct drm_crtc_state *state,
> > > +				     struct cmdq_pkt *cmdq_pkt)
> > >  {
> > >  	if (comp->funcs && comp->funcs->gamma_set)
> > > -		comp->funcs->gamma_set(comp->dev, state);
> > > +		comp->funcs->gamma_set(comp->dev, state, cmdq_pkt);
> > >  }
> > >  
> > >  static inline void mtk_ddp_comp_bgclr_in_on(struct mtk_ddp_comp *comp)
> > 
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
