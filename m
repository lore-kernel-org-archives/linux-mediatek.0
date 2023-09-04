Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E26C83F2C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmfwTeVtbAPoyWlFHKsvxuLEp3LZ66ncmrxT4i4YRM4=; b=0E2+hEsIULHWSFYsb+h+d4jcAQ
	JoZCbXLZSzRLeadNGFLwUSjWch2HITr0iE8uOH6W7LgUp6wJFi7ZFxCUCSUpF9fRTZ1Q+Kmcqtjah
	vDYnPeitQvYyYpwXzsKGSkABUfuxemKjQiywpGSPNtirc4D4L/EVxhwAA08/EkGZ5FmzL3L0KYI7n
	1yDWY8e4sc5ailCYPhCclZnPgx9LzxWXQ39Iw6TzClkBsnj9VTZgUpr8B6Ek59hjGtn33txKAm80X
	YwKgB25E89FXDhmhtleFAfoc6FcvbmwypFKd+I/MNUMOtblrRV5xwMuUxeb/2etQO0GKZcqVdtbjf
	v5oIes3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdBKw-004MVp-1h;
	Mon, 04 Sep 2023 15:17:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdBKs-004MUi-05;
	Mon, 04 Sep 2023 15:17:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEA326183D;
	Mon,  4 Sep 2023 15:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9A2C433C7;
	Mon,  4 Sep 2023 15:17:49 +0000 (UTC)
Message-ID: <a9e1f059-4727-fa65-693e-c384890c3f97@xs4all.nl>
Date: Mon, 4 Sep 2023 17:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 02/18] media: videobuf2: Stop spamming kernel log with
 all queue counter
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-3-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230901124414.48497-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_081754_155064_BD16EA1F 
X-CRM114-Status: GOOD (  16.45  )
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

On 01/09/2023 14:43, Benjamin Gaignard wrote:
> Only report unbalanced queue counters do avoid spamming kernel log
> with useless information.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 69 +++++++++++--------
>  1 file changed, 41 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index cf3b9f5b69b7..85e561e46899 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -537,16 +537,18 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>  				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming ||
>  				  q->cnt_wait_prepare != q->cnt_wait_finish;
>  
> -		if (unbalanced || debug) {
> -			pr_info("counters for queue %p:%s\n", q,
> -				unbalanced ? " UNBALANCED!" : "");
> -			pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
> -				q->cnt_queue_setup, q->cnt_start_streaming,
> -				q->cnt_stop_streaming);
> -			pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
> -				q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
> -			pr_info("     wait_prepare: %u wait_finish: %u\n",
> -				q->cnt_wait_prepare, q->cnt_wait_finish);
> +		if (unbalanced) {
> +			pr_info("unbalanced counters for queue %p\n", q);

End the pr_info with ':' (i.e. "unbalanced counters for queue %p:\n")

> +			if (q->cnt_start_streaming != q->cnt_stop_streaming)
> +				pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
> +					q->cnt_queue_setup, q->cnt_start_streaming,
> +					q->cnt_stop_streaming);
> +			if (q->cnt_prepare_streaming != q->cnt_unprepare_streaming)
> +				pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
> +					q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
> +			if (q->cnt_wait_prepare != q->cnt_wait_finish)
> +				pr_info("     wait_prepare: %u wait_finish: %u\n",
> +					q->cnt_wait_prepare, q->cnt_wait_finish);
>  		}
>  		q->cnt_queue_setup = 0;
>  		q->cnt_wait_prepare = 0;
> @@ -567,24 +569,35 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>  				  vb->cnt_buf_prepare != vb->cnt_buf_finish ||
>  				  vb->cnt_buf_init != vb->cnt_buf_cleanup;
>  
> -		if (unbalanced || debug) {
> -			pr_info("   counters for queue %p, buffer %d:%s\n",
> -				q, buffer, unbalanced ? " UNBALANCED!" : "");
> -			pr_info("     buf_init: %u buf_cleanup: %u buf_prepare: %u buf_finish: %u\n",
> -				vb->cnt_buf_init, vb->cnt_buf_cleanup,
> -				vb->cnt_buf_prepare, vb->cnt_buf_finish);
> -			pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
> -				vb->cnt_buf_out_validate, vb->cnt_buf_queue,
> -				vb->cnt_buf_done, vb->cnt_buf_request_complete);
> -			pr_info("     alloc: %u put: %u prepare: %u finish: %u mmap: %u\n",
> -				vb->cnt_mem_alloc, vb->cnt_mem_put,
> -				vb->cnt_mem_prepare, vb->cnt_mem_finish,
> -				vb->cnt_mem_mmap);
> -			pr_info("     get_userptr: %u put_userptr: %u\n",
> -				vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
> -			pr_info("     attach_dmabuf: %u detach_dmabuf: %u map_dmabuf: %u unmap_dmabuf: %u\n",
> -				vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf,
> -				vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
> +		if (unbalanced) {
> +			pr_info("unbalanced counters for queue %p, buffer %d\n",

End with : here as well.

> +				q, buffer);
> +			if (vb->cnt_buf_init != vb->cnt_buf_cleanup)
> +				pr_info("     buf_init: %u buf_cleanup: %u\n",
> +					vb->cnt_buf_init, vb->cnt_buf_cleanup);
> +			if (vb->cnt_buf_prepare != vb->cnt_buf_finish)
> +				pr_info("     buf_prepare: %u buf_finish: %u\n",
> +					vb->cnt_buf_prepare, vb->cnt_buf_finish);
> +			if (vb->cnt_buf_queue != vb->cnt_buf_done)
> +				pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
> +					vb->cnt_buf_out_validate, vb->cnt_buf_queue,
> +					vb->cnt_buf_done, vb->cnt_buf_request_complete);
> +			if (vb->cnt_mem_alloc != vb->cnt_mem_put)
> +				pr_info("     alloc: %u put: %u\n",
> +					vb->cnt_mem_alloc, vb->cnt_mem_put);
> +			if (vb->cnt_mem_prepare != vb->cnt_mem_finish)
> +				pr_info("     prepare: %u finish: %u\n",
> +					vb->cnt_mem_prepare, vb->cnt_mem_finish);
> +			pr_info("     mmap: %u\n", vb->cnt_mem_mmap);

Drop this, and also drop the cnt_mem_mmap field. I don't think this is
interesting.

> +			if (vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr)
> +				pr_info("     get_userptr: %u put_userptr: %u\n",
> +					vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
> +			if (vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf)
> +				pr_info("     attach_dmabuf: %u detach_dmabuf: %u\n",
> +					vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf);
> +			if (vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf)
> +				pr_info("     map_dmabuf: %u unmap_dmabuf: %u\n",
> +					vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
>  			pr_info("     get_dmabuf: %u num_users: %u vaddr: %u cookie: %u\n",
>  				vb->cnt_mem_get_dmabuf,
>  				vb->cnt_mem_num_users,

Same for cnt_mem_vaddr and cnt_mem_cookie. It's not interesting. But let's keep get_dmabuf and num_users
for now.

Regards,

	Hans

