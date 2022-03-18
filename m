Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E6EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LXHcRVq3c9Rjz1t19gZ1IODo9WKiTNmIpGT6TtRRgI=; b=wIsjtIiiWiukVT
	1ky4v1aXKgak6jpY0244jXihBQF9Vw74LxygSsRvYxHAOu1rtzUI2hd9nDIRNpsr/hDh3mnGoxNH0
	2zAvVTNsymUpDxeusWmuHym8tNPCCKaQ9XfYWtK9iG9A+gX1U6MtQlYG7+OfVcOMGkarOyLifl0WA
	LFEE2zCZfFNi4ez3hm7Zvt8R0gvYAHFcil7nq3Q39wD8z53AzqRIeVesnLppPWy/tOLGpuLEb4pQj
	VC7/STHGwRbBJC2QTaYMbMyVHFGIm1sCzPXTyc081nUOsyn+F8KJk7u23BEgCDCCixl2rMq3XmVGe
	HU1a/ByJ9AUonoXQaKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV8tJ-000xYY-00; Fri, 18 Mar 2022 09:27:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV8t6-000xW9-BG; Fri, 18 Mar 2022 09:27:14 +0000
X-UUID: 82390930c742411fb919353aacef7553-20220318
X-UUID: 82390930c742411fb919353aacef7553-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 362498480; Fri, 18 Mar 2022 02:27:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 02:23:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Mar 2022 17:23:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 17:23:21 +0800
Message-ID: <4adcccde9165cd52faa13d5b0d60cc4d58f52ec1.camel@mediatek.com>
Subject: Re: [PATCH v1 02/14] soc: mediatek: mutex: expand parameter for mdp
 mutex function
From: CK Hu <ck.hu@mediatek.com>
To: roy-cw.yeh <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>, daoyuan
 huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 Moudy Ho <moudy.ho@mediatek.com>, "river . cheng" <river.cheng@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 18 Mar 2022 17:23:21 +0800
In-Reply-To: <20220117055254.9777-3-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
 <20220117055254.9777-3-roy-cw.yeh@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_022712_405114_DEA326C4 
X-CRM114-Status: GOOD (  22.65  )
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

Hi, Roy:

On Mon, 2022-01-17 at 13:52 +0800, roy-cw.yeh wrote:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Expand parameter for mdp mutex function
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
> This patch is base on [1][2]
> [1] soc: mediatek: mutex: add functions that operate registers by
> CMDQ
> - 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220104091712.25670-5-moudy.ho@mediatek.com/__;!!CTRNKA9wMg0ARbw!28saNp-15JnZswiyVpRSXYtGcevLvGr2FEapxkshXVSBltSnkpE2iPgK4HDCWg$
>  
> [2] media: platform: mtk-mdp3: add Mediatek MDP3 driver
> - 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220105093758.6850-4-moudy.ho@mediatek.com/__;!!CTRNKA9wMg0ARbw!28saNp-15JnZswiyVpRSXYtGcevLvGr2FEapxkshXVSBltSnkpE2iPhg9ACQ7Q$
>  
> ---
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  3 ++-
>  drivers/soc/mediatek/mtk-mutex.c              | 26 +++++++++++++--
> ----
>  include/linux/soc/mediatek/mtk-mutex.h        |  2 +-
>  3 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> index 4a08502952d6..87751f0e2513 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> @@ -101,7 +101,8 @@ static int mdp_path_subfrm_require(struct
> mdp_path_subfrm *subfrm,
>  	}
>  
>  	if (subfrm->mutex_mod)
> -		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm-
> >mutex_mod, cmd);
> +		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm-
> >mutex_mod,
> +					  0, 0, cmd);
>  
>  	/* Set SOF */
>  	for (index = 0; index < config->num_components; index++) {
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index 89daab7e6863..7da0f44b6f9a 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -27,8 +27,9 @@
>  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>  #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 *
> (n))
> -#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 *
> (n))
> -#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 *
> (n))
> +#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20
> * (n))
> +#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg
> ) + 0x20 * (n) + 0x4)
> +#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	((mutex_sof_reg) + 0x20
> * (n))
>  #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 *
> (n))
>  
>  #define INT_MUTEX				BIT(1)
> @@ -180,6 +181,11 @@
>  #define MT8183_MUTEX_MOD_MDP_AAL0		BIT(23)
>  #define MT8183_MUTEX_MOD_MDP_CCORR0		BIT(24)
>  
> +#define
> MT8183_MDP_PIPE_IMGI                   MT8183_MUTEX_MDP_START
> +#define
> MT8183_MDP_PIPE_RDMA0                  (MT8183_MUTEX_MDP_START + 1)
> +#define
> MT8183_MDP_PIPE_WPEI                   (MT8183_MUTEX_MDP_START + 2)
> +#define
> MT8183_MDP_PIPE_WPEI2                  (MT8183_MUTEX_MDP_START + 3)
> +
>  struct mtk_mutex {
>  	int id;
>  	bool claimed;
> @@ -364,10 +370,10 @@ static const unsigned int
> mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  
>  /* indicate which mutex is used by each pipepline */
>  static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
> -	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
> -	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
> -	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
> -	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
> +	[MDP_PIPE_IMGI] = MT8183_MDP_PIPE_IMGI,
> +	[MDP_PIPE_RDMA0] = MT8183_MDP_PIPE_RDMA0,
> +	[MDP_PIPE_WPEI] = MT8183_MDP_PIPE_WPEI,
> +	[MDP_PIPE_WPEI2] = MT8183_MDP_PIPE_WPEI2,
>  };
>  
>  static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> @@ -606,7 +612,7 @@ u32 mtk_mutex_get_mdp_mod(struct mtk_mutex
> *mutex, enum mtk_mdp_comp_id id)
>  EXPORT_SYMBOL_GPL(mtk_mutex_get_mdp_mod);
>  
>  void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
> -			       struct mmsys_cmdq_cmd *cmd)
> +			       u32 mod1, u32 sof, struct mmsys_cmdq_cmd
> *cmd)

In cover letter, describe this series depend on which series.
And, why do you need add mod by cmdq? I expect that pipeline is fixed
before it start working.

Regards,
CK

>  {
>  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
>  						 mutex[mutex->id]);
> @@ -618,9 +624,13 @@ void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex
> *mutex, u32 mod,
>  	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr +
> offset,
>  			    mod, mtx->data->mutex_mdp_mod_mask);
>  
> +	offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg, mutex-
> >id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr +
> offset,
> +			    mod1, mtx->data->mutex_mdp_mod_mask);
> +
>  	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex-
> >id);
>  	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr +
> offset,
> -			    0, mtx->data->mutex_mdp_sof_mask);
> +			    sof, mtx->data->mutex_mdp_sof_mask);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_add_mod_by_cmdq);
>  
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> b/include/linux/soc/mediatek/mtk-mutex.h
> index 05de7ad4a124..dbb7324c12d9 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -18,7 +18,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  			enum mtk_ddp_comp_id id);
>  u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum
> mtk_mdp_comp_id id);
>  void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
> -			       struct mmsys_cmdq_cmd *cmd);
> +			       u32 mod1, u32 sof, struct mmsys_cmdq_cmd
> *cmd);
>  void mtk_mutex_enable(struct mtk_mutex *mutex);
>  void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
>  			      struct mmsys_cmdq_cmd *cmd);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
