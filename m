Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F1CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49ABF61359
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49ABF61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY3aHaq0Qnd5fRUkaCMWakUVA2+4PwCBMzbrpIWjxfQ=; b=cFh1MHlcSHPydKHNd+GLKAYiOI
	bddMa0YEFe4PCZeQRYlV8HZHqgsVJH6OEKNMjFJWm9TNjRCX52P8aMruvwxaCUo2qf16nF8yCyAtY
	z7RLzEAHyD90Gp6LHYH+OsGiEwVE0Gk6yTRBIY/oL/xY78ZJ//71T/mLKBW62Of3030ZhkeK5wXVD
	SpBFaBVwZgTZnN8XVomQBuUr1UHHfKbkfeyT0qFjCIWaRsRlbuQ6RLHzGtFDnxpCYyoaI9vTtz1eZ
	fOpTndjJOm1A4TbgG5pkWkHme10ezfYKNsSjg9cPzHBVHB2cWkftrCi733eyMORMUrFrChTaUzBUg
	cbc0ZuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7vH-003zyM-2G; Wed, 20 Oct 2021 09:30:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7uz-003zoY-EE; Wed, 20 Oct 2021 09:29:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A711B1F43D72
Subject: Re: [PATCH v2 2/9] soc: mediatek: mutex: expand parameter for mdp
 mutex function
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
 <20211020071448.14187-3-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0eaea2d4-1683-622a-e814-8b6c7c3eab2e@collabora.com>
Date: Wed, 20 Oct 2021 11:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020071448.14187-3-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_022953_799556_8ABBC9ED 
X-CRM114-Status: GOOD (  19.81  )
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

Il 20/10/21 09:14, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Expand parameter for mdp mutex function
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   drivers/soc/mediatek/mtk-mutex.c       | 26 ++++++++++++++++++--------
>   include/linux/soc/mediatek/mtk-mutex.h |  2 +-
>   2 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 814f58f692cf..c100a5249016 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -25,8 +25,9 @@
>   #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>   #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>   #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
> -#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
> -#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
> +#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	((mutex_sof_reg) + 0x20 * (n))
>   #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
>   
>   #define INT_MUTEX				BIT(1)
> @@ -116,6 +117,11 @@
>   #define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
>   #define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
>   
> +#define MT8183_MDP_PIPE_IMGI			MT8183_MUTEX_MDP_START
> +#define MT8183_MDP_PIPE_RDMA0			(MT8183_MUTEX_MDP_START + 1)
> +#define MT8183_MDP_PIPE_WPEI			(MT8183_MUTEX_MDP_START + 2)
> +#define MT8183_MDP_PIPE_WPEI2			(MT8183_MUTEX_MDP_START + 3)
> +
>   struct mtk_mutex {
>   	int id;
>   	bool claimed;
> @@ -254,10 +260,10 @@ static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   
>   /* indicate which mutex is used by each pipepline */
>   static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
> -	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
> -	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
> -	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
> -	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
> +	[MDP_PIPE_IMGI] = MT8183_MDP_PIPE_IMGI,
> +	[MDP_PIPE_RDMA0] = MT8183_MDP_PIPE_RDMA0,
> +	[MDP_PIPE_WPEI] = MT8183_MDP_PIPE_WPEI,
> +	[MDP_PIPE_WPEI2] = MT8183_MDP_PIPE_WPEI2,
>   };
>   
>   static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> @@ -410,7 +416,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>   EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
>   
>   void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
> -			   struct mmsys_cmdq_cmd *cmd)
> +			   u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
>   						 mutex[mutex->id]);
> @@ -422,9 +428,13 @@ void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
>   	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
>   			    mod, mtx->data->mutex_mdp_mod_mask);
>   
> +	offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg, mutex->id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> +			    mod1, mtx->data->mutex_mdp_mod_mask);
> +
>   	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
>   	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> -			    0, mtx->data->mutex_mdp_sof_mask);
> +			    sof, mtx->data->mutex_mdp_sof_mask);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_add_mdp_mod);
>   
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
> index d08b98419dd9..a2b81ce55b5d 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -17,7 +17,7 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
>   void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>   			enum mtk_ddp_comp_id id);
>   void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
> -			   struct mmsys_cmdq_cmd *cmd);
> +			   u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd);
>   void mtk_mutex_enable(struct mtk_mutex *mutex);
>   void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
>   			      struct mmsys_cmdq_cmd *cmd);
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
