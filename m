Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE04CC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 11:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A780207D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 11:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byUK0LpN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qlNSUV1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A780207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x1BFUpQLbwvyV64l8gr3Znvw/VeQypVoG6HgmL1xlz8=; b=byUK0LpN38WT3AucMz7I4zUc0
	Ubmd09r1DnUTo7jM4qfZawcZ2DUPOvWkC1j77Ob8wn6cc+c4FAsiR60qOyO5rxkp2hNCrf4lSQRKy
	POZDHT3E/SSzicMk2LIdXMQuQmNrUi9VbjVK5hNRLtPi7fITARoXZX93ja46xGgSwmfI+6O936Y7Z
	kBlbNv2R3tcoviePQbv/w0Y2J+z7du47C2mACqAuf1xkYRzZUcGx4DlPhicSyXuWYwD74y2WOjKqc
	ptWwBHhKHKGLN6yIMNUAnJjVRGnqTq1FFCmu1ui8qyaTu6folm9UcLUDTZ2ecHmwepQeyeA+GPwgp
	/zvEEYccw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfLwc-0004Tn-SC; Wed, 18 Nov 2020 11:48:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfLwY-0004SN-7E; Wed, 18 Nov 2020 11:48:11 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93132207D3;
 Wed, 18 Nov 2020 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1605700088;
 bh=AVFwWiK5o8kOcZQ0tm/tH6XBw33UzNsFN4Icb/uq+iI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qlNSUV1GI7YrFNh8EvH0WS+CG5srE8T79RrRbC336+2OtWUtbUGFSomChewe3OABA
 JXfk/TM2l/aJ+E5UmxOH0hRfQ1k54IpLKgXQAkGRypJPP3A8+155BeFrfFfvNiD3wW
 vkdKWSYavRv5/EkvJW7QobaE1ZMukQhE1ti6iAj0=
Date: Wed, 18 Nov 2020 12:48:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: min.guo@mediatek.com
Subject: Re: [PATCH] usb: musb: remove unused variable 'devctl'
Message-ID: <X7UKJtWtE0UZgqAQ@kroah.com>
References: <20201117082125.7619-1-min.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117082125.7619-1-min.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_064810_391575_2A7EEEA7 
X-CRM114-Status: GOOD (  16.13  )
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
 chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 04:21:25PM +0800, min.guo@mediatek.com wrote:
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
>  drivers/usb/musb/musbhsdma.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> index 0aacfc8be5a1..7acd1635850d 100644
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
> @@ -336,8 +334,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
>  						< musb_channel->len) ?
>  					"=> reconfig 0" : "=> complete");
>  
> -				devctl = musb_readb(mbase, MUSB_DEVCTL);

Are you sure that the hardware does not require this read to complete
the command?  Lots of hardware is that way, so be very careful about
this.  Did you test it?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
