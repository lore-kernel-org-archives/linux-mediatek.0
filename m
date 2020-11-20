Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735FAC5519F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 09:02:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4B92224C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 09:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XcFl1q0f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DwfGG6wP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD4B92224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wZM6O+92rPwMCGK/Cubeww9ByG6RAohbrd6plM7mS/g=; b=XcFl1q0fvyUTYetUhIoWQ98OI
	+nQM1R0Cd/rdb6lmbU6pXVyIXryfbSGAlSsXdMlL3nUwzejUv9FgQfDstbkitlGfaMhE6WDg81fev
	YZ4HGhljyvxdPeD3t4kNec9k8xViHgbgnGzVpYhdZ8Y73E8ABBc04S+t2j/gBGBA3qyGS3J6xNMey
	DUBRrJYbUafOawxLF3Xxh7HZYmo46EsIQ92+Ebxq91eOrVh0xcur3/rlq9CdGbq99tBblBkHe5iJf
	BEVX1CE4mUdfTiHmyhqCEA5iFHpxmX0BQjDgerovD169EZLfIYUhTKe3PH39o75JnjVIAWeFvJeIY
	Om2ZP6R5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2JP-0003r9-Q6; Fri, 20 Nov 2020 09:02:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2JF-0003np-Pw; Fri, 20 Nov 2020 09:02:27 +0000
X-UUID: c7e01bdef8944d9a8ec85968b7aa1f8f-20201120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NOnBEeD5QcqRy5ACxANNtYY5eIEEbKNWhHFCVwRq7Bk=; 
 b=DwfGG6wPx8bwL1YuhPBQqay0GjEFZHN+7ZklUtK4gmQpzaPr/NDBddmO2BU28NP5qJQfzbDbLIVuq5U1cuKBqwtmkVYH+wPJCNIGgrOa7qBQ1ACmWXmMOP6J+eSscooV+ERUSIlPtefL/KwuPyOL7CLQnClG9kSBbCNW7sh9+Yk=;
X-UUID: c7e01bdef8944d9a8ec85968b7aa1f8f-20201120
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <min.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 929312975; Fri, 20 Nov 2020 01:02:09 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 01:02:20 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 20 Nov 2020 17:02:16 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 17:02:15 +0800
Message-ID: <1605862935.3995.20.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: musb: remove unused variable 'devctl'
From: Min Guo <min.guo@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 20 Nov 2020 17:02:15 +0800
In-Reply-To: <X7eAEaTN/fM3fkkp@kroah.com>
References: <20201117082125.7619-1-min.guo@mediatek.com>
 <X7UKJtWtE0UZgqAQ@kroah.com> <1605854930.3995.8.camel@mhfsdcap03>
 <X7doKlP1k824LGGN@kroah.com> <1605858126.3995.14.camel@mhfsdcap03>
 <X7eAEaTN/fM3fkkp@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F523D46BD23D8F2D4C4167306D0A9C11AFC2932A6549B7623E792AD4C4C739792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_040226_627915_ADE4EECC 
X-CRM114-Status: GOOD (  30.49  )
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

On Fri, 2020-11-20 at 09:36 +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 20, 2020 at 03:42:06PM +0800, Min Guo wrote:
> > On Fri, 2020-11-20 at 07:54 +0100, Greg Kroah-Hartman wrote:
> > > On Fri, Nov 20, 2020 at 02:48:50PM +0800, Min Guo wrote:
> > > > Hi greg k-h:
> > > > On Wed, 2020-11-18 at 12:48 +0100, Greg Kroah-Hartman wrote:
> > > > > On Tue, Nov 17, 2020 at 04:21:25PM +0800, min.guo@mediatek.com wrote:
> > > > > > From: Min Guo <min.guo@mediatek.com>
> > > > > > 
> > > > > > Remove unused 'devctl' variable to fix compile warnings:
> > > > > > 
> > > > > >     drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
> > > > > >     drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
> > > > > >     but not used [-Wunused-but-set-variable]
> > > > > > 
> > > > > > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > > > > > ---
> > > > > >  drivers/usb/musb/musbhsdma.c | 4 ----
> > > > > >  1 file changed, 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> > > > > > index 0aacfc8be5a1..7acd1635850d 100644
> > > > > > --- a/drivers/usb/musb/musbhsdma.c
> > > > > > +++ b/drivers/usb/musb/musbhsdma.c
> > > > > > @@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> > > > > >  				musb_channel->channel.status =
> > > > > >  					MUSB_DMA_STATUS_BUS_ABORT;
> > > > > >  			} else {
> > > > > > -				u8 devctl;
> > > > > > -
> > > > > >  				addr = musb_read_hsdma_addr(mbase,
> > > > > >  						bchannel);
> > > > > >  				channel->actual_len = addr
> > > > > > @@ -336,8 +334,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> > > > > >  						< musb_channel->len) ?
> > > > > >  					"=> reconfig 0" : "=> complete");
> > > > > >  
> > > > > > -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> > > > > 
> > > > > Are you sure that the hardware does not require this read to complete
> > > > > the command?  Lots of hardware is that way, so be very careful about
> > > > > this.  Did you test it?
> > > > 
> > > > I have tested this patch on Mediatek's platform, and not sure if it
> > > > will affect other vendors' platforms.
> > > > 
> > > > Dear Bin:
> > > > 
> > > > Does this patch will affect other vendors' platforms?
> > > 
> > > The hardware specs will answer this question, what do they say about
> > > this read?
> > 
> > Sorry, I didn't seen the comment on the hardware specs indicate that
> > devctl register needs to read once to take effect.
> 
> Perhaps you might want to add a comment here so that people will not
> keep making this same mistake when they run auto-checkers on the
> codebase?

Sorry for confused you, I searched the hardware specs, but did not find
the special description of the register devctl indicating that it needs
to be read out before the hardware can work.

> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
