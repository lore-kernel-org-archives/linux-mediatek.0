Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CACC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10641613D2
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10641613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNX2eKiyejSM1cMOVDdtPArdY8NNw+1EsAH8mqZU0kQ=; b=WfoMEfzgfud1ge
	q+tfOXQOI8jr1jH3aPyNNd4ZZYtbNlKPru7spQnsLJNqB5gpV1TYxfo47uMg7Yxy5jrpLPVhchN2m
	SEh8R7q97LMp8x+mUIqTVwfY7K1j9vfJ+4UpY31KqDJgBLjnJXjF1M1bi4ccYVRaRAipzvc92aRZO
	g26bydKFTzVr8+yMSvM34M4fQfDxQEmIWir8u2EMRpGoxERD9MMVmSnwLKWev62rGzsCVdBI0oFH8
	2yiaU/P0qhvd4nMbaLwZTcC0gXRn7nt09CHylQwTeCUqKaoqVXc8h2ldekcYzG/cjdIpnQ52CIqYP
	eRENtnLP4lMfdC6QmUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m27Gq-003Dhw-19; Sat, 10 Jul 2021 07:19:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m27Gc-003Dej-HV; Sat, 10 Jul 2021 07:19:16 +0000
X-UUID: 72547217761b4781ac3940fbca3d0800-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/okFO/76ZahoifasUdc1lyHwQCsHpNseD/T4awn0nFE=; 
 b=lU+1/lbM5TBkGTMhMniGqcfmaEEtsAB2Igz7Q0/OjLYIsJ4/NUJEstqEM255k3+wvedFAGrsIh8oX4UXHveRX055W9/Vk2P7gjP1vBZ/H5vRLJszvycmMBytTbWCP2iE5IsM2uG4QU+ViFzO2zaxzCdEoIW7KSPT5ck07g8IzHY=;
X-UUID: 72547217761b4781ac3940fbca3d0800-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1132707909; Sat, 10 Jul 2021 00:19:10 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 00:17:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 15:17:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 15:17:46 +0800
Message-ID: <d841973cfac17f67b1716a861a433bbddf92058b.camel@mediatek.com>
Subject: Re: [PATCH v1 09/17] drm/mediatek: add OVL support multi-layer
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 15:17:46 +0800
In-Reply-To: <1625636614.7824.19.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-10-jason-jh.lin@mediatek.com>
 <1625636614.7824.19.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_001914_726233_E66BA841 
X-CRM114-Status: GOOD (  22.42  )
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

On Wed, 2021-07-07 at 13:43 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > Add datapath_con settings to support multi-layer output.
> 
> 
> What is multi-layer output? Why we need this?
> 
Hi CK,

This patch is not the multi-layer output fix up patch.
The fix up patch is this one:

https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/drivers/gpu/drm/mediatek/mtk_disp_ovl.c?h=mediatek-drm-next&id=d41ff4dcf093885dcc253e3861834eea294827cb

So this patch is not necessary for mt8195 DRM series patches.
I'll remove this patch at the next version.

By the way, this patches is for:
1. If GCLAST is not enabled, SMI will not know if the group is over.
SMI will wait until the last signal is received before it starts to
act.
It may cause OVL can not receive any data from SMI.

To support OVL multi-layer output, add datapath_con settings below:
GCLAST_EN = BIT(24), enable last SMI signal of ovl group
HDR_GCLAST_EN = BIT(25), enable last SMI signal of ovl AFBC group

2. After OUTPUT_CLAMP is enabled, the data will be rounded from 12-bit
to 10-bit. Because the modules after OVL need 10-bit input currently.
It may cause underflow problem, if there is no rounding to 10-bit.

To support 10bit data rounding, add datapath_con settings below:
OUTPUT_CLAMP = BIT(26), rounding data from 12-bit to 10-bit

Regard,
Jason-JH.Lin
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index 7504e86b167a..95fd5e00eb91 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -18,14 +18,17 @@
> >  #include "mtk_drm_ddp_comp.h"
> >  
> >  #define DISP_REG_OVL_INTEN			0x0004
> > -#define OVL_FME_CPL_INT					BIT(1)
> > +#define OVL_FME_CPL_INT				BIT(1)
> >  #define DISP_REG_OVL_INTSTA			0x0008
> >  #define DISP_REG_OVL_EN				0x000c
> >  #define DISP_REG_OVL_RST			0x0014
> >  #define DISP_REG_OVL_ROI_SIZE			0x0020
> >  #define DISP_REG_OVL_DATAPATH_CON		0x0024
> > -#define OVL_LAYER_SMI_ID_EN				BIT(0)
> > -#define OVL_BGCLR_SEL_IN				BIT(2)
> > +#define OVL_LAYER_SMI_ID_EN			BIT(0)
> > +#define OVL_BGCLR_SEL_IN			BIT(2)
> > +#define OVL_GCLAST_EN				BIT(24)
> > +#define OVL_HDR_GCLAST_EN			BIT(25)
> > +#define OVL_OUTPUT_CLAMP			BIT(26)
> >  #define DISP_REG_OVL_ROI_BGCLR			0x0028
> >  #define DISP_REG_OVL_SRC_CON			0x002c
> >  #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20
> > * (n))
> > @@ -222,6 +225,7 @@ void mtk_ovl_layer_on(struct device *dev,
> > unsigned int idx,
> >  	unsigned int gmc_thrshd_l;
> >  	unsigned int gmc_thrshd_h;
> >  	unsigned int gmc_value;
> > +	unsigned int datapatch_con;
> >  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> >  
> >  	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs,
> > @@ -237,6 +241,11 @@ void mtk_ovl_layer_on(struct device *dev,
> > unsigned int idx,
> >  			    gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
> >  	mtk_ddp_write(cmdq_pkt, gmc_value,
> >  		      &ovl->cmdq_reg, ovl->regs,
> > DISP_REG_OVL_RDMA_GMC(idx));
> > +
> > +	datapatch_con = OVL_GCLAST_EN | OVL_HDR_GCLAST_EN |
> > OVL_OUTPUT_CLAMP;
> > +	mtk_ddp_write_mask(cmdq_pkt, datapatch_con, &ovl->cmdq_reg,
> > ovl->regs,
> > +				 DISP_REG_OVL_DATAPATH_CON,
> > datapatch_con);
> 
> For mt8173 or other SoC, this does not turn on. Now you turn on this,
> would this influence other SoC?
> 
> Regards,
> CK
> 
> > +
> >  	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &ovl->cmdq_reg, ovl-
> > >regs,
> >  			   DISP_REG_OVL_SRC_CON, BIT(idx));
> >  }
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
