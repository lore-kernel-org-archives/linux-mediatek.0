Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE14C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7EB60E0B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D7EB60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuDyFd0QncrsCAgxe0nUYhbkj/8pNVHdehgkkr5VkSs=; b=w9EU9SgurmqlFz
	qeddbpyuxkfPZtps0xNjHguQxPquQVHd0tHzZx8yQlQfHxlEoa1lS0AuIbbIHSbCIWrIlfngtDxN3
	LQk6oxpDN1xyt4BzM39AqJtIZ9vt0JlZbA8C4aLjbgp6aGpr3fLpvXJAdtAx9xiUok19Ig+SQ1XLU
	qpWK6ibQ/I0/S2+BIRIoYgqW5RrNp01Ag1jIAA5hc44A3IIZhL2x9VHt1v7s5Xbtdtqu7UnXaHEuQ
	n0XQJDGvPBgXuV759GFSxykiQ+GLJUSJLtm2Jq3tHibnIMsrX+In6xk+9egVY0ENftwud/yVPKYEL
	RztMcurK55AtZf17vsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0h38-00Arr8-FW; Tue, 06 Jul 2021 09:07:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0h34-00Arq6-Sv
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 09:07:24 +0000
Received: by mail-lf1-x12d.google.com with SMTP id c28so13663438lfp.11
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 02:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/3HzjS40NCzeCxcicoEsvFijQpXDThbZ/r8InzKdlc=;
 b=e1zNBH9vDY0TRtaFRs+O1SVfb//TvklWU2MYVnDt39eqZ/HX7JlEcg+Tlm/9p31a/z
 CnlGOqXMya3RDLPBteSg7gvFvEx31Ps6yyaCvwJJvl6r4hKb3q1Q0bPlTbJwh8udkprf
 4nfyX87h0i7G1AceII8sU+xH4bd2Km6m6k2+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/3HzjS40NCzeCxcicoEsvFijQpXDThbZ/r8InzKdlc=;
 b=S+w6B5krndv+7Q/XpCoT/WGiBNLQsp+uC+ehLO564zFalgiENVvZN8lr48BLygrkE+
 zDf8y+brVbxXzcE/2ZrsmFEnZg5eZ2OitPLzyCCki5jf1WSHENz48tjHMdBkWfW9GWKM
 aNResHI8O4U0BxAAneYtbFaou5WXHjfQEgxbZg1Ic4Uu2XOfyFDN1ld6hWn4M5Nq5nmq
 xVNKbDSJ25arNMwqloXElJbQKsB4beY+BFKeBXiJzTfXO/LpFaLjUPUi9GB65f5UwGzW
 498x5EVQ0NkPuEew7ttX8p2BYRb0a0JUaMKolFz5CloxGn33szKtmLFJgb8BTJrlbK5J
 OJyw==
X-Gm-Message-State: AOAM533n5tKc6gxa+aBxr1y1Pqbg9B2HaiOCMvNp2ba7iUdTjUpY3jwn
 E4icep5XGxsZevxOajzAB4Xg5deTLrPP6gdbB1hC/w==
X-Google-Smtp-Source: ABdhPJysvxKwdpFsCEfj9/EBHKTte7fcaL772GEGT+XYjWLqMbh2CPlWIhbJho7kLQMGyI3WRJwcsoA0w7pyzu7pM0Y=
X-Received: by 2002:a05:6512:6d0:: with SMTP id
 u16mr1458924lff.587.1625562440122; 
 Tue, 06 Jul 2021 02:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-10-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-10-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jul 2021 17:07:09 +0800
Message-ID: <CAGXv+5F0hTL2Meafo6cQ4FaAMkU+nRZBcnLgeXOgrHAttrNkBQ@mail.gmail.com>
Subject: Re: [PATCH 09/22] clk: mediatek: Add MT8195 imgsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_020722_995646_C0CB2E48 
X-CRM114-Status: GOOD (  18.07  )
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

Hi,

On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 imgsys clock providers
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig          |  6 ++
>  drivers/clk/mediatek/Makefile         |  1 +
>  drivers/clk/mediatek/clk-mt8195-img.c | 98 +++++++++++++++++++++++++++
>  3 files changed, 105 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-img.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 6a6e496d08a4..f92d0b6b7eec 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -612,6 +612,12 @@ config COMMON_CLK_MT8195_CCUSYS
>         help
>           This driver supports MediaTek MT8195 ccusys clocks.
>
> +config COMMON_CLK_MT8195_IMGSYS
> +       bool "Clock driver for MediaTek MT8195 imgsys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 imgsys clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index bb8aac6f9185..1768eda917c2 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -85,5 +85,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS) += clk-mt8195-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS_SRC) += clk-mt8195-aud_src.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_CAMSYS) += clk-mt8195-cam.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_CCUSYS) += clk-mt8195-ccu.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_IMGSYS) += clk-mt8195-img.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-img.c b/drivers/clk/mediatek/clk-mt8195-img.c
> new file mode 100644
> index 000000000000..923fa82aedae
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-img.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +
> +static const struct mtk_gate_regs img_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_IMG(_id, _name, _parent, _shift)                  \
> +       GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate img_clks[] = {
> +       GATE_IMG(CLK_IMG_LARB9, "img_larb9", "img_sel", 0),
> +       GATE_IMG(CLK_IMG_TRAW0, "img_traw0", "img_sel", 1),
> +       GATE_IMG(CLK_IMG_TRAW1, "img_traw1", "img_sel", 2),
> +       GATE_IMG(CLK_IMG_TRAW2, "img_traw2", "img_sel", 3),
> +       GATE_IMG(CLK_IMG_TRAW3, "img_traw3", "img_sel", 4),
> +       GATE_IMG(CLK_IMG_DIP0, "img_dip0", "img_sel", 8),
> +       GATE_IMG(CLK_IMG_WPE0, "img_wpe0", "img_sel", 9),
> +       GATE_IMG(CLK_IMG_IPE, "img_ipe", "img_sel", 10),
> +       GATE_IMG(CLK_IMG_DIP1, "img_dip1", "img_sel", 11),
> +       GATE_IMG(CLK_IMG_WPE1, "img_wpe1", "img_sel", 12),
> +       GATE_IMG(CLK_IMG_GALS, "img_gals", "img_sel", 31),
> +};
> +
> +static const struct mtk_gate img1_dip_top_clks[] = {
> +       GATE_IMG(CLK_IMG1_DIP_TOP_LARB10, "img1_dip_top_larb10", "img_sel", 0),
> +       GATE_IMG(CLK_IMG1_DIP_TOP_DIP_TOP, "img1_dip_top_dip_top", "img_sel", 1),
> +};
> +
> +static const struct mtk_gate img1_dip_nr_clks[] = {
> +       GATE_IMG(CLK_IMG1_DIP_NR_RESERVE, "img1_dip_nr_reserve", "img_sel", 0),

Adding a clock for a bit that is named "reserved" is sort of weird.
Does it actually exist and function?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
