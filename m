Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1007CC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 09:33:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06F4206D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 09:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBZyjUHx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmLSAop2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06F4206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+AqW3IwarfIA+55yMjawD8HDoFdBL0q7Zeuk8XrJ6zI=; b=JBZyjUHx4yRkdKur4voYgfXlG
	li1CdSYQRYm5KTBmUHwNnwBQ46RUuDFvGCw98Jk4H8ZILcR1vlFZUo4LYTSZIVxnOQtTU42V+hV1u
	0/8/TERl+kcHpoHU2l+Ywkb2fJUi6XF8rH6ODeJKjNtX4qvxaoYoKKR9Cx2UEPY1zzt4CxKpgmoh6
	LpJcvH4E5g8PHP1Asb/fgtm5jpelJteS7ss2wqj4HVUlC4cKtqXtE/5cXkE9+bWcsxdEopDXDn1BT
	PBz7D1RyFLrfZ2fkbGztyVFwuxPv1XvDs5GmOaGc3yfvpvkJkQ6SL1kK6VFHgtVLV1vAu4ejB+MuC
	PDlHIMyrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0iSP-0000uB-HA; Wed, 29 Jul 2020 09:33:05 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0iSE-0000qQ-38; Wed, 29 Jul 2020 09:32:55 +0000
Received: by mail-ot1-x342.google.com with SMTP id l26so478931otj.4;
 Wed, 29 Jul 2020 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OHhG5jxleK/NwjMdPfb9zjsQp7xv4ruX3ZHlREQ/R1E=;
 b=nmLSAop2RYQFa35KUVOM2bkx8RGjiDGd+1v/AENuODxfInSpb26mCs/SjVwJQQnVtY
 cGS0UE214SE4mLBt9tMzHb2FEFQwScLPSAcXRouJVT4b3rUIoHlitRpT/+zPgcefAsIU
 NLsQpITaLj1WmaSSiktae8CjQe8qbIslEZrWgHQT+TQhoPACSUqggoUNl52EsQJM3jRR
 25nN4oHhDF7Uy1DGDfb7oQuYgTkdgsC/+bq7rYrPvt5mQFGv96hOYlsvihO5+52XPQgU
 FMxm+RswV/flgIa1qSVhUB8oTYgJXCH/8CIr9ppYcf0zor0kfHvsJluCoPmkdMZpdWAU
 +qHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OHhG5jxleK/NwjMdPfb9zjsQp7xv4ruX3ZHlREQ/R1E=;
 b=gqzDDeM+Ab8cibghhWdLYkPio4tF3YSO+druIB6jz8CVRIblxPCymTVSwxXwoR+FFM
 iU/VEYvUoFUTsAqJYuIyPQJkplsw8hEtEdrq5fJk4PWLQxFARtmXvtudHQv2ZmMLLmd7
 o9zwvWOUzYbCMAeLW36bLbKlWYQjprvrn+xDxtN4B3nVp9lbHmXkujq/y5zzrR9n5Csx
 n5zZlH95hKrjWZjk+5xZQyLanV8dDJf8f3hgj4Z32W/Vb1dVKgMGZLgYey/QFSXYjz2S
 8OHTDXd+9iiLhGcVBg8OUSDpYQyGZ6XwueY1WTdfOz3o+5r53SRh1B5nIvlUms/GUkxc
 YNXA==
X-Gm-Message-State: AOAM533LMdV/KnhjydNXi75yuqfdRmFvd73ZjQDIJbWK5ioxlr7+pw/r
 VCkv6l0/ZU9WldY1+XufQFGKLaBNQD8IBsCeIYc=
X-Google-Smtp-Source: ABdhPJz+lDYyzS5yNdRSnrCl60tunB7jRkBS4DJ55b3j6mWjIyEdpCm8HqT7jQEXlNi/0E21pKrDEHxYKk+ZQhV6CEY=
X-Received: by 2002:a9d:d57:: with SMTP id 81mr26959371oti.184.1596015171996; 
 Wed, 29 Jul 2020 02:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-6-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1596012277-8448-6-git-send-email-weiyi.lu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 29 Jul 2020 11:32:40 +0200
Message-ID: <CAFqH_50_xi5WkokS3WmV2Z-yAK06bpXBMgTQomwmJHcQmfX9yw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: mediatek: Add MT8192 clock support
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_053254_182014_0CFEA39E 
X-CRM114-Status: GOOD (  16.49  )
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

Hi Weiyi,

Thank you for your patch. Some few comment below, I'll focus on
clk-mt8192-mm file, but I think can apply to other files too.

[snip]

> diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
> new file mode 100644
> index 0000000..02eef24
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8192-mm.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0

nit: Although is a valid license identifier for the kernel would be
better to use the non-deprecated form by SPDX, GPL-2.0-only

> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +// Author: Weiyi Lu <weiyi.lu@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8192-clk.h>
> +
> +static const struct mtk_gate_regs mm0_cg_regs = {
> +       .set_ofs = 0x104,
> +       .clr_ofs = 0x108,
> +       .sta_ofs = 0x100,
> +};
> +
> +static const struct mtk_gate_regs mm1_cg_regs = {
> +       .set_ofs = 0x114,
> +       .clr_ofs = 0x118,
> +       .sta_ofs = 0x110,
> +};
> +
> +static const struct mtk_gate_regs mm2_cg_regs = {
> +       .set_ofs = 0x1a4,
> +       .clr_ofs = 0x1a8,
> +       .sta_ofs = 0x1a0,
> +};
> +
> +#define GATE_MM0(_id, _name, _parent, _shift)                  \
> +       GATE_MTK(_id, _name, _parent, &mm0_cg_regs, _shift,     \
> +               &mtk_clk_gate_ops_setclr)

