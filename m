Return-Path: <SRS0=EyWE=O5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C072C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 04:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623516103B
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 04:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 623516103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzl+EuXVUYqCN6jl6+ay/uKc+E5BDpLg62QnjeDHDcs=; b=WeslYpgybrOq0DxGBkmMIMks7j
	vJad8P+x2jlhjRBMDOvtS9PUzqbxT1vOyD2v9HcoXRnVKjmYLmJKDiAcRRdufu9EyGUNR5IzGEKPI
	ZO1rsDOvCBymgD+ISs+wnqpnPinBQYWPbynRxQQNrvPB/M0u+zBM9KtEblly2qSl7pbnVT0YdBJXl
	bnJtBel1ocolTx5FgCzc4GpbIIqkgt9s/nkKQbnquHfky40/hLP9AVdOnF8ZrX8/9ozmmFtweTqFx
	dOfpJNod2FQX0jIWcJxijLAu2GQrw9/4L1QGEBTMuRmtRHDpWhXJWeIUaS516Nup5oytMFhtYTPcr
	rXEIgMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ4AU-0058Dz-3L; Sat, 09 Oct 2021 04:41:06 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ4AT-0058DR-3k; Sat, 09 Oct 2021 04:41:05 +0000
Subject: Re: [PATCH] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com
References: <20211009024733.65676-1-guangming.cao@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c23181a5-b75b-c04b-7cc4-020f2b2b44c1@infradead.org>
Date: Fri, 8 Oct 2021 21:41:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009024733.65676-1-guangming.cao@mediatek.com>
Content-Language: en-US
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

On 10/8/21 7:47 PM, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> If dma-buf don't want userspace users to touch the dmabuf buffer,
> it seems we should add this restriction into dma_buf_ops.mmap,
> not in this IOCTL:DMA_BUF_SET_NAME.
> 
> With this restriction, we can only know the kernel users of the dmabuf
> by attachments.
> However, for many userspace users, such as userpsace users of dma_heap,
> they also need to mark the usage of dma-buf, and they don't care about
> who attached to this dmabuf, and seems it's no meaning to waitting for

                                                          to be waiting for

> IOCTL:DMA_BUF_SET_NAME rather than mmap.
> 
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..afbd0a226639 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   
>   /**
>    * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
> - * The name of the dma-buf buffer can only be set when the dma-buf is not
> - * attached to any devices. It could theoritically support changing the
> - * name of the dma-buf if the same piece of memory is used for multiple
> - * purpose between different devices.
> + * It could theoritically support changing the name of the dma-buf if the same

                theoretically

(yes, it was incorrect before this change.)

> + * piece of memory is used for multiple purpose between different devices.
>    *
>    * @dmabuf: [in]     dmabuf buffer that will be renamed.
>    * @buf:    [in]     A piece of userspace memory that contains the name of
> @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	if (IS_ERR(name))
>   		return PTR_ERR(name);
>   
> -	dma_resv_lock(dmabuf->resv, NULL);
> -	if (!list_empty(&dmabuf->attachments)) {
> -		ret = -EBUSY;
> -		kfree(name);
> -		goto out_unlock;
> -	}
>   	spin_lock(&dmabuf->name_lock);
>   	kfree(dmabuf->name);
>   	dmabuf->name = name;
>   	spin_unlock(&dmabuf->name_lock);
>   
> -out_unlock:
> -	dma_resv_unlock(dmabuf->resv);
>   	return ret;
>   }
>   
> 


-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
