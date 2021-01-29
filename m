Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD373C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:45:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8876A64DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8876A64DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvJUpPVy7RoJgZSiy7AH8nSATLnTjRrJQ+pbK/wzkkw=; b=MAAfElhGLDrUqWKhnGq09OwKt7
	J26wiIhFU/K2r2Zjqki1REtpdwnRvIOpRWM88VEpHTwkb15LIEn2pqUHBDKSfRLyrn0LFcpVawVzY
	jN88miCMbjwkf8TyBio/UM/9JkC97Y8oeZTOEZnubMbrmcW4Myj1x+SUoCzFPCJTM2GO8TyCy6EZg
	87SLkqvX3BrvSnxKF6+KzCXMaVkfWdLS1MTFYVXDJictrhX8q1Oc6g3zWQ0zkx8XxzoltWTdZRmfx
	0y2US02hJRwlmH4V+R8setiSKtjNa30Metk/q2cYGcsePjesLzuPoHtuBK/wunliPgTPWpS+cMhRf
	NXdOO8eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OT3-00069y-Oz; Fri, 29 Jan 2021 07:45:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OT0-00068m-LM; Fri, 29 Jan 2021 07:45:20 +0000
X-UUID: 73ddb4d92fc6475c82d6455364720711-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=r2EgZakFk2zVv4JxdHuJL0gzurAODYWI+bsdmfCnS4k=; 
 b=EE574tJw0UjHDfz8TOAMVXEPXmmHUw0yzBU2OjVizLoUE/GLpcnDVscKO5/JuLNk2uGyYK2BOGzOC2Qbj+2eh2l1VKtzGy3oxiH+nXIPoo2Az0kbteq9aJb9CB1IfjhovM0ugeadqjmsfR4WTmiWDasXuYBuPbLL99jlU2o6rDs=;
X-UUID: 73ddb4d92fc6475c82d6455364720711-20210128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1161260018; Thu, 28 Jan 2021 23:45:14 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 23:42:07 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 29 Jan 2021 15:42:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 15:42:04 +0800
Message-ID: <1611906124.1947.22.camel@mhfsdcap03>
Subject: Re: [PATCH v12 6/8] drm/mediatek: enable dither function
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 15:42:04 +0800
In-Reply-To: <CAJMQK-hLf6f0mofWMF6eEKtTRTmK4Pm-mkYjAAGzD80uTpZLug@mail.gmail.com>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-7-hsinyi@chromium.org>
 <1611883982.5226.12.camel@mtksdaap41>
 <CAJMQK-gKKjLJ5xOAKOx5BM5dL2MxgFq72FVCfGTfzK4ZXzRJfA@mail.gmail.com>
 <1611901808.1947.16.camel@mhfsdcap03>
 <CAJMQK-hLf6f0mofWMF6eEKtTRTmK4Pm-mkYjAAGzD80uTpZLug@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_024518_926328_EAD6732A 
X-CRM114-Status: GOOD (  34.35  )
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

