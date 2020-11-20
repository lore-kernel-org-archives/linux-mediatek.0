Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCF4C56201
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 06:59:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA02B2223F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 06:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMz8jVtX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QljlJLdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA02B2223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nOfV+P5U8VXOTf/0O82HoH86pX/uKt8DY+YYv5/y4JU=; b=oMz8jVtXOsL0ZuzTptpxDcnnN
	x17kRTVedfAdmnkLJ3KumHsfapcAswoHPG10dwwVn04wcgvA/B3shP5Oy1iNuA+7R36n6GVKDy2E0
	uMhb07lef9IsDRUYeXaYHuAvLzQial/mpkC9smlA/m73LSnt6+Oq7yd9zCuMLml0rUdexhsRa0Mw6
	2DCdIBipmxC5bp0dEiXCcpcSKqy+J/f6IM9mRRPc+97G9Rt4tS9ve+5A3dkBLLxcY1hvc+Po8lIf5
	oFskhHhOXWseHs0/AmMMm53Uva2LxFvVPnKs+vsMQ/e2WJUQwha6E7nCM4VixYvYCrIas8SCCG+Rp
	sA9P0L16Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg0O2-0007CZ-NC; Fri, 20 Nov 2020 06:59:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg0Nx-0007AR-IJ; Fri, 20 Nov 2020 06:59:11 +0000
X-UUID: 9594e64f149b4cee93f14b40d7bf375e-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4lVDMuVkFUdI9VsgXnEVZ+MC7jCYkAiO9icTqnOC4OY=; 
 b=QljlJLdXZjHscn/1qlc9JmciuZGo5xweDKIVxMClw/KFIAqkerIxtC7svTsyN53KsjuBYaBKMpLcl8RiBepqxkJkKvJ7kDqKZ3NlIBgTuJ47zG1lv5TJDt6bN+yHhZwiycHJLdUEw3/ch+8wk3Or8NlsL6XPdSZbFIcnklbq2/Q=;
X-UUID: 9594e64f149b4cee93f14b40d7bf375e-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <min.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1618187883; Thu, 19 Nov 2020 22:58:56 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 22:49:01 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 20 Nov 2020 14:48:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 14:48:50 +0800
Message-ID: <1605854930.3995.8.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: musb: remove unused variable 'devctl'
From: Min Guo <min.guo@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>
Date: Fri, 20 Nov 2020 14:48:50 +0800
In-Reply-To: <X7UKJtWtE0UZgqAQ@kroah.com>
References: <20201117082125.7619-1-min.guo@mediatek.com>
 <X7UKJtWtE0UZgqAQ@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3E62456714BCD4CF737C2489202A3C930B0AFD70CFB2E3D40B0BFC2915D08B002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_015909_845429_9C9B5D80 
X-CRM114-Status: GOOD (  20.25  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi greg k-h:
On Wed, 2020-11-18 at 12:48 +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 17, 2020 at 04:21:25PM +0800, min.guo@mediatek.com wrote:
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > Remove unused 'devctl' variable to fix compile warnings:
> > 
> >     drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
> >     drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
> >     but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > ---
> >  drivers/usb/musb/musbhsdma.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> > index 0aacfc8be5a1..7acd1635850d 100644
> > --- a/drivers/usb/musb/musbhsdma.c
> > +++ b/drivers/usb/musb/musbhsdma.c
> > @@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> >  				musb_channel->channel.status =
> >  					MUSB_DMA_STATUS_BUS_ABORT;
> >  			} else {
> > -				u8 devctl;
> > -
> >  				addr = musb_read_hsdma_addr(mbase,
> >  						bchannel);
> >  				channel->actual_len = addr
> > @@ -336,8 +334,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
> >  						< musb_channel->len) ?
> >  					"=> reconfig 0" : "=> complete");
> >  
> > -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> 
> Are you sure that the hardware does not require this read to complete
> the command?  Lots of hardware is that way, so be very careful about
> this.  Did you test it?

I have tested this patch on Mediatek's platform, and not sure if it
will affect other vendors' platforms.

Dear Bin:

Does this patch will affect other vendors' platforms?

Best Regards,
Min

> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
