Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EF0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhKB7mMPaYc2w+VhJVorA0SnTha7j2lCMKfMCjc7Fa4=; b=HC8rdMI5ejqq8q
	T+LvMmt1gupk7A3W9vG7u6gE9kbLgMkTkaE5jV889SxNHEcAKwol3nuDCuEzBGHzEc0S8v/unYhSk
	bfMqB0OLoUw3VAh1bGRuvxKHbpgvtl2MVydlY8Er3b7m8VjrBfz8NPopic7taJDPWOjQzD+P+cKo7
	wxTymOVc4vR44H9bCxBX6frcK34BP/YPFtq2XFUalarLrWpAy3Ee+l64vQ6sxY7+/PedaCN7Y7oIg
	FbFra7LYfRk2ili4GCivzt9bgtEsZEFf/is/T6Qgj4Ij+0hGHayNrCD897mgUL4mvXY1QkP5WFDIl
	MghYsh7tuke6SEL+Jfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWA8-00HAMg-VE; Fri, 27 May 2022 09:21:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWA5-00HALy-W7; Fri, 27 May 2022 09:21:39 +0000
X-UUID: b0b8470c12e846e9ac0fafb5894939ff-20220527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:2ac7fa93-5031-4b5b-8326-4520f75fd12b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:2
X-CID-META: VersionHash:2a19b09,CLOUDID:8363b847-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: b0b8470c12e846e9ac0fafb5894939ff-20220527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 276138364; Fri, 27 May 2022 02:21:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 May 2022 02:21:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 27 May 2022 17:21:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 27 May 2022 17:21:25 +0800
Message-ID: <618b8f6ed04ad0802c8335d57ea774bf70adeece.camel@mediatek.com>
Subject: Re: [PATCH v18 1/6] soc: mediatek: mutex: add common interface for
 modules setting
From: moudy.ho <moudy.ho@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
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
Date: Fri, 27 May 2022 17:21:25 +0800
In-Reply-To: <05ad616704053c3f9b3275cd557b99bd56b3f40f.camel@mediatek.com>
References: <20220512084139.15086-1-moudy.ho@mediatek.com>
	 <20220512084139.15086-2-moudy.ho@mediatek.com>
	 <05ad616704053c3f9b3275cd557b99bd56b3f40f.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_022138_093436_37557320 
X-CRM114-Status: GOOD (  31.44  )
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

On Wed, 2022-05-25 at 11:27 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Thu, 2022-05-12 at 16:41 +0800, Moudy Ho wrote:
> > In order to allow multiple modules to operate MUTEX hardware
> > through
> > a common interfrace, a flexible index "mtk_mutex_table_index" needs
> > to
> > be added to replace original component ID so that like DDP and MDP
> > can add their own MUTEX table settings independently.
> > 
> > In addition, 4 generic interface "mtk_mutex_set_mod",
> > "mtk_mutex_set_sof",
> > "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added,
> > which is
> > expected to replace the "mtk_mutex_add_comp" and
> > "mtk_mutex_remove_comp"
> > pair originally dedicated to DDP in the future.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c       | 88
> > ++++++++++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-mutex.h | 22 +++++++
> >  2 files changed, 110 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index aaf8fc1abb43..a62ac1811419 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -156,6 +156,8 @@ struct mtk_mutex_data {
> >  	const unsigned int *mutex_sof;
> >  	const unsigned int mutex_mod_reg;
> >  	const unsigned int mutex_sof_reg;
> > +	const unsigned int *mutex_table_mod;
> > +	const unsigned int *mutex_table_sof;
> >  	const bool no_clk;
> >  };
> >  
> > @@ -530,6 +532,92 @@ void mtk_mutex_release(struct mtk_mutex
> > *mutex)
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mutex_release);
> >  
> > +static int mtk_mutex_write_mod(struct mtk_mutex *mutex,
> > +			       enum mtk_mutex_table_index idx, bool
> > clear)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +	unsigned int reg;
> > +	unsigned int offset;
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> > +	    idx >= MUTEX_TABLE_IDX_MAX) {
> > +		dev_err(mtx->dev, "Not supported MOD table index : %d",
> > idx);
> > +		return -EINVAL;
> > +	}
> > +
> > +	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> > +				    mutex->id);
> > +	reg = readl_relaxed(mtx->regs + offset);
> > +
> > +	if (clear)
> > +		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
> > +	else
> > +		reg |= BIT(mtx->data->mutex_table_mod[idx]);
> > +
> > +	writel_relaxed(reg, mtx->regs + offset);
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_mutex_set_mod(struct mtk_mutex *mutex,
> > +		      enum mtk_mutex_table_index idx)
> > +{
> > +	return mtk_mutex_write_mod(mutex, idx, false);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_set_mod);
> 
> Why not just export symbol of mtk_mutex_write_mod() and drop
> mtk_mutex_set_mod()/mtk_mutex_clear_mod()?
> 

