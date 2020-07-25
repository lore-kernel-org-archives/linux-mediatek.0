Return-Path: <SRS0=Q1uE=BE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA678C433E5
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 03:29:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD65206C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 03:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="klgsPxxR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U5uHQE5A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD65206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWT4sV9yFuAT7LgJqvvjoB67m0CaL0NtfxoQ/jS15NY=; b=klgsPxxRpPrAd203qWRLXa+phA
	/YN/69+Q/HhiLM3wnritW8Z0Ph+E13VtxPOh8fDiv2cfsi3NVZnXm5FD8rezcEYGDEN5XHUyXiqDg
	2rwmKjHffKYIHD7JfdmZFPd/nUSEeSqmLBV2tFGpXbApcbMZb+AOpvXol8c5CxT4ZwCdFWLRIL7Di
	RtERHw+MXGFtyWUg3rytDHjvlpVJpBPyz8xb3RRPao6NYPj5z6SYBpougncc1Gn6+RfJx2bPyC5XG
	tqunE2DitivUndfHBee6NMp0pOPvT7DL0Ci6ds8rFS/DwG6htPmK0F3VXn8WkD0rHsDYUwyQVgR5+
	h/wi4FUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzAsE-0004W1-6n; Sat, 25 Jul 2020 03:29:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzAsA-0004V0-H1; Sat, 25 Jul 2020 03:29:20 +0000
X-UUID: 7f5b915909304930b9cf14c69b5d3bea-20200724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=M62PCOyTvhtsvOIF0JwWReBvgyNfve+xjwbD7BXUPIU=; 
 b=U5uHQE5AsojwRhRt40wGTdu5lRcywsidsuDoMIfoX6Ehu5Xz3kF7ffK936wJhfeRgkBCySiCew4bkd5pKVrTiVsuV18m6UDnJcIvzrw9TqY7lyY6e2+x/2HowX4PBJLTJvYFg6V2yeRclVH/pXaQQol/3wOw2KcqVpUvDzqDyYQ=;
X-UUID: 7f5b915909304930b9cf14c69b5d3bea-20200724
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1965932313; Fri, 24 Jul 2020 19:29:09 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 20:29:08 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 25 Jul 2020 11:29:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 25 Jul 2020 11:29:05 +0800
Message-ID: <1595647675.13250.18.camel@mhfsdcap03>
Subject: Re: [v7, PATCH 2/7] mtk-mmsys: add mmsys private data
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Sat, 25 Jul 2020 11:27:55 +0800
In-Reply-To: <CAFqH_51sKR-tUHhdJs4N5KaGq-4+oFsAOhZsJqpFk0ikZjJ=mg@mail.gmail.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-3-git-send-email-yongqiang.niu@mediatek.com>
 <CAFqH_51sKR-tUHhdJs4N5KaGq-4+oFsAOhZsJqpFk0ikZjJ=mg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_232918_890607_B12F38C4 
X-CRM114-Status: GOOD (  25.10  )
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
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-23 at 11:32 +0200, Enric Balletbo Serra wrote:
> Hi Yongqiang Niu,
> 
> Thank you for your patch.
> 
> Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 23
> de jul. 2020 a les 4:05:
> >
> > add mmsys private data
> >
> 
> I think this change requires a better explanation of what you are
> doing. Although I'm really uncomfortable with this change, why you
> need to create a new mt2701-mmsys file?

