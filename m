Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C787C07E96
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 01:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08FF46101E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 01:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08FF46101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgtIQNky/ytOsl8fgB4FjUExVi/xIgEJQOLE8d+Rb2I=; b=k9Cp0iRRn5JZGx
	ojJ+ZLA7h+LBD6ZzoJhvXelM1Ll7mBnIsqX/0XFJjs2/w6D81sFKo5yvWI0UVGLgf78UBe57C0X2Y
	lM4r8OlDCS4J/acx5t1k3gBPunumniyJyXh3oVG6YcTzXXL2s/ve2M856knvhzZ3WWN6Ksul1l6wC
	qbKfpG3Qc+8u9sN6zWb3skWi96CI956AjRESiITaDgGaMS4UTEtPbL7q+64krV0XheqA6zFN2+dmM
	tWCZ3v6hdkDEHEgj6cQxpEBr9jRdM2sXvHk0FSps5tzgMW1P/xyewvsk5zHMrjum7uw+2Gy7+NWqF
	4YjwJZNLG1tQljtSXh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2kxh-005hRb-2t; Mon, 12 Jul 2021 01:42:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2kxd-005hR9-AD; Mon, 12 Jul 2021 01:42:19 +0000
X-UUID: 18bf1278c420405382fd98995e0156a7-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WbudQEvPpcxQZODZf8OScCdCXRP8v+l01ckWJMMbx5U=; 
 b=WWIq3XQt7owh4ztk8wCMP28S/KklSk1dW0uy2G63LiZLS3a0UMJyTEaiYGDJ5/ATWwpWfSVOfvFjHj42lcIIsncMMRTcCmwWr+IEfisRBNthD4XGMn7p9lrZq8FwpxHhYyK9gynOl54bXOoJ0JHae5hBatDW7cWOe62ZOag7csQ=;
X-UUID: 18bf1278c420405382fd98995e0156a7-20210711
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1210616422; Sun, 11 Jul 2021 18:42:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 18:34:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 09:34:27 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 09:34:22 +0800
Message-ID: <c92a5f98560393617b2cfffabecac953ef7f7828.camel@mediatek.com>
Subject: Re: [PATCH 14/22] clk: mediatek: Add MT8195 vdecsys clock support
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Jul 2021 09:34:21 +0800
In-Reply-To: <CAGXv+5GbyKpT9mTseCc2t94UWBCoPWtrXUfd_ZqXOewhP3QEZw@mail.gmail.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-15-chun-jie.chen@mediatek.com>
 <CAGXv+5GbyKpT9mTseCc2t94UWBCoPWtrXUfd_ZqXOewhP3QEZw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_184217_415250_A1EA1564 
X-CRM114-Status: GOOD (  29.92  )
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

On Fri, 2021-07-09 at 16:40 +0800, Chen-Yu Tsai wrote:
> On Thu, Jun 17, 2021 at 7:02 AM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> > 
> > Add MT8195 vdecsys clock providers
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig           |   6 ++
> >  drivers/clk/mediatek/Makefile          |   1 +
> >  drivers/clk/mediatek/clk-mt8195-vdec.c | 106
> > +++++++++++++++++++++++++
> >  3 files changed, 113 insertions(+)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8195-vdec.c
> > 
> > diff --git a/drivers/clk/mediatek/Kconfig
> > b/drivers/clk/mediatek/Kconfig
> > index d34517728f4a..b7881b8ebb23 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -642,6 +642,12 @@ config COMMON_CLK_MT8195_NNASYS
> >         help
> >           This driver supports MediaTek MT8195 nnasys clocks.
> > 
> > +config COMMON_CLK_MT8195_VDECSYS
> > +       bool "Clock driver for MediaTek MT8195 vdecsys"
> > +       depends on COMMON_CLK_MT8195
> > +       help
> > +         This driver supports MediaTek MT8195 vdecsys clocks.
> > +
> 
> Same comments about the commit log and Kconfig option.
> 
> >  config COMMON_CLK_MT8516
> >         bool "Clock driver for MediaTek MT8516"
> >         depends on ARCH_MEDIATEK || COMPILE_TEST
> > diff --git a/drivers/clk/mediatek/Makefile
> > b/drivers/clk/mediatek/Makefile
> > index 49e585a7ac8e..9acfa705f1de 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -90,5 +90,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_IPESYS) += clk-
> > mt8195-ipe.o
> >  obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
> >  obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
> >  obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
> > +obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
> >  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
> >  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> > diff --git a/drivers/clk/mediatek/clk-mt8195-vdec.c
> > b/drivers/clk/mediatek/clk-mt8195-vdec.c
> > new file mode 100644
> > index 000000000000..9ab84e75e1a0
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8195-vdec.c
> > @@ -0,0 +1,106 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +// Copyright (c) 2021 MediaTek Inc.
> > +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-mtk.h"
> > +#include "clk-gate.h"
> 
> Please order alphabetically. I think this applies to all the other
> patches.
> I missed this in the earlier ones, but please fix them nonetheless.
> 

