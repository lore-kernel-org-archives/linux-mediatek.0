Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB79FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7Z6dSdjhR20h+4iFmRwYUDcixLcpC7PEICG9AgLEUI=; b=jjFvhr7u1Odsax
	5fmvpKMVgs+5jXf0AcdoL/++iyUw9lY6ZO3zd1xCqSstpTfU6WidmQ2qsZiuyB02QxDN3A9CvCKfz
	jQnQnRKiEiHM1Gx9rvtLSrJrE2NwIFLPj3skbJjlpcxNxfXGwEzun8l6kstIUAM3NzFDiXr7zmV/2
	ozoCyWHfcywPe53Xzbz3Y7ce+PjYnN28FdF7741uEpnq/eCJty8kyz3IteZYOu/djGnW/Q8Es5NM6
	FE8RY+0YmXCSDsV5JJCC/omR9L/EXVDffJZxtE9yDdr6IbVqyDqgZkKtRj33b7DqHUIl0fN3Lpaky
	OJfvOTxUbep05TZA8ZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk053-005cku-41; Thu, 28 Apr 2022 09:04:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk04z-005ckM-IK; Thu, 28 Apr 2022 09:04:55 +0000
X-UUID: 191ebf0de94546778ce4e5b69f7ecdcc-20220428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AOwUVRF/By9MHA+Jo3h/GAeY6SiF6pE48cUodOSHwIE=; 
 b=Q1041qytG9ZPGBg94PyZNPVZ6XLhZdqFyKou5RJ4I6mQN5t5MFGjvUzEDPjzFNFtEpp5cCFmhA/CclX3v2ZDScQN3rTks7OXGu9OYDiqaRalEh7msrH+z4HLa3OGCPLd1U4JqQhyujk0a1jOxvUoGL3LFwY9WMAYP9DMj7scIrg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4c94738d-d04c-4d22-ba8e-a5035edbbe1b, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:7,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:15
X-CID-META: VersionHash:faefae9, CLOUDID:aebe062f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 191ebf0de94546778ce4e5b69f7ecdcc-20220428
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 76632292; Thu, 28 Apr 2022 02:04:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 02:04:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 28 Apr 2022 17:04:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 17:04:44 +0800
Message-ID: <294e27863c250287ca2a8a9a65465b88b99d95fb.camel@mediatek.com>
Subject: Re: [PATCH v3, 1/1] drm/mediatek: add lut diff flag for new gamma
 hardware support
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, David Airlie
 <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Date: Thu, 28 Apr 2022 17:04:44 +0800
In-Reply-To: <ca8309f7fcfe0a307ec465f082361a3d9842d1ec.camel@mediatek.com>
References: <20220428070403.12968-1-yongqiang.niu@mediatek.com>
 <20220428070403.12968-2-yongqiang.niu@mediatek.com>
 <ca8309f7fcfe0a307ec465f082361a3d9842d1ec.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_020453_663756_AC22A31B 
X-CRM114-Status: GOOD (  29.63  )
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

On Thu, 2022-04-28 at 16:35 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Thu, 2022-04-28 at 15:04 +0800, Yongqiang Niu wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com
> > >
> > 
> > mt8183 gamma module usage is different with before soc,
> > gamma odd(index start from 0) lut value set to hardware
> > register should be
> > the difference of current lut value with last lut value.
> > 
> > for example, chrome os user space set lut
> > like this(only r chanel for example):
> > 2 4 6 8 10 12.
> > 1) mt8183 gamma driver should set the gamma lut to hardware
> > register like this:
> > 2 [2] 6 [8] 10 [2]
> 
> I don't know why you do not modify this to
> 
> 2 [2] 6 [2] 10 [2]
> 
> With this modification,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

