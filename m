Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0181BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 07:11:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BED0B20774
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 07:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="erea5wzA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XxyH5xHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BED0B20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XyqfOxN7T6bpoZVmbZAD6LUWGQCdSG3Q9w2TYplge8I=; b=erea5wzA7HDs4AYWwyEGTEYz2
	Jdb+s40j1RXi8mvNMXNhdfgjBklPXHY/xE1wzKHMUcp8zrRHdecchsOv/lG9K6EUsltCRfc2UDyK/
	CVkPi7LSB79T2OiVBRDvJnt2wDhFjoIsM1Tfi1SHU5EMuvrIvqxca2WZsc4bHQPVN/2bL6WNEgSiH
	vn1ErFHkMxpPPKDyO0o4IJd/SadT68XjFv6kiXEi5s+Rbs8JG13pHq7fglWgWD0SUQXTcLLmW0YWM
	Jl8a3JFgD/1PhhKTqkoYGe3ZYnWyBsdMvECwQrjqPDUv3xx8biaFpkgHsqVcQWVsKTHepFlbhX5PU
	U0m48LI7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5ORl-0003b7-5o; Tue, 11 Aug 2020 07:11:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5ORh-0003aM-Lz; Tue, 11 Aug 2020 07:11:43 +0000
X-UUID: 3c72b3e571ed4bfc87a611937362d895-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=usoA9Yokks0SP8P4YiF+O2f/8bLSWfQUxX1DlJ4XR3Y=; 
 b=XxyH5xHr58mlf7jGNCokoN4nW4g1wjU8H3hASt03AI9rDl3c9Vy/bKZ12p3d060Txk1m9z4JGejDCF9wLlwvkzgs6XkCoPsD0iZeSbOkZ03YwtlGi/2Yns8Z/AYyhAhgCdisL5GOV7t9p+BssW5UJNeuR0ElCJBK6Slu5nCp79k=;
X-UUID: 3c72b3e571ed4bfc87a611937362d895-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2069206982; Mon, 10 Aug 2020 23:11:36 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 00:03:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 15:03:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Aug 2020 15:03:38 +0800
Message-ID: <1597129418.20627.27.camel@mtksdaap41>
Subject: Re: [PATCH v2 5/5] clk: mediatek: Add MT8192 clock support
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 11 Aug 2020 15:03:38 +0800
In-Reply-To: <CAFqH_50_xi5WkokS3WmV2Z-yAK06bpXBMgTQomwmJHcQmfX9yw@mail.gmail.com>
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-6-git-send-email-weiyi.lu@mediatek.com>
 <CAFqH_50_xi5WkokS3WmV2Z-yAK06bpXBMgTQomwmJHcQmfX9yw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_031142_007430_C9787844 
X-CRM114-Status: GOOD (  24.94  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-29 at 11:32 +0200, Enric Balletbo Serra wrote:
> Hi Weiyi,
> 
> Thank you for your patch. Some few comment below, I'll focus on
> clk-mt8192-mm file, but I think can apply to other files too.
> 
> [snip]
> 
> > diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
> > new file mode 100644
> > index 0000000..02eef24
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8192-mm.c
> > @@ -0,0 +1,108 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> nit: Although is a valid license identifier for the kernel would be
> better to use the non-deprecated form by SPDX, GPL-2.0-only
> 
> > +//
> > +// Copyright (c) 2020 MediaTek Inc.
> > +// Author: Weiyi Lu <weiyi.lu@mediatek.com>
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-mtk.h"
> > +#include "clk-gate.h"
> > +
> > +#include <dt-bindings/clock/mt8192-clk.h>
> > +
> > +static const struct mtk_gate_regs mm0_cg_regs = {
> > +       .set_ofs = 0x104,
> > +       .clr_ofs = 0x108,
> > +       .sta_ofs = 0x100,
> > +};
> > +
> > +static const struct mtk_gate_regs mm1_cg_regs = {
> > +       .set_ofs = 0x114,
> > +       .clr_ofs = 0x118,
> > +       .sta_ofs = 0x110,
> > +};
> > +
> > +static const struct mtk_gate_regs mm2_cg_regs = {
> > +       .set_ofs = 0x1a4,
> > +       .clr_ofs = 0x1a8,
> > +       .sta_ofs = 0x1a0,
> > +};
> > +
> > +#define GATE_MM0(_id, _name, _parent, _shift)                  \
> > +       GATE_MTK(_id, _name, _parent, &mm0_cg_regs, _shift,     \
> > +               &mtk_clk_gate_ops_setclr)
> 
> nit: You can take advantage of the new line length limit, which is now
> 100 characters.
> 

OK, thanks for reminding.

> > +
> > +#define GATE_MM1(_id, _name, _parent, _shift)                  \
> > +       GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift,     \
> > +               &mtk_clk_gate_ops_setclr)
> > +
> 
> ditto
> 

Got it.

