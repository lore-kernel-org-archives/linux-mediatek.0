Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E9AC56201
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:32:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A5A2225B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RvFD1pNy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xa49XbAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A5A2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=URHJV4Sz2HbHnGFMAkSVt/zhT7Xm++dWuF6YhzeKFUM=; b=RvFD1pNyOCOkcL5UrstLkVX49
	UO9KwlXACVcnjLN1WgiRdcSnVQzARehbhR9rzxKcCPRyBhWfIQR0volPTazcGPnl0F7G/l+x8AzfX
	Y9TORtPgv4NM3P05T6bGS0l72CFvu8HlBi2B+qXmE8vIkhEG6EcnKG6gFIVk2BNF40UuzfeJG5T4j
	hmWHEI2S6uoT+AQjwb1HkRy9cRSoE52VwxceYWPQvC41RJxCJ50XmmE8uomI5nwG7fEyJbhYYQUOH
	ssvuMn1I5Dj6PphogTOtw21h505YiWIvGADfRlNL25QgKSn86DROF+0Hk79XiPmJkW+AfVFwkzOBN
	mBJR1ifnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg9KS-0002bg-G4; Fri, 20 Nov 2020 16:32:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg9KO-0002aa-5Y; Fri, 20 Nov 2020 16:32:05 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA3E12225B;
 Fri, 20 Nov 2020 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1605889922;
 bh=4e9p67MzQBx/2VQpNribhatdRMaigeDtqxXm/8AKqR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xa49XbAWsuSktkGsEF/O+5TkED2jrydKOnnO8NZwrRFQYTV+8rlCRmD6EfqM/gQGc
 esaQEGLAO/jm4Yl4Q3NxsRRis2CyLCP5RDZb3TjKYKqVwkuoimDpsdmWvCl+0x0mZt
 qWJ8xIclX8eNO8DYj7F3KoUtuEHXj3JltUtzPDbQ=
Date: Fri, 20 Nov 2020 17:32:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usb: musb: remove unused variable 'devctl'
Message-ID: <X7fvrK4F2378+9Rl@kroah.com>
References: <20201117082125.7619-1-min.guo@mediatek.com>
 <X7UKJtWtE0UZgqAQ@kroah.com> <1605854930.3995.8.camel@mhfsdcap03>
 <X7doKlP1k824LGGN@kroah.com> <1605858126.3995.14.camel@mhfsdcap03>
 <X7eAEaTN/fM3fkkp@kroah.com>
 <20201120161519.GA619708@rowland.harvard.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120161519.GA619708@rowland.harvard.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_113204_499158_A65F5A4D 
X-CRM114-Status: GOOD (  32.95  )
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
 Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 11:15:19AM -0500, Alan Stern wrote:
> On Fri, Nov 20, 2020 at 09:36:33AM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Nov 20, 2020 at 03:42:06PM +0800, Min Guo wrote:
> > > On Fri, 2020-11-20 at 07:54 +0100, Greg Kroah-Hartman wrote:
> > > > On Fri, Nov 20, 2020 at 02:48:50PM +0800, Min Guo wrote:
> > > > > Hi greg k-h:
> > > > > On Wed, 2020-11-18 at 12:48 +0100, Greg Kroah-Hartman wrote:
> > > > > > On Tue, Nov 17, 2020 at 04:21:25PM +0800, min.guo@mediatek.com wrote:
> > > > > > > From: Min Guo <min.guo@mediatek.com>
> > > > > > > 
> > > > > > > Remove unused 'devctl' variable to fix compile warnings:
> > > > > > > 
> > > > > > >     drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
> > > > > > >     drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
> > > > > > >     but not used [-Wunused-but-set-variable]
> > > > > > > 
> > > > > > > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > > > > > > ---
> > > > > > >  drivers/usb/musb/musbhsdma.c | 4 ----
> > > > > > >  1 file changed, 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> > > > > > > index 0aacfc8be5a1..7acd1635850d 100644
> > > > > > > --- a/drivers/usb/musb/musbhsdma.c
> > > > > > > +++ b/drivers/usb/musb/musbhsdma.c
> > > > > > > @@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> > > > > > >  				musb_channel->channel.status =
> > > > > > >  					MUSB_DMA_STATUS_BUS_ABORT;
> > > > > > >  			} else {
> > > > > > > -				u8 devctl;
> > > > > > > -
> > > > > > >  				addr = musb_read_hsdma_addr(mbase,
> > > > > > >  						bchannel);
> > > > > > >  				channel->actual_len = addr
> > > > > > > @@ -336,8 +334,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> > > > > > >  						< musb_channel->len) ?
> > > > > > >  					"=> reconfig 0" : "=> complete");
> > > > > > >  
> > > > > > > -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> > > > > > 
> > > > > > Are you sure that the hardware does not require this read to complete
> > > > > > the command?  Lots of hardware is that way, so be very careful about
> > > > > > this.  Did you test it?
> > > > > 
> > > > > I have tested this patch on Mediatek's platform, and not sure if it
> > > > > will affect other vendors' platforms.
> > > > > 
> > > > > Dear Bin:
> > > > > 
> > > > > Does this patch will affect other vendors' platforms?
> > > > 
> > > > The hardware specs will answer this question, what do they say about
> > > > this read?
> > > 
> > > Sorry, I didn't seen the comment on the hardware specs indicate that
> > > devctl register needs to read once to take effect.
> > 
> > Perhaps you might want to add a comment here so that people will not
> > keep making this same mistake when they run auto-checkers on the
> > codebase?
> 
> A better change would be
> 
> -			devctl = musb_readb(mbase, MUSB_DEVCTL);
> +			(void) musb_readb(mbase, MUSB_DEVCTL);
> 
> and eliminate the unused variable.  Then there wouldn't be any compiler 
> warning.

No need for the (void), the compiler shouldn't warn about that, right?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
