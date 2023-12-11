Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F724C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QND1QHpepruOGumHZ/dutTSuWcKv95HIrOvhmexoK1I=; b=iDp2uYrpjkXSyvRKM7cJDprSvJ
	JmXKkhu6qwh+djhVkI9o9DvE0QbJzGqalZci8kVJpyYMoHyMMu1SEohF284kT4uNRk2KePEuusm1N
	LZYsHdV6Nn7KBsCM5Zt++pQKgbUojHkOF1u2MLijlWXh3lNX0AVuZiHY4FVJtYn34AUHzWIUZibKH
	TLih6hGuKE2c9MOK0Ng3rGQgEGrCmFycBXNe5MrOP6CUnaxsI25V2O8r6wCig98Btmbl27r2QtD+Y
	7Mq9mTz+m2aoi5uviwq6lZ9ByDdD8+blaB2ySpEIjIxV5F3ijAqLgrMoc+J0Ozzx/FU55OxVekhVT
	e4crShxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdzt-004gNA-2u;
	Mon, 11 Dec 2023 10:58:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdzp-004gMg-1f;
	Mon, 11 Dec 2023 10:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DDBB611A7;
	Mon, 11 Dec 2023 10:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9F0C433C7;
	Mon, 11 Dec 2023 10:58:38 +0000 (UTC)
Message-ID: <705ce6b0-e945-404c-8014-38881a01fbca@xs4all.nl>
Date: Mon, 11 Dec 2023 11:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,03/21] v4l2: verify secure dmabufs are used in secure
 queue
Content-Language: en-US, nl
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-4-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231206081538.17056-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_025845_761197_C8AB0730 
X-CRM114-Status: GOOD (  17.05  )
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

On 06/12/2023 09:15, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Verfies in the dmabuf implementations that if the secure memory flag is

Verfies -> Verifies

> set for a queue that the dmabuf submitted to the queue is unmappable.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++++++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef5310..ad58ef8dc231 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -710,6 +710,12 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* verify the dmabuf is secure if we are in secure mode */
> +	if (buf->vb->vb2_queue->secure_mem && sg_page(sgt->sgl)) {

This needs a bit more explanation. I guess that for secure memory
sg_page returns NULL?

> +		pr_err("secure queue requires secure dma_buf");
> +		return -EINVAL;
> +	}
> +
>  	/* checking if dmabuf is big enough to store contiguous chunk */
>  	contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < buf->size) {
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 28f3fdfe23a2..55428c73c380 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -564,6 +564,12 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* verify the dmabuf is secure if we are in secure mode */
> +	if (buf->vb->vb2_queue->secure_mem && !sg_dma_secure(sgt->sgl)) {

I can't find the sg_dma_secure function. I suspect this patch series
depends on another series?

> +		pr_err("secure queue requires secure dma_buf");
> +		return -EINVAL;
> +	}
> +
>  	buf->dma_sgt = sgt;
>  	buf->vaddr = NULL;
>  

Regards,

	Hans

