Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B720C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:05:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F80206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 10:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p4OGffTJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NU0SiGyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F80206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBu5zgaeS3OfdqCGN/NiUHgbWrja6mDue+HgYjV9kC0=; b=p4OGffTJwmIwqQPjj+DwzEw+pz
	Ur4cxS1GmmsbO/jIKhGsWZdSwsn+fQwA4zsSJN2H9w8L1MivQLx6jqinv0CcO3Fv0E3lq/4Fla680
	XQXngDYVX4IuHbK1lZmqpAY6xYAvRGuEFt69zRkQgX3wOFfw4IkB6m1cdn035UAroFM97q+UdXTTG
	7VUHxvTmcN94LebxULr406dUH/4uWK62pMqu7tjIrA0sKLjvZTZTeRH/m79J1T9IjqA0Zs0SveZv6
	5uOIcR46HC1sYseqaSxXjGL9bZOkeY+opOZGHdZrIw+0qOMT5BVUf6VoCE+sJFbtDx3WPbvmNnAc1
	NL/PNFpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyY6O-0003Ul-2q; Thu, 23 Jul 2020 10:05:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyY6L-0003Tj-5v; Thu, 23 Jul 2020 10:05:22 +0000
X-UUID: 331f03fb8af047459ebbb11a1086919a-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=nIqgvQpS3VAhbyseetbTsl4br2KGKeKt/w/IWi2RGrk=; 
 b=NU0SiGyAI4hlwm4enjiBB2qWC+KyXn1ijbG1UoqaD/M422CwQx/2VjE18vRsEKaXnKTgXnLWdLpSW3lZ1ihiWV1fm8nQT+kWpi+f220b6zszD9ph/VTKW28qmHft1Br2wdc6F8Dl7MDW8SMO0vbhs+g7wZFqs9bzS1nO3r7JLkM=;