nit: You can take advantage of the new line length limit, which is now
100 characters.

> +
> +#define GATE_MM1(_id, _name, _parent, _shift)                  \
> +       GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift,     \
> +               &mtk_clk_gate_ops_setclr)
> +

ditto

> +#define GATE_MM2(_id, _name, _parent, _shift)                  \
> +       GATE_MTK(_id, _name, _parent, &mm2_cg_regs, _shift,     \
> +               &mtk_clk_gate_ops_setclr)
> +

ditto

> +static const struct mtk_gate mm_clks[] = {
> +       /* MM0 */
> +       GATE_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "disp_sel", 0),
> +       GATE_MM0(CLK_MM_DISP_CONFIG, "mm_disp_config", "disp_sel", 1),
> +       GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "disp_sel", 2),
> +       GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "disp_sel", 3),
> +       GATE_MM0(CLK_MM_DISP_OVL0_2L, "mm_disp_ovl0_2l", "disp_sel", 4),
> +       GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp_sel", 5),
> +       GATE_MM0(CLK_MM_DISP_UFBC_WDMA0, "mm_disp_ufbc_wdma0", "disp_sel", 6),
> +       GATE_MM0(CLK_MM_DISP_RSZ0, "mm_disp_rsz0", "disp_sel", 7),
> +       GATE_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp_sel", 8),
> +       GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp_sel", 9),
> +       GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp_sel", 10),
> +       GATE_MM0(CLK_MM_SMI_INFRA, "mm_smi_infra", "disp_sel", 11),
> +       GATE_MM0(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp_sel", 12),
> +       GATE_MM0(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "disp_sel", 13),
> +       GATE_MM0(CLK_MM_DISP_DSC_WRAP0, "mm_disp_dsc_wrap0", "disp_sel", 14),
> +       GATE_MM0(CLK_MM_DSI0, "mm_dsi0", "disp_sel", 15),
> +       GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp_sel", 16),
> +       GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "disp_sel", 17),
> +       GATE_MM0(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp_sel", 18),
> +       GATE_MM0(CLK_MM_DISP_FAKE_ENG1, "mm_disp_fake_eng1", "disp_sel", 19),
> +       GATE_MM0(CLK_MM_MDP_TDSHP4, "mm_mdp_tdshp4", "disp_sel", 20),
> +       GATE_MM0(CLK_MM_MDP_RSZ4, "mm_mdp_rsz4", "disp_sel", 21),
> +       GATE_MM0(CLK_MM_MDP_AAL4, "mm_mdp_aal4", "disp_sel", 22),
> +       GATE_MM0(CLK_MM_MDP_HDR4, "mm_mdp_hdr4", "disp_sel", 23),
> +       GATE_MM0(CLK_MM_MDP_RDMA4, "mm_mdp_rdma4", "disp_sel", 24),
> +       GATE_MM0(CLK_MM_MDP_COLOR4, "mm_mdp_color4", "disp_sel", 25),
> +       GATE_MM0(CLK_MM_DISP_Y2R0, "mm_disp_y2r0", "disp_sel", 26),
> +       GATE_MM0(CLK_MM_SMI_GALS, "mm_smi_gals", "disp_sel", 27),
> +       GATE_MM0(CLK_MM_DISP_OVL2_2L, "mm_disp_ovl2_2l", "disp_sel", 28),
> +       GATE_MM0(CLK_MM_DISP_RDMA4, "mm_disp_rdma4", "disp_sel", 29),
> +       GATE_MM0(CLK_MM_DISP_DPI0, "mm_disp_dpi0", "disp_sel", 30),
> +       /* MM1 */
> +       GATE_MM1(CLK_MM_SMI_IOMMU, "mm_smi_iommu", "disp_sel", 0),
> +       /* MM2 */
> +       GATE_MM2(CLK_MM_DSI_DSI0, "mm_dsi_dsi0", "disp_sel", 0),
> +       GATE_MM2(CLK_MM_DPI_DPI0, "mm_dpi_dpi0", "dpi_sel", 8),
> +       GATE_MM2(CLK_MM_26MHZ, "mm_26mhz", "clk26m", 24),
> +       GATE_MM2(CLK_MM_32KHZ, "mm_32khz", "clk32k", 25),
> +};
> +
> +static int clk_mt8192_mm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_onecell_data *clk_data;
> +
> +       clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);

mtk_alloc_clk_data can return NULL

           if (!clk_data)
              return -ENOMEM;

> +
> +       mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> +                       clk_data);
> +

The above function can fail, better check for error

         if (ret)
             return ret;

> +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
> +

No need for double line spacing.

> +static struct platform_driver clk_mt8192_mm_drv = {
> +       .probe = clk_mt8192_mm_probe,
> +       .driver = {
> +               .name = "clk-mt8192-mm",
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8192_mm_drv);

[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
