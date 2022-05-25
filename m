Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 03:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZTlD8VQqLJdBQKDoadZh/DKc6bTchprdZdVU3EGCCA=; b=OQzhj8s3DbBfJ5
	A2Zr4pwJIiBDKXPh8X9s1M5U+jCGShVEg5chxslwOIetY4K1IdnGsibOakWCxaD8b+aGraZoxb6qr
	GtVQ6Wos4BTORiw9r/TN3hKDm+trUFMXExVahOBDbORNeGxmzEvaj01w098ek45MAiXL8UGcM4ehq
	lM42ohrYW8TjyI3m1Rm3TkFfpxJz2BMBFTrmdtsBTygAPItK6q0HjwPMLDpcRgOXAXO4vpIWIEg8L
	t0wxb0yJ9dKEqBolg5vJZUpPuFLlilPsXLZfUd9Rvz1acW6XvqCR1LL3/ehHEo7IRQ75R03LooofB
	mY1NgJ+osvLaCA9q7cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nthgt-009pjg-AK; Wed, 25 May 2022 03:28:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nthgh-009ph1-Ub; Wed, 25 May 2022 03:27:57 +0000
X-UUID: 4019af35c1eb47fea93ad5292661201a-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:98c8463a-6183-49c7-9922-60e783737708, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:bd1c5c47-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 4019af35c1eb47fea93ad5292661201a-20220524
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1075296761; Tue, 24 May 2022 20:27:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 20:27:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 11:27:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 May 2022 11:27:41 +0800
Message-ID: <05ad616704053c3f9b3275cd557b99bd56b3f40f.camel@mediatek.com>
Subject: Re: [PATCH v18 1/6] soc: mediatek: mutex: add common interface for
 modules setting
From: CK Hu <ck.hu@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Alexandre Courbot
 <acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
 <pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <cellopoint.kai@gmail.com>
Date: Wed, 25 May 2022 11:27:41 +0800
In-Reply-To: <20220512084139.15086-2-moudy.ho@mediatek.com>
References: <20220512084139.15086-1-moudy.ho@mediatek.com>
 <20220512084139.15086-2-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_202756_041241_99C25C14 
X-CRM114-Status: GOOD (  27.63  )
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

On Thu, 2022-05-12 at 16:41 +0800, Moudy Ho wrote:
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
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 88
> ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h | 22 +++++++
>  2 files changed, 110 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index aaf8fc1abb43..a62ac1811419 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -156,6 +156,8 @@ struct mtk_mutex_data {
>  	const unsigned int *mutex_sof;
>  	const unsigned int mutex_mod_reg;
>  	const unsigned int mutex_sof_reg;
> +	const unsigned int *mutex_table_mod;
> +	const unsigned int *mutex_table_sof;
>  	const bool no_clk;
>  };
>  
> @@ -530,6 +532,92 @@ void mtk_mutex_release(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_release);
>  
> +static int mtk_mutex_write_mod(struct mtk_mutex *mutex,
> +			       enum mtk_mutex_table_index idx, bool
> clear)
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
> +	    idx >= MUTEX_TABLE_IDX_MAX) {
> +		dev_err(mtx->dev, "Not supported MOD table index : %d",
> idx);
> +		return -EINVAL;
> +	}
> +
> +	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> +				    mutex->id);
> +	reg = readl_relaxed(mtx->regs + offset);
> +
> +	if (clear)
> +		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
> +	else
> +		reg |= BIT(mtx->data->mutex_table_mod[idx]);
> +
> +	writel_relaxed(reg, mtx->regs + offset);
> +
> +	return 0;
> +}
> +
> +int mtk_mutex_set_mod(struct mtk_mutex *mutex,
> +		      enum mtk_mutex_table_index idx)
> +{
> +	return mtk_mutex_write_mod(mutex, idx, false);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_set_mod);

Why not just export symbol of mtk_mutex_write_mod() and drop
mtk_mutex_set_mod()/mtk_mutex_clear_mod()?

> +
> +int mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> +			enum mtk_mutex_table_index idx)
> +{
> +	return mtk_mutex_write_mod(mutex, idx, true);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_clear_mod);
> +
> +int mtk_mutex_write_sof(struct mtk_mutex *mutex,
> +			enum mtk_mutex_table_index idx, bool clear)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +	unsigned int sof_id, val;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> +	    idx >= MUTEX_TABLE_IDX_MAX) {
> +		dev_err(mtx->dev, "Not supported SOF table index : %d",
> idx);
> +		return -EINVAL;
> +	}
> +
> +	sof_id = mtx->data->mutex_table_sof[idx];

Why do you map each idx to a sof? For each idx, we could choose sof by
different application. I would like to change parameter
mtk_mutex_table_index to mtk_mutex_sof_index.

Regards,
CK

> +
> +	if (clear)
> +		val = MUTEX_SOF_SINGLE_MODE;
> +	else
> +		val = mtx->data->mutex_sof[sof_id];
> +
> +	writel_relaxed(val, mtx->regs +
> +		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
> mutex->id));
> +
> +	return 0;
> +}
> +
> +int mtk_mutex_set_sof(struct mtk_mutex *mutex,
> +		      enum mtk_mutex_table_index idx)
> +{
> +	return mtk_mutex_write_sof(mutex, idx, false);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_set_sof);
> +
> +int mtk_mutex_clear_sof(struct mtk_mutex *mutex,
> +			enum mtk_mutex_table_index idx)
> +{
> +	return mtk_mutex_write_sof(mutex, idx, true);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_clear_sof);
> +
>  static int mtk_mutex_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> b/include/linux/soc/mediatek/mtk-mutex.h
> index 6fe4ffbde290..f174452212d6 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -10,6 +10,20 @@ struct regmap;
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
> @@ -22,5 +36,13 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex);
>  void mtk_mutex_put(struct mtk_mutex *mutex);
>  void mtk_mutex_acquire(struct mtk_mutex *mutex);
>  void mtk_mutex_release(struct mtk_mutex *mutex);
> +int mtk_mutex_set_mod(struct mtk_mutex *mutex,
> +		      enum mtk_mutex_table_index idx);
> +int mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> +			enum mtk_mutex_table_index idx);
> +int mtk_mutex_set_sof(struct mtk_mutex *mutex,
> +		      enum mtk_mutex_table_index idx);
> +int mtk_mutex_clear_sof(struct mtk_mutex *mutex,
> +			enum mtk_mutex_table_index idx);
>  
>  #endif /* MTK_MUTEX_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
