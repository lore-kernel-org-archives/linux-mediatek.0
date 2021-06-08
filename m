Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310B5C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 23:00:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82566135D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 23:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82566135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZV9y6suJOFLtpFnwwcS176bzFXHQ7yw8sgnwuI77Q8=; b=Xb2vvfX5OJYAYJ
	Nqj2YeOXTZoO1NFzdcsMGybyPmDIidf0aRJKUcjjyz0j+yv1ihOibdACmU4RoAYsjU+Bhqmc9xdqH
	F9D53uwoEwV2Rd9wO6ZnFB7OUgNA6qTtxCM5q6hVIMc+rpjAYCZYg4Qwa1kn4QgW2T2dUEtA9UJaX
	lZY2hW1EvTqnlAQP+8uf3JkBX6iGnggnL58C/DtLONJyvBGEsnPgIo9C10e9nyzCRm7NR3GJ3LIGV
	HFVlYJlbflfCPE1QSRw9UDjc13BJjFoQAdRTl9OCGYx5UDMb0KC/Fr4AIWJhcAbrHcij/z1VgrKv5
	UE9DXFhCsQ0tEFLwEmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqkhL-00Ajbp-VL; Tue, 08 Jun 2021 22:59:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqkh7-00AjaE-Pp; Tue, 08 Jun 2021 22:59:39 +0000
X-UUID: ec609f78663044e7ba277d9638ac5183-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZgVhymEJ5L4BrwipQZUOwi4OJWbvueZ20HB1FJkKDBM=; 
 b=mtESIbus3JwB9ymJUjjryP70c+fZs/nMHK6x2B+ZEYgiUG7KJ72RaiH9EHgltEtFaO4n8/4/z7kGtikUhA0uyGQSspl0rtz3b4wQexXx1VRwVF2BlBROZ+JRLaiuc1X/p4I8kIcwdbUjWSeNaHKF6kJ/tcuTOUXOtlCFf9uWXjk=;
X-UUID: ec609f78663044e7ba277d9638ac5183-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 133001944; Tue, 08 Jun 2021 15:59:33 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:59:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Jun 2021 06:59:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Jun 2021 06:59:23 +0800
Message-ID: <f7fd0d7038361c7efae54ba96924105baa3fb033.camel@mediatek.com>
Subject: Re: [PATCH v5, 4/4] soc: mediatek: mmsys: Add mt8192 mmsys routing
 table
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 9 Jun 2021 06:59:23 +0800
In-Reply-To: <1618236288-1617-5-git-send-email-yongqiang.niu@mediatek.com>
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_155937_869822_799327C8 
X-CRM114-Status: GOOD (  18.94  )
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

On Mon, 2021-04-12 at 22:04 +0800, Yongqiang Niu wrote:
> mt8192 has different routing registers than mt8183
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8192-mmsys.h | 68
> +++++++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    |  7 ++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h
> b/drivers/soc/mediatek/mt8192-mmsys.h
> new file mode 100644
> index 0000000..3179029
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8192_MMSYS_H
> +#define __SOC_MEDIATEK_MT8192_MMSYS_H
> +
> +#define MT8192_MMSYS_OVL_MOUT_EN		0xf04
> +#define MT8192_DISP_OVL1_2L_MOUT_EN		0xf08
> +#define MT8192_DISP_OVL0_2L_MOUT_EN		0xf18
> +#define MT8192_DISP_OVL0_MOUT_EN		0xf1c
> +#define MT8192_DISP_RDMA0_SEL_IN		0xf2c
> +#define MT8192_DISP_RDMA0_SOUT_SEL		0xf30
> +#define MT8192_DISP_CCORR0_SOUT_SEL		0xf34
> +#define MT8192_DISP_AAL0_SEL_IN			0xf38
> +#define MT8192_DISP_DITHER0_MOUT_EN		0xf3c
> +#define MT8192_DISP_DSI0_SEL_IN			0xf40
> +#define MT8192_DISP_OVL2_2L_MOUT_EN		0xf4c
> +
> +#define MT8192_DISP_OVL0_GO_BLEND			BIT(0)
> +#define MT8192_DITHER0_MOUT_IN_DSI0			BIT(0)
> +#define MT8192_OVL0_MOUT_EN_DISP_RDMA0			BIT(0)
> +#define MT8192_OVL2_2L_MOUT_EN_RDMA4			BIT(0)
> +#define MT8192_DISP_OVL0_GO_BG				BIT(1)
> +#define MT8192_DISP_OVL0_2L_GO_BLEND			BIT(2)
> +#define MT8192_DISP_OVL0_2L_GO_BG			BIT(3)
> +#define MT8192_OVL1_2L_MOUT_EN_RDMA1			BIT(4)
> +#define MT8192_OVL0_MOUT_EN_OVL0_2L			BIT(4)
> +#define MT8192_RDMA0_SEL_IN_OVL0_2L			0x3
> +#define MT8192_RDMA0_SOUT_COLOR0			0x1
> +#define MT8192_CCORR0_SOUT_AAL0				0x1
> +#define MT8192_AAL0_SEL_IN_CCORR0			0x1
> +#define MT8192_DSI0_SEL_IN_DITHER0			0x1
> +
> +static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] =
> {
> +	{
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8192_DISP_OVL0_2L_MOUT_EN,
> MT8192_OVL0_MOUT_EN_DISP_RDMA0,
> +	}, {
> +		DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
> +		MT8192_DISP_OVL2_2L_MOUT_EN,
> MT8192_OVL2_2L_MOUT_EN_RDMA4
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8192_DISP_DITHER0_MOUT_EN,
> MT8192_DITHER0_MOUT_IN_DSI0
> +	}, {
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L
> +	}, {
> +		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0
> +	}, {
> +		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +		MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
> +	}, {
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
> +	}
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
> +
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 79e5515..c755617 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -12,6 +12,7 @@
>  
>  #include "mtk-mmsys.h"
>  #include "mt8183-mmsys.h"
> +#include "mt8192-mmsys.h"
>  
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
> {
>  	.clk_driver = "clk-mt2701-mm",
> @@ -45,6 +46,12 @@
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
> {
> +	.clk_driver = "clk-mt8192-mm",
> +	.routes = mmsys_mt8192_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> +};
> +
>  struct mtk_mmsys {
>  	void __iomem *regs;
>  	const struct mtk_mmsys_driver_data *data;

Hi Yongqiang,

There is 8192 mmsys compatible data in [1], but seems to lack of it in
this patch, because mm clock driver will be bound to platform device 
in mtk_mmsys_probe.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-11-git-send-email-yongqiang.niu@mediatek.com/

Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
