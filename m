Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D04C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIaV966ovjb7uOoXqA7KObWZkwmm8L8RsDBE+oHdI/Q=; b=oN49DdVYG/G/5y
	oFWVKYkzxfek6LUUxCZUWYFO1hSek/ANIKCwjnMdAxkuRzWpqmQkiWdjTiuBzrRrcSXW8R0WAmT39
	AM3ywYQKKhGo5oI/0g8ov42FMpD5EkQ1aZ91V70qWuRExDKuP7fzJqxcSfDupkUMCdiel4pVzunhf
	gkXl+OUbjOyIiVb+9hTw21mqOg3ss1QG87FQ13JIuwLYuH+sjSu79S0qeRwCg+sOQ14tPmxR0KBHc
	gu01MehcIHrTk9uhkoZY5wjYb5M9YPGkrER/M3WpChYyjTJKmU9D6L7ARGulOY5+yE1QbZE5sFgPJ
	WVUWCtkiAz9klqeb8nFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH5Qf-00AZ90-8M; Mon, 07 Feb 2022 14:55:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH5Lu-00AXtx-LU; Mon, 07 Feb 2022 14:50:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B335A1F444B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644245449;
 bh=13Pa/hRoL9bc6PMdKa7o3kW0gnpTZ/7yRWMBa7/cWug=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E5nDpwdJ3WJeBqgA11hTJgycuzr9IolkDMGGw/W0GyDH6gtijdYhCrmKgT50mz2Bc
 ZZWfgMuby4+E+/iGal0uerm3GAhl96/I61rhtkEAqVPDkJ+MgDbKItyIRozrlwGjy4
 x+JCnRZiXFTma4kNRMrHqjJF5MxIwbFhxRzLHzdgtfKFGamelDdQYY55JKopBN4Gt6
 kZpo/Wv17MvsU5RDVIteshi0UJzElRBd+0D8lNz9ZLPtZQjYR2EgwKYVKM4/mvn682
 dy+SO74CcRhmj++OGIZ/zqUL3OPfTWMfOI/5DoxJzz8yOHzjhnbTH03juHvW0bzPVP
 NUl8f8rHgCHoA==
Message-ID: <d305aefa-7cdf-3221-2883-9381785e335d@collabora.com>
Date: Mon, 7 Feb 2022 15:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V1, 5/6] media: mtk-jpegdec: add output pic reorder
 interface
Content-Language: en-US
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
 <1638509655-14296-6-git-send-email-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1638509655-14296-6-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_065050_968669_3BF08BC5 
X-CRM114-Status: GOOD (  19.85  )
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
> add output reorder func to reorder the output images
> to ensure the output pic is consistent with the input images.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c | 50 +++++++++++++++++++++--
>   1 file changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> index 9138ecb..fad5bf1c 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> @@ -443,6 +443,49 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>   	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
>   }
>   
> +void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)

This function is used only in this file, hence it should be static.

> +{
> +	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
> +	struct vb2_v4l2_buffer *dst_buffer;
> +	struct list_head *temp_entry;
> +	struct list_head *pos = NULL;
> +	struct mtk_jpeg_ctx *ctx;
> +	unsigned long flags;
> +
> +	ctx = jpeg->hw_param.curr_ctx;
> +	if (!ctx) {
> +		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");

Since this is unlikely to happen (or should be unlikely anyway!!), this print
should then be a dev_dbg()

> +		return;
> +	}
> +
> +	dst_buffer = jpeg->hw_param.dst_buffer;
> +	if (!dst_buffer) {
> +		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
> +		return;
> +	}
> +
> +	dst_done_buf = container_of(dst_buffer, struct mtk_jpeg_src_buf, b);
> +
> +	spin_lock_irqsave(&ctx->done_queue_lock, flags);
> +	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
> +	while (!list_empty(&ctx->dst_done_queue) &&
> +		(pos != &ctx->dst_done_queue)) {
> +		list_for_each_prev_safe(pos, temp_entry,
> +			(&ctx->dst_done_queue)) {
> +			tmp_dst_done_buf = list_entry(pos,
> +				struct mtk_jpeg_src_buf, list);
> +			if (tmp_dst_done_buf->frame_num ==
> +				ctx->last_done_frame_num) {
> +				list_del(&tmp_dst_done_buf->list);
> +				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> +					VB2_BUF_STATE_DONE);
> +				ctx->last_done_frame_num++;
> +			}
> +		}
> +	}
> +	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> +}
> +
>   static void mtk_jpegdec_timeout_work(struct work_struct *work)
>   {
>   	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> @@ -450,10 +493,9 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
>   		container_of(work, struct mtk_jpegdec_comp_dev,
>   		job_timeout_work.work);
>   	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
> -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct vb2_v4l2_buffer *src_buf;
>   
>   	src_buf = cjpeg->hw_param.src_buffer;
> -	dst_buf = cjpeg->hw_param.dst_buffer;
>   
>   	mtk_jpeg_dec_reset(cjpeg->reg_base);
>   	clk_disable_unprepare(cjpeg->pm.dec_clk.clk_info->jpegdec_clk);
> @@ -462,7 +504,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
>   	atomic_inc(&cjpeg->hw_rdy);
>   	wake_up(&master_jpeg->dec_hw_wq);
>   	v4l2_m2m_buf_done(src_buf, buf_state);
> -	v4l2_m2m_buf_done(dst_buf, buf_state);
> +	mtk_jpegdec_put_buf(cjpeg);
>   }
>   
>   int mtk_jpegdec_init_pm(struct mtk_jpegdec_comp_dev *mtkdev)
> @@ -559,7 +601,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   
>   dec_end:
>   	v4l2_m2m_buf_done(src_buf, buf_state);
> -	v4l2_m2m_buf_done(dst_buf, buf_state);
> +	mtk_jpegdec_put_buf(jpeg);
>   	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
>   	clk_disable_unprepare(jpeg->pm.dec_clk.clk_info->jpegdec_clk);
>   	pm_runtime_put(ctx->jpeg->dev);



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