X-UUID: 331f03fb8af047459ebbb11a1086919a-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1643676963; Thu, 23 Jul 2020 02:05:14 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 03:05:13 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Jul 2020 18:05:11 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 18:05:12 +0800
Message-ID: <1595498644.13250.2.camel@mhfsdcap03>
Subject: Re: [v7, PATCH 1/7] drm/mediatek: move ddp component defint into
 mtk_mmsys.h
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 23 Jul 2020 18:04:04 +0800
In-Reply-To: <CAFqH_50=MkBLHJ23hJo--RG=4560ttOUOjHuEwpevghFZ59xQQ@mail.gmail.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAFqH_50=MkBLHJ23hJo--RG=4560ttOUOjHuEwpevghFZ59xQQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_060521_372356_7AEC181A 
X-CRM114-Status: GOOD (  19.20  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-23 at 11:34 +0200, Enric Balletbo Serra wrote:
> Hi Yongqian Niu,
> 
> Thank you for your patch
> 
> Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 23
> de jul. 2020 a les 4:05:
> >
> > move ddp component defint into mtk_mmsys.h
> >
> 
> There is a typo, should be "defines". But why you should move these
> defines to mtk-mmsys?
> 

ck do not like this :
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"

after remove this, we need move the ddp component define

type error will fixed in next version.


> 
> 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 34 +----------------------------
> >  drivers/soc/mediatek/mtk-mmsys.c            |  4 +---
> >  include/linux/soc/mediatek/mtk-mmsys.h      | 33 ++++++++++++++++++++++++++++
> >  3 files changed, 35 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index debe363..161201f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -7,6 +7,7 @@
> >  #define MTK_DRM_DDP_COMP_H
> >
> >  #include <linux/io.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> >
> >  struct device;
> >  struct device_node;
> > @@ -35,39 +36,6 @@ enum mtk_ddp_comp_type {
> >         MTK_DDP_COMP_TYPE_MAX,
> >  };
> >
> > -enum mtk_ddp_comp_id {
> > -       DDP_COMPONENT_AAL0,
> > -       DDP_COMPONENT_AAL1,
> > -       DDP_COMPONENT_BLS,
> > -       DDP_COMPONENT_CCORR,
> > -       DDP_COMPONENT_COLOR0,
> > -       DDP_COMPONENT_COLOR1,
> > -       DDP_COMPONENT_DITHER,
> > -       DDP_COMPONENT_DPI0,
> > -       DDP_COMPONENT_DPI1,
> > -       DDP_COMPONENT_DSI0,
> > -       DDP_COMPONENT_DSI1,
> > -       DDP_COMPONENT_DSI2,
> > -       DDP_COMPONENT_DSI3,
> > -       DDP_COMPONENT_GAMMA,
> > -       DDP_COMPONENT_OD0,
> > -       DDP_COMPONENT_OD1,
> > -       DDP_COMPONENT_OVL0,
> > -       DDP_COMPONENT_OVL_2L0,
> > -       DDP_COMPONENT_OVL_2L1,
> > -       DDP_COMPONENT_OVL1,
> > -       DDP_COMPONENT_PWM0,
> > -       DDP_COMPONENT_PWM1,
> > -       DDP_COMPONENT_PWM2,
> > -       DDP_COMPONENT_RDMA0,
> > -       DDP_COMPONENT_RDMA1,
> > -       DDP_COMPONENT_RDMA2,
> > -       DDP_COMPONENT_UFOE,
> > -       DDP_COMPONENT_WDMA0,
> > -       DDP_COMPONENT_WDMA1,
> > -       DDP_COMPONENT_ID_MAX,
> > -};
> > -
> >  struct mtk_ddp_comp;
> >  struct cmdq_pkt;
> >  struct mtk_ddp_comp_funcs {
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > index a55f255..36ad66b 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -5,13 +5,11 @@
> >   */
> >
> >  #include <linux/device.h>
> > +#include <linux/io.h>
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/soc/mediatek/mtk-mmsys.h>
> >
> > -#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
> > -#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
> > -
> >  #define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> >  #define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> >  #define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 7bab5d9..2228bf6 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -9,6 +9,39 @@
> >  enum mtk_ddp_comp_id;
> >  struct device;
> >
> > +enum mtk_ddp_comp_id {
> > +       DDP_COMPONENT_AAL0,
> > +       DDP_COMPONENT_AAL1,
> > +       DDP_COMPONENT_BLS,
> > +       DDP_COMPONENT_CCORR,
> > +       DDP_COMPONENT_COLOR0,
> > +       DDP_COMPONENT_COLOR1,
> > +       DDP_COMPONENT_DITHER,
> > +       DDP_COMPONENT_DPI0,
> > +       DDP_COMPONENT_DPI1,
> > +       DDP_COMPONENT_DSI0,
> > +       DDP_COMPONENT_DSI1,
> > +       DDP_COMPONENT_DSI2,
> > +       DDP_COMPONENT_DSI3,
> > +       DDP_COMPONENT_GAMMA,
> > +       DDP_COMPONENT_OD0,
> > +       DDP_COMPONENT_OD1,
> > +       DDP_COMPONENT_OVL0,
> > +       DDP_COMPONENT_OVL_2L0,
> > +       DDP_COMPONENT_OVL_2L1,
> > +       DDP_COMPONENT_OVL1,
> > +       DDP_COMPONENT_PWM0,
> > +       DDP_COMPONENT_PWM1,
> > +       DDP_COMPONENT_PWM2,
> > +       DDP_COMPONENT_RDMA0,
> > +       DDP_COMPONENT_RDMA1,
> > +       DDP_COMPONENT_RDMA2,
> > +       DDP_COMPONENT_UFOE,
> > +       DDP_COMPONENT_WDMA0,
> > +       DDP_COMPONENT_WDMA1,
> > +       DDP_COMPONENT_ID_MAX,
> > +};
> > +
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >                            enum mtk_ddp_comp_id cur,
> >                            enum mtk_ddp_comp_id next);
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
