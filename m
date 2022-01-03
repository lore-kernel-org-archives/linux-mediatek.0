Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F92C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 02:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0fDOzm+Ls/wuXIwzWyHJbt+10VRC5/G83Uv5yfh5xY=; b=dtRAFwLIPvwK4h
	c0GIvDYykv8PZjCyHbpzQlGJfPEDbaI8AjaMsLviAAE28YPEwHJVKJR2EZDgd5IAg2JnsD7A75PO4
	r15DO7cgapEK/q9RBVI332z9ViNjUJF1rX7uhUOeiywLyDs1unVdg3icV4XluDwYrpO9EOZZhJ8sG
	kEJCxgNYQBY3zJtIEeKcMwHJMsgRxRX04Y1zo65aEkHLMzEH5NxPJTpbs2225kE4PXchpBq//o34H
	5Eps12yxrhcvx/+4GZEl/YgDfynIckZVvly4siq1UdxFG7No/a25ud15NJqcUgMGvmeEUOszE8fSN
	VkXb66aWnlfY0MmJjNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Ch4-008IL9-R8; Mon, 03 Jan 2022 02:03:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Ch2-008IK4-0C; Mon, 03 Jan 2022 02:03:25 +0000
X-UUID: 51de43d231d049dd9a98b425da25a2fd-20220102
X-UUID: 51de43d231d049dd9a98b425da25a2fd-20220102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1235633857; Sun, 02 Jan 2022 19:03:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Jan 2022 18:03:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 3 Jan 2022 10:03:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 10:03:16 +0800
Message-ID: <73b6ac2405e72ba1479d84c226d0ede3ecc8dd72.camel@mediatek.com>
Subject: Re: [PATCH v10 15/22] drm/mediatek: add display merge async reset
 control
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 3 Jan 2022 10:03:16 +0800
In-Reply-To: <20211208024426.15595-16-nancy.lin@mediatek.com>
References: <20211208024426.15595-1-nancy.lin@mediatek.com>
 <20211208024426.15595-16-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_180324_058104_43D20064 
X-CRM114-Status: GOOD (  16.82  )
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

Hi, Nancy:

On Wed, 2021-12-08 at 10:44 +0800, Nancy.Lin wrote:
> Add merge async reset control in mtk_merge_stop. Async hw doesn't do
> self
> reset on each sof signal(start of frame), so need to reset the async
> to
> clear the hw status for the next merge start.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index 9dca145cfb71..177473fa8160 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -8,6 +8,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  
>  #include "mtk_drm_ddp_comp.h"
> @@ -79,6 +80,9 @@ void mtk_merge_stop(struct device *dev)
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
>  	mtk_merge_stop_cmdq(dev, NULL);
> +
> +	if (priv->async_clk)
> +		device_reset_optional(dev);
>  }
>  
>  void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