Hi CK,

Thanks for your review, I'll simplify this part in the next version.

> > +
> > +int mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> > +			enum mtk_mutex_table_index idx)
> > +{
> > +	return mtk_mutex_write_mod(mutex, idx, true);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_clear_mod);
> > +
> > +int mtk_mutex_write_sof(struct mtk_mutex *mutex,
> > +			enum mtk_mutex_table_index idx, bool clear)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +	unsigned int sof_id, val;
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	if (idx < MUTEX_TABLE_IDX_MDP_RDMA0 ||
> > +	    idx >= MUTEX_TABLE_IDX_MAX) {
> > +		dev_err(mtx->dev, "Not supported SOF table index : %d",
> > idx);
> > +		return -EINVAL;
> > +	}
> > +
> > +	sof_id = mtx->data->mutex_table_sof[idx];
> 
> Why do you map each idx to a sof? For each idx, we could choose sof
> by
> different application. I would like to change parameter
> mtk_mutex_table_index to mtk_mutex_sof_index.
> 
> Regards,
> CK
> 

I'll separate another index for SOF and revise setting function.

Regards,
Moudy

> > +
> > +	if (clear)
> > +		val = MUTEX_SOF_SINGLE_MODE;
> > +	else
> > +		val = mtx->data->mutex_sof[sof_id];
> > +
> > +	writel_relaxed(val, mtx->regs +
> > +		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
> > mutex->id));
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_mutex_set_sof(struct mtk_mutex *mutex,
> > +		      enum mtk_mutex_table_index idx)
> > +{
> > +	return mtk_mutex_write_sof(mutex, idx, false);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_set_sof);
> > +
> > +int mtk_mutex_clear_sof(struct mtk_mutex *mutex,
> > +			enum mtk_mutex_table_index idx)
> > +{
> > +	return mtk_mutex_write_sof(mutex, idx, true);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_clear_sof);
> > +
> >  static int mtk_mutex_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> > b/include/linux/soc/mediatek/mtk-mutex.h
> > index 6fe4ffbde290..f174452212d6 100644
> > --- a/include/linux/soc/mediatek/mtk-mutex.h
> > +++ b/include/linux/soc/mediatek/mtk-mutex.h
> > @@ -10,6 +10,20 @@ struct regmap;
> >  struct device;
> >  struct mtk_mutex;
> >  
> > +enum mtk_mutex_table_index {
> > +	/* MDP table index */
> > +	MUTEX_TABLE_IDX_MDP_RDMA0,
> > +	MUTEX_TABLE_IDX_MDP_RSZ0,
> > +	MUTEX_TABLE_IDX_MDP_RSZ1,
> > +	MUTEX_TABLE_IDX_MDP_TDSHP0,
> > +	MUTEX_TABLE_IDX_MDP_WROT0,
> > +	MUTEX_TABLE_IDX_MDP_WDMA,
> > +	MUTEX_TABLE_IDX_MDP_AAL0,
> > +	MUTEX_TABLE_IDX_MDP_CCORR0,
> > +
> > +	MUTEX_TABLE_IDX_MAX		/* ALWAYS keep at the end */
> > +};
> > +
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev);
> >  int mtk_mutex_prepare(struct mtk_mutex *mutex);
> >  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
> > @@ -22,5 +36,13 @@ void mtk_mutex_unprepare(struct mtk_mutex
> > *mutex);
> >  void mtk_mutex_put(struct mtk_mutex *mutex);
> >  void mtk_mutex_acquire(struct mtk_mutex *mutex);
> >  void mtk_mutex_release(struct mtk_mutex *mutex);
> > +int mtk_mutex_set_mod(struct mtk_mutex *mutex,
> > +		      enum mtk_mutex_table_index idx);
> > +int mtk_mutex_clear_mod(struct mtk_mutex *mutex,
> > +			enum mtk_mutex_table_index idx);
> > +int mtk_mutex_set_sof(struct mtk_mutex *mutex,
> > +		      enum mtk_mutex_table_index idx);
> > +int mtk_mutex_clear_sof(struct mtk_mutex *mutex,
> > +			enum mtk_mutex_table_index idx);
> >  
> >  #endif /* MTK_MUTEX_H */
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
