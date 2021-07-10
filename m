Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAA4C07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14568611ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14568611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6CMwqdLxT8b1zSP8h83OnbclKaO5Iozw42xNaDNQ30=; b=cs/4LEsON9hxSN
	/UZD9g5X3f9J/CJwNYAuhQKIoZlvlxM4chQVxy+F5eYh5hgr8kTrzhDBfHGVrtnxrps5S0STx8mA3
	gchMr0nboH9SRHzLBWm2z0zBAyrJhQZL54Gdnkwz92Eiug+mtBheOyiqoEE8UMaojM8Zcy2s3gQ6C
	gPBKF67ZLmjwMJCKdJYI2CA79eY6313NVflztyC9uRV1XyyhQ+lGFNJ/qZKtjq1q4dKukWnw9O28X
	tFfZts/u5br+NKEx9v/aQCqGQBMATeAe8ZgUU09R7A6Vx07sLdF8tIn+sR3SBc5tvsMSWJReZOQFP
	y9XZw6/KX0us9K3gqqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m27gV-003Hr7-CT; Sat, 10 Jul 2021 07:45:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m27gI-003HqA-Ca; Sat, 10 Jul 2021 07:45:48 +0000
X-UUID: 4617cde8c95c4fc0a38ec0fc8f04f046-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ksi1tJKtXw+hGsfYzAVp4LQ4enLTHVyetLrk/wT8aDU=; 
 b=jneK4q3kSWSb6eMeCH9KqP/nmB1Z1eY9GUfylLkNbrA0lfBPBap+lYP8CNNx0TFkGLlKZiRK6uT4vu6TF/izOPr+WUdzXDZL9Q7nZ0zFaAjbFPCKLeM5ccTjA7VX7J8LAoqrKn2/JSdUxXhyGo/EMBA3f1R3SU+3RZPex9kC84g=;
X-UUID: 4617cde8c95c4fc0a38ec0fc8f04f046-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 217992015; Sat, 10 Jul 2021 00:45:35 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 00:35:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 15:35:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 15:35:19 +0800
Message-ID: <923a1be8698d23acdce2b988162da83745c9f3e9.camel@mediatek.com>
Subject: Re: [PATCH v1 13/17] drm/mediatek: Add AAL support for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 15:35:19 +0800
In-Reply-To: <1625638499.7824.25.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-14-jason-jh.lin@mediatek.com>
 <1625638499.7824.25.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_004546_577452_4687F066 
X-CRM114-Status: GOOD (  22.28  )
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

On Wed, 2021-07-07 at 14:14 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > 1. Add AAL support for MT8195.
> > 2. Add AAL_OUTPUT_SIZE configuration.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 8 +++++++-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 2 ++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 75bc00e17fc4..f154f7c0cd11 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -34,6 +34,7 @@
> >  
> >  #define DISP_AAL_EN				0x0000
> >  #define DISP_AAL_SIZE				0x0030
> > +#define DISP_AAL_OUTPUT_SIZE			0x04d8
> >  
> >  #define DISP_DITHER_EN				0x0000
> >  #define DITHER_EN				BIT(0)
> > @@ -196,7 +197,12 @@ static void mtk_aal_config(struct device *dev,
> > unsigned int w,
> >  {
> >  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> >  
> > -	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv-
> > >regs, DISP_AAL_SIZE);
> > +	mtk_ddp_write(cmdq_pkt, w << 16 | h,
> > +				&priv->cmdq_reg, priv->regs,
> > +				DISP_AAL_SIZE);
> 
> Why do you change this?
> 
> > +	mtk_ddp_write(cmdq_pkt, w << 16 | h,
> > +				&priv->cmdq_reg, priv->regs,
> > +				DISP_AAL_OUTPUT_SIZE);
> 
> This seems not related to mt8195, so move this modification to
> another
> patch.
> 
> >  }
> >  
> >  static void mtk_aal_gamma_set(struct device *dev, struct
> > drm_crtc_state *state)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 058b50d0e64b..459bb1e53f2e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -450,6 +450,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DISP_COLOR },
> >  	{ .compatible = "mediatek,mt8173-disp-aal",
> >  	  .data = (void *)MTK_DISP_AAL},
> > +	{ .compatible = "mediatek,mt8195-disp-aal",
> > +	  .data = (void *)MTK_DISP_AAL},
> 
> The same question for OVL, COLOR, CCORR.
> 
> Regards,
> CK
> 
> 
Hi CK,

To avoid the output height is incorrect, AAL_OUTPUT_SIZE
configuration is necessary setting for every chips.

> 
Other chips may set AAL_OUPUT_SIZE in boot loader or somewhere before
kernel, so they didn't need this confiuration here.

So I'll remove this patch at the next version.

Regard,
Jason-JH.Lin

> >  	{ .compatible = "mediatek,mt8173-disp-gamma",
> >  	  .data = (void *)MTK_DISP_GAMMA, },
> >  	{ .compatible = "mediatek,mt8183-disp-gamma",
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