I will check it in all patches of this series, thanks for you comment.

Best Regards,
Chun-Jie

> > +
> > +#include <dt-bindings/clock/mt8195-clk.h>
> > +
> > +static const struct mtk_gate_regs vdec0_cg_regs = {
> > +       .set_ofs = 0x0,
> > +       .clr_ofs = 0x4,
> > +       .sta_ofs = 0x0,
> > +};
> > +
> > +static const struct mtk_gate_regs vdec1_cg_regs = {
> > +       .set_ofs = 0x200,
> > +       .clr_ofs = 0x204,
> > +       .sta_ofs = 0x200,
> > +};
> > +
> > +static const struct mtk_gate_regs vdec2_cg_regs = {
> > +       .set_ofs = 0x8,
> > +       .clr_ofs = 0xc,
> > +       .sta_ofs = 0x8,
> > +};
> > +
> > +#define GATE_VDEC0(_id, _name, _parent,
> > _shift)                        \
> > +       GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift,
> > &mtk_clk_gate_ops_setclr_inv)
> > +
> > +#define GATE_VDEC1(_id, _name, _parent,
> > _shift)                        \
> > +       GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift,
> > &mtk_clk_gate_ops_setclr_inv)
> > +
> > +#define GATE_VDEC2(_id, _name, _parent,
> > _shift)                        \
> > +       GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift,
> > &mtk_clk_gate_ops_setclr_inv)
> > +
> > +static const struct mtk_gate vdec_clks[] = {
> > +       /* VDEC0 */
> > +       GATE_VDEC0(CLK_VDEC_VDEC, "vdec_vdec", "vdec_sel", 0),
> > +       /* VDEC1 */
> > +       GATE_VDEC1(CLK_VDEC_LAT, "vdec_lat", "vdec_sel", 0),
> > +       /* VDEC2 */
> > +       GATE_VDEC2(CLK_VDEC_LARB1, "vdec_larb1", "vdec_sel", 0),
> > +};
> > +
> > +static const struct mtk_gate vdec_core1_clks[] = {
> > +       /* VDEC0 */
> > +       GATE_VDEC0(CLK_VDEC_CORE1_VDEC, "vdec_core1_vdec",
> > "vdec_sel", 0),
> > +       /* VDEC1 */
> > +       GATE_VDEC1(CLK_VDEC_CORE1_LAT, "vdec_core1_lat",
> > "vdec_sel", 0),
> > +       /* VDEC2 */
> > +       GATE_VDEC2(CLK_VDEC_CORE1_LARB1, "vdec_core1_larb1",
> > "vdec_sel", 0),
> > +};
> > +
> > +static const struct mtk_gate vdec_soc_clks[] = {
> > +       /* VDEC0 */
> > +       GATE_VDEC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "vdec_sel",
> > 0),
> > +       /* VDEC1 */
> > +       GATE_VDEC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "vdec_sel",
> > 0),
> > +       /* VDEC2 */
> > +       GATE_VDEC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1",
> > "vdec_sel", 0),
> > +};
> > +
> > +static const struct mtk_clk_desc vdec_desc = {
> > +       .clks = vdec_clks,
> > +       .num_clks = ARRAY_SIZE(vdec_clks),
> > +};
> > +
> > +static const struct mtk_clk_desc vdec_core1_desc = {
> > +       .clks = vdec_core1_clks,
> > +       .num_clks = ARRAY_SIZE(vdec_core1_clks),
> > +};
> > +
> > +static const struct mtk_clk_desc vdec_soc_desc = {
> > +       .clks = vdec_soc_clks,
> > +       .num_clks = ARRAY_SIZE(vdec_soc_clks),
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt8195_vdec[] = {
> > +       {
> > +               .compatible = "mediatek,mt8195-vdecsys",
> > +               .data = &vdec_desc,
> > +       }, {
> > +               .compatible = "mediatek,mt8195-vdecsys_core1",
> > +               .data = &vdec_core1_desc,
> > +       }, {
> > +               .compatible = "mediatek,mt8195-vdecsys_soc",
> > +               .data = &vdec_soc_desc,
> > +       }, {
> > +               /* sentinel */
> > +       }
> > +};
> > +
> > +static struct platform_driver clk_mt8195_vdec_drv = {
> > +       .probe = mtk_clk_simple_probe,
> > +       .driver = {
> > +               .name = "clk-mt8195-vdec",
> > +               .of_match_table = of_match_clk_mt8195_vdec,
> > +       },
> > +};
> > +
> 
> Nit: you could drop the empty line here. Same in the other patches.
> 
> ChenYu
> 

I will check it in all patches of this series, thanks for you comment.

Best Regards,
Chun-Jie

> 
> > +builtin_platform_driver(clk_mt8195_vdec_drv);
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!29GLBpjACRCpc5FxaHdrGgafZTaEALh8IjHiOrQ9T_GuJJzdOlwhLRehPS8v5ciHUo9W$
> >  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
