Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88124C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 07:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E42221FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 07:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="18+0el4B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FkJC1Qkz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E42221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ANW+ss4XN0FEMc0N5CZInwRp9wgqe/QTCiHqX8JkALQ=; b=18+0el4BKSGE75GltyAZvnjb+
	qqnInJ2kdwQFxYNhJY8n/WTdFyrCuouJ6ow3kr864YqRVX5BVy8dDqPTS+G+EfJ2KkdPUJ8FAKWDr
	4U3pp2r+rGrg28NRqsH4i2CTv+2T57iaOB1K4zXrGFMm7PzKfsCm09P6+TZQ8Wx5bjrKIjbu7T0VA
	zskL8dlTZYX6DA7NquClTskeI2lLnp5zIcxHeQuNasYU01vxE0Y2kAWpa31F2DvamvM04EDowz2tr
	NtG+Xk/CV/oiEjhZqfDYoyQLG3JonEJkncB5RIK34k0dczd2TMcFTD2VU30iiv1EhLgef+FlmqX4k
	ab2o7iXdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kevVS-0003Ps-Co; Tue, 17 Nov 2020 07:34:26 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kevVO-0003Op-Ln
 for linux-mediatek@lists.infradead.org; Tue, 17 Nov 2020 07:34:23 +0000
Received: by mail-il1-x144.google.com with SMTP id q1so17684387ilt.6
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 23:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6HDQ36IQmVwckUFR1jBquv3GATc8YP+i067nuhtqXMU=;
 b=FkJC1QkzBGq1xiw3ZYZUvrgU3D/qhzlZFl95blKrpdFb0mMjRtHTGcsKULzeSqxcLD
 TcJtuOPAQKUv0SRgMRAb2Z390dosWlnmIoZX2RRjoNzGmW3ofFHJCaJ9FOP1FI+nBpb+
 9dJ7L2uxkDZN8uJKmzLsnnFBlw4TCwwcwwkmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6HDQ36IQmVwckUFR1jBquv3GATc8YP+i067nuhtqXMU=;
 b=IVQIQspl2bwLUxY91X2vVCq3nhLDYGthaIhSYy10uLC1vr6He9CNu1SJDubWxzMKvO
 dB/e+LFUKPUB6hUfLd5+S8w91YVCSj38pxWG5ucqEctiJ9j77cc/P5wmhZ/xAuD0LLNh
 LLexNnAJkT3U/FnZP3ZM1GucnV9ND1HWqmdJprRcMqy+2JOerrrxs95vzy3oUYOwdt9O
 4cCUY/aeTFOw3HO+LrzrznXnomF/HRIJpE1ZEc3riH1qL7DKH406Kj04XLwMlu/cySDZ
 J0+RzBHp2DN+br5a933/GyLFIvrQABxibK5HONggmeDfagQaMXbwoWXEbjDaFiv61TVt
 0jkw==
X-Gm-Message-State: AOAM532PhK6GsQmlpeuINxBYrizbKrqXIdj9fXDWBh9S20pw4ZcC4Rk/
 cHOEsQXAzJ2+aNFwrcNiOSCeglkexZpkbsIacuJCfQ==
X-Google-Smtp-Source: ABdhPJyhldjhwb1mLZC438M7LVHuxra/t1HCNICdkNriJ7L2AIbB4FEpFKlINz1Bn9qS+8p5dsClFMJU1CAg1+wejAE=
X-Received: by 2002:a92:dd87:: with SMTP id g7mr12363454iln.102.1605598458861; 
 Mon, 16 Nov 2020 23:34:18 -0800 (PST)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-5-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 17 Nov 2020 15:33:53 +0800
