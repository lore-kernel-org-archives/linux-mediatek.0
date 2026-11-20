Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6D60A260D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JRQcdf60;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=a+l/+NdJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AcAKXow4k7nAsz4NvTf98ZQKCNLbRCZ9q0bbUe/mxCg=; b=JRQcdf60RUd6dMIL4SxnIDUeiP
	u5zfrvzzV9iLoZ3t3ddjvM/md86ScejxmU2E2fQvfF7qgrL75hzWmDqlyWMO8cjoioW07MWNEGtSN
	1l1cKhQMUcJvG09dfLfpCxZPQsUPXPIctXEoPbhWjN4ipICiPN2knWcHU5Tg8I+IukErEbEct643t
	0JSn3N8mLJEsn5AAmrUwPscScmRdv8SGRG3YZm2p+VbDEqTanUCcXKa9HHWoQtrXCCdiB+ODoRUY7
	pMBHvkpPl5Yo9Be41Wc7gu4YjA+bXEbtwrX8ZkVCdWgwPqIrihpRwgYy+uSD2CDmZSoxCVFH09ocR
	bFoPoTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNi5-0000000Ex9d-0Kv5;
	Fri, 20 Nov 2026 12:27:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNi3-0000000Ex8o-2YeU;
	Fri, 20 Nov 2026 12:27:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18F424417F;
	Fri, 20 Nov 2026 12:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174611F000C4;
	Fri, 20 Nov 2026 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795177638;
	bh=AcAKXow4k7nAsz4NvTf98ZQKCNLbRCZ9q0bbUe/mxCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a+l/+NdJlosvbvrFz8skxFt+7lH/BYqPvJI/SIcdwvR35/YhtHI7xEaNR9/SQwDck
	 OoIenHKHOWWbZUzANxx/C2LIM3aPEhDag+j8O3HOCKVuRuQ5ofCbLJQGgQsjZzwR+r
	 ooAKISbCoLcv8rQ3xxP8xWsrEuXt8CeRSaJKKObE=
Date: Fri, 20 Nov 2026 13:27:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fangwen Deng <fangwen.deng@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jarried.lin@mediatek.com, vince-wl.liu@mediatek.com,
	justin.yeh@mediatek.com
Subject: Re: [PATCH] usb: mtu3: cancel EP0 requests to prevent use-after-free
Message-ID: <2026112053-curtain-astound-bf4e@gregkh>
References: <20261106080140.342107-1-fangwen.deng@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106080140.342107-1-fangwen.deng@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:00:58PM +0800, Fangwen Deng wrote:
> mtu3_ep0_dequeue() always returns -EINVAL and leaves the request on
> mep->req_list without unlinking or completing it, so an EP0 request
> can never be cancelled.
> 
> FunctionFS assigns its temporary read buffer to ep0req and waits in
> __ffs_ep0_queue_wait(). When that wait is interrupted by a signal it
> calls usb_ep_dequeue(), does not check the return value, and its
> caller ffs_ep0_read() frees the buffer on every exit path. With
> -EINVAL returned the request stays queued and MTU3 still owns it.
> When the host then sends the OUT data stage, ep0_rx_state() writes
> the received bytes through the stale req->buf, giving the host a
> content-controlled write into freed kernel memory. That corrupts
> whichever object reuses the slab and can panic the kernel.
> 
> Implement mtu3_ep0_dequeue() following mtu3_gadget_dequeue() but
> without QMU flush/start since EP0 uses PIO: validate the request
> under mtu->lock, unlink it once and give it back with -ECONNRESET,
> so ownership of the buffer returns to FunctionFS before it is freed.
> 
> Cancelling the request that backed the data stage also leaves the
> transfer unable to finish, so retire the aborted transaction with a
> protocol stall. That returns ep0_state to SETUP and stops a later
> ep0_queue() from reading this transaction's leftover FIFO data into
> the next request's buffer. The stall is skipped when the controller
> is already powered down or no data stage is in flight.
> 
> The same stub is why functionfs_unbind() cannot cancel a pending EP0
> request, which deadlocks against the FunctionFS thread holding
> ffs->mutex.
> 
> Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
> Signed-off-by: Fangwen Deng <fangwen.deng@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3_gadget_ep0.c | 55 ++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> index e4fd1bb14a55..73a1af8b6c65 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -857,8 +857,59 @@ static int mtu3_ep0_queue(struct usb_ep *ep,
>  
>  static int mtu3_ep0_dequeue(struct usb_ep *ep, struct usb_request *req)
>  {
> -	/* we just won't support this */
> -	return -EINVAL;
> +	struct mtu3_ep *mep;
> +	struct mtu3_request *mreq = NULL;
> +	struct mtu3_request *r = NULL;
> +	struct mtu3 *mtu;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	if (!ep || !req)
> +		return -EINVAL;
> +
> +	mep = to_mtu3_ep(ep);
> +	mtu = mep->mtu;
> +
> +	spin_lock_irqsave(&mtu->lock, flags);
> +
> +	mreq = to_mtu3_request(req);
> +
> +	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);

Don't add "trace" calls like this.  And __func__ is NEVER needed for a
dev_dbg() call.

thanks,

greg k-h

