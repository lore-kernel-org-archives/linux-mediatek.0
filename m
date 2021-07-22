Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4C9C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 10:16:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D031561264
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 10:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D031561264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=neu9IuZ7THQ2S7R65d6iSQgl9hW0A50nI7hPYIO+Wb0=; b=QbVCGd+EjS3hhp
	7swErIio3F6H2e/vpS+XwDCb8XzpuL1YlWFJKSKU1noLHFdUW2HjmEVUd5XzJxIhGbqT+t3LTfBvz
	CoPrTLEp4LavEePd6dEzo6dNKu5Dr9VyA+V850A78Zk+5jITye06oIAm+Z4KStagHb8dyQbpoFDPq
	SYOLOhJHA14RzReuVTZ/y6DkcMtpHYkmrFAaFBLSp2qV3COoLnZW4QhfRlrWaXk/tru9SefE0Clxx
	PyHSH9YFnWtJRCD9C4Kx2VUPeQS5fclSwPtcsRDuHztkY6zlK2ZN6SvaHkgsw7Gs81zUtDMX7iOaE
	6eS2rKr6IxY+oNb6ppZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Vkb-001AnA-K2; Thu, 22 Jul 2021 10:16:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Vgw-0019SV-OC; Thu, 22 Jul 2021 10:12:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A57F261249;
 Thu, 22 Jul 2021 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626948753;
 bh=PD6+quR50a/B3tEP2haRK97FZm507gd8odCaXmk0NLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DfRRN584U0PmEiVYBOsEHqGz4ReyrUHA1JzdrNGIoCVAq044FGIivyFHz5zC1p4ql
 nZaw16+rJU9MvPrtZ/nb+6OuiX/jpEcJJqHjO1EOKbHv6bQ18H2hjb12Qghw2mftra
 vfw+r+R/HnxQ2/OJTQyp8YqHmsR3tP8b35CGn8+M=
Date: Thu, 22 Jul 2021 12:12:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zhiyong tao <zhiyong.tao@mediatek.com>
Cc: timur@kernel.org, linux@armlinux.org.uk, alcooperx@gmail.com,
 tklauser@distanz.ch, sean.wang@kernel.org,
 srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 yuchen.huang@mediatek.com, huihui.wang@mediatek.com,
 eddie.huang@mediatek.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH] uart: mediatek: fix memory corruption issue
Message-ID: <YPlEjlKn5Hav/GNH@kroah.com>
References: <20210710090103.2643-1-zhiyong.tao@mediatek.com>
 <20210710090103.2643-2-zhiyong.tao@mediatek.com>
 <YPf67gw2KJCk/Ucs@kroah.com> <1626948212.29611.47.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626948212.29611.47.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_031234_926403_3DC40E5F 
X-CRM114-Status: GOOD (  37.23  )
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

On Thu, Jul 22, 2021 at 06:03:32PM +0800, zhiyong tao wrote:
> On Wed, 2021-07-21 at 12:46 +0200, Greg KH wrote:
> > On Sat, Jul 10, 2021 at 05:01:03PM +0800, Zhiyong Tao wrote:
> > > This patch is used to fix memory corruption issue when rx power off.
> > > 1. add spin lock in mtk8250_dma_rx_complete function in APDMA mode.
> > 
> > What does a lock protect from?  Please be explicit and detailed.
> 
> ==> Hi Gregkh,
> 
> when uart is used as a communication port with external device(GPS).
> when external device(GPS) power off, the power of rx pin is also from
> 1.8v to 0v. Even if there is not any data in rx. But uart rx pin can
> capture the data "0".

That sounds like a broken hardware design.

> If uart don't receive any data in specified cycle, uart will generates
> BI(Break interrupt) interrupt.
> If external device(GPS) power off, we found that BI interrupt appeared
> continuously and very frequently.
> When uart interrupt type is BI, uart IRQ handler(8250 framwork
> API:serial8250_handle_irq) will push data to tty buffer.
> The code path:
> https://elixir.bootlin.com/linux/latest/source/drivers/tty/serial/8250/8250_port.c#L1917
> 
> mtk8250_dma_rx_complete is a task of mtk_uart_apdma_rx_handler.
> mtk8250_dma_rx_complete priority is lower than uart irq
> handler(serial8250_handle_irq).
> if we are in process of mtk8250_dma_rx_complete, uart appear BI
> interrupt:1)serial8250_handle_irq will priority execution.2)it may cause
> write tty buffer conflict in mtk8250_dma_rx_complete.
> So the spin lock protect the rx receive data process is not break.

Then put something like this in the changelog text, as it is, it is not
descriptive at all.

> > > 2. add processing mechanism which count value is 0
> > 
> > What does this do?  And why is it needed?
> 
> ==> when count value is 0, we don't need push data to tty buffer.
> so we add it.

But that does not actually do anything different from what it does
today.  And it has nothing to do with the lock, so this should be 2
different patches, right?

> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > 
> > What commit does this fix?  Does this need to go to stable kernel trees?
> > If so, how far back?
> > 
> > > ---
> > >  drivers/tty/serial/8250/8250_mtk.c | 15 +++++++++++----
> > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> > > index f7d3023f860f..09f7d2166315 100644
> > > --- a/drivers/tty/serial/8250/8250_mtk.c
> > > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > > @@ -91,12 +91,15 @@ static void mtk8250_dma_rx_complete(void *param)
> > >  	struct mtk8250_data *data = up->port.private_data;
> > >  	struct tty_port *tty_port = &up->port.state->port;
> > >  	struct dma_tx_state state;
> > > -	int copied, total, cnt;
> > > +	unsigned int copied, total, cnt;
> > >  	unsigned char *ptr;
> > > +	unsigned long flags;
> > >  
> > >  	if (data->rx_status == DMA_RX_SHUTDOWN)
> > >  		return;
> > >  
> > > +	spin_lock_irqsave(&up->port.lock, flags);
> > > +
> > >  	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> > >  	total = dma->rx_size - state.residue;
> > >  	cnt = total;
> > > @@ -104,9 +107,11 @@ static void mtk8250_dma_rx_complete(void *param)
> > >  	if ((data->rx_pos + cnt) > dma->rx_size)
> > >  		cnt = dma->rx_size - data->rx_pos;
> > >  
> > > -	ptr = (unsigned char *)(data->rx_pos + dma->rx_buf);
> > > -	copied = tty_insert_flip_string(tty_port, ptr, cnt);
> > > -	data->rx_pos += cnt;
> > > +	if (cnt != 0) {
> > 
> > Why does cnt matter here?  If cnt is 0, the code above should not do
> > anything at all, right?
> 
> ==> yes, if the counter value is 0, we don't need push data to the tty
> buffer.

But this does not change the logic as if cnt is 0, nothing gets pushed
with the current code either, right?

> > Or if it does, should we change tty_insert_flip_string() to always check
> > for cnt != 0 before it does the first loop?  Hm, it looks like it will
> > abort if cnt is 0, so what is this change really doing?  Why do you need
> > it?  What is it "fixing"?
> > 
> ==> It is not fix anything, we just think if count value is 0, we don't
> need do anything.

Then make it a separate patch, independant from the lock patch, and we
can discuss it there.  Do NOT have patches do multiple things.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
