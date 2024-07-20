Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DFCC3DA59
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpBMQO3OqjGAx6uDMqSVU/ytuqm4KP7DV6TrGiDbAbM=; b=dPg1AAxcBp1zNnT9JvY2dQMAND
	BnSyPUepb1EylLM+AVAkJQKiuwn5wX49fqCDlmCfLGTwidBpROK+5H1BN0rh/2zZcNMsRqq6/qnqX
	x7VLEMs1OqITie8rfcvU+ZzN3aMppYQ3vXDWD02YHB7L+44DO5JymAl/p/PCioI9JaveyzZ3Bpr7C
	no29AaOFPrBvrlfFGk4rzXV/A++LPaSJfH8r5KaX46CDUNTz717vCBJCHMAdhWIJwFswgW5QNGIHT
	vGoRkzTvTaiEYqPKdarc90e9Vju3nNxYwgbSxjwIfJV8lCQOiyFFHjQhy2qaeRoSx+EyQj8StQ6Vq
	tA02Jt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV6PX-00000004q3X-1ydJ;
	Sat, 20 Jul 2024 09:29:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV6PA-00000004pp3-3Tfr;
	Sat, 20 Jul 2024 09:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39684CE010F;
	Sat, 20 Jul 2024 09:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FD1C2BD10;
	Sat, 20 Jul 2024 09:29:18 +0000 (UTC)
Message-ID: <8c76b9da-bcc2-4316-b372-ea5f0c632d26@xs4all.nl>
Date: Sat, 20 Jul 2024 11:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/28] media: videobuf2: calculate restricted memory
 size
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-4-yunfei.dong@mediatek.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240720071606.27930-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_022929_224139_F367C80F 
X-CRM114-Status: GOOD (  21.22  )
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

On 20/07/2024 09:15, Yunfei Dong wrote:
> Getting the physical address with sg_dma_address for restricted memory,
> only return the first physical address size since sg may not be physical
> continuous, then leading to the dmabuf size is small than buf size. Need
> to bypass continuous checking for restricted memory.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 34 +++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef5310..f0e4652b615f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -66,6 +66,22 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>  	return size;
>  }
>  
> +/**************************************************/
> +/*   restricted mem scatterlist table functions   */
> +/**************************************************/
> +
> +static unsigned long vb2_dc_get_res_mem_contiguous_size(struct sg_table *sgt)
> +{
> +	struct scatterlist *s;
> +	unsigned int i;
> +	unsigned long size = 0;
> +
> +	for_each_sgtable_dma_sg(sgt, s, i)
> +		size += sg_dma_len(s);
> +
> +	return size;
> +}

I think it is better to add a 'bool restricted' argument to vb2_dc_get_contiguous_size.
If true, then skip the 'expected' check there.

> +
>  /*********************************************/
>  /*         callbacks for all buffers         */
>  /*********************************************/
> @@ -648,10 +664,13 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
>  		goto fail_sgt_init;
>  	}
>  
> -	contig_size = vb2_dc_get_contiguous_size(sgt);
> +	if (buf->vb->vb2_queue->restricted_mem)

I think it is better to do the same as with buf->non_coherent_mem,
so add a 'bool restricted_mem' to struct vb2_dc_buf and set it in
vb2_dc_alloc(). It makes this code easier to read.

> +		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
> +	else
> +		contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < size) {
> -		pr_err("contiguous mapping is too small %lu/%lu\n",
> -			contig_size, size);
> +		pr_err("contiguous mapping is too small %lu/%lu/%u\n",
> +		       contig_size, size, buf->vb->vb2_queue->restricted_mem);

Rather than add a "/%u", which is not easy to understand, perhaps do this:

		pr_err("%scontiguous mapping is too small %lu/%lu\n",
		       buf->vb->vb2_queue->restricted_mem ? "restricted " : "",
		       contig_size, size);

>  		ret = -EFAULT;
>  		goto fail_map_sg;
>  	}
> @@ -711,10 +730,13 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>  	}
>  
>  	/* checking if dmabuf is big enough to store contiguous chunk */
> -	contig_size = vb2_dc_get_contiguous_size(sgt);
> +	if (buf->vb->vb2_queue->restricted_mem)
> +		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
> +	else
> +		contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < buf->size) {
> -		pr_err("contiguous chunk is too small %lu/%lu\n",
> -		       contig_size, buf->size);
> +		pr_err("contiguous chunk is too small %lu/%lu/%u\n",
> +		       contig_size, buf->size, buf->vb->vb2_queue->restricted_mem);

Ditto.

>  		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
>  						  buf->dma_dir);
>  		return -EFAULT;

Regards,

	Hans

