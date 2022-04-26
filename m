Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410D1C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3BNapGuPC1UcqgKXUE+/05GlFc4TMS6joacigTN8WM=; b=v7VI9AoK+9VvPG
	XHQILe3achjDr2K9ftCgdZbGw2TF5yJ246jpRqIWxg7c+LpIttMSafDgdtTxKjZFCE+8dbAv2TAwm
	ApobX9LnoqJNLGtJJ2QXLc7tl+GaAQOejSvHlxyNRU551pLhy6aUt/UgEHjMqRbKY6Zoe46lOEIY6
	BdzFir8j18eVSyy6BOwTpKn97IHd/vd4sLcrxSMHP8OCjrcjx7NmkmkS/AojXbiqhehjh3q3ke9Gg
	QmbzQ3f04gv/NimpfTgeLlMcsK/VGLXJk84OJH9vcSkjW+w+oCQ2i+2QfmWiqaaR+JLCcQVFz5OGk
	L0cUqV7W7ueXqt7cWNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njBHx-00CEd8-WD; Tue, 26 Apr 2022 02:50:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njBHm-00CEa9-FR; Tue, 26 Apr 2022 02:50:44 +0000
X-UUID: f1896dd2c08247158773192ce95990ab-20220425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vhgu7JCGBrG4kmqMFMQQnOb8wIxlAzRqLZSFP2K0n6U=; 
 b=JBZSiRtasIinJiRGGsLR9kOuRo4iXm2e41gVLSzhH5SZiRTYj922Y9i1g27gR9d5dAnOc0FfJ1vrEygniR2/Q1Kizlaw1CPAlTObTMvC8iZpIMquIfZi2iGapFPEofxrLj/enXktt8uUJQ2dy6rFr/AbZAU6LC4JGFL+kn7to+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9e59c60e-6b41-44e2-9efb-216033435130, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:7,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:7
X-CID-META: VersionHash:faefae9, CLOUDID:752d19f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f1896dd2c08247158773192ce95990ab-20220425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 894188556; Mon, 25 Apr 2022 19:50:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 19:50:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 10:50:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 10:50:32 +0800
Message-ID: <146a57a783abcbcc45b4ca625c44bb87224e8b14.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] drm/mediatek: add lut diff flag for new gamma
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
Date: Tue, 26 Apr 2022 10:50:31 +0800
In-Reply-To: <8b643b0faeb0a6ba7730f2d30076c6d62145bc12.camel@mediatek.com>
References: <20220420130617.814-1-yongqiang.niu@mediatek.com>
 <20220420130617.814-2-yongqiang.niu@mediatek.com>
 <a9e026c2018668057b8482c27eeae991667c46d3.camel@mediatek.com>
 <48f4a8d3d447342eb952598d479028586caacedc.camel@mediatek.com>
 <8b643b0faeb0a6ba7730f2d30076c6d62145bc12.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_195042_566981_CA1C2B9B 
X-CRM114-Status: GOOD (  42.03  )
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

