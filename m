Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDB1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 11:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC27D60FE3
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 11:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC27D60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ypM4L3+6axHwBQI0b2YUTZgrUVsa0m9a2FTnff8OEA=; b=xVRUbpMBw1QZHT
	hcjrInXtvNS2kwtZRWX/R6sNf6289q10exQVPjBexdVHRvdUxkjmC05hicyQvxlvP/Y6X1VMQCZYY
	I2pjuM1WK8pIhSmTOQp0vTeE4F8fPaP1dhYy2ZEFyaqOq/ucDHF3j2mk4tRXerWxUZowbrJInLnw4
	ZlszoNhKMrjqJMWApD4rpLaGZ9IamQcLPq2HiZu8NrNhRbKqLMaFfbF1MG7h1jRbHnXagpJVhtqBB
	2OmxsK6MC4KQQtEkkMzTJALdZVf996adbGOnzNhCXnaOK+3o/4jrQcs/M6pfeJWhgi4Nw2z0GJHum
	VLmBdgktrCc7o+wclpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOeY1-00CapT-EH; Fri, 10 Sep 2021 11:18:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOeXx-00CaoW-TO; Fri, 10 Sep 2021 11:18:19 +0000
X-UUID: 5b1fb6e4c4f94084a8d232301e3e9dd4-20210910
X-UUID: 5b1fb6e4c4f94084a8d232301e3e9dd4-20210910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 776289653; Fri, 10 Sep 2021 04:18:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 04:09:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 19:09:45 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Sep 2021 19:09:45 +0800
Message-ID: <9845ce7c9c2236210d9f730a00eec7071572a0a4.camel@mediatek.com>
Subject: Re: [v2 19/24] clk: mediatek: Add MT8195 vencsys clock support
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>, Devicetree
 List <devicetree@vger.kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 10 Sep 2021 19:09:45 +0800
In-Reply-To: <CAGXv+5FuLTw9jmXEifkfKKYiN-vur3jBbwZWjL5m8vTkoP6VMA@mail.gmail.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-20-chun-jie.chen@mediatek.com>
 <CAGXv+5FuLTw9jmXEifkfKKYiN-vur3jBbwZWjL5m8vTkoP6VMA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_041818_015763_E206783E 
X-CRM114-Status: GOOD (  27.08  )
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

On Wed, 2021-08-25 at 19:03 +0800, Chen-Yu Tsai wrote:
> On Fri, Aug 20, 2021 at 7:31 PM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> > 
> > Add MT8195 vencsys clock controller which provide clock gate
> > control for video encoder.
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Makefile          |  2 +-
> >  drivers/clk/mediatek/clk-mt8195-venc.c | 69
> > ++++++++++++++++++++++++++
> >  2 files changed, 70 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c
> > 
> > diff --git a/drivers/clk/mediatek/Makefile
> > b/drivers/clk/mediatek/Makefile
> > index 3c8c8cdbd3ef..82ffcc4f2c52 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -82,6 +82,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-
> > mt8192-vdec.o
> >  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> >  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-
> > mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-
> > mt8195-cam.o \
> >                                         clk-mt8195-ccu.o clk-
> > mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-
> > scp_adsp.o \
> > -                                       clk-mt8195-vdec.o clk-
> > mt8195-vdo0.o clk-mt8195-vdo1.o
> > +                                       clk-mt8195-vdec.o clk-
> > mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o
> >  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
> >  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> > diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c
> > b/drivers/clk/mediatek/clk-mt8195-venc.c
> > new file mode 100644
> > index 000000000000..10702a4ad5ff
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8195-venc.c
> > @@ -0,0 +1,69 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +//
> > +// Copyright (c) 2021 MediaTek Inc.
> > +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +#include "clk-gate.h"
> > +#include "clk-mtk.h"
> > +
> > +#include <dt-bindings/clock/mt8195-clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/platform_device.h>
> > +
> > +static const struct mtk_gate_regs venc_cg_regs = {
> > +       .set_ofs = 0x4,
> > +       .clr_ofs = 0x8,
> > +       .sta_ofs = 0x0,
> > +};
> > +
> > +#define GATE_VENC(_id, _name, _parent, _shift)                 \
> > +       GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift,
> > &mtk_clk_gate_ops_setclr_inv)
> > +
> > +static const struct mtk_gate venc_clks[] = {
> > +       GATE_VENC(CLK_VENC_LARB, "venc_larb", "top_venc", 0),
> > +       GATE_VENC(CLK_VENC_VENC, "venc_venc", "top_venc", 4),
> > +       GATE_VENC(CLK_VENC_JPGENC, "venc_jpgenc", "top_venc", 8),
> > +       GATE_VENC(CLK_VENC_JPGDEC, "venc_jpgdec", "top_venc", 12),
> > +       GATE_VENC(CLK_VENC_JPGDEC_C1, "venc_jpgdec_c1", "top_venc",
> > 16),
> > +       GATE_VENC(CLK_VENC_GALS, "venc_gals", "top_venc", 28),
> > +};
> > +
> > +static const struct mtk_gate venc_core1_clks[] = {
> > +       GATE_VENC(CLK_VENC_CORE1_LARB, "venc_core1_larb",
> > "top_venc", 0),
> > +       GATE_VENC(CLK_VENC_CORE1_VENC, "venc_core1_venc",
> > "top_venc", 4),
> > +       GATE_VENC(CLK_VENC_CORE1_JPGENC, "venc_core1_jpgenc",
> > "top_venc", 8),
> > +       GATE_VENC(CLK_VENC_CORE1_JPGDEC, "venc_core1_jpgdec",
> > "top_venc", 12),
> > +       GATE_VENC(CLK_VENC_CORE1_JPGDEC_C1, "venc_core1_jpgdec_c1",
> > "top_venc", 16),
> > +       GATE_VENC(CLK_VENC_CORE1_GALS, "venc_core1_gals",
> > "top_venc", 28),
> 
> The two hardware blocks look the same. Are there any actual
> differences?

These two hardware blocks are same, like venc core0 and core1.
Based on performance requirement we can choose to run one core or two
cores.

Thanks!
Best Regards,
Chun-Jie

> I am somewhat skeptical about using different compatible strings just
> to provide different clock names. This is normally handled with
> "clock-output-names" properties in the device tree.
> 
> ChenYu
> 
> > +};
> > +
> > +static const struct mtk_clk_desc venc_desc = {
> > +       .clks = venc_clks,
> > +       .num_clks = ARRAY_SIZE(venc_clks),
> > +};
> > +
> > +static const struct mtk_clk_desc venc_core1_desc = {
> > +       .clks = venc_core1_clks,
> > +       .num_clks = ARRAY_SIZE(venc_core1_clks),
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt8195_venc[] = {
> > +       {
> > +               .compatible = "mediatek,mt8195-vencsys",
> > +               .data = &venc_desc,
> > +       }, {
> > +               .compatible = "mediatek,mt8195-vencsys_core1",
> > +               .data = &venc_core1_desc,
> > +       }, {
> > +               /* sentinel */
> > +       }
> > +};
> > +
> > +static struct platform_driver clk_mt8195_venc_drv = {
> > +       .probe = mtk_clk_simple_probe,
> > +       .driver = {
> > +               .name = "clk-mt8195-venc",
> > +               .of_match_table = of_match_clk_mt8195_venc,
> > +       },
> > +};
> > +builtin_platform_driver(clk_mt8195_venc_drv);
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!y1_g6m5bndRYKNdAsx1SEqMln7Rc-AmZ63Tn_4fTkT24K04mXhjGMOYcO1ew0k99Y72C$
> >  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
