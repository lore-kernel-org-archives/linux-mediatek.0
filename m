Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8762DC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1547323DE5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1547323DE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+CpBt3MUO0HDkN+nJRPauY0rkeWEwiu8HnWmvl5iaVk=; b=upftK6yK55q4/QR4RuPyAhRvP
	rfAhehNBG0397XVHzDgf36YmKLC9FhiCPeGOgiI9u6JYKeNfEJ1Vh7B7jnwsEyCYoiwlPUiOLrDCr
	jHuDM9D77Fsq1QoXu7RU+gx2go7oUEx1d4tIQhM7KVWfBwzOvCRuVJlFY8HurV6+Qi9AKaHP0Tg8h
	DUj8srVRlxk6p+9XHes56FGfkc8PjMmjyIXkr6yKxadNvxRbZW8S+KQOLrl9BdaxN3t8VvhxCcSrZ
	lx9cKerWRmonbzfgnDh0zD3HY8Vu8o2gi98/DscusnJ3Ds9lWxge2H6r9VC90BCe1qWRCmwkrYuWH
	PA7wwzjVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knOOW-0006N2-Cd; Thu, 10 Dec 2020 16:02:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knNQ6-0000GE-9h; Thu, 10 Dec 2020 15:00:08 +0000
Date: Thu, 10 Dec 2020 16:01:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607612389;
 bh=PIj9FhhUvvSZu0xzJxHT6c/gR8kNiKhw5BAjOPiDy8c=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+urhOw5zVITPob6166OQJDTbM4feF7LQoaKdyvkUWUWZQNxyqYQoal6EfsM1Y3Vk
 g9c7dlsKnjViwFRVSOcz/v2eMBjKQK+CeRDrZRBOPrM69254Ttwc3xnnQBpMJ6qfrX
 eElBMZ4Lbu2D6X5hPC77z/EHK3wboN659P5hKjU4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH v3] usb: musb: remove unused variable 'devctl'
Message-ID: <X9I4L3E9EJlcPMEu@kroah.com>
References: <20201124084955.30270-1-min.guo@mediatek.com>
 <c2f3f643-8514-5c4a-dd52-7abc8a6dc501@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2f3f643-8514-5c4a-dd52-7abc8a6dc501@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_095950_450216_9979BD7E 
X-CRM114-Status: GOOD (  19.00  )
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
 min.guo@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 12:13:42PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 24.11.2020 11:49, min.guo@mediatek.com wrote:
> 
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > Remove unused 'devctl' variable to fix compile warnings:
> > 
> >      drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
> >      drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
> >      but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > ---
> > changes in v3
> > suggested by Greg Kroah-Hartman:
> > Add a comment.
> > 
> > changes in v2
> > suggested by Alan Stern:
> > Add void before musb_read to indicate that the register MUSB_DEVCTL
> > was intended to be read and discarded.
> > ---
> >   drivers/usb/musb/musbhsdma.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> > index 0aacfc8be5a1..2a345b4ad015 100644
> > --- a/drivers/usb/musb/musbhsdma.c
> > +++ b/drivers/usb/musb/musbhsdma.c
> [...]
> > @@ -336,7 +334,11 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> >   						< musb_channel->len) ?
> >   					"=> reconfig 0" : "=> complete");
> > -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> > +				/*
> > +				 * Some hardware may need to read the
> > +				 * MUSB_DEVCTL register once to take effect.
> > +				 */
> > +				(void)musb_readb(mbase, MUSB_DEVCTL);
> 
>    Hm, forcibly reading DevCtl in the DMA driver... sounds quite
> nonsensically. Lemme take a look...

What happened to your look?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
