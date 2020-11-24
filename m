Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E5CC56201
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 07:24:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3212320679
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 07:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKkme8Xn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N533lIgj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3212320679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g6AyJO0ZZbbXskSw+73dGsOCvALXMJgAYTBO9cXYzYg=; b=UKkme8XnIJm6J8U7EB+ASU4fq
	eN3waVsiO3IczfM53Z+zz471Af/gmq83zusV9xucBeIHUstdp2ba4pCYrS/AFr5yzgwY9HoHQXaX/
	AgBRkycapkeG4CVPdBCxmKANmmSY0uPCtYoB85aQ7bAbOPn2peQcGiTLiwpGUZqA02NO8n+Y3lpA0
	JBKuLpj4X3xTQjjmM4cVSwYm5Zqzl44YC15HxHDQ6fUEYNBoUOZgZwm3TGYM4E5JL3Ll/mzWBuNrP
	IbekZCL1nqs9jaSOXnvqZgoP8JK0wRk/5+5kxENw6kfPiDFeoiAULSAyNCwS1Y4hJbBlgmEdDTF0U
	PmBv7Rrkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khSg8-0004Fb-7Q; Tue, 24 Nov 2020 07:23:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khSg3-0004EX-Rw; Tue, 24 Nov 2020 07:23:52 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B80F720679;
 Tue, 24 Nov 2020 07:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606202630;
 bh=hGvjCXUrD2s4wdSYVX0JDuusUwGBrIWDOHYN8zVuzv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N533lIgjC0TkGs7IOqLrfv/v08xX5xYIetmohAEM+zPMCshpdpEs1R1ccVfwkCNZS
 qX38NB2JRe+AOg3tLwSX1LGU6WbMT4TVeVOSYCp1SJJEBm7PPSjnVEwZnFm9VK61Yx
 yd/lsmvhQSSfjoA3Lo//S0jlPTqzm2M45G1M8GKk=
Date: Tue, 24 Nov 2020 08:24:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: min.guo@mediatek.com
Subject: Re: [PATCH v2] usb: musb: remove unused variable 'devctl'
Message-ID: <X7y1SpiRE+CcBQIa@kroah.com>
References: <20201124063613.28796-1-min.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124063613.28796-1-min.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_022352_101051_517B86EC 
X-CRM114-Status: GOOD (  20.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 chunfeng.yun@mediatek.com, Alan Stern <stern@rowland.harvard.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:36:13PM +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> Remove unused 'devctl' variable to fix compile warnings:
> 
>     drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
>     drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
>     but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Min Guo <min.guo@mediatek.com>
> ---
> changes in v2
> suggested by Alan Stern:
> Add void before musb_read to indicate that the register MUSB_DEVCTL
> was intended to be read and discarded.
> ---
>  drivers/usb/musb/musbhsdma.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> index 0aacfc8be5a1..f59a009c533e 100644
> --- a/drivers/usb/musb/musbhsdma.c
> +++ b/drivers/usb/musb/musbhsdma.c
> @@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
>  				musb_channel->channel.status =
>  					MUSB_DMA_STATUS_BUS_ABORT;
>  			} else {
> -				u8 devctl;
> -
>  				addr = musb_read_hsdma_addr(mbase,
>  						bchannel);
>  				channel->actual_len = addr
> @@ -336,7 +334,7 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
>  						< musb_channel->len) ?
>  					"=> reconfig 0" : "=> complete");
>  
> -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> +				(void)musb_readb(mbase, MUSB_DEVCTL);

Please put a comment here as to why the read is happening so that people
do not throw it away sometime in the future.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
