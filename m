Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A65C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srKv/sPdhhDx8xosGYlRbfx2LpQrVKpXIZHtcTno7dI=; b=vAez9snWzdJvHR
	TQSUXiMM8DzLOl64UHpH4j4GXsUGrLYA6jpaFDfzcf2cphW4FX/T4j5NaMA/g5c0b3o48i9TEveH9
	W1BF04+xTuCb7E4ixXcloquGO2u87050OBV4/amcAXSJKV/7EL9wXZLzSCQXIR9hcoN0GqzqUYWXg
	VK7SUKVvdIlE/H+0ct0E969CAZ+zWuCiispookRZoo5ez1ZCsoCOKOj+Ne3jJzxkuSaJhkBjNtUwj
	92r+EUrC5kBbhwpj/R17ZYY4MvHtuSesfpCTMgAygCBWl7lT3kuAu2vOI1B23VfUicFlGBzO8PQTT
	8XKFf5P2JLFDivzE3tlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLyRk-0032AF-Jj; Mon, 21 Feb 2022 02:29:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyRX-00327G-VK; Mon, 21 Feb 2022 02:28:53 +0000
X-UUID: ab95582205294d7bb14ae618446293b7-20220220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qryuEWMoLv86pOX4sDpAOxYNQOc2ycwxUBR6pGp+EhY=; 
 b=IDESNTLiUV7SJDshNgnuB8CkFCuU6+QS+jANx6ch5TNOuwDpSWfyVHA29ipDOorpudOf1rj/fKgZUp5AsWPHjPwrPZCTdvUDY9JBvRYzWRIWniYRVKRHo5Xlxl+MneyS5IklSeTNwW35qOM4D5Opl07AzNculOmuRA/8lp5SngA=;
X-UUID: ab95582205294d7bb14ae618446293b7-20220220
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1869369947; Sun, 20 Feb 2022 19:28:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 18:28:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 10:28:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 10:28:44 +0800
Message-ID: <0f750dcb3bf2b4703c23357b814f50c365739e3d.camel@mediatek.com>
Subject: Re: [PATCH V1, 5/6] media: mtk-jpegdec: add output pic reorder
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
Date: Mon, 21 Feb 2022 10:28:44 +0800
In-Reply-To: <d305aefa-7cdf-3221-2883-9381785e335d@collabora.com>
References: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
 <1638509655-14296-6-git-send-email-kyrie.wu@mediatek.com>
 <d305aefa-7cdf-3221-2883-9381785e335d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_182852_049083_825E5390 
X-CRM114-Status: GOOD (  22.12  )
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

On Mon, 2022-02-07 at 15:50 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 06:34, kyrie.wu ha scritto:
> > add output reorder func to reorder the output images
> > to ensure the output pic is consistent with the input images.
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> > ---
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c | 50
> > +++++++++++++++++++++--
> >   1 file changed, 46 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > index 9138ecb..fad5bf1c 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> > @@ -443,6 +443,49 @@ void mtk_jpeg_dec_set_config(void __iomem
> > *base,
> >   	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
> >   }
> >   
> > +void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
> 
> This function is used only in this file, hence it should be static.
Thanks. I will fix it.
> 
> > +{
> > +	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
> > +	struct vb2_v4l2_buffer *dst_buffer;
> > +	struct list_head *temp_entry;
> > +	struct list_head *pos = NULL;
> > +	struct mtk_jpeg_ctx *ctx;
> > +	unsigned long flags;
> > +
> > +	ctx = jpeg->hw_param.curr_ctx;
> > +	if (!ctx) {
> > +		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
> 
> Since this is unlikely to happen (or should be unlikely anyway!!),
> this print
> should then be a dev_dbg()
Thanks. I will consider your suggestion.
> 
> > +		return;
> > +	}
> > +
> > +	dst_buffer = jpeg->hw_param.dst_buffer;
> > +	if (!dst_buffer) {
> > +		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
> > +		return;
> > +	}
> > +
> > +	dst_done_buf = container_of(dst_buffer, struct
> > mtk_jpeg_src_buf, b);
> > +
> > +	spin_lock_irqsave(&ctx->done_queue_lock, flags);
> > +	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
> > +	while (!list_empty(&ctx->dst_done_queue) &&
> > +		(pos != &ctx->dst_done_queue)) {
> > +		list_for_each_prev_safe(pos, temp_entry,
> > +			(&ctx->dst_done_queue)) {
> > +			tmp_dst_done_buf = list_entry(pos,
> > +				struct mtk_jpeg_src_buf, list);
> > +			if (tmp_dst_done_buf->frame_num ==
> > +				ctx->last_done_frame_num) {
> > +				list_del(&tmp_dst_done_buf->list);
> > +				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> > +					VB2_BUF_STATE_DONE);
> > +				ctx->last_done_frame_num++;
> > +			}
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> > +}
> > +
> >   static void mtk_jpegdec_timeout_work(struct work_struct *work)
> >   {
> >   	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > @@ -450,10 +493,9 @@ static void mtk_jpegdec_timeout_work(struct
> > work_struct *work)
> >   		container_of(work, struct mtk_jpegdec_comp_dev,
> >   		job_timeout_work.work);
> >   	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
> > -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +	struct vb2_v4l2_buffer *src_buf;
> >   
> >   	src_buf = cjpeg->hw_param.src_buffer;
> > -	dst_buf = cjpeg->hw_param.dst_buffer;
> >   
> >   	mtk_jpeg_dec_reset(cjpeg->reg_base);
> >   	clk_disable_unprepare(cjpeg->pm.dec_clk.clk_info->jpegdec_clk);
> > @@ -462,7 +504,7 @@ static void mtk_jpegdec_timeout_work(struct
> > work_struct *work)
> >   	atomic_inc(&cjpeg->hw_rdy);
> >   	wake_up(&master_jpeg->dec_hw_wq);
> >   	v4l2_m2m_buf_done(src_buf, buf_state);
> > -	v4l2_m2m_buf_done(dst_buf, buf_state);
> > +	mtk_jpegdec_put_buf(cjpeg);
> >   }
> >   
> >   int mtk_jpegdec_init_pm(struct mtk_jpegdec_comp_dev *mtkdev)
> > @@ -559,7 +601,7 @@ static irqreturn_t
> > mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> >   
> >   dec_end:
> >   	v4l2_m2m_buf_done(src_buf, buf_state);
> > -	v4l2_m2m_buf_done(dst_buf, buf_state);
> > +	mtk_jpegdec_put_buf(jpeg);
> >   	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
> >   	clk_disable_unprepare(jpeg->pm.dec_clk.clk_info->jpegdec_clk);
> >   	pm_runtime_put(ctx->jpeg->dev);
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