this is a type error, fixed in v4
> 
> 
> > the value with [] is the difference value
> > 2)gamma hardware process display data with original lut
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  2 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 +++++++++++++++++++
> > ----
> >  3 files changed, 30 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > index f46d4ab73d6a..0f9d7efb61d7 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > @@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct
> > drm_crtc_state *state)
> >  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> >  
> >  	if (aal->data && aal->data->has_gamma)
> > -		mtk_gamma_set_common(aal->regs, state);
> > +		mtk_gamma_set_common(aal->regs, state, false);
> >  }
> >  
> >  void mtk_aal_start(struct device *dev)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index 86c3068894b1..3380651c6707 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -51,7 +51,7 @@ void mtk_gamma_config(struct device *dev,
> > unsigned
> > int w,
> >  		      unsigned int h, unsigned int vrefresh,
> >  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state);
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state);
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff);
> >  void mtk_gamma_start(struct device *dev);
> >  void mtk_gamma_stop(struct device *dev);
> >  
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index 3a5815ab4079..bbd558a036ec 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -27,6 +27,7 @@
> >  
> >  struct mtk_disp_gamma_data {
> >  	bool has_dither;
> > +	bool lut_diff;
> >  };
> >  
> >  /*
> > @@ -53,12 +54,13 @@ void mtk_gamma_clk_disable(struct device *dev)
> >  	clk_disable_unprepare(gamma->clk);
> >  }
> >  
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state)
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff)
> >  {
> >  	unsigned int i, reg;
> >  	struct drm_color_lut *lut;
> >  	void __iomem *lut_base;
> >  	u32 word;
> > +	u32 diff[3] = {0};
> >  
> >  	if (state->gamma_lut) {
> >  		reg = readl(regs + DISP_GAMMA_CFG);
> > @@ -67,9 +69,20 @@ void mtk_gamma_set_common(void __iomem *regs,
> > struct drm_crtc_state *state)
> >  		lut_base = regs + DISP_GAMMA_LUT;
> >  		lut = (struct drm_color_lut *)state->gamma_lut->data;
> >  		for (i = 0; i < MTK_LUT_SIZE; i++) {
> > -			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) <<
> > 20) +
> > -				(((lut[i].green >> 6) & LUT_10BIT_MASK)
> > << 10) +
> > -				((lut[i].blue >> 6) & LUT_10BIT_MASK);
> > +
> > +			if (!lut_diff || (i % 2 == 0)) {
> > +				word = (((lut[i].red >> 6) &
> > LUT_10BIT_MASK) << 20) +
> > +					(((lut[i].green >> 6) &
> > LUT_10BIT_MASK) << 10) +
> > +					((lut[i].blue >> 6) &
> > LUT_10BIT_MASK);
> > +			} else {
> > +				diff[0] = (lut[i].red >> 6) - (lut[i -
> > 1].red >> 6);
> > +				diff[1] = (lut[i].green >> 6) - (lut[i
> > - 1].green >> 6);
> > +				diff[2] = (lut[i].blue >> 6) - (lut[i -
> > 1].blue >> 6);
> > +
> > +				word = ((diff[0] & LUT_10BIT_MASK) <<
> > 20) +
> > +					((diff[1] & LUT_10BIT_MASK) <<
> > 10) +
> > +					(diff[2] & LUT_10BIT_MASK);
> > +			}
> >  			writel(word, (lut_base + i * 4));
> >  		}
> >  	}
> > @@ -78,8 +91,12 @@ void mtk_gamma_set_common(void __iomem *regs,
> > struct drm_crtc_state *state)
> >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state)
> >  {
> >  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > +	bool lut_diff = false;
> > +
> > +	if (gamma->data)
> > +		lut_diff = gamma->data->lut_diff;
> >  
> > -	mtk_gamma_set_common(gamma->regs, state);
> > +	mtk_gamma_set_common(gamma->regs, state, lut_diff);
> >  }
> >  
> >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > @@ -176,10 +193,15 @@ static const struct mtk_disp_gamma_data
> > mt8173_gamma_driver_data = {
> >  	.has_dither = true,
> >  };
> >  
> > +static const struct mtk_disp_gamma_data mt8183_gamma_driver_data =
> > {
> > +	.lut_diff = true,
> > +};
> > +
> >  static const struct of_device_id mtk_disp_gamma_driver_dt_match[]
> > =
> > {
> >  	{ .compatible = "mediatek,mt8173-disp-gamma",
> >  	  .data = &mt8173_gamma_driver_data},
> > -	{ .compatible = "mediatek,mt8183-disp-gamma"},
> > +	{ .compatible = "mediatek,mt8183-disp-gamma",
> > +	  .data = &mt8183_gamma_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
