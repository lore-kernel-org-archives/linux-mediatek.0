Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9596DECAAD3
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Sep 2022 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNoBL5APFQBCkGYN+lQ1f1ewIpOD2UL3PvQdNH2ExRM=; b=sitbm6oyUgKDehkQEOkuM03BAS
	MLax9UxlWlJwzKBFFEdaGOGrR/mL4BL66vcxhXaTaHRBBKk0eayNHzomVoQ9GKKiEp6KDSvvOVp0X
	Cu1WxU/+5gom7lopiz+rhLVttO8o7Ls+p3ub8qoB6Cn8B9XVQLmPLLv8J4JS6u2OKu+UabINsuwwP
	2iHSlrne1k0QFHBxsrFpIqOc3qAz/samw4X79ONIkwIOSjQptwKDm5Y3nQgLwBi596Mfc5c5Ofh/r
	6f80PhiHAMf6AkjOp0Hkn2Rel4HawBqPqeWM32IqQaSuTD0ZaEzA9JOQ5SkuhR9ZL00QNeuYs8xR6
	+QxvcqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX3w4-00Bsv2-Lv; Sat, 10 Sep 2022 17:06:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX3vt-00Bsht-5f; Sat, 10 Sep 2022 17:06:19 +0000
X-UUID: b978fd9fab9d4fdeb24d7f684d212ad2-20220910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zNoBL5APFQBCkGYN+lQ1f1ewIpOD2UL3PvQdNH2ExRM=;
	b=WD2Pa0v2wCkHf2fdCrIGoa54uxCwZiJ5yC0jzGZEu30bF0A7nTwPObzVYhXfBnJpkBh+7+gipESl853hEkNwC4WyYtJLchFdDBDninTLX2/U/vauXttiZQUN6YQYiEdRGcDlkCqv4FoZzC+/u+dia5J3Eq0J/fUnOsGoInYzZsk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:424fd12a-c2c0-4e7f-abdd-2e029b7c0be3,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:d7defaeb-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b978fd9fab9d4fdeb24d7f684d212ad2-20220910
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1887028392; Sat, 10 Sep 2022 10:06:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 11 Sep 2022 00:25:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sun, 11 Sep 2022 00:25:27 +0800
Message-ID: <17ceb3122bb6aa5c67a0f952fd506007e8bf1536.camel@mediatek.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: Add gamma lut support for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, zheng-yan.chen <zheng-yan.chen@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, Singo Chang <singo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Sun, 11 Sep 2022 00:25:27 +0800
In-Reply-To: <fc7ebb459d0828fe3f26304b9935fb8910a1b965.camel@mediatek.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
	 <20220830063929.13390-3-zheng-yan.chen@mediatek.com>
	 <fc7ebb459d0828fe3f26304b9935fb8910a1b965.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_100617_371031_557BD90F 
X-CRM114-Status: GOOD (  35.51  )
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

