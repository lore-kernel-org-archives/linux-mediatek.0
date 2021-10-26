Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 08:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3A160F9B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 08:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D3A160F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFZ8i/x8fpWBq9pZ5xNBO7wIEly9n2p9JdMleQdS9J4=; b=RjiVTHThVXVcvr
	h3rgPndjwEx6eoAXvqOposK/V4sQdbX6NWUnjwiO0nu7ZfmBZm5TuUWcBkBhRH9a0F3/00bsuKIIn
	D+1LEBk8+1lfhZrYjTVbXx0dwfWXN1JK+COQCrVEcRvqo/+YxhzLbV9ShWQyUGTpZLKpCWwGnNpC7
	Ag5j+kf2GZMKDxW8nY91hY8H0ZD3pE/RL8FEm87sTo9JmponWYNl4Ld3pMUgzrgjFOQacJdzBqaDY
	fel4ZZ7l07XqzBudrscHAEho8ADsneJ6XHfvM9k7R53tpgJXTEFbyD4wDgy4BqSFXIT8Mwf6aeFXc
	87X/bwskhaLJcG/LlXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfHbV-0010pN-Ui; Tue, 26 Oct 2021 08:14:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfHbJ-0010nw-HF; Tue, 26 Oct 2021 08:14:31 +0000
X-UUID: 8b25661f0e5e4b6da60eb5b009222492-20211026
X-UUID: 8b25661f0e5e4b6da60eb5b009222492-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1674407756; Tue, 26 Oct 2021 01:14:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 01:04:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Oct 2021 16:04:45 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 26 Oct 2021 16:04:44 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>, <sumit.semwal@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <rdunlap@infradead.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date: Tue, 26 Oct 2021 16:04:51 +0800
Message-ID: <20211026080451.3763-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211014102551.54983-1-guangming.cao@mediatek.com>
References: <20211014102551.54983-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_011429_609646_37303B04 
X-CRM114-Status: GOOD (  29.41  )
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

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Thu, 2021-10-14 at 18:25 +0800, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> In this patch(https://patchwork.freedesktop.org/patch/310349),
> it add a new IOCTL to support dma-buf user to set debug name.
> 
> But it also added a limitation of this IOCTL, it needs the
> attachments of dmabuf should be empty, otherwise it will fail.
> 
> For the original series, the idea was that allowing name change
> mid-use could confuse the users about the dma-buf.
> However, the rest of the series also makes sure each dma-buf have a
> unique
> inode(https://patchwork.freedesktop.org/patch/310387/), and any
> accounting
> should probably use that, without relying on the name as much.
> 
> So, removing this restriction will let dma-buf userspace users to use
> it
> more comfortably and without any side effect.
> 
Hi christian, sumit,

Just a gentle ping for this patch, please kindly let me know your comments about this patch.
Thanks!

Guangming

> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/dma-buf.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..5fbb3a2068a3 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file,
> poll_table *poll)
>  
>  /**
>   * dma_buf_set_name - Set a name to a specific dma_buf to track the
> usage.
> - * The name of the dma-buf buffer can only be set when the dma-buf
> is not
> - * attached to any devices. It could theoritically support changing
> the
> - * name of the dma-buf if the same piece of memory is used for
> multiple
> - * purpose between different devices.
> + * It could support changing the name of the dma-buf if the same
> + * piece of memory is used for multiple purpose between different
> devices.
>   *
>   * @dmabuf: [in]     dmabuf buffer that will be renamed.
>   * @buf:    [in]     A piece of userspace memory that contains the
> name of
> @@ -341,25 +339,16 @@ static __poll_t dma_buf_poll(struct file *file,
> poll_table *poll)
>  static long dma_buf_set_name(struct dma_buf *dmabuf, const char
> __user *buf)
>  {
>  	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
> -	long ret = 0;
>  
>  	if (IS_ERR(name))
>  		return PTR_ERR(name);
>  
> -	dma_resv_lock(dmabuf->resv, NULL);
> -	if (!list_empty(&dmabuf->attachments)) {
> -		ret = -EBUSY;
> -		kfree(name);
> -		goto out_unlock;
> -	}
>  	spin_lock(&dmabuf->name_lock);
>  	kfree(dmabuf->name);
>  	dmabuf->name = name;
>  	spin_unlock(&dmabuf->name_lock);
>  
> -out_unlock:
> -	dma_resv_unlock(dmabuf->resv);
> -	return ret;
> +	return 0;
>  }
>  
>  static long dma_buf_ioctl(struct file *file,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
