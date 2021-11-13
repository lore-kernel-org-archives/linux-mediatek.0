Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 08:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524A56112E
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 08:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 524A56112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWl/iwmpyyDY0YMs7wnUt8mfBkbkW2EXcmv/5CZcz/c=; b=N+cZz0YlMJGxbZ
	g7nRigfb3BU6FLUy2tjIHjM/gA5IPFt06J30h9HZsp+FBitt0Xzq6GhLM72fatpAijGlG7h1SazjX
	AocYE/E7BXJZN8ZUVauS/CdBFDy9mM9D22fBWNuYx/50B32EZD3XcrlFXzdO+KaBBLn2vnDBYSXus
	XCuf4dON4IoxdOXbg8Z1MwIi45xMoI638FNbNEvj/Ei5Szg6RuZgEUyqm0+V2NncsHs+HNq7nEQfT
	5JIvD4JjpGSog2L3WEbTjUeHcF9KjYySkEL0MDb+Vb3fpubi+wA5WSNwQtLQ9GsXtnmK72+34Jnu2
	yhSBAHalgDXHNyF5dNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlnzm-00CLYn-09; Sat, 13 Nov 2021 08:02:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlnzZ-00CLX9-8V; Sat, 13 Nov 2021 08:02:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA37B60EB4;
 Sat, 13 Nov 2021 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636790548;
 bh=QCklIn07a4Q9kSJmzDKlN3UHyVzwJygAHFISjCNIgy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0QMq1/NXq1hjwEBts4ABOzyJ6At+fTHmRdTpVjpF7P2vWEOaCWe3wWFTUO30Ja3ex
 gQZGnnnkDGSI1U/AledGlSktAh8VitaquWaOTrQvCTO6owkIeQkn8pDXoJUKtTc0+O
 mMKfkspT8o/M+zFcw00H/XnZ9JH7HVLSrYzhRUfk=
Date: Sat, 13 Nov 2021 09:02:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: mt7621-dma: reindent to avoid '(' at the end of
 line
Message-ID: <YY9xD1K0cUpc5iCW@kroah.com>
References: <20211113052815.358793-1-liujunqi@pku.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113052815.358793-1-liujunqi@pku.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_000229_343141_3AEE733D 
X-CRM114-Status: GOOD (  13.09  )
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

On Sat, Nov 13, 2021 at 01:28:15PM +0800, Liu Junqi wrote:
> Fixed a coding style issue.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> index 1424d01d434b..282fc807d0de 100644
> --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> @@ -455,9 +455,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>  	spin_unlock_bh(&chan->vchan.lock);
>  }
>  
> -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> -		size_t len, unsigned long flags)
> +static struct dma_async_tx_descriptor
> +*mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,

No, this is now worse looking.  The original was not pretty, but better
than this.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
