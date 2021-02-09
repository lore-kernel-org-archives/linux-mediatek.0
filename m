Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5B0C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 15:39:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D55F64E54
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 15:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D55F64E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lIXaFrx3A4nvU0q/VMNRY7rsERB2vJoiFFejZJfXydk=; b=sLEVLaSZTbbKhUldRYii+vrO8
	YRTPVspE2MJG3ttGMLMYNnOjbhBCtwaIswfmMIT2R5M9h/Tfcc8QPWbx9IX5WFCXVsVBec0R3WhLq
	ZtwiqHmKo+nrTesoRrpIaMlJyFQh5FSci3FTcN6AOi0zpDN2MzL+Ml9WybKmHtQ3XMgqlOEi4NYUI
	ogZlL5e1flBCPalvaEsVWczs9rCZT/F+KqNqCTZ/B+Y/oWmEMIi03/F3T3YYWo03Pc2jmwuxG8ZWE
	xGpJuStlzaPz65lkLXYT8V+hnRzV9V8r27gfxAVBWNta8O0DtXPXkNCuSUFa6UIFuwPjEVd4FEpZv
	C5TqBKn7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9V6X-0001XC-9A; Tue, 09 Feb 2021 15:39:05 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9V6T-0001Vf-D7; Tue, 09 Feb 2021 15:39:04 +0000
Received: by mail-oo1-xc31.google.com with SMTP id e17so2820806oow.4;
 Tue, 09 Feb 2021 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0HkG5koAwJ4Aw/3npsq0R64Ak6ESM41BDW/+AYj466E=;
 b=ZWO+AL45l1vBXFLQU7BahAHbymSYE9IzNERayRZPrb+jE4983YcT4WNhdr2hoMEhpY
 SWwXAgvFsIFymvexiNV/QLLBkyRW1TS3yIC7ti5aXXRR2WbzfKFatc9eP0u0Smfvw7Lw
 bH16kTYvbdAXc5+mJNSMIN3elGAMpHKoWQKXkUCydG6osLjFQ4P7fJ/RiBg9NAj/EMBL
 +Tgo8TDNnpNVkC185hAdFe6csbrmA1hm+FSHZz/FDm6OJXhC8cgdADMsN28GoVLQqpbu
 FbRkv/2khtFBM+dDm5quKf3mSSc2JS4Z7rDBcvfxRBAPxSxaVv/qzDl9fGLZfYuy9Liu
 oMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0HkG5koAwJ4Aw/3npsq0R64Ak6ESM41BDW/+AYj466E=;
 b=WrT6z87HEZbKRUXtqt6zrcJE663LL8pgtmT9y4hURw/CRAU2ziYGzDu/zDJpyTqtq2
 8a5Uwk7oTM94oBeEJX8obfAfQ5fVwCml08W3SMsOOZLu6M8gAy/0QDF30aMmF3pkg+Tb
 DfJ2jij4OaAOsPwXqoX8UX6R0QYC4B41GH2xR1D9oKgDj5rLEO59TBhEBMRjqyjaSBng
 h+otWUFbUvSzh/MDdqN2MkM6QrjbyaWOXZWRf+Vy69r+S8L1BcXAjb/Pi756c5TtNOo8
 XaHuRgMMEN6/5M7CPfxZ+HRYGbTosV1EETUE88hepjGopgcwjqep7BOw4oNGY7vkxJc6
 1HsQ==
X-Gm-Message-State: AOAM531iY2ERxFUBoT0cJ2LrdREH8bjKNsiMMPZk/ibtJuE/SqUSc0ee
 +VopZeBJHtk2+htaCACu1PDIwAEOjE478RCEQgI=
X-Google-Smtp-Source: ABdhPJyG4MNSWQqhz8ncZNGi4erkJwzCVwRSoeSFASwZvlA9kjdYvCkEQJxF/tP4DxESUflYro5Mow3kla6ri3DAP/A=
X-Received: by 2002:a05:6820:255:: with SMTP id
 b21mr16319031ooe.0.1612885139006; 
 Tue, 09 Feb 2021 07:38:59 -0800 (PST)
