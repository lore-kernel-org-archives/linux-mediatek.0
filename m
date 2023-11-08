Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99F3C4167D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl4fWpL+4WqrRbrPGbkcAdKnVroGWhv60FIQBcZGIbQ=; b=I2lLWKjfbZN4/761XUKTHQjene
	Da1VNrKXSfHuZlzKQ+HYeWM1ifByAqyahZJKHY4iJ6yX+PkfTzaSem044C1Qr00r/8jXT4qgNIcP8
	mAOg2B2CxiQSEfuWpQCq774Jk7dyCrArUOAbugchr4Ai8nAOaj666sNRX3CvF/4v0I0NAb8I1Cwdc
	cmw4eEAprk5FN6bXussBsqxxVkSZe/3oAU1PGZENEROZkMHEA8MoNusxYa1lhMJKBOWYRB3jWYCzx
	HiQ7+Bpv6FgjzRRd6cF73LX6Bo3yVIPrMKR9DOT0bSykt9cDQUnGjmBamLuVpdwprbtEQDXPvrrQg
	iDSMKHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lr8-004Lgi-2R;
	Wed, 08 Nov 2023 16:56:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lr5-004Lfc-0u;
	Wed, 08 Nov 2023 16:56:40 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 09C0E660746B;
	Wed,  8 Nov 2023 16:56:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699462598;
	bh=kYRbh6QCO0drKtDqhYzofnzH2F/9JXlenVRZfwbwu2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C5FqcnxL9jhiXGVI76sn04GNZJCgntZUTy/I9qgG1i8iEcQiFkVs/6DjWQOzlh+HE
	 9cu+5ZDTU646TGuUZuAtq8h4xKbC3+rJG7QV1jp+4Y6EnVkBHdrFB6pB90cZynwQ26
	 f5A6no6MtNRkpRKOZOiNRirD9W0bSy4bLwgx56dw1D7iHaxv9X33YNHgQnDxBt0bZI
	 fqB6esSSpr4Ru0nL1IAr6Y3UyREqd63VvWxZMZ3UJMs2T01xXlJ4xryCce7ZZhq3Rd
	 2g2GmCWBEJtsSf8YBjuRB41kTh7bkoETju0eoVIY/NM9aqy3jyZ8v/yS/JAtUZJSdk
	 DFYC328oA+TTQ==
Message-ID: <3b8a4886-3589-4bde-9a18-74cb6a6a7509@collabora.com>
Date: Wed, 8 Nov 2023 17:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 10/56] media: amphion: Stop direct calls to queue
 num_buffers field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Zhou Peng <eagle.zhou@nxp.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-11-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-11-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_085639_453089_009DCE67 
X-CRM114-Status: GOOD (  16.28  )
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

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Ming Qian <ming.qian@nxp.com>
> CC: Zhou Peng <eagle.zhou@nxp.com>
> ---
>   drivers/media/platform/amphion/vpu_dbg.c  | 8 ++++----
>   drivers/media/platform/amphion/vpu_v4l2.c | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
> index a462d6fe4ea9..940e5bda5fa3 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -87,7 +87,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>   	num = scnprintf(str, sizeof(str),
>   			"output (%2d, %2d): fmt = %c%c%c%c %d x %d, %d;",
>   			vb2_is_streaming(vq),
> -			vq->num_buffers,
> +			vb2_get_num_buffers(vq),
>   			inst->out_format.pixfmt,
>   			inst->out_format.pixfmt >> 8,
>   			inst->out_format.pixfmt >> 16,
> @@ -111,7 +111,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>   	num = scnprintf(str, sizeof(str),
>   			"capture(%2d, %2d): fmt = %c%c%c%c %d x %d, %d;",
>   			vb2_is_streaming(vq),
> -			vq->num_buffers,
> +			vb2_get_num_buffers(vq),
>   			inst->cap_format.pixfmt,
>   			inst->cap_format.pixfmt >> 8,
>   			inst->cap_format.pixfmt >> 16,
> @@ -139,7 +139,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>   		return 0;
>   
>   	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
> -	for (i = 0; i < vq->num_buffers; i++) {
> +	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
>   		struct vb2_buffer *vb;
>   		struct vb2_v4l2_buffer *vbuf;
>   
> @@ -161,7 +161,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>   	}
>   
>   	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
> -	for (i = 0; i < vq->num_buffers; i++) {
> +	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
>   		struct vb2_buffer *vb;
>   		struct vb2_v4l2_buffer *vbuf;
>   
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> index 0f6e4c666440..87afb4a18d5d 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -439,7 +439,7 @@ int vpu_get_num_buffers(struct vpu_inst *inst, u32 type)
>   	else
>   		q = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
>   
> -	return q->num_buffers;
> +	return vb2_get_num_buffers(q);
>   }
>   
>   static void vpu_m2m_device_run(void *priv)
> @@ -587,7 +587,7 @@ static int vpu_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>   		  fmt->sizeimage[0], fmt->bytesperline[0],
>   		  fmt->sizeimage[1], fmt->bytesperline[1],
>   		  fmt->sizeimage[2], fmt->bytesperline[2],
> -		  q->num_buffers);
> +		  vb2_get_num_buffers(q));
>   	vb2_clear_last_buffer_dequeued(q);
>   	ret = call_vop(inst, start, q->type);
>   	if (ret)