On Tue, 2022-04-26 at 10:47 +0800, CK Hu wrote:
> On Tue, 2022-04-26 at 10:39 +0800, yongqiang.niu wrote:
> > On Tue, 2022-04-26 at 09:58 +0800, CK Hu wrote:
> > > Hi, Yongqiang:
> > > 
> > > On Wed, 2022-04-20 at 21:06 +0800, Yongqiang Niu wrote:
> > > > From: Yongqiang Niu <
> > > > yongqiang.niu@mediatek.corp-partner.google.com
> > > > > 
> > > > 
> > > > mt8183 gamma module usage is different with before soc,
> > > > gamma odd(index start from 0) lut value set to hardware
> > > > register should be
> > > > the difference of current lut value with last lut value.
> > > > 
> > > > gamma function support both increase and decrease lut.
> > > 
> > > How to set decrease lut?
> > > 
> > > Original lut:
> > > 12 10 8 6 4 2
> > > 
> > > Does diff lut look like this?
> > > 12 [2] 8 [2] 4 [2]
> > > 
> > 
> > yes
> > 
> > > How does hardware know that this is increase lut or decrease lut?
> > 
> > gamma register 0x20 , bit 2, 
> > if this bit set to 1, hardware will know lut is decrease.
> > this bit default is 0, that means lut is increase
> > 
> > > 
> > > > chrome os app set increase lut normally.
> > > > 
> > > > for increase lut example, chrome os user space set lut
> > > > like this(only r chanel for example):
> > > > 2 4 6 8 10 12.
> > > > 1) mt8183 gamma driver should set the gamma lut to hardware
> > > > register like this:
> > > > 2 [2] 6 [8] 10 [2]
> > > 
> > > 2 [2] 6 [2] 10 [2]
> > > 
> > > > the value with [] is the difference value
> > > > 2) gamma hardware will restore the lut when apply gamma
> > > > function to display
> > > 
> > > I don't know why do you mention the 'restore', any modification
> > > is
> > > related to this?
> > > 
> > 
> > that means gamma
> > hardware process display data with original lut
> > > > 
> > > > Signed-off-by: Yongqiang Niu <
> > > > yongqiang.niu@mediatek.corp-partner.google.com>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  4 ++-
> > > >  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
> > > >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34
> > > > +++++++++++++++++++
> > > > ----
> > > >  3 files changed, 32 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > > b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > > index f46d4ab73d6a..e6378b074a17 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > > > @@ -23,6 +23,7 @@
> > > >  
> > > >  struct mtk_disp_aal_data {
> > > >  	bool has_gamma;
> > > > +	bool lut_diff;
> > > >  };
> > > >  
> > > >  /**
> > > > @@ -66,7 +67,7 @@ void mtk_aal_gamma_set(struct device *dev,
> > > > struct
> > > > drm_crtc_state *state)
> > > >  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> > > >  
> > > >  	if (aal->data && aal->data->has_gamma)
> > > > -		mtk_gamma_set_common(aal->regs, state);
> > > > +		mtk_gamma_set_common(aal->regs, state, aal-
> > > > >data-
> > > > > lut_diff);
> > > 
> > > gamma in aal does not support diff lut, so this would make things
> > > simple.
> > > 
> > > mtk_gamma_set_common(aal->regs, state, false);
> > 
> > fix next version
> > > 
> > > Regards,
> > > CK
> > > 
> > > >  }
> > > >  
> > > >  void mtk_aal_start(struct device *dev)
> > > > @@ -148,6 +149,7 @@ static int mtk_disp_aal_remove(struct
> > > > platform_device *pdev)
> > > >  
> > > >  static const struct mtk_disp_aal_data mt8173_aal_driver_data =
> > > > {
> > > >  	.has_gamma = true,
> > > > +	.lut_diff = false,
> > > >  };
> > > >  
> > > >  static const struct of_device_id
> > > > mtk_disp_aal_driver_dt_match[]
> > > > =
> > > > {
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > > index 86c3068894b1..3380651c6707 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > > @@ -51,7 +51,7 @@ void mtk_gamma_config(struct device *dev,
> > > > unsigned
> > > > int w,
> > > >  		      unsigned int h, unsigned int vrefresh,
> > > >  		      unsigned int bpc, struct cmdq_pkt
> > > > *cmdq_pkt);
> > > >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > > > *state);
> > > > -void mtk_gamma_set_common(void __iomem *regs, struct
> > > > drm_crtc_state
> > > > *state);
> > > > +void mtk_gamma_set_common(void __iomem *regs, struct
> > > > drm_crtc_state
> > > > *state, bool lut_diff);
> > > >  void mtk_gamma_start(struct device *dev);
> > > >  void mtk_gamma_stop(struct device *dev);
> > > >  
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > > index 3a5815ab4079..fec2e9a5b60d 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > > > @@ -27,6 +27,7 @@
> > > >  
> > > >  struct mtk_disp_gamma_data {
> > > >  	bool has_dither;
> > > > +	bool lut_diff;
> > > >  };
> > > >  
> > > >  /*
> > > > @@ -53,12 +54,13 @@ void mtk_gamma_clk_disable(struct device
> > > > *dev)
> > > >  	clk_disable_unprepare(gamma->clk);
> > > >  }
> > > >  
> > > > -void mtk_gamma_set_common(void __iomem *regs, struct
> > > > drm_crtc_state
> > > > *state)
> > > > +void mtk_gamma_set_common(void __iomem *regs, struct
> > > > drm_crtc_state
> > > > *state, bool lut_diff)
> > > >  {
> > > >  	unsigned int i, reg;
> > > >  	struct drm_color_lut *lut;
> > > >  	void __iomem *lut_base;
> > > >  	u32 word;
> > > > +	u32 diff[3] = {0};
> > > >  
> > > >  	if (state->gamma_lut) {
> > > >  		reg = readl(regs + DISP_GAMMA_CFG);
> > > > @@ -67,9 +69,20 @@ void mtk_gamma_set_common(void __iomem
> > > > *regs,
> > > > struct drm_crtc_state *state)
> > > >  		lut_base = regs + DISP_GAMMA_LUT;
> > > >  		lut = (struct drm_color_lut *)state->gamma_lut-
> > > > >data;
> > > >  		for (i = 0; i < MTK_LUT_SIZE; i++) {
> > > > -			word = (((lut[i].red >> 6) &
> > > > LUT_10BIT_MASK) <<
> > > > 20) +
> > > > -				(((lut[i].green >> 6) &
> > > > LUT_10BIT_MASK)
> > > > << 10) +
> > > > -				((lut[i].blue >> 6) &
> > > > LUT_10BIT_MASK);
> > > > +
> > > > +			if (!lut_diff || (i % 2 == 0)) {
> > > > +				word = (((lut[i].red >> 6) &
> > > > LUT_10BIT_MASK) << 20) +
> > > > +					(((lut[i].green >> 6) &
> > > > LUT_10BIT_MASK) << 10) +
> > > > +					((lut[i].blue >> 6) &
> > > > LUT_10BIT_MASK);
> > > > +			} else {
> > > > +				diff[0] = abs((lut[i].red >> 6)
> > > > -
> > > > (lut[i - 1].red >> 6));
> 
> You does not set register 0x20[2], so this patch only support
> increase
> lut and abs() is not necessary.
> 
> Regards,
> CK

abs will be removed in next version
> 
> > > > +				diff[1] = abs((lut[i].green >>
> > > > 6) -
> > > > (lut[i - 1].green >> 6));
> > > > +				diff[2] = abs((lut[i].blue >>
> > > > 6) -
> > > > (lut[i - 1].blue >> 6));
> > > > +
> > > > +				word = ((diff[0] &
> > > > LUT_10BIT_MASK) <<
> > > > 20) +
> > > > +					((diff[1] &
> > > > LUT_10BIT_MASK) <<
> > > > 10) +
> > > > +					(diff[2] &
> > > > LUT_10BIT_MASK);
> > > > +			}
> > > >  			writel(word, (lut_base + i * 4));
> > > >  		}
> > > >  	}
> > > > @@ -78,8 +91,12 @@ void mtk_gamma_set_common(void __iomem
> > > > *regs,
> > > > struct drm_crtc_state *state)
> > > >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > > > *state)
> > > >  {
> > > >  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> > > > +	bool lut_diff = false;
> > > > +
> > > > +	if (gamma->data)
> > > > +		lut_diff = gamma->data->lut_diff;
> > > >  
> > > > -	mtk_gamma_set_common(gamma->regs, state);
> > > > +	mtk_gamma_set_common(gamma->regs, state, lut_diff);
> > > >  }
> > > >  
> > > >  void mtk_gamma_config(struct device *dev, unsigned int w,
> > > > @@ -176,10 +193,15 @@ static const struct mtk_disp_gamma_data
> > > > mt8173_gamma_driver_data = {
> > > >  	.has_dither = true,
> > > >  };
> > > >  
> > > > +static const struct mtk_disp_gamma_data
> > > > mt8183_gamma_driver_data
> > > > =
> > > > {
> > > > +	.lut_diff = true,
> > > > +};
> > > > +
> > > >  static const struct of_device_id
> > > > mtk_disp_gamma_driver_dt_match[]
> > > > =
> > > > {
> > > >  	{ .compatible = "mediatek,mt8173-disp-gamma",
> > > >  	  .data = &mt8173_gamma_driver_data},
> > > > -	{ .compatible = "mediatek,mt8183-disp-gamma"},
> > > > +	{ .compatible = "mediatek,mt8183-disp-gamma",
> > > > +	  .data = &mt8183_gamma_driver_data},
> > > >  	{},
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
> > > 
> > > 
> > 
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