> > +#define GATE_MM2(_id, _name, _parent, _shift)                  \
> > +       GATE_MTK(_id, _name, _parent, &mm2_cg_regs, _shift,     \
> > +               &mtk_clk_gate_ops_setclr)
> > +
> 
> ditto
> 
> > +static const struct mtk_gate mm_clks[] = {
> > +       /* MM0 */
> > +       GATE_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "disp_sel", 0),
> > +       GATE_MM0(CLK_MM_DISP_CONFIG, "mm_disp_config", "disp_sel", 1),
> > +       GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "disp_sel", 2),
> > +       GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "disp_sel", 3),
> > +       GATE_MM0(CLK_MM_DISP_OVL0_2L, "mm_disp_ovl0_2l", "disp_sel", 4),
> > +       GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp_sel", 5),
> > +       GATE_MM0(CLK_MM_DISP_UFBC_WDMA0, "mm_disp_ufbc_wdma0", "disp_sel", 6),
> > +       GATE_MM0(CLK_MM_DISP_RSZ0, "mm_disp_rsz0", "disp_sel", 7),
> > +       GATE_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp_sel", 8),
> > +       GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp_sel", 9),
> > +       GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp_sel", 10),
> > +       GATE_MM0(CLK_MM_SMI_INFRA, "mm_smi_infra", "disp_sel", 11),
> > +       GATE_MM0(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp_sel", 12),
> > +       GATE_MM0(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "disp_sel", 13),
> > +       GATE_MM0(CLK_MM_DISP_DSC_WRAP0, "mm_disp_dsc_wrap0", "disp_sel", 14),
> > +       GATE_MM0(CLK_MM_DSI0, "mm_dsi0", "disp_sel", 15),
> > +       GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp_sel", 16),
> > +       GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "disp_sel", 17),
> > +       GATE_MM0(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp_sel", 18),
> > +       GATE_MM0(CLK_MM_DISP_FAKE_ENG1, "mm_disp_fake_eng1", "disp_sel", 19),
> > +       GATE_MM0(CLK_MM_MDP_TDSHP4, "mm_mdp_tdshp4", "disp_sel", 20),
> > +       GATE_MM0(CLK_MM_MDP_RSZ4, "mm_mdp_rsz4", "disp_sel", 21),
> > +       GATE_MM0(CLK_MM_MDP_AAL4, "mm_mdp_aal4", "disp_sel", 22),
> > +       GATE_MM0(CLK_MM_MDP_HDR4, "mm_mdp_hdr4", "disp_sel", 23),
> > +       GATE_MM0(CLK_MM_MDP_RDMA4, "mm_mdp_rdma4", "disp_sel", 24),
> > +       GATE_MM0(CLK_MM_MDP_COLOR4, "mm_mdp_color4", "disp_sel", 25),
> > +       GATE_MM0(CLK_MM_DISP_Y2R0, "mm_disp_y2r0", "disp_sel", 26),
> > +       GATE_MM0(CLK_MM_SMI_GALS, "mm_smi_gals", "disp_sel", 27),
> > +       GATE_MM0(CLK_MM_DISP_OVL2_2L, "mm_disp_ovl2_2l", "disp_sel", 28),
> > +       GATE_MM0(CLK_MM_DISP_RDMA4, "mm_disp_rdma4", "disp_sel", 29),
> > +       GATE_MM0(CLK_MM_DISP_DPI0, "mm_disp_dpi0", "disp_sel", 30),
> > +       /* MM1 */
> > +       GATE_MM1(CLK_MM_SMI_IOMMU, "mm_smi_iommu", "disp_sel", 0),
> > +       /* MM2 */
> > +       GATE_MM2(CLK_MM_DSI_DSI0, "mm_dsi_dsi0", "disp_sel", 0),
> > +       GATE_MM2(CLK_MM_DPI_DPI0, "mm_dpi_dpi0", "dpi_sel", 8),
> > +       GATE_MM2(CLK_MM_26MHZ, "mm_26mhz", "clk26m", 24),
> > +       GATE_MM2(CLK_MM_32KHZ, "mm_32khz", "clk32k", 25),
> > +};
> > +
> > +static int clk_mt8192_mm_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *node = dev->parent->of_node;
> > +       struct clk_onecell_data *clk_data;
> > +
> > +       clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> 
> mtk_alloc_clk_data can return NULL
> 
>            if (!clk_data)
>               return -ENOMEM;
> 
> > +
> > +       mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> > +                       clk_data);
> > +
> 
> The above function can fail, better check for error
> 
>          if (ret)
>              return ret;
> 

OK, I'll fix in next version.

> > +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +}
> > +
> > +
> 
> No need for double line spacing.
> 

Got it.

> > +static struct platform_driver clk_mt8192_mm_drv = {
> > +       .probe = clk_mt8192_mm_probe,
> > +       .driver = {
> > +               .name = "clk-mt8192-mm",
> > +       },
> > +};
> > +
> > +builtin_platform_driver(clk_mt8192_mm_drv);
> 
> [snip]
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!3-tRGg8pYRBy0yJ4A9LkGuveXPD7gziSzHyQDExjoUi3iiLooDu5k2Sbx2kWQZtW$ 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
