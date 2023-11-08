Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C0C4167D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyeDFCIAX9kPeURHeE+85dw0OUA5YL55iBJKJFSPuPc=; b=ERnMC4mM2e3dQjKg7hiFGaMk+I
	gaMXnksNwpw0dxfqcazvtu78vkVFTMVqmzGAEeyoMsy83VkUMytHG11cJan07VxXQtii27sv7NFsW
	Ko1ZYyhehm05fsfYW250rAJHJe2HHby52mcprcqarNV5y4fTjcD9EtQtXaIXIQgO2neObmMijgMoO
	vgq9G98kc7aWJChqx6KAcnH5PRX8BoTcPxkH0tkzyFa82oGk5Wc+TmwIFP6y2T1E0MJcfvs/mx3Cu
	yvuz8kUBPdAAZx6MGR6cWfzaaFAsFqq3oBfyIrAV+V8j7KbjjOeR178wjzFpo2v/t1cuDT7tAT4X1
	0k/OstNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kDP-004A0A-1i;
	Wed, 08 Nov 2023 15:11:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kDL-0049wg-2j;
	Wed, 08 Nov 2023 15:11:33 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8CB55660768A;
	Wed,  8 Nov 2023 15:11:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699456285;
	bh=K5VXgBozdsSABodMQiE6+mK90u54h0+xV4Xvoon1qpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kkphmV+JYfqj+ns8NoxsBLanCoQtKf/WqfersIRDq1ESjfsgbVsLyKprjuLkHb8+u
	 eYbeV/5sc9Uaixti/t99d0OJJa69i7X1jzOaxDyUqUbNO2LBrNgLoZCfEPbEp3S5s3
	 GgHwUpWZoRyvaqdkQXSdRH6HRp/Bi4yK+I+vaYWWK+Qo9pl7ya72C2qzL30umV1BUA
	 pKN2f2avJQGq79jRDm2H8n/TPa/eYtmQpuGxtvH6ZmOedLNG1Lbm1VFNpyeDyBOcEp
	 sKhe8zYc4qBHUHSmVlVp9/G+MKwvITnFKP02mJzKB0j9WibptLiG+uH8sOp7cO3mbu
	 cDh/a/cECWL/A==
Message-ID: <762f42fb-1cb3-4854-bd48-90d91c2eb3ef@collabora.com>
Date: Wed, 8 Nov 2023 16:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 01/56] media: videobuf2: Rename offset parameter
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-2-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071132_134121_2C0AAFCC 
X-CRM114-Status: GOOD (  17.35  )
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
> Rename 'off' parameter to 'offset' to clarify the code.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   .../media/common/videobuf2/videobuf2-core.c   | 26 +++++++++----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 27aee92f3eea..a5e57affeb30 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -356,23 +356,23 @@ static void __setup_offsets(struct vb2_buffer *vb)
>   {
>   	struct vb2_queue *q = vb->vb2_queue;
>   	unsigned int plane;
> -	unsigned long off = 0;
> +	unsigned long offset = 0;
>   
>   	if (vb->index) {
>   		struct vb2_buffer *prev = q->bufs[vb->index - 1];
>   		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
>   
> -		off = PAGE_ALIGN(p->m.offset + p->length);
> +		offset = PAGE_ALIGN(p->m.offset + p->length);
>   	}
>   
>   	for (plane = 0; plane < vb->num_planes; ++plane) {
> -		vb->planes[plane].m.offset = off;
> +		vb->planes[plane].m.offset = offset;
>   
>   		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
> -				vb->index, plane, off);
> +				vb->index, plane, offset);
>   
> -		off += vb->planes[plane].length;
> -		off = PAGE_ALIGN(off);
> +		offset += vb->planes[plane].length;
> +		offset = PAGE_ALIGN(offset);
>   	}
>   }
>   
> @@ -2185,9 +2185,9 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
>   EXPORT_SYMBOL_GPL(vb2_core_streamoff);
>   
>   /*
> - * __find_plane_by_offset() - find plane associated with the given offset off
> + * __find_plane_by_offset() - find plane associated with the given offset
>    */
> -static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
> +static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>   			unsigned int *_buffer, unsigned int *_plane)
>   {
>   	struct vb2_buffer *vb;
> @@ -2218,7 +2218,7 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
>   		vb = q->bufs[buffer];
>   
>   		for (plane = 0; plane < vb->num_planes; ++plane) {
> -			if (vb->planes[plane].m.offset == off) {
> +			if (vb->planes[plane].m.offset == offset) {
>   				*_buffer = buffer;
>   				*_plane = plane;
>   				return 0;
> @@ -2304,7 +2304,7 @@ EXPORT_SYMBOL_GPL(vb2_core_expbuf);
>   
>   int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>   {
> -	unsigned long off = vma->vm_pgoff << PAGE_SHIFT;
> +	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
>   	struct vb2_buffer *vb;
>   	unsigned int buffer = 0, plane = 0;
>   	int ret;
> @@ -2335,7 +2335,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>   	 * Find the plane corresponding to the offset passed by userspace. This
>   	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
>   	 */
> -	ret = __find_plane_by_offset(q, off, &buffer, &plane);
> +	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
>   	if (ret)
>   		goto unlock;
>   
> @@ -2380,7 +2380,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
>   				    unsigned long pgoff,
>   				    unsigned long flags)
>   {
> -	unsigned long off = pgoff << PAGE_SHIFT;
> +	unsigned long offset = pgoff << PAGE_SHIFT;
>   	struct vb2_buffer *vb;
>   	unsigned int buffer, plane;
>   	void *vaddr;
> @@ -2392,7 +2392,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
>   	 * Find the plane corresponding to the offset passed by userspace. This
>   	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
>   	 */
> -	ret = __find_plane_by_offset(q, off, &buffer, &plane);
> +	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
>   	if (ret)
>   		goto unlock;
>   


