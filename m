Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010CBC636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZxWzb3yPLqGq6Yxix+GBrYa0mk3uS9zwEb67e98TQU=; b=UbptFGWWorPMYF7bsaxra8q6m+
	aeB4bMxZHtMoSZE0VGMZ61DBOUirn8o38fMRWeXQ1EgugZfKBaf/3oMO6wReMd7MEkE7kxr92DP06
	JEWxEH96ZkiqSvqS0BYdTG2qEOC4DfTAgOmuA+rVXTsrnnchMLQq9DalvKX3R8SKgAjwypHKvHuAV
	bgQq15ifUVxecNYd9a51/Px0N9Dr8Je3qFofhUXibS6Et44U7vFTQAuySd7+bATc6+W1aymDZ/rLd
	mLfw/QKEz6Cws4lJRGHOq3RJmAkKlM8LraMQ91EQ/tz1LUUhGhSC8MMDPjrhQCv4dmWwi/GO/iisi
	6Y6mH3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqfs-000q2U-QS; Fri, 03 Feb 2023 07:39:56 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqfh-000py1-Lf
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:39:47 +0000
Received: by mail-vk1-xa33.google.com with SMTP id g28so2159247vkd.8
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QZxWzb3yPLqGq6Yxix+GBrYa0mk3uS9zwEb67e98TQU=;
        b=R4yRal95vWUSAG5KfiUpIrJGkBDc00tzIhKtqbo7P14e8g2G8sHhMSE82H+DYlj7Q0
         FrnlFEZg+mALfvwZqyjJ1drf5a8d6yniYZHxohmPNuqeWNFtzexnnw1MuDiiv2XqRq+6
         506uXFAmLvFaopBcq4cjLseIGAwL0yXsz0HVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZxWzb3yPLqGq6Yxix+GBrYa0mk3uS9zwEb67e98TQU=;
        b=YbzVjgLRLJsZKW3Y1jjtAZDa4yUCM1bAsoj5g0QVW72+8wbN8hpL7978GQQfObrqyh
         GUHUVt5JzTJUk7wXxqmtZ3pJRlNptNEMhFGCjlBuaBMXmANRGMQbT+aCp8bhDDVKpVMt
         YQ68WLCxBQGqV+8ek4smIms3Wp0omVx4VEyhb+yysPYtfGbCzsj2CsKYVK5pmubiPXF0
         f6uz9JDUrNCuAPoftC9tRA3NBvmnfbB3B4NrzBRih63dQxr84GLy4jUY9iu3GHFFdmg8
         oGsG9WgbpsF620xcerLp35La4djXnSYc+emBr0wGeFKHG42SN10nY7b8ZzOE8zA/bG+j
         mx3g==
X-Gm-Message-State: AO0yUKXveCS1gVkpoHflKcBRIddd33omB26AAfCS3BPr2y0BZeHn5Vn/
	RYtv3ImLCUvBQMvpt6ZVX4DY8K/GGByClRmN9vz8Hg==
X-Google-Smtp-Source: AK7set+GgxBgT+BjAC93C+XgjP/ecVL4fdQCV19du01DsL5X7oKE27t5MzZ9k5TCaAt7gX05+mhLAXIYkjyFGXvWHuE=
X-Received: by 2002:ac5:c744:0:b0:3ea:94ea:110b with SMTP id
 b4-20020ac5c744000000b003ea94ea110bmr1316090vkn.22.1675409984392; Thu, 02 Feb
 2023 23:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-20-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-20-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:39:33 +0800
Message-ID: <CAGXv+5EW8DXXp+D_M1AU7ohrrbmU8e7eMwo5LpZb9FHWi7ELAw@mail.gmail.com>
Subject: Re: [PATCH v5 19/19] clk: mediatek: Add MT8188 adsp clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_233945_719394_453327AE 
X-CRM114-Status: GOOD (  15.79  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 19, 2023 at 9:02 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 adsp clock controller which provides clock gate
> control for Audio DSP.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile                 |  2 +-
>  .../clk/mediatek/clk-mt8188-adsp_audio26m.c   | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 8befaedfdd3d..b56ae9bee1d8 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -89,7 +89,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
>                                    clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
>                                    clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
>                                    clk-mt8188-vpp0.o clk-mt8188-vpp1.o clk-mt8188-wpe.o \
> -                                  clk-mt8188-imp_iic_wrap.o
> +                                  clk-mt8188-imp_iic_wrap.o clk-mt8188-adsp_audio26m.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
> new file mode 100644
> index 000000000000..f91381a1316c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Garmin Chang <garmin.chang@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +static const struct mtk_gate_regs adsp_audio26m_cg_regs = {
> +       .set_ofs = 0x80,
> +       .clr_ofs = 0x80,
> +       .sta_ofs = 0x80,
> +};
> +
> +#define GATE_ADSP_FLAGS(_id, _name, _parent, _shift)           \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &adsp_audio26m_cg_regs, _shift,             \
> +               &mtk_clk_gate_ops_no_setclr, CLK_IGNORE_UNUSED)

Why CLK_IGNORE_UNUSED?

