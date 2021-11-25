Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF47C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Lg18j4+OGEOhxjPEFpmtt5N2mGswOuTS8v/1XHN1Kg4=; b=U8YrEZVNnUbbO7e690R9rNtO7L
	w+P913+i9aJqCf+0sxr1AKYdHUNPn8dznGQnvUJApsbpuIQim3uLSs6SyzpEhX9ComLNOAyK5Vbck
	PuiGy/Grx/ehyFbxfRpExusLrOuqfq1xpRi0QJL7xd6WjNxKHpbFokWS7T+3tKzeFsvix42SIOkBi
	3YREXeLtfyq4y5Ic+oDovSmRWuSch8ZD/AIwKefnErN7amMFzUzZ3bE7DnUsmRlN1iaN5qQHTcwaF
	d1XKbn6PyVOx8PrfQYP9JJjUJ1q3QXe18MV2bN1+HVTGzUB2N3FX/zBalrXm+RXnOYHbQsOagqBj2
	zUJRSDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqA9W-006igR-VG; Thu, 25 Nov 2021 08:30:46 +0000
Received: from lb1-smtp-cloud9.xs4all.net ([2001:888:0:108::1c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqA9U-006ieY-3O
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 08:30:46 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id qA9Im61391HGJqA9Lm2o3M; Thu, 25 Nov 2021 09:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1637829037; bh=9EAtMFeE4ZFHwDaCGPKmvAvvkvJAdiUCLPzQOH4sMzk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=Av3SCX4RC918JILq+Qtse9DMmVQkIxxlMYHJSH33l5nCYSJCUEBamJDXNk8HMqdYq
 F4wv4ZhQCVlPCz7BhILPWRwMWW5M8Fw+JWQSOfrPR9JDgDLwyXyUuPGeeqX07s6hz4
 McW8+vJom+rzeqdZLabjByn+Dwyvd577wm5xSzCtD+wXSqkohIV/7NQwAMzIV4gp2a
 BD9VftvysPmuSoKlorU4Sf9elyL/JAt9tcge7N0xC50B3xA/T9Okg+HwI0/aSTuI/p
 sTCzEsXhUv4SaMEIMzjFUBSn0y2Anu9DA/aJKv3mUhYZr7FQ2iFbl5ZY+Vdn2YQAA2
 gxXOUs/zfHojg==
Subject: Re: [PATCH v2 3/7] media: mtk-vcodec: enc: use "stream_started" flag
 for "stop/start_streaming"
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-media@vger.kernel.org
Cc: kernel@collabora.com, acourbot@chromium.org, andrew-ct.chen@mediatek.com, 
 courbot@chromium.org, dafna3@gmail.com, eizan@chromium.org,
 houlong.wei@mediatek.com, hsinyi@chromium.org, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
 <20211117130635.11633-4-dafna.hirschfeld@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <759d6336-f63a-cd9c-80bf-666b47bb9cf7@xs4all.nl>
Date: Thu, 25 Nov 2021 09:30:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117130635.11633-4-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfAG6teqi8hLRwclr+QvS6o6Y4uotSrdyZ+GCGL1pPLdSd7au7fQuZ35paCdUB5s9Os6AJlLc/MpCvMEQUQ0BZbpLM0L0MKcBtnnPA3ncD0k/swMTlWdg
 QMa/EcdkGDExjMSHTM2XqHcLdaeYYODs7TS9bLZzkgHlz4U0mYYM8kr4/B3xQ9eRNPXn8EJVeCH8NPCuqVg1hmST1RdrG8v/PnSV4qswUFVIukMXG9ZiwHKS
 vl9Cj9W6pGOWh8XY/0qQasafX8JOHnjDtYpjR59MjNkhGwNAFiJ5I8jh68OCdKPnb3PbF7HSeXG4H6w8FHIk3SlSpOGVq/LT3xmR1BpLwZI/iYGdNi1FeBMp
 RMP8B6pAhevD8tjMa705DdPh3S8e3rFTqbQnc1pCWqjxMIkL0HURiBVTmL7mhMBJ9elT/vNyyXMSclX7MM7HLWsnBEViN69NFZnL4lL2kU+ib1siKGU9fi0m
 Q9dl/5weLwtn919bDF80xpzuKTfalpx9za15TBc1wrEiem4bzEN+S5VlttPTv3aLhx4QYgX3UGnAvVjHMtjNtx11YvVBgvzbmiX8uJpbzJaHuCyYvintBoEe
 J+M14pHjwuCXKwr/qfBcf7eR6yTHkCzJGSDSrnJh0H1LlVLIHgTszWucVozdr2/NAx34XZLB2fmwG+iz0w+torIWHBIf6tMUofelDvq05BUwXnwEo6CTliuT
 uLoJh9MnJL5V6j1YeoHe5XrdgU3GHI1dOSw+4UIPPFTJn+9ufS4ncJ2WRKVNwejF+oOkO6LacUdpPoABd/qkxTGbQ1uOf9t74lvbNiEkiEURN1xhmFBnCH0h
 AGkomg38AWtN/nqb24Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_003044_323493_0AF2D066 
X-CRM114-Status: GOOD (  33.16  )
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

Hi Dafna,

On 17/11/2021 14:06, Dafna Hirschfeld wrote:
> Currently the mtk-vcodec encoder does runtime pm resume
> in "start_streaming" cb if both queues are streaming
> and does runtime pm 'put' in "stop_streaming" if both
> queues are not streaming.
> This is wrong since the same queue might be started and
> then stopped causing the driver to turn off the hardware
> without turning it on. This cause for example unbalanced
> calls to pm_runtime_*
> 
> Fixes: 4e855a6efa547 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> to reproduce the issue:
> patch v4l-utils as follow:
> 
> static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
> 
>  	if (fd.streamon(out.g_type()))
>  		return;
> +	if (fd.streamoff(out.g_type()))
> +		return;
> +
> +	exit(1);
> 
>  	fd.s_trace(0);
>  	if (exp_fd_p)
> 
> and call:
> v4l2-ctl -x width=160,height=128,pixelformat=NM12 -v pixelformat=VP80 --stream-mmap --stream-out-mmap -d5
> then the file /sys/devices/platform/soc/19002000.vcodec/power/runtime_usage
> will show a negative number and further streaming (with e.g, gstreamer) is not possible.
> 
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 4 ++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9d36e3d27369..84c5289f872b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -259,6 +259,9 @@ struct vdec_pic_info {
>   * @decoded_frame_cnt: number of decoded frames
>   * @lock: protect variables accessed by V4L2 threads and worker thread such as
>   *	  mtk_video_dec_buf.
> + * @stream_started: this flag is turned on when both queues (cap and out) starts streaming
> + *	  and it is turned off once both queues stop streaming. It is used for a correct
> + *	  setup and set-down of the hardware when starting and stopping streaming.
>   */
>  struct mtk_vcodec_ctx {
>  	enum mtk_instance_type type;
> @@ -301,6 +304,7 @@ struct mtk_vcodec_ctx {
>  
>  	int decoded_frame_cnt;
>  	struct mutex lock;
> +	bool stream_started;
>  
>  };
>  
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 87a5114bf680..fb3cf804c96a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -890,6 +890,9 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  		goto err_start_stream;
>  	}
>  
> +	if (ctx->stream_started)
> +		return 0;
> +
>  	/* Do the initialization when both start_streaming have been called */
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>  		if (!vb2_start_streaming_called(&ctx->m2m_ctx->cap_q_ctx.q))
> @@ -928,6 +931,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  		ctx->state = MTK_STATE_HEADER;
>  	}
>  
> +	ctx->stream_started = true;
>  	return 0;
>  
>  err_set_param:
> @@ -1002,6 +1006,9 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  		}
>  	}
>  
> +	if (!ctx->stream_started)
> +		return;
> +
>  	if ((q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>  	     vb2_is_streaming(&ctx->m2m_ctx->out_q_ctx.q)) ||
>  	    (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&

(copy-and-pasted from my reply to the same patch in the v1 series, you probably
missed that reply...)

I don't think this patch is the right fix. I think the real problem is that
vb2ops_venc_start_streaming() calls vb2_start_streaming_called() to
check that the other queue is also ready to start streaming, whereas
vb2ops_venc_stop_streaming() incorrectly calls vb2_is_streaming()
instead of vb2_start_streaming_called().

So my guess is that this mismatch is what causes the problem. Regardless,
it is definitely a bug that vb2ops_venc_stop_streaming() calls vb2_is_streaming().

I'm marking this patch as 'Changes Requested', but I'll accept the other patches
this series (with patch 4/7 fixed to take care of the kernel test robot report).

Regards,

	Hans

> @@ -1023,6 +1030,7 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  		mtk_v4l2_err("pm_runtime_put fail %d", ret);
>  
>  	ctx->state = MTK_STATE_FREE;
> +	ctx->stream_started = false;
>  }
>  
>  static int vb2ops_venc_buf_out_validate(struct vb2_buffer *vb)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
