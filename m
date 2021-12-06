Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DFCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7yubAp0VQ1Jye8K0GCwUyvRofEp+gSUVflQJBW2LSc=; b=d5TRXVqUlqC/UT5tJHYQlcwvJ6
	lFYYlIiiAudLTbnHYBuE1vwPTPSzLb/4/n9bait/n9rJ5M2s/Rfs9BwgXgVOP5OfN7tC2N2UW/rO/
	zQTdrroVFlU78Ug7+s0pnin82s8QwO/oRmP+1YXL5I7GZAX4+PJj8+3rfzi7n1rMAAZolyaVWlL/m
	hoxMZtjP7gZ4y+MmXE++7xKiv35FhKNHghtI/lbaVxnCE/HHE2qcz19jKKZbhnJ65+damAhOSla1k
	U2LCY7tZ5Zf9Pkzlh+Z73eg3HcmHJialzn6NYrIkIdHOiPWwKZBqCNaZotT4wCxzjn4T//F7R4Q4a
	jOZhZ0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGoy-004lsA-3X; Mon, 06 Dec 2021 16:26:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGok-004lpX-IZ; Mon, 06 Dec 2021 16:26:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2A2121F449AA
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638807977; bh=0rQTTF2QgSQJJ2bf5Dy5jQmG8LVwC5zO11tv6jX0lD8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=W4h85dImJdJQH7Oc7BRt49wZWM81HCKeAFrqvhzH2zGAWWvnPh7GHUuqUtffAElxL
 +BW5+mIT/cMKfX+L1d4rYM/k3a37IIxejwkKpeIs4cPcD0DmNWFZ/388R/tnlGZshY
 zroRVpymTCTmwV4fMBdkdLPGushIcrB4kn4h46fsXOb4zneDJOwmy2XHiHvhBTCdm4
 4tzfMA/dIt4iEoboEiVJT4rO86e1BjCbTl3pa+iBTilR40tInFqfC0yE/zfMRDBYlT
 Vt0eU4uILRYsSQq0tenDYfWgKt7XR2TBQ/UbE1BGLHx2VRDguv1si9HP4HMcjSiMlb
 nb2LkHyYJgP5g==
Subject: Re: [PATCH V1, 4/6] media: mtk-jpegdec: add jpeg decode worker
 interface
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
References: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
 <1638509655-14296-5-git-send-email-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1de01778-5750-c7aa-eac9-d9f91ad76ddb@collabora.com>
Date: Mon, 6 Dec 2021 17:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1638509655-14296-5-git-send-email-kyrie.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_082618_958734_CD1A3A3F 
X-CRM114-Status: GOOD (  30.40  )
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

Il 03/12/21 06:34, kyrie.wu ha scritto:
> Add jpeg decoding worker to ensure that three HWs
> run in parallel in MT8195.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 190 +++++++++++++++++++---
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |   5 +
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |  17 ++
>   3 files changed, 189 insertions(+), 23 deletions(-)
> 

