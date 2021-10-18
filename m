Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D01C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 13:51:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C8A608FB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 13:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3C8A608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHcU107pZDOyEHSm7EkNT8wz8bTCFVTJAt1SDPyExDo=; b=gvf1b8TI8JbtbHpfLtPZsHyMvt
	ECAVd3oLCJHz6RWP7b1icrKVfMzb+zFPo5kffIA450QS9YukG+1C8Sl9J1bjR5H/6ReqondfKdFZw
	2hsBsZDA4E78IGW1R7mk7yq1qelURILmGMBZW0ZEA+BFnqJkzkrhFeHI6okIx6a5egwbe7zedLP+Q
	a7I1pIdbVPQ+ogzCC2aI8qlnX0+D2ZI8F6O4/wBEV/+TTTZzzZOVRnpNP6cuuLfqu9lQWIKDe9lfO
	1/J1CuA8O5TuRqACmhwKK1WyZuOpUCVgNo+YxNPUXhlcTtNtymsDber17L6adOlqSSG5NJHvqwQsI
	YouUnLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcT2v-00FuFE-4Q; Mon, 18 Oct 2021 13:51:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcT1x-00Ftvz-QI; Mon, 18 Oct 2021 13:50:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 27FA91F4167F
Subject: Re: [PATCH v8 4/7] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
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
 <20211015123832.17914-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c30de071-0ac4-bbbe-bde3-770c2a15025d@collabora.com>
Date: Mon, 18 Oct 2021 15:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015123832.17914-5-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_065022_185445_2CF8289D 
X-CRM114-Status: GOOD (  20.51  )
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

> Considering that some functions have timing requirements
> in specific situation, this patch adds several interface that
> operate registers by CMDQ.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mutex.c       | 63 +++++++++++++++++++++++++-
>   include/linux/soc/mediatek/mtk-mutex.h |  6 +++
>   2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index adab4c9edc16..874d4c60b844 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -7,10 +7,12 @@
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/soc/mediatek/mtk-mutex.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #define MT2701_MUTEX0_MOD0			0x2c
>   #define MT2701_MUTEX0_SOF0			0x30
> @@ -143,6 +145,8 @@ struct mtk_mutex_ctx {
>   	void __iomem			*regs;
>   	struct mtk_mutex		mutex[10];
>   	const struct mtk_mutex_data	*data;
> +	phys_addr_t			addr;
> +	u8				subsys_id;
>   };
>   
>   static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> @@ -442,6 +446,25 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
>   
> +void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
> +			       struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +	unsigned int offset;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg, mutex->id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> +			    mod, mtx->data->mutex_mdp_mod_mask);
> +
> +	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> +			    0, mtx->data->mutex_mdp_sof_mask);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_add_mod_by_cmdq);
> +
>   void mtk_mutex_enable(struct mtk_mutex *mutex)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -453,6 +476,20 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_enable);
>   
> +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> +			      struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,
> +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> +			    0x1, 0x00000001);

(don't use this definition name if not appropriate)
#define MTK_MUTEX_ENABLE	BIT(0)

cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,

		    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),

		    MTK_MUTEX_ENABLE, MTK_MUTEX_ENABLE);

...or anyway remove leading zeros.

> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> +
>   void mtk_mutex_disable(struct mtk_mutex *mutex)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -464,6 +501,20 @@ void mtk_mutex_disable(struct mtk_mutex *mutex)
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_disable);
>   
> +void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
> +			       struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,
> +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> +			    0x0, 0x00000001);

cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,


		    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),


		    0, MTK_MUTEX_ENABLE);

> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_disable_by_cmdq);
> +

Regards,
- Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