On Wed, 2022-08-31 at 10:56 +0800, CK Hu wrote:
> Hi, Zheng-yan:
> 
> On Tue, 2022-08-30 at 14:39 +0800, zheng-yan.chen wrote:
> > Since the previous gamma_set_common() function is designed for
> > 9bit-to-10bit conversion, which is not feasible for the
> > 10bit-to-12bit conversion in mt8195.
> > 
> > Update the function to fit the need of mt8195.
> > 
> > Fixes: 7266e90a51a3 ("drm/mediatek: Add mediatek-drm of vdosys0
> > support for mt8195")
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_aal.c     |   2 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 102 +++++++++++++++-
> > --
> > --
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   5 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   2 +
> >  8 files changed, 85 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > index 0f9d7efb61d7..f563eee3c330 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > @@ -66,7 +66,7 @@ void mtk_aal_gamma_set(struct device *dev, struct
> > drm_crtc_state *state)
> >  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> >  
> >  	if (aal->data && aal->data->has_gamma)
> > -		mtk_gamma_set_common(aal->regs, state, false);
> > +		mtk_gamma_set_common(aal->regs, state, dev);
> >  }
> >  
> >  void mtk_aal_start(struct device *dev)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index 33e61a136bbc..c1269fce9a66 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -51,8 +51,9 @@ void mtk_gamma_clk_disable(struct device *dev);
> >  void mtk_gamma_config(struct device *dev, unsigned int w,
> >  		      unsigned int h, unsigned int vrefresh,
> >  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > +unsigned int mtk_gamma_size(struct device *dev);
> >  void mtk_gamma_set(struct device *dev, struct drm_crtc_state
> > *state);
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff);
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, struct device *dev);
> >  void mtk_gamma_start(struct device *dev);
> >  void mtk_gamma_stop(struct device *dev);
> >  
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index bbd558a036ec..0409e15fceb3 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -18,18 +18,22 @@
> >  #define DISP_GAMMA_EN				0x0000
> >  #define GAMMA_EN					BIT(0)
> >  #define DISP_GAMMA_CFG				0x0020
> > +#define RELAY_MODE					BIT(0)
> >  #define GAMMA_LUT_EN					BIT(1)
> >  #define GAMMA_DITHERING					BIT(2)
> >  #define DISP_GAMMA_SIZE				0x0030
> > +#define DISP_GAMMA_BANK				0x0100
> >  #define DISP_GAMMA_LUT				0x0700
> > -
> > -#define LUT_10BIT_MASK				0x03ff
> > -
> > +#define DISP_GAMMA_LUT1				0x0b00
> > +#define TABLE_9BIT_SIZE				512
> > +#define TABLE_10BIT_SIZE			1024
> > +#define BANK_SIZE				256
> >  struct mtk_disp_gamma_data {
> >  	bool has_dither;
> >  	bool lut_diff;
> > +	unsigned int lut_size;
> > +	unsigned int lut_bits;
> >  };
> > -
> >  /*
> >   * struct mtk_disp_gamma - DISP_GAMMA driver structure
> >   */
> > @@ -54,40 +58,75 @@ void mtk_gamma_clk_disable(struct device *dev)
> >  	clk_disable_unprepare(gamma->clk);
> >  }
> >  
> > -void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, bool lut_diff)
> > +void mtk_gamma_set_common(void __iomem *regs, struct
> > drm_crtc_state
> > *state, struct device *dev)
> >  {
> > -	unsigned int i, reg;
> > -	struct drm_color_lut *lut;
> > +	unsigned int i, reg, idx;
> >  	void __iomem *lut_base;
> > -	u32 word;
> > -	u32 diff[3] = {0};
> > +	void __iomem *lut1_base;
> > +	u32 word, word1;
> > +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> >  
> >  	if (state->gamma_lut) {
> > +		u32 table_size;
> > +		u32 mask;
> > +		u32 lut_bits;
> > +		u32 shift_bits;
> > +		bool lut_diff;
> > +		struct drm_color_lut color, color_rec;
> > +		struct drm_color_lut *lut = (struct drm_color_lut
> > *)state->gamma_lut;
> > +
> > +		table_size = gamma->data->lut_size;
> > +		lut_bits = gamma->data->lut_bits;
> > +		lut_diff = gamma->data->lut_diff;
> > +		shift_bits = (lut_bits == 12) ? 4 : 6;
> > +		mask = GENMASK(lut_bits - 1, 0);
> >  		reg = readl(regs + DISP_GAMMA_CFG);
> > +		reg = reg & ~RELAY_MODE;
> >  		reg = reg | GAMMA_LUT_EN;
> >  		writel(reg, regs + DISP_GAMMA_CFG);
> >  		lut_base = regs + DISP_GAMMA_LUT;
> > -		lut = (struct drm_color_lut *)state->gamma_lut->data;
> > -		for (i = 0; i < MTK_LUT_SIZE; i++) {
> > -
> > -			if (!lut_diff || (i % 2 == 0)) {
> > -				word = (((lut[i].red >> 6) &
> > LUT_10BIT_MASK) << 20) +
> > -					(((lut[i].green >> 6) &
> > LUT_10BIT_MASK) << 10) +
> > -					((lut[i].blue >> 6) &
> > LUT_10BIT_MASK);
> > +		lut1_base = regs + DISP_GAMMA_LUT1;
> > +		for (i = 0; i < table_size; i++) {
> > +			color.red = (lut[i].red >> shift_bits) & mask;
> > +			color.green = (lut[i].green >> shift_bits) &
> > mask;
> > +			color.blue = (lut[i].blue >> shift_bits) &
> > mask;
> > +			if (lut_diff && (i % 2)) {
> > +				word = (lut_bits == 12) ?
> > +						      (((color.green -
> > color_rec.green) << 12) +
> > +						      (color.red -
> > color_rec.red))
> > +							:
> > +						      (((color.red -
> > color_rec.red) << 20) +
> > +						      ((color.green -
> > color_rec.green) << 10) +
> > +						      (color.blue -
> > color_rec.blue));
> > +				word1 = (color.blue - color_rec.blue);
> >  			} else {
> > -				diff[0] = (lut[i].red >> 6) - (lut[i -
> > 1].red >> 6);
> > -				diff[1] = (lut[i].green >> 6) - (lut[i
> > - 1].green >> 6);
> > -				diff[2] = (lut[i].blue >> 6) - (lut[i -
> > 1].blue >> 6);
> > -
> > -				word = ((diff[0] & LUT_10BIT_MASK) <<
> > 20) +
> > -					((diff[1] & LUT_10BIT_MASK) <<
> > 10) +
> > -					(diff[2] & LUT_10BIT_MASK);
> > +				word = (lut_bits == 12) ?
> > +						      ((color.green <<
> > 12) + color.red)
> > +							:
> > +						      ((color.red <<
> > 20) +
> > +						      (color.green <<
> > 10) + color.blue);
> > +				word1 = color.blue;
> > +				color_rec = color;
> >  			}
> > -			writel(word, (lut_base + i * 4));
> > +			idx = (lut_bits == 12) ? (i % BANK_SIZE) : i;
> > +			writel(word, (lut_base + idx * 4));
> > +			if (!(i % BANK_SIZE) && lut_bits == 12)
> > +				writel((i / BANK_SIZE), regs +
> > DISP_GAMMA_BANK);
> 
> This patch looks a little messy and mt8195 gamma introduce three
> different things. So I would like to separate this patch to 4
> patches.
> 
> 1. Add multiple bank support. For other SoC, bank size is 0 which
> means
> no bank support.
> 2. Support different lut_size: For other SoC, lut_size = 512
> 3. Support different lut_bits: For other SoC, lut_bits = 10
> 4. Add MT8195 gamma support, bank_size = 256, lut_size = 1024,
> lut_bits
> = 12
> 
> In this view point, I think the last patch is not a bug-fix but a new
> feature, so just drop the Fixes tag.
> 
> Regards,
> CK


Hi CK,

Thanks for the reviews.

I'll help Zheng-yan finish this series.

I'll separate this one patch to the patches below:
drm/mediatek: Adjust mtk_drm_gamma_set_common parameters
drm/mediatek: Add gamma support different lut_size for other SoC
drm/mediatek: Add gamma support different lut_bits for other SoC
drm/mediatek: Add gamma support different bank_size for other SoC
drm/mediatek: Add gamma lut support for mt8195
drm/mediatek: Add clear RELAY_MODE bit to set gamma

Regrads,
Jason-JH.Lin


