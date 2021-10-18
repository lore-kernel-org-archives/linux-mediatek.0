Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 13:54:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4098460F25
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 13:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4098460F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5/XHlL/RS2JMCseo1oJlWIrsObqhrbjFBFVR7ncUf8=; b=ehuhmue91XMrK/k1bARJxQpZ5B
	hMKNe9HgxhIwt+taJ6Y7WEi4VsmE9JOK+yrEocycR17J38SDFm/z/MXb53mX4ArwBfAuR5ULV0UnU
	anLLaBkNOQiKPJ1LybDo7yWG6wwCygaVgdJzrclK/2wQ0w9VFkC3XR3g46iEaLJpvFOE+ZeVdLjXu
	3VYPDneeH7Gb6iORDOrzcMjGmgd/seDHaBYb86fpem2Cp6FKouG5rh5N5ObDhBDjdGOHSmiGeMSDS
	JNbM847pLme29c42lNF1qRTDlHhGdM5FuvGNBMkwpSby6il30VIOuyyyoI5gHe6i96u2blJ1O5oMM
	63HrDjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcT6F-00FvcT-PC; Mon, 18 Oct 2021 13:54:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcT2d-00FuAL-FV; Mon, 18 Oct 2021 13:51:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2D3F81F420D4
Subject: Re: [PATCH v8 1/7] soc: mediatek: mmsys: add support for MDP
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, drinkcat@chromium.org,
 acourbot@chromium.org, pihsun@chromium.org, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com, hsinyi@google.com
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <31577e05-34b8-2e5e-14f0-db9949ffdd3d@collabora.com>
Date: Mon, 18 Oct 2021 15:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015123832.17914-2-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_065103_715935_60C6B655 
X-CRM114-Status: GOOD (  24.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/10/21 14:38, Moudy Ho ha scritto:
> For the purpose of module independence, related settings should be moved
> from MDP to the corresponding driver.
> This patch adds more 8183 MDP settings and interface. and MDP
> related settings must be set via CMDQ to avoid frame unsynchronized.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig           |   1 +
>   drivers/soc/mediatek/mt8183-mmsys.h    | 219 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       |  52 ++++++
>   drivers/soc/mediatek/mtk-mmsys.h       |   2 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  56 +++++++
>   5 files changed, 330 insertions(+)
> 

snip...

> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a78e88f27b62..31fec490617e 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -7,8 +7,10 @@
>   #include <linux/device.h>
>   #include <linux/io.h>
>   #include <linux/of_device.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #include "mtk-mmsys.h"
>   #include "mt8167-mmsys.h"
> @@ -51,6 +53,8 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8183-mm",
>   	.routes = mmsys_mt8183_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> +	.mdp_routes = mmsys_mt8183_mdp_routing_table,
> +	.mdp_num_routes = ARRAY_SIZE(mmsys_mt8183_mdp_routing_table),
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
> @@ -62,6 +66,8 @@ static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   struct mtk_mmsys {
>   	void __iomem *regs;
>   	const struct mtk_mmsys_driver_data *data;
> +	phys_addr_t addr;
> +	u8 subsys_id;
>   };
>   
>   void mtk_mmsys_ddp_connect(struct device *dev,
> @@ -101,12 +107,49 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +void mtk_mmsys_mdp_connect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			   enum mtk_mdp_comp_id cur,
> +			   enum mtk_mdp_comp_id next)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_routes *routes = mmsys->data->mdp_routes;
> +	int i;
> +
> +	WARN_ON(!routes);

Sorry, I didn't notice this one in the previous version review.

> +	WARN_ON(mmsys->subsys_id == 0);
> +	for (i = 0; i < mmsys->data->mdp_num_routes; i++)
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)

If routes is NULL, you'll get a NULL pointer kernel panic here, so you should
avoid reaching this point if that happens.

After fixing that,
Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