Message-ID: <CAJMQK-hAhu00a4X3SWZVFJLodDqAdTMZi4TmZPFJN=O6VM=DCQ@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 4/7] mtk-mmsys: add mt8183 mmsys support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_023422_795509_067FA833 
X-CRM114-Status: GOOD (  22.39  )
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
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 8, 2020 at 2:53 AM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> add mt8183 mmsys support
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/Makefile       |   1 +
>  drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 154 ++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          |   1 +
>  3 files changed, 156 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c
>
> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> index 33b0dab..62cfedf 100644
> --- a/drivers/soc/mediatek/mmsys/Makefile
> +++ b/drivers/soc/mediatek/mmsys/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += mt2701-mmsys.o
> +obj-y += mt8183-mmsys.o
> diff --git a/drivers/soc/mediatek/mmsys/mt8183-mmsys.c b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
> new file mode 100644
> index 0000000..e5170b5
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +
> +#define DISP_OVL0_MOUT_EN              0xf00
> +#define DISP_OVL0_2L_MOUT_EN           0xf04
> +#define DISP_OVL1_2L_MOUT_EN           0xf08
> +#define DISP_DITHER0_MOUT_EN           0xf0c
> +#define DISP_PATH0_SEL_IN              0xf24
> +#define DISP_DSI0_SEL_IN               0xf2c
> +#define DISP_DPI0_SEL_IN               0xf30
> +#define DISP_RDMA0_SOUT_SEL_IN         0xf50
> +#define DISP_RDMA1_SOUT_SEL_IN         0xf54
> +
> +#define OVL0_MOUT_EN_OVL0_2L                   BIT(4)
> +#define OVL0_2L_MOUT_EN_DISP_PATH0             BIT(0)
> +#define OVL1_2L_MOUT_EN_RDMA1                  BIT(4)
> +#define DITHER0_MOUT_IN_DSI0                   BIT(0)
> +#define DISP_PATH0_SEL_IN_OVL0_2L              0x1
> +#define DSI0_SEL_IN_RDMA0                      0x1
> +#define DSI0_SEL_IN_RDMA1                      0x3
> +#define DPI0_SEL_IN_RDMA0                      0x1
> +#define DPI0_SEL_IN_RDMA1                      0x2
> +#define RDMA0_SOUT_COLOR0                      0x1
> +#define RDMA1_SOUT_DSI0                                0x1
> +
> +struct mmsys_path_sel {
> +       enum mtk_ddp_comp_id cur;
> +       enum mtk_ddp_comp_id next;
> +       u32 addr;
> +       u32 val;
> +};
> +
> +static struct mmsys_path_sel mmsys_mout_en[] = {
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +               DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_OVL0_2L,
> +       },
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               DISP_OVL0_2L_MOUT_EN, OVL0_2L_MOUT_EN_DISP_PATH0,
> +       },
> +       {
> +               DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
> +               DISP_OVL1_2L_MOUT_EN, OVL1_2L_MOUT_EN_RDMA1,
> +       },
> +       {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               DISP_DITHER0_MOUT_EN, DITHER0_MOUT_IN_DSI0,
> +       },
> +};
> +
> +static struct mmsys_path_sel mmsys_sel_in[] = {
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               DISP_PATH0_SEL_IN, DISP_PATH0_SEL_IN_OVL0_2L,
> +       },
> +       {
> +               DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +               DISP_DPI0_SEL_IN, DPI0_SEL_IN_RDMA1,
> +       },
> +};
> +
> +static struct mmsys_path_sel mmsys_sout_sel[] = {
> +       {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +               DISP_RDMA0_SOUT_SEL_IN, RDMA0_SOUT_COLOR0,
> +       },
> +};
> +
> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> +                                         enum mtk_ddp_comp_id next,
> +                                         unsigned int *addr)
> +{
> +       u32 i;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_mout_en); i++) {
> +               path = &mmsys_mout_en[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       return path->val;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> +                                        enum mtk_ddp_comp_id next,
> +                                        unsigned int *addr)
> +{
> +       u32 i;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sel_in); i++) {
> +               path = &mmsys_sel_in[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       return path->val;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> +                                  enum mtk_ddp_comp_id cur,
> +                                  enum mtk_ddp_comp_id next)
> +{
> +       u32 i;
> +       u32 val = 0;

This variable is unused.

> +       u32 addr = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sout_sel); i++) {
> +               path = &mmsys_sout_sel[i];
> +               if (cur == path->cur && next == path->next) {
> +                       addr = path->addr;
> +                       writel_relaxed(path->val, config_regs + addr);
> +                       return;
> +               }
> +       }
> +}
> +
> +static struct mtk_mmsys_conn_funcs mmsys_funcs = {
> +       .mout_en = mtk_mmsys_ddp_mout_en,
> +       .sel_in = mtk_mmsys_ddp_sel_in,
> +       .sout_sel = mtk_mmsys_ddp_sout_sel,
> +};
> +
> +static int mmsys_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +
> +       mtk_mmsys_register_conn_funcs(dev->parent, &mmsys_funcs);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver mmsys_drv = {
> +       .probe = mmsys_probe,
> +       .driver = {
> +               .name = "mt8183-mmsys",
> +       },
> +};
> +
> +builtin_platform_driver(mmsys_drv);
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 605b992..6a451ac 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -47,6 +47,7 @@ struct mtk_mmsys_private_data {
>
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>         .clk_driver = "clk-mt8183-mm",
> +       .mmsys_driver = "mt8183-mmsys",
>  };
>
>  void mtk_mmsys_ddp_connect(struct device *dev,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