On Fri, 2021-01-29 at 14:46 +0800, Hsin-Yi Wang wrote:
> On Fri, Jan 29, 2021 at 2:30 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > On Fri, 2021-01-29 at 14:24 +0800, Hsin-Yi Wang wrote:
> > > On Fri, Jan 29, 2021 at 9:33 AM CK Hu <ck.hu@mediatek.com> wrote:
> > > >
> > > > Hi, Hsin-Yi:
> > > >
> > > > On Thu, 2021-01-28 at 19:23 +0800, Hsin-Yi Wang wrote:
> > > > > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > >
> > > > > for 5 or 6 bpc panel, we need enable dither function
> > > > > to improve the display quality
> > > > >
> > > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++++--
> > > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > index ac2cb25620357..6c8f246380a74 100644
> > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > @@ -53,6 +53,7 @@
> > > > >  #define DITHER_EN                            BIT(0)
> > > > >  #define DISP_DITHER_CFG                              0x0020
> > > > >  #define DITHER_RELAY_MODE                    BIT(0)
> > > > > +#define DITHER_ENGINE_EN                     BIT(1)
> > > > >  #define DISP_DITHER_SIZE                     0x0030
> > > > >
> > > > >  #define LUT_10BIT_MASK                               0x03ff
> > > > > @@ -314,9 +315,19 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> > > > >                             unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > > > >  {
> > > > >       struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > > > +     bool enable = (bpc == 5 || bpc == 6);
> > > >
> > > > I strongly believe that dither function in dither is identical to the
> > > > one in gamma and od, and in mtk_dither_set_common(), 'bpc >=
> > > > MTK_MIN_BPC' is valid, so I believe we need not to limit bpc to 5 or 6.
> > > > But we should consider the case that bpc is invalid in
> > > > mtk_dither_set_common(). Invalid case in gamma and od use different way
> > > > to process. For gamma, dither is default relay mode, so invalid bpc
> > > > would do nothing in mtk_dither_set_common() and result in relay mode.
> > > > For od, it set to relay mode first, them invalid bpc would do nothing in
> > > > mtk_dither_set_common() and result in relay mode. I would like dither,
> > > > gamma and od to process invalid bpc in the same way. One solution is to
> > > > set relay mode in mtk_dither_set_common() for invalid bpc.
> > > >
> > > > Regards,
> > > > CK
> > > >
> > >
> > > I modify the mtk_dither_config() to follow:
> > >
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > index ac2cb25620357..5b7fcedb9f9a8 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > @@ -53,6 +53,7 @@
> > >  #define DITHER_EN                              BIT(0)
> > >  #define DISP_DITHER_CFG                                0x0020
> > >  #define DITHER_RELAY_MODE                      BIT(0)
> > > +#define DITHER_ENGINE_EN                       BIT(1)
> > >  #define DISP_DITHER_SIZE                       0x0030
> > >
> > >  #define LUT_10BIT_MASK                         0x03ff
> > > @@ -166,6 +167,8 @@ void mtk_dither_set_common(void __iomem *regs,
> > > struct cmdq_client_reg *cmdq_reg,
> > >                               DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > >                               cmdq_reg, regs, DISP_DITHER_16);
> > >                 mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
> > > +       } else {
> > > +               mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, cmdq_reg, regs, cfg);
> > >         }
> > >  }
> > >
> > > @@ -315,8 +318,12 @@ static void mtk_dither_config(struct device *dev,
> > > unsigned int w,
> > >  {
> > >         struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > >
> > > -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg,
> > > priv->regs, DISP_DITHER_SIZE);
> > > -       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
> > > priv->regs, DISP_DITHER_CFG);
> > > +       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> > > +                     DISP_DITHER_SIZE);
> > > +       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
> > > +                     DISP_DITHER_CFG);
> > > +       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
> > > +                              DITHER_ENGINE_EN, cmdq_pkt);
> > >  }
> > >
> > > So now, not only bpc==5 or 6, but all valid bpc, dither config will
> > > call mtk_dither_set_common() with the flag DITHER_ENGINE_EN(BIT(1)).
> > > od config will call mtk_dither_set_common() with the flag
> > > DISP_DITHERING(BIT(2)).
> > > Additionally for 8173, gamma config will call mtk_dither_set_common()
> > > with the flag DISP_DITHERING (BIT(2))
> > >
> > > For invalid mode all of them will be DITHER_RELAY_MODE.
> > >
> > > Just to make sure that this follows the spec? thanks
> > >
> >
> > for mt8173 gamma, there is no relay mode, only dither enable or not(bit
> > 2).
> > for mt8183 dither, there is dither enable bit 1, and relay mode bit 0
> >
> CK suggested to set relay mode for invalid cases. Or should I just set
> invalid case in mtk_dither_config()? So that invalid case for gamma
> and od would remain its default mode?
> 
od and gamma has no relay mode
set relay mode in  mtk_dither_config is better


> Besides that, the major difference of this patch and original version
> is that not only bpc ==5 or 6 will set dither enable bit 1. Does this
> looks good to you?

dither only support  bpc 4 6 8 , there is no bpc 5 use case,
please modify this error.

and drm only has these bpc
switch (edid->input & DRM_EDID_DIGITAL_DEPTH_MASK) {
	case DRM_EDID_DIGITAL_DEPTH_6:
		info->bpc = 6;
		break;
	case DRM_EDID_DIGITAL_DEPTH_8:
		info->bpc = 8;
		break;
	case DRM_EDID_DIGITAL_DEPTH_10:
		info->bpc = 10;
		break;
	case DRM_EDID_DIGITAL_DEPTH_12:
		info->bpc = 12;
		break;
	case DRM_EDID_DIGITAL_DEPTH_14:
		info->bpc = 14;
		break;
	case DRM_EDID_DIGITAL_DEPTH_16:
		info->bpc = 16;
		break;
	case DRM_EDID_DIGITAL_DEPTH_UNDEF:
	default:
		info->bpc = 0;
		break;
	}

> >
> > > > >
> > > > > -     mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > > > > -     mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > +     if (enable) {
> > > > > +             mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
> > > > > +                                   DISP_DITHER_CFG, DITHER_ENGINE_EN,
> > > > > +                                   cmdq_pkt);
> > > > > +     } else {
> > > > > +             mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
> > > > > +                           priv->regs, DISP_DITHER_CFG);
> > > > > +     }
> > > > > +
> > > > > +     mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> > > > > +                   DISP_DITHER_SIZE);
> > > > >  }
> > > > >
> > > > >  static void mtk_dither_start(struct device *dev)
> > > >
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
