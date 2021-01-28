Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB4EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:10:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6571D64DDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6571D64DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6aKxdAp/hCgj0TpqxSOPpnQkrzNoEQ6OlO7y/wx+aI=; b=X1VIucErq1Uatq6T4F8wCHlO8k
	liC/0CWFdWkkgbArenxrUxuyPjxtR3XxLilGrEzocqyhKeaWKu4H/4eAvL2JZyHsZ8TxrXIiksFkU
	5CAt+z19PIyzZxfJHsmuxF6tNsca4KOD31iEnlbSYJoEaKZoMyD7jvUDULNSuW7kcmPm734ZNlI30
	bi8fh5PaqAzLoJ5nzVJdzFMjEnJPsh6IlEcvBW9dbSEVnpiSALWdR/DjuOPsAHIeOHijC5MQ3ZcIJ
	dE0GZ/sMLBCVhBSC7gENH7vY6ICYRRO32Qga+HyJIGdOhVQWBNVSJ+6nfnbFcukdG0EIT/BZUiZJL
	QZYOXSfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l52NZ-0008Az-Ce; Thu, 28 Jan 2021 08:10:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l52NS-00088y-3o; Thu, 28 Jan 2021 08:10:09 +0000
X-UUID: 4ef40994f3b141fe93ccbb6266de675b-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=3avhCwfwHncHem81Q76+RbeX5Zom5hg2AKdmxBBvpRI=; 
 b=I7FXhgSs9DXCVcT6lyLI4GxsAlOt/F1GssHQWojcFhi7ngp2wb+8NIrtjq3njP6Q3/P++wePLz+mUOBh6xOi3Tui7SDmpBwvqPaR+Xg1Xy0lgf7ycRsJxVmA9Zl9YdZmndMfe5LaFuaLJSuVMhSWv7zT29vYLx5F3jH+enhdw0I=;
X-UUID: 4ef40994f3b141fe93ccbb6266de675b-20210128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 446076568; Thu, 28 Jan 2021 00:10:01 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 00:09:59 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 Jan 2021 16:09:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 16:09:57 +0800
Message-ID: <1611821396.1947.10.camel@mhfsdcap03>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 28 Jan 2021 16:09:56 +0800
In-Reply-To: <1611821233.18369.4.camel@mtksdaap41>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
 <1611819766.16091.4.camel@mtksdaap41> <1611820770.1947.8.camel@mhfsdcap03>
 <1611821233.18369.4.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_031007_375596_1338FF36 
X-CRM114-Status: GOOD (  27.94  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-28 at 16:07 +0800, CK Hu wrote:
> On Thu, 2021-01-28 at 15:59 +0800, Yongqiang Niu wrote:
> > On Thu, 2021-01-28 at 15:42 +0800, CK Hu wrote:
> > > Hi, Hsin-Yi:
> > > 
> > > On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> > > > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > 
> > > > for 5 or 6 bpc panel, we need enable dither function
> > > > to improve the display quality
> > > > 
> > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
> > > >  1 file changed, 43 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > index 8173f709272be..e85625704d611 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > @@ -53,7 +53,9 @@
> > > >  #define DITHER_EN				BIT(0)
> > > >  #define DISP_DITHER_CFG				0x0020
> > > >  #define DITHER_RELAY_MODE			BIT(0)
> > > > +#define DITHER_ENGINE_EN			BIT(1)
> > > >  #define DISP_DITHER_SIZE			0x0030
> > > > +#define DITHER_REG(idx)				(0x100 + (idx) * 4)
> > > >  
> > > >  #define LUT_10BIT_MASK				0x03ff
> > > >  
> > > > @@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> > > >  {
> > > >  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > >  
> > > > +	bool enable = false;
> > > > +
> > > > +	/* default value for dither reg 5 to 14 */
> > > > +	const u32 dither_setting[] = {
> > > > +		0x00000000, /* 5 */
> > > > +		0x00003002, /* 6 */
> > > > +		0x00000000, /* 7 */
> > > > +		0x00000000, /* 8 */
> > > > +		0x00000000, /* 9 */
> > > > +		0x00000000, /* 10 */
> > > > +		0x00000000, /* 11 */
> > > > +		0x00000011, /* 12 */
> > > > +		0x00000000, /* 13 */
> > > > +		0x00000000, /* 14 */
> > > 
> > > Could you explain what is this?
> > 
> > this is dither 5 to dither 14 setting
> > this will be useless, we just need set dither 5 and dither 7 like 
> > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_5);
> > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_7);
> > other value is same with hardware default value.
> > 
> > 
> > > 
> > > > +	};
> > > > +
> > > > +	if (bpc == 5 || bpc == 6) {
> > > > +		enable = true;
> > > > +		mtk_ddp_write(cmdq_pkt,
> > > > +			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> > > > +			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> > > > +			      DITHER_NEW_BIT_MODE,
> > > > +			      &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> > > > +		mtk_ddp_write(cmdq_pkt,
> > > > +			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> > > > +			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> > > > +			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> > > > +			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > > 
> > > This result in 0x50505050, but previous version is 0x50504040, so this
> > > version is correct and previous version is incorrect?
> > 
> > the new version set r g b 3 channel same, seams more reasonable
> > 
> > 
> 
> So all the setting of DISP_DITHER_5, DISP_DITHER_7, DISP_DITHER_15,
> DISP_DITHER_16 is identical to mtk_dither_set(), so call
> mtk_dither_set() instead of duplication here.
> 

dither enable set in mtk_dither_set is
mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, CFG);

that is different 8183 and mt8192.
mt8173 dither enable in gamma is bit2
mt8183 and mt8192 dither engine enable is bit 1


> Regards,
> CK
> > > 
> > > Regards,
> > > CK
> > > 
> > > > +			      &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> > > > +	}
> > > > +
> > > > +
> > > > +	if (enable) {
> > > > +		u32 idx;
> > > > +
> > > > +		for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> > > > +			mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> > > > +				      DITHER_REG(idx + 5));
> > > > +	}
> > > > +
> > > >  	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > > > -	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > >  }
> > > >  
> > > >  static void mtk_dither_start(struct device *dev)
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
