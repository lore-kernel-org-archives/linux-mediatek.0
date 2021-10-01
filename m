Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 06:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9EC561440
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 06:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9EC561440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8np/1vjrQo41ggJH0IPHM+dztIMrEaIjarvWRZ6kuc=; b=GCRsW5AAI4aIwv
	zzhyceLJBSWUWUz27saQP2KPEobErwOnsZaSJ1EtOY/itbUvkIH9FQSLxUYI1kPVnF6d6U0d5LM+D
	2dRY3l73NnRfpZaCKN8bba01/3b/oZwSrBzoyjbI2eVZluu3BAeV2luCLu1o0z4jhT9C+o88qvH/u
	u1ife0icJN8lxcOl1igE/afr9WrVekBNkeqXM7JJXyz5frxu0fXrDNmbe35uA2EgNyA5651kr99vE
	6y0liKfqsWvb+dmlU+jp2c84jTR1Fh3Hmfz6qdxRFdaw7j8vH5W9YHcG8aFmrPzUIiPU7psd95wN9
	2L0vopKZPh9reCga7Yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWCKM-00GpgL-To; Fri, 01 Oct 2021 06:47:26 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWCK9-00Gpd8-Sx; Fri, 01 Oct 2021 06:47:16 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so10389509otb.1; 
 Thu, 30 Sep 2021 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Croa0ikRg9ed7rFOcCt98+2kFoVofysMYP5kvf8qbog=;
 b=fA5rnPSNUkYrQXNp3FXg4tEGdE2X9USp4E5HWLMS9HhTrbz7m1xj2vWuBF3H85WG2B
 5WJON+ymoXJtw2bXKL+yULUfTvp/3V3f1/PNRiFnp9yHKPbRE69BoN68dTCu8XXT7owr
 RvgHLiJd+59LDmAoF/gMf+4tKrC7HgWvZVecRFGY6YD9GBo7DVXEeXTDhzvwt4m7C3ap
 01Yc7v8JsSt37Aol28hML1XV8o9tPrhnRHcOGg7r8qwtkSxjXlr4kba9YkwQvdgl36p4
 1O2WNHWXA4WFAl3Rra6FJAY5Cw6MTA+EowWwnFPTTkW5FCfE8DzXaJ5EgqkwL01vyzlf
 4xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Croa0ikRg9ed7rFOcCt98+2kFoVofysMYP5kvf8qbog=;
 b=0z5ArRdVMsM340YPu+HXLWIogAgkNy97w13jRISt7vv7GhhQeUzqR+lRHNguxjgFoc
 ZJ50hO96oVGrXtOcPmxYb65lhFRUM+TIP/oxbNew90ex4LUsD7rs/5xM1TB8xAWyRByS
 5h2lL9hips+NVoHBjGaVRZGTLvme/A35JWhvUeNgPJAmtlLXSv4aIZp0qDZLeH+IMKra
 9hwuqKQzL4yg8jTUx77mP9LbdopbTb50WFxXti+2vvBIxlVv4mvRzT5x/kiLiRb+N0C1
 d2pEJX7Yzr6JJl3YUwNH1WpeFeAgDB7Fssz/kR7wmWtXqbOmhi8yAFYBIZcgeqLqUhFo
 9erQ==
X-Gm-Message-State: AOAM5326jKKawArXQKcFBTPj2Wq5Md6ZQJqhMOxN/0SgtODJo7EdqIqd
 3UB4xWPgRLisw4k+mLr3Mbf4Ti2WeuJJ/l21r2E=
X-Google-Smtp-Source: ABdhPJwyAvuHVKGewNwRCIDt87Kj/ThUttEmpLFrhQaYhgZQQzhGmQs83LQwjcJqZTMUntD3DPp4Ix9FvG/r6NGxUKc=
X-Received: by 2002:a9d:369:: with SMTP id 96mr2980930otv.150.1633070829661;
 Thu, 30 Sep 2021 23:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210930135944.6125-1-yongqiang.niu@mediatek.com>
 <20210930135944.6125-3-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930135944.6125-3-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 1 Oct 2021 08:46:58 +0200
Message-ID: <CAFqH_53w6LkdMM4fPEFt_nwgRs9MRFkbi9yMjK9B7TqV4e8wng@mail.gmail.com>
Subject: Re: [PATCH v9,
 2/2] soc: mediatek: mmsys: Add mt8192 mmsys routing table
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_234713_947721_9E66B542 
X-CRM114-Status: GOOD (  19.14  )
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

Hi Yongqiang,