Hello Kyrie,
thanks for the patch! However, there are some things to improve...

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index f2a5e84..2518660 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1065,57 +1065,187 @@ static void mtk_jpeg_enc_device_run(void *priv)
>   	queue_work(jpeg->workqueue, &ctx->jpeg_work);
>   }
>   
> -static void mtk_jpeg_dec_device_run(void *priv)
> +static int mtk_jpegdec_select_hw(struct mtk_jpeg_ctx *ctx)
>   {
> -	struct mtk_jpeg_ctx *ctx = priv;
> +	struct mtk_jpegdec_comp_dev *comp_jpeg;
>   	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> -	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
>   	unsigned long flags;
> -	struct mtk_jpeg_src_buf *jpeg_src_buf;
> +	int hw_id = -1;
> +	int i;
> +
> +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> +	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +		comp_jpeg = jpeg->dec_hw_dev[i];
> +		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
> +			hw_id = i;
> +			comp_jpeg->hw_state = MTK_JPEG_HW_BUSY;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> +
> +	return hw_id;
> +}
> +
> +static int mtk_jpegdec_deselect_hw(struct mtk_jpeg_dev *jpeg, int hw_id)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> +	jpeg->dec_hw_dev[hw_id]->hw_state =
> +		MTK_JPEG_HW_IDLE;
> +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegdec_set_hw_param(struct mtk_jpeg_ctx *ctx,
> +	int hw_id,
> +	struct vb2_v4l2_buffer *src_buf,
> +	struct vb2_v4l2_buffer *dst_buf)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =
> +		ctx->jpeg->dec_hw_dev[hw_id];
> +
> +	jpeg->hw_param.curr_ctx = ctx;
> +	jpeg->hw_param.src_buffer = src_buf;
> +	jpeg->hw_param.dst_buffer = dst_buf;
> +
> +	return 0;
> +}
> +
> +static void mtk_jpegdec_worker(struct work_struct *work)
> +{
> +	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
> +		jpeg_work);
> +	struct mtk_jpegdec_comp_dev *comp_jpeg[MTK_JPEGDEC_HW_MAX];
> +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +	atomic_t *hw_rdy[MTK_JPEGDEC_HW_MAX];
> +	struct clk *jpegdec_clk;
> +	int ret, i, hw_id = 0;
>   	struct mtk_jpeg_bs bs;
>   	struct mtk_jpeg_fb fb;
> -	int ret;
> +	unsigned long flags;
> +
> +	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +		comp_jpeg[i] = jpeg->dec_hw_dev[i];
> +		hw_rdy[i] = &comp_jpeg[i]->hw_rdy;
> +	}
> +

This entire retry_select block should go to a helper function instead
of being inside of here.

Also, there's a big issue with this snippet that has to be solved: you're
unconditionally calling "goto retry_select" at the end of the if branch,
but please consider the following scenario:

- mtk_jpegdec_select_hw() returns a hw_id < 0
- wait_event_interruptible returns 0
... then we redo the same, and we still get the same result.

This may generate an infinite loop!!

After putting this into a separate function, please use a controlled loop
with a well thought maximum number of retries, as to avoid this situation.

> +retry_select:
> +	hw_id = mtk_jpegdec_select_hw(ctx);
> +	if (hw_id < 0) {
> +		ret = wait_event_interruptible(jpeg->dec_hw_wq,
> +			(atomic_read(hw_rdy[0]) ||
> +			atomic_read(hw_rdy[1]) ||
> +			atomic_read(hw_rdy[2])) > 0);
> +		if (ret != 0) {
> +			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
> +				__func__, __LINE__);
> +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +			return;
> +		}
> +
> +		dev_err(jpeg->dev, "%s : %d, NEW HW IDLE, please retry selcet!!!\n",
> +			__func__, __LINE__);
> +		goto retry_select;
> +	}
>   
> +	atomic_dec(&comp_jpeg[hw_id]->hw_rdy);
>   	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	if (!src_buf) {
> +		dev_err(jpeg->dev, "%s : %d, get src_buf fail !!!\n",
> +			__func__, __LINE__);
> +		goto getbuf_fail;
> +	}
>   	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (!dst_buf) {
> +		dev_err(jpeg->dev, "%s : %d, get dst_buf fail !!!\n",
> +			__func__, __LINE__);
> +		goto getbuf_fail;
> +	}
> +
>   	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> +	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
>   
> -	if (mtk_jpeg_check_resolution_change(ctx, &jpeg_src_buf->dec_param)) {
> +	if (mtk_jpeg_check_resolution_change(ctx,
> +		&jpeg_src_buf->dec_param)) {

Why are you breaking this line? There's no need to.

>   		mtk_jpeg_queue_src_chg_event(ctx);
>   		ctx->state = MTK_JPEG_SOURCE_CHANGE;
> -		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> -		return;
> +		goto getbuf_fail;
>   	}
>   


Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
