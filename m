Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD5BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UGY6qBNxJKYkg9EgOm91HAGwNN/n0LVzy1U/k27qiQ=; b=UvFRC6Ttb7aP9E
	D0vh3XpCUOmDW227WbNnSKCCB0Fu6Af/wCMuv8mBITRmWV1STzRT9WGGyzGx7532THEdpdj2Z4M1G
	90+tl3xrylF0fk7/ouIJO+4sXVkygg7CmRT1MbVp3pJKt7nbfw3yPHD/W1yaEDQasogm2T+0rmM0p
	O0whKZff0uWscWKvjL9bsjVBusGqee0vmUs5TrwzUDDubE1XWbqPj72VCUkZl+zRMU2pwFvxx1lp0
	AwDt9rIRMnsal3cIyfUsIJaz3XzkpzjhuqmZpxJbIciyrycnz+gzHEQuG/5OUlvf2JrWJTuTNvaKS
	+5Q95xrVFwMGL5SegB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWaxf-00AcK7-PW; Tue, 22 Mar 2022 09:37:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWaxc-00AcIi-Dh; Tue, 22 Mar 2022 09:37:54 +0000
X-UUID: 328674ffb758477bb2704b228977a062-20220322
X-UUID: 328674ffb758477bb2704b228977a062-20220322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1834304159; Tue, 22 Mar 2022 02:37:46 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 02:37:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 22 Mar 2022 17:37:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 17:37:41 +0800
Message-ID: <0a81bedfecd0f691c4da06640c50fc409f1e2cb0.camel@mediatek.com>
Subject: Re: [PATCH v14 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
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
Date: Tue, 22 Mar 2022 17:37:41 +0800
In-Reply-To: <20220317143926.15835-2-moudy.ho@mediatek.com>
References: <20220317143926.15835-1-moudy.ho@mediatek.com>
 <20220317143926.15835-2-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_023752_504710_2A09CF62 
X-CRM114-Status: GOOD (  22.94  )
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

On Thu, 2022-03-17 at 22:39 +0800, Moudy Ho wrote:
> In order to allow multiple modules to operate MUTEX hardware through
> a common interfrace, a flexible index "mtk_mutex_table_index" needs
> to
> be added to replace original component ID so that like DDP and MDP
> can add their own MUTEX table settings independently.
> 
> In addition, 4 generic interface "mtk_mutex_set_mod",
> "mtk_mutex_set_sof",
> "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added,
> which is
> expected to replace the "mtk_mutex_add_comp" and
> "mtk_mutex_remove_comp"
> pair originally dedicated to DDP in the future.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 105
> +++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h |  21 +++++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index aaf8fc1abb43..f8c33186685a 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -151,11 +151,17 @@ enum mtk_mutex_sof_id {
>  	MUTEX_SOF_DSI3,
>  };
>  
> +struct mtk_mutex_mod {
> +	u8 tab;

tab is always 0 in this series, so remove this.

> +	u32 value;

Without tab, this struct is not necessary.

> +};
> +
>  struct mtk_mutex_data {
>  	const unsigned int *mutex_mod;
>  	const unsigned int *mutex_sof;
>  	const unsigned int mutex_mod_reg;
>  	const unsigned int mutex_sof_reg;
> +	const struct mtk_mutex_mod *mutex_table_mod;
>  	const bool no_clk;
>  };
>  
> @@ -445,6 +451,65 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
>  
> +void mtk_mutex_set_mod(struct mtk_mutex *mutex,
> +		       enum mtk_mutex_table_index idx)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +	unsigned int reg;
> +	unsigned int offset;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> +	    idx >= MUTEX_TABLE_IDX_MAX)

error message?

> +		return;
> +
> +	if (mtx->data->mutex_table_mod[idx].tab)
> +		offset = DISP_REG_MUTEX_MOD2(mutex->id);
> +	else
> +		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> +					    mutex->id);
> +
> +	reg = readl_relaxed(mtx->regs + offset);
> +	reg |= 1 << mtx->data->mutex_table_mod[idx].value;
> +	writel_relaxed(reg, mtx->regs + offset);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_set_mod);
> +
> +void mtk_mutex_set_sof(struct mtk_mutex *mutex,
> +		       enum mtk_mutex_table_index idx)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +	unsigned int sof_id;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> +	    idx >= MUTEX_TABLE_IDX_MAX)