This patch already have my reviewed tag but I just noticed a small nit


Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 30
de set. 2021 a les 16:00:
>
> mt8192 has different routing registers than mt8183
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/soc/mediatek/mt8192-mmsys.h | 77 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    | 11 +++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
>
> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
> new file mode 100644
> index 000000000000..7ea1531ee8af
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8192_MMSYS_H
> +#define __SOC_MEDIATEK_MT8192_MMSYS_H
> +
> +#define MT8192_MMSYS_OVL_MOUT_EN               0xf04
> +#define MT8192_DISP_OVL1_2L_MOUT_EN            0xf08
> +#define MT8192_DISP_OVL0_2L_MOUT_EN            0xf18
> +#define MT8192_DISP_OVL0_MOUT_EN               0xf1c
> +#define MT8192_DISP_RDMA0_SEL_IN               0xf2c
> +#define MT8192_DISP_RDMA0_SOUT_SEL             0xf30
> +#define MT8192_DISP_CCORR0_SOUT_SEL            0xf34
> +#define MT8192_DISP_AAL0_SEL_IN                        0xf38
> +#define MT8192_DISP_DITHER0_MOUT_EN            0xf3c
> +#define MT8192_DISP_DSI0_SEL_IN                        0xf40
> +#define MT8192_DISP_OVL2_2L_MOUT_EN            0xf4c
> +
> +#define MT8192_DISP_OVL0_GO_BLEND                      BIT(0)
> +#define MT8192_DITHER0_MOUT_IN_DSI0                    BIT(0)
> +#define MT8192_OVL0_MOUT_EN_DISP_RDMA0                 BIT(0)
> +#define MT8192_OVL2_2L_MOUT_EN_RDMA4                   BIT(0)
> +#define MT8192_DISP_OVL0_GO_BG                         BIT(1)
> +#define MT8192_DISP_OVL0_2L_GO_BLEND                   BIT(2)
> +#define MT8192_DISP_OVL0_2L_GO_BG                      BIT(3)
> +#define MT8192_OVL1_2L_MOUT_EN_RDMA1                   BIT(4)
> +#define MT8192_OVL0_MOUT_EN_OVL0_2L                    BIT(4)
> +#define MT8192_RDMA0_SEL_IN_OVL0_2L                    0x3
> +#define MT8192_RDMA0_SOUT_COLOR0                       0x1
> +#define MT8192_CCORR0_SOUT_AAL0                                0x1
> +#define MT8192_AAL0_SEL_IN_CCORR0                      0x1
> +#define MT8192_DSI0_SEL_IN_DITHER0                     0x1
> +
> +static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
> +               MT8192_OVL0_MOUT_EN_DISP_RDMA0
> +       }, {
> +               DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
> +               MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4,
> +               MT8192_OVL2_2L_MOUT_EN_RDMA4
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0,
> +               MT8192_DITHER0_MOUT_IN_DSI0
> +       }, {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L,
> +               MT8192_RDMA0_SEL_IN_OVL0_2L
> +       }, {
> +               DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +               MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
> +               MT8192_AAL0_SEL_IN_CCORR0
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
> +               MT8192_DSI0_SEL_IN_DITHER0
> +       }, {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +               MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,
> +               MT8192_RDMA0_SOUT_COLOR0
> +       }, {
> +               DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +               MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0,
> +               MT8192_CCORR0_SOUT_AAL0
> +       }, {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +               MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
> +               MT8192_DISP_OVL0_GO_BG,
> +       }, {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
> +               MT8192_DISP_OVL0_2L_GO_BLEND,
> +       }
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a78e88f27b62..6e97d1468183 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -14,6 +14,7 @@
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
>  #include "mt8365-mmsys.h"
> +#include "mt8192-mmsys.h"
>
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>         .clk_driver = "clk-mt2701-mm",
> @@ -59,6 +60,12 @@ static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>         .num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
> +       .clk_driver = "clk-mt8192-mm",
> +       .routes = mmsys_mt8192_routing_table,
> +       .num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> +};
> +

For better readability it would be nice if you put this structure by
SoC order. That's before mt8365 struct and after mt8183 struct.

>  struct mtk_mmsys {
>         void __iomem *regs;
>         const struct mtk_mmsys_driver_data *data;
> @@ -171,6 +178,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>                 .compatible = "mediatek,mt8365-mmsys",
>                 .data = &mt8365_mmsys_driver_data,
>         },
> +       {
> +               .compatible = "mediatek,mt8192-mmsys",
> +               .data = &mt8192_mmsys_driver_data,
> +       },

The same here,  for better readability would be nice if you put this
fields by SoC order. That's before mt8365 fields and after mt8183
fields.

Thanks,
  Enric

>         { }
>  };
>
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
