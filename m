Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8F7C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 01:58:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3D9207DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 01:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EoxBT2I9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J1IlM1Yh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE3D9207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JUZZaJJYWWiyow6ZThypOHGlFq4aUI3OgxHzRlKTKPI=; b=EoxBT2I9h9IPkG4CDSyKvESQ8
	Q/xt84t2MmmgnR9GtHhmfexkvCUtDsWOntXP3v4vbIHu4DqJ/aZCR0RJ9E6ZOjoWwht/XB6ShqQrn
	Y7GUMeCFCFJmXp06xjghqdcH8hJZSaBL2LVsxipfCKt01MvHO38CXopnKmcE7FNnBwSQujrxwJRLr
	237KU0isUW57BT8+qktGvlUnYBtwiIlEu3OjlYE9UbfYeNch5ExjHSymUOYpReQH2aXKiKlaZg/Kn
	+Syn1qkEELJ6eIUpIfwMakQFYDHJkUDXCegwziBNFm+xn4x6fCOlT8hNQS+1RPEn11okN9WQaifIR
	cPdIOBKog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8ZqW-0005k8-4v; Thu, 20 Aug 2020 01:58:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ZqQ-0005j4-OJ; Thu, 20 Aug 2020 01:58:23 +0000
X-UUID: 2f6d2dfb8f6d456aaa9b9ae808eede03-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EFWywN6zeLfx3mYDlfu+y15rEMdXgmrxserMhZ887hk=; 
 b=J1IlM1Yh+IHRVrTZB10AbJJjGKJIysMwZxenNX8Ft9rLwFeBaUaZpAmzSONDJdkWSaIEyuXNZrptSzF00gOsovKM15ESR3J7/GOay1iESu2CnkD99HcLAahG3JqX0QJF6e0qy2hezG2roBv4hil5Of18//EPupwNMU9T1Xqd/v8=;
X-UUID: 2f6d2dfb8f6d456aaa9b9ae808eede03-20200819
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1685836257; Wed, 19 Aug 2020 17:58:18 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 18:58:17 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 20 Aug 2020 09:58:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 09:58:10 +0800
Message-ID: <1597888623.23067.19.camel@mhfsdcap03>
Subject: Re: [PATCH 10/10] usb: udc: net2280: convert to
 readl_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Alan Stern <stern@rowland.harvard.edu>
Date: Thu, 20 Aug 2020 09:57:03 +0800
In-Reply-To: <20200819145957.GA183103@rowland.harvard.edu>
References: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597840865-26631-10-git-send-email-chunfeng.yun@mediatek.com>
 <20200819145957.GA183103@rowland.harvard.edu>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 22D2EDA70C9DE4A57BACB86CCD4B9AF55312C82D351F55D5F12277413D9518212000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_215822_985067_0C21BACB 
X-CRM114-Status: GOOD (  21.57  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-19 at 10:59 -0400, Alan Stern wrote:
> On Wed, Aug 19, 2020 at 08:41:05PM +0800, Chunfeng Yun wrote:
> > Use readl_poll_timeout_atomic() to simplify code
> > 
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/gadget/udc/net2280.c | 21 ++++++++++-----------
> >  1 file changed, 10 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
> > index 7530bd9..f1a21f4 100644
> > --- a/drivers/usb/gadget/udc/net2280.c
> > +++ b/drivers/usb/gadget/udc/net2280.c
> > @@ -52,6 +52,7 @@
> >  #include <linux/usb/gadget.h>
> >  #include <linux/prefetch.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  
> >  #include <asm/byteorder.h>
> >  #include <asm/irq.h>
> > @@ -360,18 +361,16 @@ static inline void enable_pciirqenb(struct net2280_ep *ep)
> >  static int handshake(u32 __iomem *ptr, u32 mask, u32 done, int usec)
> >  {
> >  	u32	result;
> > +	int	ret;
> >  
> > -	do {
> > -		result = readl(ptr);
> > -		if (result == ~(u32)0)		/* "device unplugged" */
> > -			return -ENODEV;
> > -		result &= mask;
> > -		if (result == done)
> > -			return 0;
> > -		udelay(1);
> > -		usec--;
> > -	} while (usec > 0);
> > -	return -ETIMEDOUT;
> > +	ret = readl_poll_timeout_atomic(ptr, result,
> > +					((result & mask) == done ||
> > +					 result == U32_MAX),
> > +					1, usec);
> > +	if (result == U32_MAX)		/* device unplugged */
> > +		return -ENODEV;
> > +
> > +	return ret;
> >  }
> >  
> >  static const struct usb_ep_ops net2280_ep_ops;
> > -- 
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> However, I noticed that the kerneldoc for readl_poll_timeout_atomic() is 
> out of date.  Can you fix it up?
Ok, will do it, thanks

> 
> Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
