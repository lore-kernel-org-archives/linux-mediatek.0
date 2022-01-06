Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1829C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OM5QS28zBDDkKD3zWfNl1qm2FRo3lTIEenbbI6JIgag=; b=BDfFtRhb7Jmk6s
	JrJ0KsdnJVGshQGh1RFwuHvEUluM2w55H7M+qCo9BrOZJQuzF13skqxRommGB5gTbvekWfw5db8BA
	VxlRSTrDDG0r/XXOPIujOtnIOxCa6bqkq/aMUhqLi28inlOH7oYJoR4Go7/+zbOtf8z1y0AQ5knKF
	aRB7v+TGcDMzsQx0FqOwrSezpltgRUFD2Q0UMO/hEBcjmQ1pMdOedWUSx6sAwrAG4JVPpJGOJVvsT
	rU4yynxEvl/Vrbx9e4M2urubXeSrDMhK6opZHZbnG8ZOLr+QD+JtMukwLNaq6vXTy9SXNL6XHHURt
	9j4OY7iEU6W5+Imp7dUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Mks-00Gof9-Fb; Thu, 06 Jan 2022 07:00:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5MkU-00GoWT-N4; Thu, 06 Jan 2022 06:59:48 +0000
X-UUID: 74b18b53643447afa013098654ad9403-20220105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=v4VJy6CQLykZwTS/xRERlxBV04bBhj0Wwma8wAugzL8=; 
 b=KXdAics9+ZRi+svxo7adeoxbKQW4qt0+nzUYRATAaoBcNbK0aT2+Wel3raQyL64d1v7DBgexdIhG/3G/XjG+ZGXiiRUgo6j3nvD9iMdzd6Lk9sUQdV7AxpEmQZrEAG0VpB0+b3guUwzEoiGSAVomJvduAyKqnwcG/X2vYzHVGWM=;
X-UUID: 74b18b53643447afa013098654ad9403-20220105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2024618171; Wed, 05 Jan 2022 23:59:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 22:52:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 14:52:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 14:52:49 +0800
Message-ID: <065733e7f404a31985560a490910f57d9c1897c8.camel@mediatek.com>
Subject: Re: [PATCH V1, 4/6] media: mtk-jpegdec: add jpeg decode worker
 interface
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <irui.wang@mediatek.com>
Date: Thu, 6 Jan 2022 14:52:49 +0800
In-Reply-To: <1de01778-5750-c7aa-eac9-d9f91ad76ddb@collabora.com>
References: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
 <1638509655-14296-5-git-send-email-kyrie.wu@mediatek.com>
 <1de01778-5750-c7aa-eac9-d9f91ad76ddb@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_225946_833304_E0F949E5 
X-CRM114-Status: GOOD (  32.78  )
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

