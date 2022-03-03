Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sK5yumWn14PIpxs5q1q05nYLnQJigYbq23Q4FmHtZoI=; b=DcTISN4vAJnNJ5
	QinTI/Bf6L91rqDerMBK4QxQNj+W+QPr899nYyfp+WvTTTkpGXaujcjf5QABjVKzpDPytpFJPZRUL
	HRGpQjpNbMdsoCmeX2vyOV3m4RQHp0uCcB3JriIXb3f1F2RoXd+VWBQtS2jflrREewkBdK3sxKL5l
	gt37gzFrLehpew7RShXD7XW8mJ0yHyDPLC1UzPpojuzTcXs6zrsZkAHvyV94oVThj2dXQVi6JKqJN
	wLu2jk+b1mMhBkXk3fL4owsRR3dosx+YK0mtC7eMSILjK9KFxboRHp7UFEsJfvHQMxwM52HcHc/hT
	maTqYPzZOdZS9bvIA1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPhqD-005uTf-M1; Thu, 03 Mar 2022 09:33:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPhqB-005uSk-1U; Thu, 03 Mar 2022 09:33:44 +0000
X-UUID: 48cae1eeea8f45c98b6d556500e1e619-20220303
X-UUID: 48cae1eeea8f45c98b6d556500e1e619-20220303
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1126218674; Thu, 03 Mar 2022 02:33:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 01:33:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 17:33:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 17:33:35 +0800
Message-ID: <1c665549b28c206126b1407eaf6ca97269bf1169.camel@mediatek.com>
Subject: Re: [PATCH v12 3/4] soc: mediatek: mutex: add support for MDP
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 3 Mar 2022 17:33:35 +0800
In-Reply-To: <20220301100246.2153-4-moudy.ho@mediatek.com>
References: <20220301100246.2153-1-moudy.ho@mediatek.com>
 <20220301100246.2153-4-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_013343_116972_3FC6D5E6 
X-CRM114-Status: GOOD (  24.57  )
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

Hi, Moudy:

On Tue, 2022-03-01 at 18:02 +0800, Moudy Ho wrote:
> For the purpose of module independence, related settings should be
> moved
> from MDP to the corresponding driver.
> This patch adds more 8183 MDP settings and interface.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 68
> ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h |  3 ++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index aaf8fc1abb43..a6268ecde240 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -136,6 +136,18 @@
>  #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_S
> OF_DSI0 << 6)
>  #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_S
> OF_DPI0 << 6)
>  
> +#define MT8183_MUTEX_MDP_START			5
> +#define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
> +#define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
> +#define MT8183_MUTEX_MOD_MDP_RDMA0		BIT(2)
> +#define MT8183_MUTEX_MOD_MDP_RSZ0		BIT(4)
> +#define MT8183_MUTEX_MOD_MDP_RSZ1		BIT(5)
> +#define MT8183_MUTEX_MOD_MDP_TDSHP0		BIT(6)
> +#define MT8183_MUTEX_MOD_MDP_WROT0		BIT(7)
> +#define MT8183_MUTEX_MOD_MDP_WDMA		BIT(8)
> +#define MT8183_MUTEX_MOD_MDP_AAL0		BIT(23)
> +#define MT8183_MUTEX_MOD_MDP_CCORR0		BIT(24)
> +
>  struct mtk_mutex {
>  	int id;
>  	bool claimed;
> @@ -156,6 +168,10 @@ struct mtk_mutex_data {
>  	const unsigned int *mutex_sof;
>  	const unsigned int mutex_mod_reg;
>  	const unsigned int mutex_sof_reg;
> +	const unsigned int *mutex_mdp_offset;
> +	const unsigned int *mutex_mdp_mod;
> +	const unsigned int mutex_mdp_mod_mask;

Useless, so remove this.

> +	const unsigned int mutex_mdp_sof_mask;

Useless, so remove this.

>  	const bool no_clk;
>  };
>  
> @@ -243,6 +259,17 @@ static const unsigned int
> mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>  };
>  
> +static const unsigned int mt8183_mutex_mdp_mod[MDP_MAX_COMP_COUNT] =
> {
> +	[MDP_COMP_RDMA0] = MT8183_MUTEX_MOD_MDP_RDMA0,
> +	[MDP_COMP_RSZ0] = MT8183_MUTEX_MOD_MDP_RSZ0,
> +	[MDP_COMP_RSZ1] = MT8183_MUTEX_MOD_MDP_RSZ1,
> +	[MDP_COMP_TDSHP0] = MT8183_MUTEX_MOD_MDP_TDSHP0,
> +	[MDP_COMP_WROT0] = MT8183_MUTEX_MOD_MDP_WROT0,
> +	[MDP_COMP_WDMA] = MT8183_MUTEX_MOD_MDP_WDMA,
> +	[MDP_COMP_AAL0] = MT8183_MUTEX_MOD_MDP_AAL0,
> +	[MDP_COMP_CCORR0] = MT8183_MUTEX_MOD_MDP_CCORR0,
> +};
> +
>  static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
>  	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
> @@ -300,6 +327,14 @@ static const unsigned int
> mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 |
> MT8186_MUTEX_EOF_DPI0,
>  };
>  
> +/* indicate which mutex is used by each pipepline */
> +static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
> +	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
> +	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
> +	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
> +	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
>  	.mutex_sof = mt2712_mutex_sof,
> @@ -334,6 +369,10 @@ static const struct mtk_mutex_data
> mt8183_mutex_driver_data = {
>  	.mutex_sof = mt8183_mutex_sof,
>  	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
>  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.mutex_mdp_offset = mt8183_mutex_mdp_offset,
> +	.mutex_mdp_mod = mt8183_mutex_mdp_mod,
> +	.mutex_mdp_mod_mask = MT8183_MUTEX_MDP_MOD_MASK,
> +	.mutex_mdp_sof_mask = MT8183_MUTEX_MDP_SOF_MASK,
>  	.no_clk = true,
>  };
>  
> @@ -366,6 +405,21 @@ struct mtk_mutex *mtk_mutex_get(struct device
> *dev)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_get);
>  
> +struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
> +				    enum mtk_mdp_pipe_id id)

For DRM, mutex id does not physically bound to specific hardware, why
do MDP need the pipeline id?

Regards,
CK

> +{
> +	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> +	int i = mtx->data->mutex_mdp_offset[id];
> +
> +	if (!mtx->mutex[i].claimed) {
> +		mtx->mutex[i].claimed = true;
> +		return &mtx->mutex[i];
> +	}
> +
> +	return ERR_PTR(-EBUSY);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_mdp_get);
> +
>  void mtk_mutex_put(struct mtk_mutex *mutex)
>  {
>  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> @@ -485,6 +539,20 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> *mutex,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
>  
> +u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum
> mtk_mdp_comp_id id)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	if (mtx->data->mutex_mdp_mod)
> +		return mtx->data->mutex_mdp_mod[id];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_get_mdp_mod);
> +
>  void mtk_mutex_enable(struct mtk_mutex *mutex)
>  {
>  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> b/include/linux/soc/mediatek/mtk-mutex.h
> index 6fe4ffbde290..b2608f4220ee 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -11,9 +11,12 @@ struct device;
>  struct mtk_mutex;
>  
>  struct mtk_mutex *mtk_mutex_get(struct device *dev);
> +struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
> +				    enum mtk_mdp_pipe_id id);
>  int mtk_mutex_prepare(struct mtk_mutex *mutex);
>  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  			enum mtk_ddp_comp_id id);
> +u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum
> mtk_mdp_comp_id id);
>  void mtk_mutex_enable(struct mtk_mutex *mutex);
>  void mtk_mutex_disable(struct mtk_mutex *mutex);
>  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
