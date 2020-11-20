Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0FCC5519F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 08:36:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E47C12224C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 08:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1yjEGuvz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QQI+s1yU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E47C12224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y9dNfUoaG0jtmUwAiclh10slFD3obHR93PNTeTxlBvY=; b=1yjEGuvzaKQRxGbH5NRdUAswL
	JorMbGoibpjEjsnoh8rxUbyUMmi9bpCED/oX8W7PtgwNgEnVl1JorDHSsfCCf6UB5wi579Wxm+HfO
	VyznHMLni0MPNU/Lhy3fCIkBolTgnwgu753ELG11TwkqSPKwq/Bw7W+cdsLs9p+HWXv2TGUXmS5Oj
	iAO6OutXqBABn/jH7dPYNekv9UD9nMHVOH85kVxXuNQEEzWPUghP9ytj6f3qgpz4aPKmwHYw0kJoQ
	tM8616Jpj0kuPq2qD5OwA11eAaBpuumHAceQ4oImOd8Y/HvCo4K1HIblTIgdUHgNRz+iWnaeGRaAo
	yvzzq3J3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg1td-0008Kj-Vi; Fri, 20 Nov 2020 08:35:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg1tY-0008JC-3k; Fri, 20 Nov 2020 08:35:53 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89CE422249;
 Fri, 20 Nov 2020 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1605861351;
 bh=tIxJKxqoDLTXmbqUoDmW42v8F6sWdb/G/JzerkWeM58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QQI+s1yU0No8f3DanI86ICz7XccjfboP1FJlveIti0enUDRR5ozLmsF1POiozmV4y
 yFpmK16JZl6/fv5rJ9R9qQDzCflZIFYreqVYvGpZsygZQI5KMsvsWgmbvYCYaFVzDv
 1EBPQponTVekf79w4/BC7M74MSRQh0w73kSUFH4I=
Date: Fri, 20 Nov 2020 09:36:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH] usb: musb: remove unused variable 'devctl'
Message-ID: <X7eAEaTN/fM3fkkp@kroah.com>
References: <20201117082125.7619-1-min.guo@mediatek.com>
 <X7UKJtWtE0UZgqAQ@kroah.com> <1605854930.3995.8.camel@mhfsdcap03>
 <X7doKlP1k824LGGN@kroah.com> <1605858126.3995.14.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605858126.3995.14.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_033552_261296_4E51AE6B 
X-CRM114-Status: GOOD (  29.45  )
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

On Fri, Nov 20, 2020 at 03:42:06PM +0800, Min Guo wrote:
> On Fri, 2020-11-20 at 07:54 +0100, Greg Kroah-Hartman wrote:
> > On Fri, Nov 20, 2020 at 02:48:50PM +0800, Min Guo wrote:
> > > Hi greg k-h:
> > > On Wed, 2020-11-18 at 12:48 +0100, Greg Kroah-Hartman wrote:
> > > > On Tue, Nov 17, 2020 at 04:21:25PM +0800, min.guo@mediatek.com wrote:
> > > > > From: Min Guo <min.guo@mediatek.com>
> > > > > 
> > > > > Remove unused 'devctl' variable to fix compile warnings:
> > > > > 
> > > > >     drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
> > > > >     drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
> > > > >     but not used [-Wunused-but-set-variable]
> > > > > 
> > > > > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > > > > ---
> > > > >  drivers/usb/musb/musbhsdma.c | 4 ----
> > > > >  1 file changed, 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> > > > > index 0aacfc8be5a1..7acd1635850d 100644
> > > > > --- a/drivers/usb/musb/musbhsdma.c
> > > > > +++ b/drivers/usb/musb/musbhsdma.c
> > > > > @@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> > > > >  				musb_channel->channel.status =
> > > > >  					MUSB_DMA_STATUS_BUS_ABORT;
> > > > >  			} else {
> > > > > -				u8 devctl;
> > > > > -
> > > > >  				addr = musb_read_hsdma_addr(mbase,
> > > > >  						bchannel);
> > > > >  				channel->actual_len = addr
> > > > > @@ -336,8 +334,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> > > > >  						< musb_channel->len) ?
> > > > >  					"=> reconfig 0" : "=> complete");
> > > > >  
> > > > > -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> > > > 
> > > > Are you sure that the hardware does not require this read to complete
> > > > the command?  Lots of hardware is that way, so be very careful about
> > > > this.  Did you test it?
> > > 
> > > I have tested this patch on Mediatek's platform, and not sure if it
> > > will affect other vendors' platforms.
> > > 
> > > Dear Bin:
> > > 
> > > Does this patch will affect other vendors' platforms?
> > 
> > The hardware specs will answer this question, what do they say about
> > this read?
> 
> Sorry, I didn't seen the comment on the hardware specs indicate that
> devctl register needs to read once to take effect.

Perhaps you might want to add a comment here so that people will not
keep making this same mistake when they run auto-checkers on the
codebase?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
