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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CF0C43381
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:29:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B40864DD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B40864DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i/0/unzPb8hZ7TFVO61u5Jjr4Raf24my7s0+d8nbfH0=; b=TbHERrhYVRRZqd3N9LejLaxqK
	hdZFtO6ZMNd6SFyHxwcEFgYdmpgnP6ucFALK41r/yvCP+RHvOVC5Pgqs2cwMkNc9qBRreb8P+zWnA
	238POn7BwNFZ6GxFdyLQDygt5w8AHfCqYVwM0s+PgW0AtKgkIvR/y8HO+Ot8XAB3QLL2zW46nMXTj
	hGTR8S9sh5zZTDDOWt+i31i+8/QNzvL//uthsMip9WUikpoRGdOnjZwnfv+/vaNvVZpV0q7ZWat3E
	RizvAxmw9Etyvcvei/9tLyyvbrfCqG81h3PrclSAerRtcVAyTgb1PCL4OpcYPZ4tgP9iTrmc3TxiX
	sORNwbdfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l52fh-0002SD-V0; Thu, 28 Jan 2021 08:28:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l52ff-0002RK-6T; Thu, 28 Jan 2021 08:28:56 +0000
X-UUID: c025ea9db8f8494997fb3fa56d64ba32-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xXCb6L2ZXCrCP94s27k1hE1RsAxmrD2LYXcFbF5uA0E=; 
 b=RiyGXxxpZEBLKoq9ur0bn2LeFudUXgsHBCNRK+Lk6nZ9IUh9+8lTPzaIKrrNTaSdj7hfGjEVMb0aLX9W3I7Vx+KfDDdjh+hJuKqIxCEMYYZBcF+wNGhoPFRR8XA1TwLqFs7huugE14N1BOpLDqJYRH7QTxR7QpU+ILMZPxGKFpw=;
X-UUID: c025ea9db8f8494997fb3fa56d64ba32-20210128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 536777459; Thu, 28 Jan 2021 00:28:52 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 00:28:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 16:28:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 16:28:44 +0800
Message-ID: <1611822524.23925.4.camel@mtksdaap41>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 16:28:44 +0800
In-Reply-To: <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
 <1611819766.16091.4.camel@mtksdaap41> <1611820770.1947.8.camel@mhfsdcap03>
 <1611821233.18369.4.camel@mtksdaap41> <1611821396.1947.10.camel@mhfsdcap03>
 <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 16FFF3C473B8505D6216BE76A3CFAA9D7D5ECBF80795522F50D2FF9FE06560AF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_032855_486980_1728A8ED 
X-CRM114-Status: GOOD (  34.11  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-28 at 16:18 +0800, Hsin-Yi Wang wrote:
> On Thu, Jan 28, 2021 at 4:10 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > On Thu, 2021-01-28 at 16:07 +0800, CK Hu wrote:
> > > On Thu, 2021-01-28 at 15:59 +0800, Yongqiang Niu wrote:
> > > > On Thu, 2021-01-28 at 15:42 +0800, CK Hu wrote:
> > > > > Hi, Hsin-Yi:
> > > > >
> > > > > On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> > > > > > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > >
> > > > > > for 5 or 6 bpc panel, we need enable dither function
> > > > > > to improve the display quality
> > > > > >
> > > > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
> > > > > >  1 file changed, 43 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > index 8173f709272be..e85625704d611 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > @@ -53,7 +53,9 @@
> > > > > >  #define DITHER_EN                              BIT(0)
> > > > > >  #define DISP_DITHER_CFG                                0x0020
> > > > > >  #define DITHER_RELAY_MODE                      BIT(0)
> > > > > > +#define DITHER_ENGINE_EN                       BIT(1)
> > > > > >  #define DISP_DITHER_SIZE                       0x0030
> > > > > > +#define DITHER_REG(idx)                                (0x100 + (idx) * 4)
> > > > > >
> > > > > >  #define LUT_10BIT_MASK                         0x03ff
> > > > > >
> > > > > > @@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> > > > > >  {
> > > > > >         struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > > > >
> > > > > > +       bool enable = false;
> > > > > > +
> > > > > > +       /* default value for dither reg 5 to 14 */
> > > > > > +       const u32 dither_setting[] = {
> > > > > > +               0x00000000, /* 5 */
> > > > > > +               0x00003002, /* 6 */
> > > > > > +               0x00000000, /* 7 */
> > > > > > +               0x00000000, /* 8 */
> > > > > > +               0x00000000, /* 9 */
> > > > > > +               0x00000000, /* 10 */
> > > > > > +               0x00000000, /* 11 */
> > > > > > +               0x00000011, /* 12 */
> > > > > > +               0x00000000, /* 13 */
> > > > > > +               0x00000000, /* 14 */
> > > > >
> > > > > Could you explain what is this?
> > > >
> > > > this is dither 5 to dither 14 setting
> > > > this will be useless, we just need set dither 5 and dither 7 like
> > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_5);
> > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_7);
> > > > other value is same with hardware default value.
> > > >
> > > >
> > > > >
> > > > > > +       };
> > > > > > +
> > > > > > +       if (bpc == 5 || bpc == 6) {
> > > > > > +               enable = true;
> > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > +                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_NEW_BIT_MODE,
> > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > +                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > > > >
> > > > > This result in 0x50505050, but previous version is 0x50504040, so this
> > > > > version is correct and previous version is incorrect?
> > > >
> > > > the new version set r g b 3 channel same, seams more reasonable
> > > >
> > > >
> > >
> > > So all the setting of DISP_DITHER_5, DISP_DITHER_7, DISP_DITHER_15,
> > > DISP_DITHER_16 is identical to mtk_dither_set(), so call
> > > mtk_dither_set() instead of duplication here.
> > >
> >
> > dither enable set in mtk_dither_set is
> > mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, CFG);
> >
> > that is different 8183 and mt8192.
> > mt8173 dither enable in gamma is bit2
> > mt8183 and mt8192 dither engine enable is bit 1
> >
> >
> 
> We can still call mtk_dither_set() for bpc is 5 or 6 here, though it
> will be set to bit2,
> but later in mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN :
> DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG); it
> will be correct back to bit 1.
> 
> Is this reasonable?

Looks weird. Maybe pass some information into mtk_dither_set() to set
DISP_DITHERING correctly. 

I find one thing need to be fixed. CFG should be lower case.

Regards,
CK

> 
> > > Regards,
> > > CK
> > > > >
> > > > > Regards,
> > > > > CK
> > > > >
> > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> > > > > > +       }
> > > > > > +
> > > > > > +
> > > > > > +       if (enable) {
> > > > > > +               u32 idx;
> > > > > > +
> > > > > > +               for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> > > > > > +                       mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> > > > > > +                                     DITHER_REG(idx + 5));
> > > > > > +       }
> > > > > > +
> > > > > >         mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > > > > > -       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > > +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > >  }
> > > > > >
> > > > > >  static void mtk_dither_start(struct device *dev)
> > > > >
> > > > >
> > > >
> > > >
> > >
> > >
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
