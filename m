Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EE2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AFAC61029
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AFAC61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CODa4nFM++LNBjIsY9EYMmWQID8GjQ9cOKD2AApazc=; b=nTtXmyB5Jlnrgy
	geJVlNAjNx85XVZPWLTYEnwN+uqd4gbnZ/9lVIVpJ9zTnTaxZy3UeI0tTw/OMSWBNKqCO87DdzHse
	UPkoyGWfxQXYjzltm69J8ehzCje2A75/N2o0o7imrxPJZkyz5qpBDIeyl10arILZe/KfCpesMoz3J
	q6YZbQy0BgjHIGZqV8PORPuv/1PmDDCH9RNxcLGfWhpQPucW0RTiHaMzDQeg9L1PjNoSHPAKgN2EO
	BZGc3jx03gLNr7PMdlAQ1bqr9NyJWqRjChVDSmcsqkDEJN8dofnDmAvk9sgKU5h6EtciyN90Esf9P
	leRyfyWQhxEGYttvomPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzQG-0044nj-Oq; Tue, 14 Sep 2021 03:47:52 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzPx-0044jD-3A
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 03:47:34 +0000
Received: by mail-lf1-x130.google.com with SMTP id a4so25689033lfg.8
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 20:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrBxgBJRIesKND2p4JWvyIyYZLW/EMVyaSJmvlgnc7M=;
 b=hFHoSCP4ZqBnTi0Je/dZuxWAYVe7ahmUT4ouDeZycYplQc6eWdFD6XLD4NVCulZFWn
 PLY1K05Cb/vRU8mBrnLE2p2aORqauAvngf2sAIg1fDDu3BfqXGZNvV5uv8/5tUzw/4YG
 qzqfs3OpWUH8fEA0rF8C67mzCR11vhF0u0qwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrBxgBJRIesKND2p4JWvyIyYZLW/EMVyaSJmvlgnc7M=;
 b=orBRZFLLxIRCyHJ9aIrEJiije/A/5hoYRFkOT5lwZnNgXz6u0YjQMyM3jmD3rVaK0H
 pQDJSQO8se72pN+7q8y+B1Qe1KLppCXzL8Sr2SmYu0Bu77mrSevxyvc+BNz2KtxyECSR
 IfmhjvW2WXL7B99g07FN5ki7c4WMhohSLrQNCka3fe6k98fehs/OoYFhYDojSP/3t88s
 XGg+yyQvxNtGOpIQYbJpb0WsC29JnNWiFLe6ldSZFzLa/pxTdlwkPgjdC9SMUN4V+Qbn
 2h/C6wqN8r6V9NehLZZ25okYeZXjKiRzhEGp5j6iG+zXl2FuejEM4Dav3BW5y7GVXeqW
 VU7A==
X-Gm-Message-State: AOAM530cAdspQ6ggNCvCW8TzyWxxLLwa1zBA8yFU1agfUqkeElmah8ZF
 1s8U/bbEymTDeVauvLYkKJqpc12oQBimcbuvFwUa5g==
X-Google-Smtp-Source: ABdhPJw482RoH9R6kRaipVn2e5KT3JCWphlUZk+qJMjpQ/6Io5WzkeCO15gJ697X6Umup8yBeDalVv6S5cdtlV2Q7OQ=
X-Received: by 2002:ac2:4204:: with SMTP id y4mr11315813lfh.501.1631591251353; 
 Mon, 13 Sep 2021 20:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-20-chun-jie.chen@mediatek.com>
 <CAGXv+5FuLTw9jmXEifkfKKYiN-vur3jBbwZWjL5m8vTkoP6VMA@mail.gmail.com>
 <9845ce7c9c2236210d9f730a00eec7071572a0a4.camel@mediatek.com>
In-Reply-To: <9845ce7c9c2236210d9f730a00eec7071572a0a4.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Sep 2021 11:47:20 +0800
Message-ID: <CAGXv+5Es7PjoBaKQ3u3zU3oxof3j8Lr=Xf2E0-WF51Mn8Y4TSg@mail.gmail.com>
Subject: Re: [v2 19/24] clk: mediatek: Add MT8195 vencsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_204733_166104_405C473F 
X-CRM114-Status: GOOD (  30.82  )
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

