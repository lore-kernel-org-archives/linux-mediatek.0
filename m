Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0277C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 05:22:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC2064DD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 05:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC2064DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wn8O5s4Oj/kJNXx/zMXG71/67Lmd+0zHwn7tQ7Y7eVM=; b=ko1QwDpJllJeAoA6NvFe08psr
	hB92/j2noszY773GaQPdzFe1ppPNnzVkMCJZXy7G6u9EcLp3TPauuo0NqC4FtgfUOklwxNftUcmGG
	RbtcR7hYM7jLgPyPFcVB5Pb6W+tQi4oj1vukPOIK7+5+RGjXmFL7njtm2ztLJWlIJRFGvuEIQVsOe
	Os7DT2NEviF1YOq9xfCL5teR8vklVi5UB632KjOArtfP2FkpZEU0IFmIr2ful23oWisZbSaFDAs6b
	bIX8ONcaWwB9p4UF5nnEjTJKd922Uu2NzYajSHq98RnF9zCZnEEv5FGLyzZRdhrikJmpTrKOy9Htz
	hxrQ9wUKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4zkn-0005zt-J1; Thu, 28 Jan 2021 05:22:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4zkk-0005yq-KN; Thu, 28 Jan 2021 05:22:00 +0000
X-UUID: 9ce5073a862b4a05a0b06517daa83e84-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/pktXs/wn5J8yEqVNUEYeMaMl9r2rAFdxrOGFNkrSkM=; 
 b=PnpzPdTiKCQQ9b5/3OgTqMV9ORINQgqGAqCTy4LLr5UEMBQHbr5TMQ0olJbQ5hz1k4dzvUKCgV34ujgXZkiPq5Pq0jevpt5Enz+PoeyvK21ym/rxM9BIYlBk4neJmh1GUw0DDfLA3aFtibMgxjAInF6DVAAu7eo8bmgp8F9yBhI=;
X-UUID: 9ce5073a862b4a05a0b06517daa83e84-20210127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 399260810; Wed, 27 Jan 2021 21:21:55 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 21:21:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 13:21:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 13:21:50 +0800
Message-ID: <1611811310.25395.4.camel@mtksdaap41>
Subject: Re: [PATCH v10 4/9] drm/mediatek: generalize mtk_dither_set() function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 13:21:50 +0800
In-Reply-To: <CAJMQK-jeBBsxZ1RnFJfT5ouNJsBwEkLbZ_+6T+VUFZ_xDQ7rpQ@mail.gmail.com>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-5-hsinyi@chromium.org>
 <1611808753.19104.2.camel@mtksdaap41>
 <CAJMQK-jeBBsxZ1RnFJfT5ouNJsBwEkLbZ_+6T+VUFZ_xDQ7rpQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 80E37F9612338877016C51274D77713CD38E07D9BF6559E650938D31C7674E2C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_002158_900596_2328C160 
X-CRM114-Status: GOOD (  30.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David
 Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-28 at 13:09 +0800, Hsin-Yi Wang wrote:
> On Thu, Jan 28, 2021 at 12:39 PM CK Hu <ck.hu@mediatek.com> wrote:
> >
> > Hi, Hsin-Yi:
> >
> > On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> > > There may be data structure other than mtk_ddp_comp_dev that would call
> > > mtk_dither_set(), so use regs as parameter instead of device.
> >
> > You does not change the interface of mtk_dither_set(). You move the
> > common part in mtk_dither_set() to a new function which could be called
> > by another caller.
> >
> > Regards,
> > CK.
> >
> Current mtk_dither_set() cast dev data to struct mtk_ddp_comp_dev. But
> mtk_disp_gamma in next patch would also call this function. But it's
> dev data is struct mtk_disp_gamma, which is different, so we can't
> cast to mtk_ddp_comp_dev. I separate the necessary parameters (regs,
> cmdq_reg) out, so both component dither and gamma can both call this
> separated function.

I know this. This patch looks good to me but the description would
confuse me.From the description, it seems that you modify the interface
of mtk_dither_set(). So please modify the description to be more clear.

Regards,
CK

> 
> This is similar to the mtk_gamma_set_common() in the next patch, which
> gamma and aal both used.
> 
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++++
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 25 +++++++++++++--------
> > >  2 files changed, 20 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > index 46d199b7b4a29..c50d5fc9fd349 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > > @@ -17,6 +17,10 @@ void mtk_color_config(struct device *dev, unsigned int w,
> > >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > >  void mtk_color_start(struct device *dev);
> > >
> > > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +                        unsigned int bpc, unsigned int CFG,
> > > +                        struct cmdq_pkt *cmdq_pkt);
> > > +
> > >  void mtk_dpi_start(struct device *dev);
> > >  void mtk_dpi_stop(struct device *dev);
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > index 7b5293429426d..53d25823a37cc 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > @@ -151,33 +151,40 @@ static void mtk_ddp_clk_disable(struct device *dev)
> > >       clk_disable_unprepare(priv->clk);
> > >  }
> > >
> > > -static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > > -                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > > -{
> > > -     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > >
> > > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > > +                        unsigned int bpc, unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > > +{
> > >       /* If bpc equal to 0, the dithering function didn't be enabled */
> > >       if (bpc == 0)
> > >               return;
> > >
> > >       if (bpc >= MTK_MIN_BPC) {
> > > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
> > > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
> > > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> > > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
> > >               mtk_ddp_write(cmdq_pkt,
> > >                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> > >                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> > >                             DITHER_NEW_BIT_MODE,
> > > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
> > > +                           cmdq_reg, regs, DISP_DITHER_15);
> > >               mtk_ddp_write(cmdq_pkt,
> > >                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> > >                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> > >                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> > >                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
> > > -             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
> > > +                           cmdq_reg, regs, DISP_DITHER_16);
> > > +             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, cmdq_reg, regs, CFG);
> > >       }
> > >  }
> > >
> > > +static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > > +                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > > +{
> > > +     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > +
> > > +     mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, CFG, cmdq_pkt);
> > > +}
> > > +
> > >  static void mtk_od_config(struct device *dev, unsigned int w,
> > >                         unsigned int h, unsigned int vrefresh,
> > >                         unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> >
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