MIME-Version: 1.0
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609815993-22744-2-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 9 Feb 2021 16:38:47 +0100
Message-ID: <CAFqH_53Fbncu5BVDX7idfTN5sF6y6tnO8X3iFn=PQpuE=bbvWw@mail.gmail.com>
Subject: Re: [PATCH v4, 01/10] soc: mediatek: mmsys: create mmsys folder
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_103901_671905_5C0A67FE 
X-CRM114-Status: GOOD (  22.54  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yongqiang Niu,

Thank you for your patch.

Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dt., 5
de gen. 2021 a les 4:07:
>
> the mmsys will more and more complicated after support
> more and more SoCs, add an independent folder will be
> more clear
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/Makefile          |   2 +-

It will not apply cleanly anymore after the below commit that is
already queued. Maybe you could rebase the patches and resend them
again?

commit e1e4f7fea37572f0ccf3887430e52c491e9accb6
Author: CK Hu <ck.hu@mediatek.com>
Date:   Tue Jul 21 15:46:06 2020 +0800

    soc / drm: mediatek: Move mtk mutex driver to soc folder

    mtk mutex is used by DRM and MDP driver, and its function is SoC-specific,
    so move it to soc folder.

With that fixed,

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
  Enric

>  drivers/soc/mediatek/mmsys/Makefile    |   2 +
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 373 +++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 373 ---------------------------------
>  4 files changed, 376 insertions(+), 374 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
>  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
>  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index b6908db..eca9774 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -5,4 +5,4 @@ obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>  obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
> -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> new file mode 100644
> index 0000000..f44eadc
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> new file mode 100644
> index 0000000..18f9397
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> @@ -0,0 +1,373 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: James Liao <jamesjj.liao@mediatek.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +
> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> +#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> +#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> +#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> +#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> +
> +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> +#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> +#define DISP_REG_CONFIG_DSI_SEL                        0x050
> +#define DISP_REG_CONFIG_DPI_SEL                        0x064
> +
> +#define OVL0_MOUT_EN_COLOR0                    0x1
> +#define OD_MOUT_EN_RDMA0                       0x1
> +#define OD1_MOUT_EN_RDMA1                      BIT(16)
> +#define UFOE_MOUT_EN_DSI0                      0x1
> +#define COLOR0_SEL_IN_OVL0                     0x1
> +#define OVL1_MOUT_EN_COLOR1                    0x1
> +#define GAMMA_MOUT_EN_RDMA1                    0x1
> +#define RDMA0_SOUT_DPI0                                0x2
> +#define RDMA0_SOUT_DPI1                                0x3
> +#define RDMA0_SOUT_DSI1                                0x1
> +#define RDMA0_SOUT_DSI2                                0x4
> +#define RDMA0_SOUT_DSI3                                0x5
> +#define RDMA1_SOUT_DPI0                                0x2
> +#define RDMA1_SOUT_DPI1                                0x3
> +#define RDMA1_SOUT_DSI1                                0x1
> +#define RDMA1_SOUT_DSI2                                0x4
> +#define RDMA1_SOUT_DSI3                                0x5
> +#define RDMA2_SOUT_DPI0                                0x2
> +#define RDMA2_SOUT_DPI1                                0x3
> +#define RDMA2_SOUT_DSI1                                0x1
> +#define RDMA2_SOUT_DSI2                                0x4
> +#define RDMA2_SOUT_DSI3                                0x5
> +#define DPI0_SEL_IN_RDMA1                      0x1
> +#define DPI0_SEL_IN_RDMA2                      0x3
> +#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> +#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> +#define DSI0_SEL_IN_RDMA1                      0x1
> +#define DSI0_SEL_IN_RDMA2                      0x4
> +#define DSI1_SEL_IN_RDMA1                      0x1
> +#define DSI1_SEL_IN_RDMA2                      0x4
> +#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> +#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> +#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> +#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> +#define COLOR1_SEL_IN_OVL1                     0x1
> +
> +#define OVL_MOUT_EN_RDMA                       0x1
> +#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> +#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> +#define DSI_SEL_IN_BLS                         0x0
> +#define DPI_SEL_IN_BLS                         0x0
> +#define DSI_SEL_IN_RDMA                                0x1
> +
> +struct mtk_mmsys_driver_data {
> +       const char *clk_driver;
> +};
> +
> +static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> +       .clk_driver = "clk-mt2701-mm",
> +};
> +
> +static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
> +       .clk_driver = "clk-mt2712-mm",
> +};
> +
> +static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
> +       .clk_driver = "clk-mt6779-mm",
> +};
> +
> +static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
> +       .clk_driver = "clk-mt6797-mm",
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> +       .clk_driver = "clk-mt8173-mm",
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> +       .clk_driver = "clk-mt8183-mm",
> +};
> +
> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> +                                         enum mtk_ddp_comp_id next,
> +                                         unsigned int *addr)
> +{
> +       unsigned int value;
> +
> +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> +               value = OVL0_MOUT_EN_COLOR0;
> +       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> +               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> +               value = OVL_MOUT_EN_RDMA;
> +       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +               value = OD_MOUT_EN_RDMA0;
> +       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> +               value = UFOE_MOUT_EN_DSI0;
> +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> +               value = OVL1_MOUT_EN_COLOR1;
> +       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> +               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> +               value = GAMMA_MOUT_EN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +               value = OD1_MOUT_EN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DPI0;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DPI1;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DSI1;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DSI2;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DSI3;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DSI1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DSI2;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DSI3;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DPI0;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DPI1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DPI0;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DPI1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DSI1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DSI2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DSI3;
> +       } else {
> +               value = 0;
> +       }
> +
> +       return value;
> +}
> +
> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> +                                        enum mtk_ddp_comp_id next,
> +                                        unsigned int *addr)
> +{
> +       unsigned int value;
> +
> +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> +               value = COLOR0_SEL_IN_OVL0;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI0_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI1_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI0_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +               value = DSI1_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI2_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +               value = DSI3_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI0_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI1_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI0_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +               value = DSI1_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI2_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI3_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> +               value = COLOR1_SEL_IN_OVL1;
> +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DSI_SEL;
> +               value = DSI_SEL_IN_BLS;
> +       } else {
> +               value = 0;
> +       }
> +
> +       return value;
> +}
> +
> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> +                                  enum mtk_ddp_comp_id cur,
> +                                  enum mtk_ddp_comp_id next)
> +{
> +       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> +               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> +               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> +               writel_relaxed(DSI_SEL_IN_RDMA,
> +                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> +               writel_relaxed(DPI_SEL_IN_BLS,
> +                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> +       }
> +}
> +
> +void mtk_mmsys_ddp_connect(struct device *dev,
> +                          enum mtk_ddp_comp_id cur,
> +                          enum mtk_ddp_comp_id next)
> +{
> +       void __iomem *config_regs = dev_get_drvdata(dev);
> +       unsigned int addr, value, reg;
> +
> +       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(config_regs + addr) | value;
> +               writel_relaxed(reg, config_regs + addr);
> +       }
> +
> +       mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
> +
> +       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(config_regs + addr) | value;
> +               writel_relaxed(reg, config_regs + addr);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> +
> +void mtk_mmsys_ddp_disconnect(struct device *dev,
> +                             enum mtk_ddp_comp_id cur,
> +                             enum mtk_ddp_comp_id next)
> +{
> +       void __iomem *config_regs = dev_get_drvdata(dev);
> +       unsigned int addr, value, reg;
> +
> +       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(config_regs + addr) & ~value;
> +               writel_relaxed(reg, config_regs + addr);
> +       }
> +
> +       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(config_regs + addr) & ~value;
> +               writel_relaxed(reg, config_regs + addr);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> +
> +static int mtk_mmsys_probe(struct platform_device *pdev)
> +{
> +       const struct mtk_mmsys_driver_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct platform_device *clks;
> +       struct platform_device *drm;
> +       void __iomem *config_regs;
> +       int ret;
> +
> +       config_regs = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(config_regs)) {
> +               ret = PTR_ERR(config_regs);
> +               dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, config_regs);
> +
> +       data = of_device_get_match_data(&pdev->dev);
> +
> +       clks = platform_device_register_data(&pdev->dev, data->clk_driver,
> +                                            PLATFORM_DEVID_AUTO, NULL, 0);
> +       if (IS_ERR(clks))
> +               return PTR_ERR(clks);
> +
> +       drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
> +                                           PLATFORM_DEVID_AUTO, NULL, 0);
> +       if (IS_ERR(drm)) {
> +               platform_device_unregister(clks);
> +               return PTR_ERR(drm);
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id of_match_mtk_mmsys[] = {
> +       {
> +               .compatible = "mediatek,mt2701-mmsys",
> +               .data = &mt2701_mmsys_driver_data,
> +       },
> +       {
> +               .compatible = "mediatek,mt2712-mmsys",
> +               .data = &mt2712_mmsys_driver_data,
> +       },
> +       {
> +               .compatible = "mediatek,mt6779-mmsys",
> +               .data = &mt6779_mmsys_driver_data,
> +       },
> +       {
> +               .compatible = "mediatek,mt6797-mmsys",
> +               .data = &mt6797_mmsys_driver_data,
> +       },
> +       {
> +               .compatible = "mediatek,mt8173-mmsys",
> +               .data = &mt8173_mmsys_driver_data,
> +       },
> +       {
> +               .compatible = "mediatek,mt8183-mmsys",
> +               .data = &mt8183_mmsys_driver_data,
> +       },
> +       { }
> +};
> +
> +static struct platform_driver mtk_mmsys_drv = {
> +       .driver = {
> +               .name = "mtk-mmsys",
> +               .of_match_table = of_match_mtk_mmsys,
> +       },
> +       .probe = mtk_mmsys_probe,
> +};
> +
> +builtin_platform_driver(mtk_mmsys_drv);
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> deleted file mode 100644
> index 18f9397..0000000
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ /dev/null
> @@ -1,373 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2014 MediaTek Inc.
> - * Author: James Liao <jamesjj.liao@mediatek.com>
> - */
> -
> -#include <linux/device.h>
> -#include <linux/io.h>
> -#include <linux/of_device.h>
> -#include <linux/platform_device.h>
> -#include <linux/soc/mediatek/mtk-mmsys.h>
> -
> -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> -#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> -#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> -#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> -#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> -
> -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> -#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> -#define DISP_REG_CONFIG_DSI_SEL                        0x050
> -#define DISP_REG_CONFIG_DPI_SEL                        0x064
> -
> -#define OVL0_MOUT_EN_COLOR0                    0x1
> -#define OD_MOUT_EN_RDMA0                       0x1
> -#define OD1_MOUT_EN_RDMA1                      BIT(16)
> -#define UFOE_MOUT_EN_DSI0                      0x1
> -#define COLOR0_SEL_IN_OVL0                     0x1
> -#define OVL1_MOUT_EN_COLOR1                    0x1
> -#define GAMMA_MOUT_EN_RDMA1                    0x1
> -#define RDMA0_SOUT_DPI0                                0x2
> -#define RDMA0_SOUT_DPI1                                0x3
> -#define RDMA0_SOUT_DSI1                                0x1
> -#define RDMA0_SOUT_DSI2                                0x4
> -#define RDMA0_SOUT_DSI3                                0x5
> -#define RDMA1_SOUT_DPI0                                0x2
> -#define RDMA1_SOUT_DPI1                                0x3
> -#define RDMA1_SOUT_DSI1                                0x1
> -#define RDMA1_SOUT_DSI2                                0x4
> -#define RDMA1_SOUT_DSI3                                0x5
> -#define RDMA2_SOUT_DPI0                                0x2
> -#define RDMA2_SOUT_DPI1                                0x3
> -#define RDMA2_SOUT_DSI1                                0x1
> -#define RDMA2_SOUT_DSI2                                0x4
> -#define RDMA2_SOUT_DSI3                                0x5
> -#define DPI0_SEL_IN_RDMA1                      0x1
> -#define DPI0_SEL_IN_RDMA2                      0x3
> -#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> -#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> -#define DSI0_SEL_IN_RDMA1                      0x1
> -#define DSI0_SEL_IN_RDMA2                      0x4
> -#define DSI1_SEL_IN_RDMA1                      0x1
> -#define DSI1_SEL_IN_RDMA2                      0x4
> -#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> -#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> -#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> -#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> -#define COLOR1_SEL_IN_OVL1                     0x1
> -
> -#define OVL_MOUT_EN_RDMA                       0x1
> -#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> -#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> -#define DSI_SEL_IN_BLS                         0x0
> -#define DPI_SEL_IN_BLS                         0x0
> -#define DSI_SEL_IN_RDMA                                0x1
> -
> -struct mtk_mmsys_driver_data {
> -       const char *clk_driver;
> -};
> -
> -static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> -       .clk_driver = "clk-mt2701-mm",
> -};
> -
> -static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
> -       .clk_driver = "clk-mt2712-mm",
> -};
> -
> -static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
> -       .clk_driver = "clk-mt6779-mm",
> -};
> -
> -static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
> -       .clk_driver = "clk-mt6797-mm",
> -};
> -
> -static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> -       .clk_driver = "clk-mt8173-mm",
> -};
> -
> -static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> -       .clk_driver = "clk-mt8183-mm",
> -};
> -
> -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> -                                         enum mtk_ddp_comp_id next,
> -                                         unsigned int *addr)
> -{
> -       unsigned int value;
> -
> -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> -               value = OVL0_MOUT_EN_COLOR0;
> -       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> -               value = OVL_MOUT_EN_RDMA;
> -       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> -               value = OD_MOUT_EN_RDMA0;
> -       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> -               value = UFOE_MOUT_EN_DSI0;
> -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> -               value = OVL1_MOUT_EN_COLOR1;
> -       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> -               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> -               value = GAMMA_MOUT_EN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> -               value = OD1_MOUT_EN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DPI0;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DPI1;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DSI1;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DSI2;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DSI3;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DSI1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DSI2;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DSI3;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DPI0;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DPI1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DPI0;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DPI1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DSI1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DSI2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DSI3;
> -       } else {
> -               value = 0;
> -       }
> -
> -       return value;
> -}
> -
> -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> -                                        enum mtk_ddp_comp_id next,
> -                                        unsigned int *addr)
> -{
> -       unsigned int value;
> -
> -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> -               value = COLOR0_SEL_IN_OVL0;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI0_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI1_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI0_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -               value = DSI1_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI2_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -               value = DSI3_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI0_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI1_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI0_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -               value = DSI1_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI2_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI3_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> -               value = COLOR1_SEL_IN_OVL1;
> -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DSI_SEL;
> -               value = DSI_SEL_IN_BLS;
> -       } else {
> -               value = 0;
> -       }
> -
> -       return value;
> -}
> -
> -static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> -                                  enum mtk_ddp_comp_id cur,
> -                                  enum mtk_ddp_comp_id next)
> -{
> -       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> -               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> -               writel_relaxed(DSI_SEL_IN_RDMA,
> -                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> -               writel_relaxed(DPI_SEL_IN_BLS,
> -                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> -       }
> -}
> -
> -void mtk_mmsys_ddp_connect(struct device *dev,
> -                          enum mtk_ddp_comp_id cur,
> -                          enum mtk_ddp_comp_id next)
> -{
> -       void __iomem *config_regs = dev_get_drvdata(dev);
> -       unsigned int addr, value, reg;
> -
> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> -       if (value) {
> -               reg = readl_relaxed(config_regs + addr) | value;
> -               writel_relaxed(reg, config_regs + addr);
> -       }
> -
> -       mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
> -
> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> -       if (value) {
> -               reg = readl_relaxed(config_regs + addr) | value;
> -               writel_relaxed(reg, config_regs + addr);
> -       }
> -}
> -EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> -
> -void mtk_mmsys_ddp_disconnect(struct device *dev,
> -                             enum mtk_ddp_comp_id cur,
> -                             enum mtk_ddp_comp_id next)
> -{
> -       void __iomem *config_regs = dev_get_drvdata(dev);
> -       unsigned int addr, value, reg;
> -
> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> -       if (value) {
> -               reg = readl_relaxed(config_regs + addr) & ~value;
> -               writel_relaxed(reg, config_regs + addr);
> -       }
> -
> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> -       if (value) {
> -               reg = readl_relaxed(config_regs + addr) & ~value;
> -               writel_relaxed(reg, config_regs + addr);
> -       }
> -}
> -EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> -
> -static int mtk_mmsys_probe(struct platform_device *pdev)
> -{
> -       const struct mtk_mmsys_driver_data *data;
> -       struct device *dev = &pdev->dev;
> -       struct platform_device *clks;
> -       struct platform_device *drm;
> -       void __iomem *config_regs;
> -       int ret;
> -
> -       config_regs = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(config_regs)) {
> -               ret = PTR_ERR(config_regs);
> -               dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, config_regs);
> -
> -       data = of_device_get_match_data(&pdev->dev);
> -
> -       clks = platform_device_register_data(&pdev->dev, data->clk_driver,
> -                                            PLATFORM_DEVID_AUTO, NULL, 0);
> -       if (IS_ERR(clks))
> -               return PTR_ERR(clks);
> -
> -       drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
> -                                           PLATFORM_DEVID_AUTO, NULL, 0);
> -       if (IS_ERR(drm)) {
> -               platform_device_unregister(clks);
> -               return PTR_ERR(drm);
> -       }
> -
> -       return 0;
> -}
> -
> -static const struct of_device_id of_match_mtk_mmsys[] = {
> -       {
> -               .compatible = "mediatek,mt2701-mmsys",
> -               .data = &mt2701_mmsys_driver_data,
> -       },
> -       {
> -               .compatible = "mediatek,mt2712-mmsys",
> -               .data = &mt2712_mmsys_driver_data,
> -       },
> -       {
> -               .compatible = "mediatek,mt6779-mmsys",
> -               .data = &mt6779_mmsys_driver_data,
> -       },
> -       {
> -               .compatible = "mediatek,mt6797-mmsys",
> -               .data = &mt6797_mmsys_driver_data,
> -       },
> -       {
> -               .compatible = "mediatek,mt8173-mmsys",
> -               .data = &mt8173_mmsys_driver_data,
> -       },
> -       {
> -               .compatible = "mediatek,mt8183-mmsys",
> -               .data = &mt8183_mmsys_driver_data,
> -       },
> -       { }
> -};
> -
> -static struct platform_driver mtk_mmsys_drv = {
> -       .driver = {
> -               .name = "mtk-mmsys",
> -               .of_match_table = of_match_mtk_mmsys,
> -       },
> -       .probe = mtk_mmsys_probe,
> -};
> -
> -builtin_platform_driver(mtk_mmsys_drv);
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