Ditto.

> +		return;
> +
> +	switch (idx) {
> +	case MUTEX_TABLE_IDX_MDP_RDMA0:
> +	case MUTEX_TABLE_IDX_MDP_RSZ0:
> +	case MUTEX_TABLE_IDX_MDP_RSZ1:
> +	case MUTEX_TABLE_IDX_MDP_TDSHP0:
> +	case MUTEX_TABLE_IDX_MDP_WROT0:
> +	case MUTEX_TABLE_IDX_MDP_WDMA:
> +	case MUTEX_TABLE_IDX_MDP_AAL0:
> +	case MUTEX_TABLE_IDX_MDP_CCORR0:

Error & return?

Regards,
CK

> +	default:
> +		sof_id = MUTEX_SOF_SINGLE_MODE;
> +		break;
> +	}
> +
> +	writel_relaxed(mtx->data->mutex_sof[sof_id],
> +		       mtx->regs +
> +		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
> mutex->id));
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_set_sof);
> +
>  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>  			   enum mtk_ddp_comp_id id)
>  {
> @@ -485,6 +550,46 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> *mutex,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
>  
> +void mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> +			 enum mtk_mutex_table_index idx)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +	unsigned int reg;
> +	unsigned int offset;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> +	    idx >= MUTEX_TABLE_IDX_MAX)
> +		return;
> +
> +	if (mtx->data->mutex_table_mod[idx].tab)
> +		offset = DISP_REG_MUTEX_MOD2(mutex->id);
> +	else
> +		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> +					    mutex->id);
> +
> +	reg = readl_relaxed(mtx->regs + offset);
> +	reg &= ~(1 << mtx->data->mutex_table_mod[idx].value);
> +	writel_relaxed(reg, mtx->regs + offset);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_clear_mod);
> +
> +void mtk_mutex_clear_sof(struct mtk_mutex *mutex)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	writel_relaxed(MUTEX_SOF_SINGLE_MODE,
> +		       mtx->regs +
> +		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
> +					  mutex->id));
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_clear_sof);
> +
>  void mtk_mutex_enable(struct mtk_mutex *mutex)
>  {
>  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> b/include/linux/soc/mediatek/mtk-mutex.h
> index 6fe4ffbde290..200f4365c950 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -10,14 +10,35 @@ struct regmap;
>  struct device;
>  struct mtk_mutex;
>  
> +enum mtk_mutex_table_index {
> +	/* MDP table index */
> +	MUTEX_TABLE_IDX_MDP_RDMA0,
> +	MUTEX_TABLE_IDX_MDP_RSZ0,
> +	MUTEX_TABLE_IDX_MDP_RSZ1,
> +	MUTEX_TABLE_IDX_MDP_TDSHP0,
> +	MUTEX_TABLE_IDX_MDP_WROT0,
> +	MUTEX_TABLE_IDX_MDP_WDMA,
> +	MUTEX_TABLE_IDX_MDP_AAL0,
> +	MUTEX_TABLE_IDX_MDP_CCORR0,
> +
> +	MUTEX_TABLE_IDX_MAX		/* ALWAYS keep at the end */
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev);
>  int mtk_mutex_prepare(struct mtk_mutex *mutex);
>  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  			enum mtk_ddp_comp_id id);
> +void mtk_mutex_set_mod(struct mtk_mutex *mutex,
> +		       enum mtk_mutex_table_index idx);
> +void mtk_mutex_set_sof(struct mtk_mutex *mutex,
> +		       enum mtk_mutex_table_index idx);
>  void mtk_mutex_enable(struct mtk_mutex *mutex);
>  void mtk_mutex_disable(struct mtk_mutex *mutex);
>  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>  			   enum mtk_ddp_comp_id id);
> +void mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> +			 enum mtk_mutex_table_index idx);
> +void mtk_mutex_clear_sof(struct mtk_mutex *mutex);
>  void mtk_mutex_unprepare(struct mtk_mutex *mutex);
>  void mtk_mutex_put(struct mtk_mutex *mutex);
>  void mtk_mutex_acquire(struct mtk_mutex *mutex);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
