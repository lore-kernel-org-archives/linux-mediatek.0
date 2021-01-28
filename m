Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30023C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:29:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9702564DA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9702564DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j15VuJ41aXmUQffZQ/C7nVbWn7lrENvrgl1tldXyFyQ=; b=sWs29sv7G8v8yacumwSTEn5ynG
	3NXDKLIJfF6Kac2KOgnjCYRar52p1ovA7g5W6TM8isEahc9edjw8ayGB2ftapLF4Ub9fCqeKcb4Jz
	O5JKXbTZ4kvSW2BN8yEd+cf2kk3z8hW63vyRTiaPg9yr4Dc593Hn2Ilm4unwcrTgHOEyCwDlzeDTJ
	q9EBMy9+1agxMvYieJ+rcYwRXv39YbgvsCQTXSXyNUkZxQ4LiNAUbenX8Dg3PjcoDIsGO0siRi+vn
	NiQpoAvhPH3m3eL28z6k2vbdSfn2PCL3n88Oj45bC9DJNtjfj3e9AbRl8nONVlC2jBN4buX8QTHFX
	qYd1v+lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l52fe-0002RL-Fw; Thu, 28 Jan 2021 08:28:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l52fb-0002Qt-8P; Thu, 28 Jan 2021 08:28:52 +0000
X-UUID: 51deaffb798744b48055767b26ff29b9-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=xuMAXwo6AmkpKMd7GIWUbcpQOz0B7oib5M57arUVcdY=; 
 b=ODT4aWplJCcUN+8IAk/DRmMTo3FCEb8CmoBGmeHhorpfjRPMe5K8ClwTdqKTvtxDbtHhoVl023FebbqAb6lyTKKMFl6oTiXFQx9BbtE4oonwhwOvGgCKNJW8wfI7Fbof2DMmxncui0Gkcofa8gw4TSrroQBO6bPxdyt9+qOTAJ8=;
X-UUID: 51deaffb798744b48055767b26ff29b9-20210128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1534673603; Thu, 28 Jan 2021 00:28:46 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 00:28:44 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 Jan 2021 16:28:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 16:28:42 +0800
Message-ID: <1611822522.1947.12.camel@mhfsdcap03>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 16:28:42 +0800
In-Reply-To: <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
 <1611819766.16091.4.camel@mtksdaap41> <1611820770.1947.8.camel@mhfsdcap03>
 <1611821233.18369.4.camel@mtksdaap41> <1611821396.1947.10.camel@mhfsdcap03>
 <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_032851_592858_0849A470 
X-CRM114-Status: GOOD (  32.76  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 CK Hu <ck.hu@mediatek.com>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

the result is ok.
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