reason:
1.there will more and more Mediatek Soc upstream, and the display path
connection function mtk_mmsys_ddp_mout_en, mtk_mmsys_ddp_sel_in and
mtk_mmsys_ddp_sout_sel will complicated more and more, 
2. many of the connection are only used in some SoC, and useless for
other SoC and not readable,
3. if we add a new SoC connection, we need check is this affect other
Soc,
> 
> > Feature: drm/mediatek
> 
> Remove this.
next version will remove this
> 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/Makefile             |   1 +
> >  drivers/soc/mediatek/mmsys/Makefile       |   2 +
> >  drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 250 +++++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c          | 271 +++++-------------------------
> >  include/linux/soc/mediatek/mtk-mmsys.h    |  15 ++
> >  5 files changed, 314 insertions(+), 225 deletions(-)
> >  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
> >  create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> >
> > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > index 2afa7b9..b37ac2c 100644
> > --- a/drivers/soc/mediatek/Makefile
> > +++ b/drivers/soc/mediatek/Makefile
> > @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> >  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> >  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> >  obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> > diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> > new file mode 100644
> > index 0000000..33b0dab
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mmsys/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-y += mt2701-mmsys.o
> > diff --git a/drivers/soc/mediatek/mmsys/mt2701-mmsys.c b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> > new file mode 100644
> > index 0000000..b8e53b0
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> > @@ -0,0 +1,250 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2020 MediaTek Inc.
> > +
> > +#include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> > +
> > +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> > +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> > +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> > +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> > +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> > +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> > +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> > +#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> > +#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> > +#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> > +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> > +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> > +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> > +#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> > +
> > +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> > +#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> > +#define DISP_REG_CONFIG_DSI_SEL                        0x050
> > +#define DISP_REG_CONFIG_DPI_SEL                        0x064
> > +
> > +#define OVL0_MOUT_EN_COLOR0                    0x1
> > +#define OD_MOUT_EN_RDMA0                       0x1
> > +#define OD1_MOUT_EN_RDMA1                      BIT(16)
> > +#define UFOE_MOUT_EN_DSI0                      0x1
> > +#define COLOR0_SEL_IN_OVL0                     0x1
> > +#define OVL1_MOUT_EN_COLOR1                    0x1
> > +#define GAMMA_MOUT_EN_RDMA1                    0x1
> > +#define RDMA0_SOUT_DPI0                                0x2
> > +#define RDMA0_SOUT_DPI1                                0x3
> > +#define RDMA0_SOUT_DSI1                                0x1
> > +#define RDMA0_SOUT_DSI2                                0x4
> > +#define RDMA0_SOUT_DSI3                                0x5
> > +#define RDMA1_SOUT_DPI0                                0x2
> > +#define RDMA1_SOUT_DPI1                                0x3
> > +#define RDMA1_SOUT_DSI1                                0x1
> > +#define RDMA1_SOUT_DSI2                                0x4
> > +#define RDMA1_SOUT_DSI3                                0x5
> > +#define RDMA2_SOUT_DPI0                                0x2
> > +#define RDMA2_SOUT_DPI1                                0x3
> > +#define RDMA2_SOUT_DSI1                                0x1
> > +#define RDMA2_SOUT_DSI2                                0x4
> > +#define RDMA2_SOUT_DSI3                                0x5
> > +#define DPI0_SEL_IN_RDMA1                      0x1
> > +#define DPI0_SEL_IN_RDMA2                      0x3
> > +#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> > +#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> > +#define DSI0_SEL_IN_RDMA1                      0x1
> > +#define DSI0_SEL_IN_RDMA2                      0x4
> > +#define DSI1_SEL_IN_RDMA1                      0x1
> > +#define DSI1_SEL_IN_RDMA2                      0x4
> > +#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> > +#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> > +#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> > +#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> > +#define COLOR1_SEL_IN_OVL1                     0x1
> > +
> > +#define OVL_MOUT_EN_RDMA                       0x1
> > +#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> > +#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> > +#define DSI_SEL_IN_BLS                         0x0
> > +#define DPI_SEL_IN_BLS                         0x0
> > +#define DSI_SEL_IN_RDMA                                0x1
> > +
> > +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > +                                         enum mtk_ddp_comp_id next,
> > +                                         unsigned int *addr)
> > +{
> 
> Can't be reused this function for all devices? You did in the previous
> series, why not now?

can not reused, that why need add mmsys private data like before
version.
but that still not a good idea.

the next path like this will be more readable, and more easy to maintain
https://patchwork.kernel.org/patch/11679539/

> 
> > +       unsigned int value;
> > +
> > +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > +               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> > +               value = OVL0_MOUT_EN_COLOR0;
> > +       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> > +               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> > +               value = OVL_MOUT_EN_RDMA;
> > +       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> > +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +               value = OD_MOUT_EN_RDMA0;
> > +       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> > +               value = UFOE_MOUT_EN_DSI0;
> > +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > +               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> > +               value = OVL1_MOUT_EN_COLOR1;
> > +       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> > +               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> > +               value = GAMMA_MOUT_EN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> > +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +               value = OD1_MOUT_EN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DPI0;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DPI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DSI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DSI2;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DSI3;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DSI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DSI2;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DSI3;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DPI0;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DPI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DPI0;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DPI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DSI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DSI2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DSI3;
> > +       } else {
> > +               value = 0;
> > +       }
> > +
> > +       return value;
> > +}
> > +
> > +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > +                                        enum mtk_ddp_comp_id next,
> > +                                        unsigned int *addr)
> 
> Same question for this function
> 
> 
> > +{
> > +       unsigned int value;
> > +
> > +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > +               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> > +               value = COLOR0_SEL_IN_OVL0;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI0_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI1_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI0_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +               value = DSI1_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI2_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +               value = DSI3_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI0_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI1_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI0_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +               value = DSI1_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI2_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI3_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > +               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> > +               value = COLOR1_SEL_IN_OVL1;
> > +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DSI_SEL;
> > +               value = DSI_SEL_IN_BLS;
> > +       } else {
> > +               value = 0;
> > +       }
> > +
> > +       return value;
> > +}
> > +
> > +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> > +                                  enum mtk_ddp_comp_id cur,
> > +                                  enum mtk_ddp_comp_id next)
> > +{
> > +       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > +               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> > +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > +               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> > +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > +               writel_relaxed(DSI_SEL_IN_RDMA,
> > +                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> > +               writel_relaxed(DPI_SEL_IN_BLS,
> > +                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> > +       }
> > +}
> > +
> > +static struct mtk_mmsys_conn_funcs mmsys_funcs = {
> > +       .mout_en = mtk_mmsys_ddp_mout_en,
> > +       .sel_in = mtk_mmsys_ddp_sel_in,
> > +       .sout_sel = mtk_mmsys_ddp_sout_sel,
> > +};
> > +
> > +static int mmsys_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +
> > +       mtk_mmsys_register_conn_funcs(dev->parent, &mmsys_funcs);
> > +
> > +       return 0;
> > +}
> > +
> > +static struct platform_driver mmsys_drv = {
> > +       .probe = mmsys_probe,
> > +       .driver = {
> > +               .name = "mt2701-mmsys",
> > +       },
> > +};
> > +
> > +builtin_platform_driver(mmsys_drv);
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > index 36ad66b..605b992 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -10,267 +10,63 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/soc/mediatek/mtk-mmsys.h>
> >
> > -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> > -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> > -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> > -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> > -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> > -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> > -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> > -#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> > -#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> > -#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> > -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> > -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> > -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> > -#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> > -
> > -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> > -#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> > -#define DISP_REG_CONFIG_DSI_SEL                        0x050
> > -#define DISP_REG_CONFIG_DPI_SEL                        0x064
> > -
> > -#define OVL0_MOUT_EN_COLOR0                    0x1
> > -#define OD_MOUT_EN_RDMA0                       0x1
> > -#define OD1_MOUT_EN_RDMA1                      BIT(16)
> > -#define UFOE_MOUT_EN_DSI0                      0x1
> > -#define COLOR0_SEL_IN_OVL0                     0x1
> > -#define OVL1_MOUT_EN_COLOR1                    0x1
> > -#define GAMMA_MOUT_EN_RDMA1                    0x1
> > -#define RDMA0_SOUT_DPI0                                0x2
> > -#define RDMA0_SOUT_DPI1                                0x3
> > -#define RDMA0_SOUT_DSI1                                0x1
> > -#define RDMA0_SOUT_DSI2                                0x4
> > -#define RDMA0_SOUT_DSI3                                0x5
> > -#define RDMA1_SOUT_DPI0                                0x2
> > -#define RDMA1_SOUT_DPI1                                0x3
> > -#define RDMA1_SOUT_DSI1                                0x1
> > -#define RDMA1_SOUT_DSI2                                0x4
> > -#define RDMA1_SOUT_DSI3                                0x5
> > -#define RDMA2_SOUT_DPI0                                0x2
> > -#define RDMA2_SOUT_DPI1                                0x3
> > -#define RDMA2_SOUT_DSI1                                0x1
> > -#define RDMA2_SOUT_DSI2                                0x4
> > -#define RDMA2_SOUT_DSI3                                0x5
> > -#define DPI0_SEL_IN_RDMA1                      0x1
> > -#define DPI0_SEL_IN_RDMA2                      0x3
> > -#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> > -#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> > -#define DSI0_SEL_IN_RDMA1                      0x1
> > -#define DSI0_SEL_IN_RDMA2                      0x4
> > -#define DSI1_SEL_IN_RDMA1                      0x1
> > -#define DSI1_SEL_IN_RDMA2                      0x4
> > -#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> > -#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> > -#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> > -#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> > -#define COLOR1_SEL_IN_OVL1                     0x1
> > -
> > -#define OVL_MOUT_EN_RDMA                       0x1
> > -#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> > -#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> > -#define DSI_SEL_IN_BLS                         0x0
> > -#define DPI_SEL_IN_BLS                         0x0
> > -#define DSI_SEL_IN_RDMA                                0x1
> > -
> >  struct mtk_mmsys_driver_data {
> >         const char *clk_driver;
> > +       const char *mmsys_driver;
> > +};
> > +
> 
> What about doing this
> 
> +struct mtk_mmsys_reg_data {
> + u32 ovl0_mout_en;
> +};
> 
> > +struct mtk_mmsys_private_data {
> > +       void __iomem *config_regs;
> > +       struct mtk_mmsys_conn_funcs *funcs;
> 
> And instead of point to the funcs add the registers data here.
> 
>             const struct mtk_mmsys_reg_data regs;
> 
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> >         .clk_driver = "clk-mt2701-mm",
> > +       .mmsys_driver = "mt2701-mmsys",
> 
> And here
> +          .regs = {
> +                   .ovl0_mout_en = DISP_REG_CONFIG_DISP_OVL_MOUT_EN,
> +         },
> 
> AFAICS these registers are only used here, so you can get them per SoC
> and configure properly
> 
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
> >         .clk_driver = "clk-mt2712-mm",
> > +       .mmsys_driver = "mt2701-mmsys",
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
> >         .clk_driver = "clk-mt6779-mm",
> > +       .mmsys_driver = "mt2701-mmsys",
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
> >         .clk_driver = "clk-mt6797-mm",
> > +       .mmsys_driver = "mt2701-mmsys",
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> >         .clk_driver = "clk-mt8173-mm",
> > +       .mmsys_driver = "mt2701-mmsys",
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> >         .clk_driver = "clk-mt8183-mm",
> >  };
> >
> > -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > -                                         enum mtk_ddp_comp_id next,
> > -                                         unsigned int *addr)
> > -{
> 
> And you can do here:
> 
> + const struct mtk_mmsys_driver_data *data;
> +
> + data = of_device_get_match_data(dev);
> 
> And then use data->regs.ovl0_mout_en where you need it.
> 
> 
> > -       unsigned int value;
> > -
> > -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> > -               value = OVL0_MOUT_EN_COLOR0;
> > -       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> > -               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> > -               value = OVL_MOUT_EN_RDMA;
> 
> +  value = data->regs.ovl0_mout_en
> 
> And do the same for all the different registers per SoC
> 
> > -       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> > -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > -               value = OD_MOUT_EN_RDMA0;
> > -       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> > -               value = UFOE_MOUT_EN_DSI0;
> > -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> > -               value = OVL1_MOUT_EN_COLOR1;
> > -       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> > -               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> > -               value = GAMMA_MOUT_EN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> > -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > -               value = OD1_MOUT_EN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DPI0;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DPI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DSI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DSI2;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DSI3;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DSI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DSI2;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DSI3;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DPI0;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DPI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DPI0;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DPI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DSI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DSI2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DSI3;
> > -       } else {
> > -               value = 0;
> > -       }
> > -
> > -       return value;
> > -}
> > -
> > -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > -                                        enum mtk_ddp_comp_id next,
> > -                                        unsigned int *addr)
> > -{
> > -       unsigned int value;
> > -
> > -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> > -               value = COLOR0_SEL_IN_OVL0;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI0_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI1_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI0_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > -               value = DSI1_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI2_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > -               value = DSI3_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI0_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI1_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI0_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > -               value = DSI1_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI2_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI3_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> > -               value = COLOR1_SEL_IN_OVL1;
> > -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DSI_SEL;
> > -               value = DSI_SEL_IN_BLS;
> > -       } else {
> > -               value = 0;
> > -       }
> > -
> > -       return value;
> > -}
> > -
> > -static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> > -                                  enum mtk_ddp_comp_id cur,
> > -                                  enum mtk_ddp_comp_id next)
> > -{
> > -       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > -               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> > -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > -               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> > -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > -               writel_relaxed(DSI_SEL_IN_RDMA,
> > -                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> > -               writel_relaxed(DPI_SEL_IN_BLS,
> > -                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> > -       }
> > -}
> > -
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >                            enum mtk_ddp_comp_id cur,
> >                            enum mtk_ddp_comp_id next)
> >  {
> > -       void __iomem *config_regs = dev_get_drvdata(dev);
> > +       struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
> > +       void __iomem *config_regs = private->config_regs;
> > +       struct mtk_mmsys_conn_funcs *priv_funcs = private->funcs;
> >         unsigned int addr, value, reg;
> >
> > -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > +       value = priv_funcs->mout_en(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(config_regs + addr) | value;
> >                 writel_relaxed(reg, config_regs + addr);
> >         }
> >
> > -       mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
> > +       priv_funcs->sout_sel(config_regs, cur, next);
> >
> > -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > +       value = priv_funcs->sel_in(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(config_regs + addr) | value;
> >                 writel_relaxed(reg, config_regs + addr);
> > @@ -282,16 +78,18 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >                               enum mtk_ddp_comp_id cur,
> >                               enum mtk_ddp_comp_id next)
> >  {
> > -       void __iomem *config_regs = dev_get_drvdata(dev);
> > +       struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
> > +       void __iomem *config_regs = private->config_regs;
> > +       struct mtk_mmsys_conn_funcs *priv_funcs = private->funcs;
> >         unsigned int addr, value, reg;
> >
> > -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > +       value = priv_funcs->mout_en(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(config_regs + addr) & ~value;
> >                 writel_relaxed(reg, config_regs + addr);
> >         }
> >
> > -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > +       value = priv_funcs->sel_in(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(config_regs + addr) & ~value;
> >                 writel_relaxed(reg, config_regs + addr);
> > @@ -299,15 +97,29 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >
> > +void mtk_mmsys_register_conn_funcs(struct device *dev,
> > +                                  struct mtk_mmsys_conn_funcs *funcs)
> > +{
> > +       struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
> > +
> > +       private->funcs = funcs;
> > +}
> > +
> >  static int mtk_mmsys_probe(struct platform_device *pdev)
> >  {
> >         const struct mtk_mmsys_driver_data *data;
> >         struct device *dev = &pdev->dev;
> >         struct platform_device *clks;
> >         struct platform_device *drm;
> > +       struct platform_device *mm;
> >         void __iomem *config_regs;
> >         struct resource *mem;
> >         int ret;
> > +       struct mtk_mmsys_private_data *private;
> > +
> > +       private = devm_kzalloc(dev, sizeof(*private), GFP_KERNEL);
> > +       if (!private)
> > +               return -ENOMEM;
> >
> >         mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         config_regs = devm_ioremap_resource(dev, mem);
> > @@ -317,8 +129,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
> >                         ret);
> >                 return ret;
> >         }
> > +       private->config_regs = config_regs;
> >
> > -       platform_set_drvdata(pdev, config_regs);
> > +       platform_set_drvdata(pdev, private);
> >
> >         data = of_device_get_match_data(&pdev->dev);
> >
> > @@ -327,6 +140,14 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
> >         if (IS_ERR(clks))
> >                 return PTR_ERR(clks);
> >
> > +       mm = platform_device_register_data(&pdev->dev,
> > +                                          data->mmsys_driver,
> > +                                          PLATFORM_DEVID_AUTO,
> > +                                          NULL,
> > +                                          0);
> > +       if (IS_ERR(mm))
> > +               return PTR_ERR(mm);
> > +
> >         drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
> >                                             PLATFORM_DEVID_AUTO, NULL, 0);
> >         if (IS_ERR(drm)) {
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 2228bf6..89185c6 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -42,6 +42,21 @@ enum mtk_ddp_comp_id {
> >         DDP_COMPONENT_ID_MAX,
> >  };
> >
> > +struct mtk_mmsys_conn_funcs {
> > +       u32 (*mout_en)(enum mtk_ddp_comp_id cur,
> > +                      enum mtk_ddp_comp_id next,
> > +                      unsigned int *addr);
> > +       u32 (*sel_in)(enum mtk_ddp_comp_id cur,
> > +                     enum mtk_ddp_comp_id next,
> > +                     unsigned int *addr);
> > +       void (*sout_sel)(void __iomem *config_regs,
> > +                        enum mtk_ddp_comp_id cur,
> > +                        enum mtk_ddp_comp_id next);
> > +};
> > +
> > +void mtk_mmsys_register_conn_funcs(struct device *dev,
> > +                                  struct mtk_mmsys_conn_funcs *funcs);
> > +
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >                            enum mtk_ddp_comp_id cur,
> >                            enum mtk_ddp_comp_id next);
> > --
> > 1.8.1.1.dirty
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