On Fri, Sep 10, 2021 at 7:09 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> On Wed, 2021-08-25 at 19:03 +0800, Chen-Yu Tsai wrote:
> > On Fri, Aug 20, 2021 at 7:31 PM Chun-Jie Chen
> > <chun-jie.chen@mediatek.com> wrote:
> > >
> > > Add MT8195 vencsys clock controller which provide clock gate
> > > control for video encoder.
> > >
> > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > ---
> > >  drivers/clk/mediatek/Makefile          |  2 +-
> > >  drivers/clk/mediatek/clk-mt8195-venc.c | 69
> > > ++++++++++++++++++++++++++
> > >  2 files changed, 70 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c
> > >
> > > diff --git a/drivers/clk/mediatek/Makefile
> > > b/drivers/clk/mediatek/Makefile
> > > index 3c8c8cdbd3ef..82ffcc4f2c52 100644
> > > --- a/drivers/clk/mediatek/Makefile
> > > +++ b/drivers/clk/mediatek/Makefile
> > > @@ -82,6 +82,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-
> > > mt8192-vdec.o
> > >  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> > >  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-
> > > mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-
> > > mt8195-cam.o \
> > >                                         clk-mt8195-ccu.o clk-
> > > mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-
> > > scp_adsp.o \
> > > -                                       clk-mt8195-vdec.o clk-
> > > mt8195-vdo0.o clk-mt8195-vdo1.o
> > > +                                       clk-mt8195-vdec.o clk-
> > > mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o
> > >  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
> > >  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> > > diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c
> > > b/drivers/clk/mediatek/clk-mt8195-venc.c
> > > new file mode 100644
> > > index 000000000000..10702a4ad5ff
> > > --- /dev/null
> > > +++ b/drivers/clk/mediatek/clk-mt8195-venc.c
> > > @@ -0,0 +1,69 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +//
> > > +// Copyright (c) 2021 MediaTek Inc.
> > > +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > +
> > > +#include "clk-gate.h"
> > > +#include "clk-mtk.h"
> > > +
> > > +#include <dt-bindings/clock/mt8195-clk.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +static const struct mtk_gate_regs venc_cg_regs = {
> > > +       .set_ofs = 0x4,
> > > +       .clr_ofs = 0x8,
> > > +       .sta_ofs = 0x0,
> > > +};
> > > +
> > > +#define GATE_VENC(_id, _name, _parent, _shift)                 \
> > > +       GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift,
> > > &mtk_clk_gate_ops_setclr_inv)
> > > +
> > > +static const struct mtk_gate venc_clks[] = {
> > > +       GATE_VENC(CLK_VENC_LARB, "venc_larb", "top_venc", 0),
> > > +       GATE_VENC(CLK_VENC_VENC, "venc_venc", "top_venc", 4),
> > > +       GATE_VENC(CLK_VENC_JPGENC, "venc_jpgenc", "top_venc", 8),
> > > +       GATE_VENC(CLK_VENC_JPGDEC, "venc_jpgdec", "top_venc", 12),
> > > +       GATE_VENC(CLK_VENC_JPGDEC_C1, "venc_jpgdec_c1", "top_venc",
> > > 16),
> > > +       GATE_VENC(CLK_VENC_GALS, "venc_gals", "top_venc", 28),
> > > +};
> > > +
> > > +static const struct mtk_gate venc_core1_clks[] = {
> > > +       GATE_VENC(CLK_VENC_CORE1_LARB, "venc_core1_larb",
> > > "top_venc", 0),
> > > +       GATE_VENC(CLK_VENC_CORE1_VENC, "venc_core1_venc",
> > > "top_venc", 4),
> > > +       GATE_VENC(CLK_VENC_CORE1_JPGENC, "venc_core1_jpgenc",
> > > "top_venc", 8),
> > > +       GATE_VENC(CLK_VENC_CORE1_JPGDEC, "venc_core1_jpgdec",
> > > "top_venc", 12),
> > > +       GATE_VENC(CLK_VENC_CORE1_JPGDEC_C1, "venc_core1_jpgdec_c1",
> > > "top_venc", 16),
> > > +       GATE_VENC(CLK_VENC_CORE1_GALS, "venc_core1_gals",
> > > "top_venc", 28),
> >
> > The two hardware blocks look the same. Are there any actual
> > differences?
>
> These two hardware blocks are same, like venc core0 and core1.
> Based on performance requirement we can choose to run one core or two
> cores.

What I meant was "are these two clock controllers the same"? If so
then we shouldn't be using compatible strings to distinguish them.

ChenYu

> Thanks!
> Best Regards,
> Chun-Jie
>
> > I am somewhat skeptical about using different compatible strings just
> > to provide different clock names. This is normally handled with
> > "clock-output-names" properties in the device tree.
> >
> > ChenYu
> >
> > > +};
> > > +
> > > +static const struct mtk_clk_desc venc_desc = {
> > > +       .clks = venc_clks,
> > > +       .num_clks = ARRAY_SIZE(venc_clks),
> > > +};
> > > +
> > > +static const struct mtk_clk_desc venc_core1_desc = {
> > > +       .clks = venc_core1_clks,
> > > +       .num_clks = ARRAY_SIZE(venc_core1_clks),
> > > +};
> > > +
> > > +static const struct of_device_id of_match_clk_mt8195_venc[] = {
> > > +       {
> > > +               .compatible = "mediatek,mt8195-vencsys",
> > > +               .data = &venc_desc,
> > > +       }, {
> > > +               .compatible = "mediatek,mt8195-vencsys_core1",
> > > +               .data = &venc_core1_desc,
> > > +       }, {
> > > +               /* sentinel */
> > > +       }
> > > +};
> > > +
> > > +static struct platform_driver clk_mt8195_venc_drv = {
> > > +       .probe = mtk_clk_simple_probe,
> > > +       .driver = {
> > > +               .name = "clk-mt8195-venc",
> > > +               .of_match_table = of_match_clk_mt8195_venc,
> > > +       },
> > > +};
> > > +builtin_platform_driver(clk_mt8195_venc_drv);
> > > --
> > > 2.18.0
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > >
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!y1_g6m5bndRYKNdAsx1SEqMln7Rc-AmZ63Tn_4fTkT24K04mXhjGMOYcO1ew0k99Y72C$
> > >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