On Mon, 2021-12-06 at 17:26 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 06:34, kyrie.wu ha scritto:
> > Add jpeg decoding worker to ensure that three HWs
> > run in parallel in MT8195.
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> > ---
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 190
> > +++++++++++++++++++---
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |   5 +
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |  17 ++
> >   3 files changed, 189 insertions(+), 23 deletions(-)
> > 
> 
> Hello Kyrie,
> thanks for the patch! However, there are some things to improve...
> 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index f2a5e84..2518660 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -1065,57 +1065,187 @@ static void mtk_jpeg_enc_device_run(void
> > *priv)
> >   	queue_work(jpeg->workqueue, &ctx->jpeg_work);
> >   }
> >   
> > -static void mtk_jpeg_dec_device_run(void *priv)
> > +static int mtk_jpegdec_select_hw(struct mtk_jpeg_ctx *ctx)
> >   {
> > -	struct mtk_jpeg_ctx *ctx = priv;
> > +	struct mtk_jpegdec_comp_dev *comp_jpeg;
> >   	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > -	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> >   	unsigned long flags;
> > -	struct mtk_jpeg_src_buf *jpeg_src_buf;
> > +	int hw_id = -1;
> > +	int i;
> > +
> > +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > +	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> > +		comp_jpeg = jpeg->dec_hw_dev[i];
> > +		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
> > +			hw_id = i;
> > +			comp_jpeg->hw_state = MTK_JPEG_HW_BUSY;
> > +			break;
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> > +
> > +	return hw_id;
> > +}
> > +
> > +static int mtk_jpegdec_deselect_hw(struct mtk_jpeg_dev *jpeg, int
> > hw_id)
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > +	jpeg->dec_hw_dev[hw_id]->hw_state =
> > +		MTK_JPEG_HW_IDLE;
> > +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_jpegdec_set_hw_param(struct mtk_jpeg_ctx *ctx,
> > +	int hw_id,
> > +	struct vb2_v4l2_buffer *src_buf,
> > +	struct vb2_v4l2_buffer *dst_buf)
> > +{
> > +	struct mtk_jpegdec_comp_dev *jpeg =
> > +		ctx->jpeg->dec_hw_dev[hw_id];
> > +
> > +	jpeg->hw_param.curr_ctx = ctx;
> > +	jpeg->hw_param.src_buffer = src_buf;
> > +	jpeg->hw_param.dst_buffer = dst_buf;
> > +
> > +	return 0;
> > +}
> > +
> > +static void mtk_jpegdec_worker(struct work_struct *work)
> > +{
> > +	struct mtk_jpeg_ctx *ctx = container_of(work, struct
> > mtk_jpeg_ctx,
> > +		jpeg_work);
> > +	struct mtk_jpegdec_comp_dev *comp_jpeg[MTK_JPEGDEC_HW_MAX];
> > +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > +	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
> > +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > +	atomic_t *hw_rdy[MTK_JPEGDEC_HW_MAX];
> > +	struct clk *jpegdec_clk;
> > +	int ret, i, hw_id = 0;
> >   	struct mtk_jpeg_bs bs;
> >   	struct mtk_jpeg_fb fb;
> > -	int ret;
> > +	unsigned long flags;
> > +
> > +	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> > +		comp_jpeg[i] = jpeg->dec_hw_dev[i];
> > +		hw_rdy[i] = &comp_jpeg[i]->hw_rdy;
> > +	}
> > +
> 
> This entire retry_select block should go to a helper function instead
> of being inside of here.
> 
> Also, there's a big issue with this snippet that has to be solved:
> you're
> unconditionally calling "goto retry_select" at the end of the if
> branch,
> but please consider the following scenario:
> 
> - mtk_jpegdec_select_hw() returns a hw_id < 0
> - wait_event_interruptible returns 0
> ... then we redo the same, and we still get the same result.
> 
> This may generate an infinite loop!!
> 
> After putting this into a separate function, please use a controlled
> loop
> with a well thought maximum number of retries, as to avoid this
> situation.
Dear Angelo,
I will use wait_event_interruptible_timeout to replace
wait_event_interruptible to avoid the situation you memtioned above and
use a helper function instead those code.
> 
> > +retry_select:
> > +	hw_id = mtk_jpegdec_select_hw(ctx);
> > +	if (hw_id < 0) {
> > +		ret = wait_event_interruptible(jpeg->dec_hw_wq,
> > +			(atomic_read(hw_rdy[0]) ||
> > +			atomic_read(hw_rdy[1]) ||
> > +			atomic_read(hw_rdy[2])) > 0);
> > +		if (ret != 0) {
> > +			dev_err(jpeg->dev, "%s : %d, all HW are
> > busy\n",
> > +				__func__, __LINE__);
> > +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx-
> > >fh.m2m_ctx);
> > +			return;
> > +		}
> > +
> > +		dev_err(jpeg->dev, "%s : %d, NEW HW IDLE, please retry
> > selcet!!!\n",
> > +			__func__, __LINE__);
> > +		goto retry_select;
> > +	}
> >   
> > +	atomic_dec(&comp_jpeg[hw_id]->hw_rdy);
> >   	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +	if (!src_buf) {
> > +		dev_err(jpeg->dev, "%s : %d, get src_buf fail !!!\n",
> > +			__func__, __LINE__);
> > +		goto getbuf_fail;
> > +	}
> >   	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +	if (!dst_buf) {
> > +		dev_err(jpeg->dev, "%s : %d, get dst_buf fail !!!\n",
> > +			__func__, __LINE__);
> > +		goto getbuf_fail;
> > +	}
> > +
> >   	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> > +	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> >   
> > -	if (mtk_jpeg_check_resolution_change(ctx, &jpeg_src_buf-
> > >dec_param)) {
> > +	if (mtk_jpeg_check_resolution_change(ctx,
> > +		&jpeg_src_buf->dec_param)) {
> 
> Why are you breaking this line? There's no need to.
If the resolution changed, all input and output buffer would be free
and the new size buffer would be malloc to match the lastest resolution
for jpeg decode.
> 
> >   		mtk_jpeg_queue_src_chg_event(ctx);
> >   		ctx->state = MTK_JPEG_SOURCE_CHANGE;
> > -		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > -		return;
> > +		goto getbuf_fail;
> >   	}
> >   
> 
> 
> Regards,
> - Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
