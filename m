Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D019C433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:49:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A97206D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 13:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yDgtNK24";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F78bU+N1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A97206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u+m/TBzdFaelbDp7xfZLrHd5aOSBn121LozehGHEKH8=; b=yDgtNK24I5dFtldTKc+LeOlFU
	k5JmpV/FXj5KKjjsCnNv4vfVVomSjv59qmSxIrl3vK2+CvgxNMXFntD6d6yESMgCMSjpw4+V3oH6u
	ytwNJhMX//T3ANdMz1ZqqGImBhKFsLdIDQJGkuGFlrT2aDF0P9zsqKcLBF9zWanGA9uKM0X3MY7ON
	n0YbT8vUJ23xqovprVzb9DQLCZrHNg6VMvxfpr5N/UmkgJV8i7UDWa5wjOSvo/AFMAIi3uOgh5udB
	k6lNDQRFzjmXQMXD5kPRmmDnnb9t8N//4iqyngIjpZe2Dt4PKebHDRclkb0gDUNbQS5GzmsOvTwqU
	jftP2g2fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyy4t-0006TK-PA; Fri, 24 Jul 2020 13:49:35 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyy4n-0006R5-Uf
 for linux-mediatek@lists.infradead.org; Fri, 24 Jul 2020 13:49:32 +0000
Received: by mail-ua1-x943.google.com with SMTP id o25so2976490uar.1
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2020 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cSrp1L0eUQyzHpgZnMO7fi3+svViuZdK8HvAiaNtnzM=;
 b=F78bU+N1HV7Wf9RlToBEZUQmyTEQaGIODTRiaDKs4yyB4G0U6YuJVaYuj/IlLQ3oZM
 O1NCJCME2Xb1tyaz1/5GjQxVDXctNV1lXegkvewW8GUF6DGajF+dzrAy6d93FepB9vAW
 RDXsxkvTuWmVchB9VfqVQaKuv6wbtFVFJ9FPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cSrp1L0eUQyzHpgZnMO7fi3+svViuZdK8HvAiaNtnzM=;
 b=uleeH0OBGQJpTR6O0v6UASS528VZkIVB2/3BeeaSdoivDwooirZeTw9jyEiBoq1Zci
 wMbe+92b1+8O6cw4lvKYRjcMwbgVcxOa2X6p+HpP39/lwXBjJNcuQFG/dJ4zuu5VMrJc
 Zr3f2niAVJclwdkhDQ2NEHirjguo4ghZJlyKz5rFR26Xx5TXpmZ9TwfWfKMoNV72cPI9
 //WZVYVjsu/UEHiFaluFiTDC6jbVtX6EeesNHymfMprmEnt/od/Y/0Kf3TyMO+RJNonu
 XjhIfqrfp3mK468+YgL/mYy1broS0w+Aj4Lc5dpax9dmTmSOBNY7OhSOWRiCkdmnWJsH
 Yh8Q==
X-Gm-Message-State: AOAM530+aW6bEXVVJV8/mQ3P6qhbDSkzreGHmId6sf0TMueK8mmhBqWu
 QA4UZChMKAE4qgHRR1svnBP7Zaq8qK8u+AwnVlSuWw==
X-Google-Smtp-Source: ABdhPJz94abl2f4Bnx416rASWBY0nE0lUyqccXyLfxR6VRy06jZ8yfaI8YvKbdr25RJZ98fCM0mF202mtckT20J9JZs=
X-Received: by 2002:a9f:2338:: with SMTP id 53mr8106439uae.129.1595598567715; 
 Fri, 24 Jul 2020 06:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-4-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 24 Jul 2020 21:49:16 +0800
Message-ID: <CANMq1KDnk4QgO0=LdXY3zftRgOa_90qXPJHOrKsG2RgJeVVh5g@mail.gmail.com>
Subject: Re: [v7, PATCH 3/7] mtk-mmsys: add mt8183 mmsys support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_094930_053454_F161C70F 
X-CRM114-Status: GOOD (  20.03  )
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
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 10:05 AM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> add mt8183 mmsys support
>
> Feature: drm/mediatek
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/Makefile       |   1 +
>  drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 161 ++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          |   1 +
>  3 files changed, 163 insertions(+)
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
> index 0000000..9d5f276
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
> @@ -0,0 +1,161 @@
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
> +       u32 val = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_mout_en); i++) {
> +               path = &mmsys_mout_en[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       val = path->val;

return path->val?

> +                       break;
> +               }
> +       }
> +
> +       return val;

Then this becomes just return 0;

> +}
> +
> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> +                                        enum mtk_ddp_comp_id next,
> +                                        unsigned int *addr)
> +{
> +       u32 i;
> +       u32 val = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sel_in); i++) {
> +               path = &mmsys_sel_in[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       val = path->val;
> +                       break;
> +               }
> +       }
> +
> +       return val;

ditto

> +}
> +
> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> +                                  enum mtk_ddp_comp_id cur,
> +                                  enum mtk_ddp_comp_id next)
> +{
> +       u32 i;
> +       u32 val = 0;
> +       u32 addr = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sout_sel); i++) {
> +               path = &mmsys_sout_sel[i];
> +               if (cur == path->cur && next == path->next) {
> +                       addr = path->addr;
> +                       val = path->val;
> +                       break;

writel_relaxed(path->val, config_regs + path->addr);
return;

> +               }
> +       }
> +
> +       if (val)
> +               writel_relaxed(val, config_regs + addr);
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
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
