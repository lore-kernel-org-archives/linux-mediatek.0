Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xtyJyTC1Fe43M/A8LtO4ArGTq2+XJtForY02VUR42E=; b=PQ4jFFnG9v3fmX
	/yHGi+xbyXleOb/lzvMCNo/4lcIKyk7pRIZ2WeWtW9pLTUkjMFIqM0eDS+CIVZ1VM3cBBvR4f7IqG
	apEk1hKU9eQmyuXAaEb4ovXjFTX33c/Sel+VmxVGAaKCRI02Ip+e9nP+CqKibA4s4/8pPRZ9hle3j
	xu7zUrhl9ybsUZG77w5uRGMSiP2+nJCcsonZ3sipYqu1Vx146g8uATBbHJbTBUY/951W/JfvpyVDB
	mhCEjkQJMHNLtTBD4x/LSXHehekNpWQGIcmRF1fJGdORozsv9x37ov5W0cxzORJv0lEbZxU9STj07
	Plw7XhV4rdN8SV+KWmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh8r2-008qZK-PL; Wed, 20 Apr 2022 11:50:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh8qr-008qW5-Co; Wed, 20 Apr 2022 11:50:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EDB461944;
 Wed, 20 Apr 2022 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66082C385A0;
 Wed, 20 Apr 2022 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650455428;
 bh=wG8tmbya06CPHuXCrYxIi0BacRXo9h6kKzxQ63v1SQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=goW7qCzb0qVQ+i8Tl9MVckC5HdTcV77J9bk4vVuQ+jn7j8V1i0usNZd1k0zAgHJ32
 QZL12QXEGFp5yzjlMHi5wt/S7o/4aAxDXTPniexIgN+boLPFlJd/1Kt7YlR9QgoT7t
 pMYjM5kpCPeEscMQBFVWOMLOX9S+SFUhKpfqs5NNazbOP/uhdtVLl7zcO7fj/u0drw
 tS9fii/pMGGyPtSrdW0v6m/zkJdUGLVMCSMtHsbPBuWzrBB08Sx74uQtA2/RAJuEMt
 llYZAYqp28vxsAZQZvqVRHuxtqa4z9QvIGZR+lX72+caha7s3vQVDQ/Jr1bsVqZ8Ti
 ObDJSVkmEzNIA==
Date: Wed, 20 Apr 2022 17:20:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: mtk-hsdma: use NULL instead of
 using plain integer as pointer
Message-ID: <Yl/zgH28KL9zbcQb@matsya>
References: <1649750340-30777-1-git-send-email-baihaowen@meizu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1649750340-30777-1-git-send-email-baihaowen@meizu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_045029_510462_28C59D7B 
X-CRM114-Status: GOOD (  17.51  )
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

On 12-04-22, 15:59, Haowen Bai wrote:
> This fixes the following sparse warnings:
> drivers/dma/mediatek/mtk-hsdma.c:604:26: warning: Using plain integer
> as NULL pointer

Applied, thanks

> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/dma/mediatek/mtk-hsdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
> index 6ad8afbb95f2..358894e72fba 100644
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
> @@ -601,7 +601,7 @@ static void mtk_hsdma_free_rooms_in_ring(struct mtk_hsdma_device *hsdma)
>  			cb->flag = 0;
>  		}
>  
> -		cb->vd = 0;
> +		cb->vd = NULL;
>  
>  		/*
>  		 * Recycle the RXD with the helper WRITE_ONCE that can ensure
> -- 
> 2.7.4

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
