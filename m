Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B12C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUtEMIoJCUC5ZrI6DnGVBOKv4YtCjHr5Rnisfz1NapE=; b=q5CSHjO3TcXLBOZYahRjE4Wsfd
	G2uoJhI5TUqfvpCKXMraiI1ldcttJYUOQ4R71wKgKB4/k3LAWy+FXbILnufOBN3DGp6m78x9vDBiV
	3clS4TjVsz/57AD2jug5xaCcaa+SrIF0b+FsyE2iPbAUoRHrS6OQpgTZ7cv4r5jCNYqE7CQ9d4Of3
	wFleqjGxuUBfxMre96tLekc3z8PfZjfyVIAr8MJQzLcqxeYZb/pvcJvKlOJpsuIumZmHDXGZBU6uu
	FhUHj6+mNOaIgMTmpg0EQVUEtgcRKw6sOPw1idhsAkMb3t9GED+LEIyuXqMB5ALxRvAs39vg8zU6p
	2uZT81sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDO77-00CV9G-Pd; Mon, 18 Jul 2022 10:36:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDO6v-00CV3c-CJ; Mon, 18 Jul 2022 10:36:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 20EB56601A05;
	Mon, 18 Jul 2022 11:36:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658140580;
	bh=iSwuLXDnaixNeYtjbh3kKjug8iTFfg+DwQcZxPKFB4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W1rjXS+gHE1mn0A3nprW3zGjnLEJFTNW8RkL/QBefy02jWToxeWyghWXKuh7bMzqm
	 ZZ5MTe1MVRmXZzi1Nxdz4Cz6jKW90snYGwfbLUFtm2LkEnRpb8wGkvhUEZXtX7B/Jx
	 wSA3CKctUbzeFwE+1hYq7iONHK/R6gc30wvcoqfgETrj5duKABz/OfKYcPXE1ryOU9
	 B7fWdtmouNzSgQwVtoHxaotTv7SgPEu+FGQdSjPS60v0yMOJmUfN4tNPPVK0ymEUpb
	 g18ElU+S0sJykgWZraSv4vVTWwCqP02Thqo49IbDHL7Ub/PaKppfiTgi0l5pPqrEQi
	 xHIaIvV3M1gQw==
Message-ID: <737fbc8c-8890-c4e0-c7f6-e2c4c1cb9725@collabora.com>
Date: Mon, 18 Jul 2022 12:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [V5,6/8] media: mtk-jpegdec: add output pic reorder interface
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, nicolas.dufresne@collabora.com,
 wenst@chromium.org, kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com,
 srv_heupstream@mediatek.com
References: <20220716093408.29734-1-irui.wang@mediatek.com>
 <20220716093408.29734-7-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220716093408.29734-7-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_033621_591272_5B1B74E2 
X-CRM114-Status: GOOD (  16.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/07/22 11:34, Irui Wang ha scritto:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> add output reorder func to reorder the output images
> to ensure the output pic is consistent with the input images.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> 
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 49 ++++++++++++++++++-
>   1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 590300108bff..c0468cf96d74 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -440,6 +440,51 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>   }
>   EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_config);
>   
> +static void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
> +{
> +	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
> +	struct vb2_v4l2_buffer *dst_buffer;
> +	struct list_head *temp_entry;
> +	struct list_head *pos = NULL;
> +	struct mtk_jpeg_ctx *ctx;
> +	unsigned long flags;
> +
> +	ctx = jpeg->hw_param.curr_ctx;
> +	if (unlikely(!ctx)) {
> +		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
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
> +	       (pos != &ctx->dst_done_queue)) {
> +		list_for_each_prev_safe(pos,
> +					temp_entry,
> +					(&ctx->dst_done_queue)) {

This fits in one line, as it results in being 81 columns long, and parenthesis
are redundant for dst_done_queue.

Everything else looks ok to me.

Regards,
Angelo

