Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C460C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKU+aT+pFaKXZzUW4xvmrciu0onU+W2R8M9ENP/sbv4=; b=lMSfAAF4EJslga
	2YhjUnxKcEGIYDyDD7d1fBZYbcgXFewfYfILpdPokUZj8zutpfqq/+a7CaTGFvC5eCOvV0E2Gmxs0
	HlRG915mCM/PRwY+OtqVEXiCQ1S18winzcd/v4giEdVGwEKz4cci27Fwf6zi2wUFUCKbi9SS7WEmF
	fiJS0iEMXssdpVmxLMxYr9NX+NGYcVmMECIehroJtfdE4Vzvhr/XltmarfjNq4UnHwkuqXOo8ZubX
	uscVJsoufluG8ujP9ECVPGrJwS/x1BI/6dWQR2GQ7clORKcbBsfZ5DOBsb/GS5V4q0rFZpCFw5bF1
	OROmqm0qPUxA3iWvCvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfCo-00CEKP-Dn; Mon, 28 Feb 2022 12:32:46 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOekg-00C3a1-7R; Mon, 28 Feb 2022 12:03:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id p14so24233542ejf.11;
 Mon, 28 Feb 2022 04:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=puET9FaE+iPLWSLHaH0Jc15P7LML3ILv/CtQc1xDRlDOvchBnePGr3CpZ8iNTFg26S
 MvdmzyKLao5C/5rXrSzR7jzTPZ0Yuj+7M+cqDE4eOMJCgAt9uraXgTEJwynFkzni1Fvy
 Vjo1HNa/jUOUFI/CmrkLVTegwpA5o7Cf0wR8qBn5y2xARegC4rz7JN5F70qSFE936vyK
 a6/WQ787WIaZ7lFx0I/tSaiXwe3z6FIrVBWdIQkzq0oVXXDZs7cCv56cl8qPmZ4RxzRI
 sP+DHiZk3rxPTft7o6PkfUdJMVZiSNaECaj+ljhYu978P5TkgTkfoRd54h/EuhklkuKS
 esTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=dqlAv6WvXGOCFv2Gvs6j9UnnnyxX/c+lyXrHn7OimJ2mtPgPhbvFWdxqOeYeGmayH6
 twfKHbq+LFKb68NoNSaCdvyNUweWn3Bl18bYlNCruFdin4utZpraIX7m6g+0xUZ5rfFS
 gmewctcluMAMeBO0JKulLNH0KEXZuXyod/A3VSafPC1K5GJpliDOi+Ch+fmi8n/Z+dSi
 YhqrQVAJDRIvbsss5hJwdyozovm+kw5rPzUmbdFQh9Oq/QUe7CxdmMGa6XkJQMCH8cDx
 D728P5Gl5fbDr3u+kHKHd8NXY2mXLW6E8z/SVY+8uHynHpeOfef1TJQBN+QQbOkWoj+G
 a05A==
X-Gm-Message-State: AOAM532VhORKW5ShbUyip2dniZoJ+Hqam0eDZee7p6VasJRXqv9CQpVM
 vSuj4xPSJhHp5kv9TWfpSjw=
X-Google-Smtp-Source: ABdhPJyPihjoYwx+e9NKg98XvxKCbWi7t13guT1EBLKeJ6QGdK72cKHCeJpX8hRszpc83uJxZ+jQ9w==
X-Received: by 2002:a17:906:d14e:b0:6cd:8d7e:eec9 with SMTP id
 br14-20020a170906d14e00b006cd8d7eeec9mr14944415ejb.28.1646049820086; 
 Mon, 28 Feb 2022 04:03:40 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b006ce04bb8668sm4257528ejh.184.2022.02.28.04.03.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:03:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 1/6] drivers: usb: remove usage of list iterator past the
 loop body
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220228112413.GA2812@kadam>
Date: Mon, 28 Feb 2022 13:03:36 +0100
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergman <arnd@arndb.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-sgx@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kvm@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, v9fs-developer@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Message-Id: <E31E215E-C409-40B8-8452-57E70C91484C@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-2-jakobkoschel@gmail.com>
 <20220228112413.GA2812@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_040342_416747_171B9E01 
X-CRM114-Status: GOOD (  21.96  )
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



> On 28. Feb 2022, at 12:24, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> On Mon, Feb 28, 2022 at 12:08:17PM +0100, Jakob Koschel wrote:
>> diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
>> index 9040a0561466..0fd0307bc07b 100644
>> --- a/drivers/usb/gadget/udc/at91_udc.c
>> +++ b/drivers/usb/gadget/udc/at91_udc.c
>> @@ -150,13 +150,14 @@ static void proc_ep_show(struct seq_file *s, struct at91_ep *ep)
>> 	if (list_empty (&ep->queue))
>> 		seq_printf(s, "\t(queue empty)\n");
>> 
>> -	else list_for_each_entry (req, &ep->queue, queue) {
>> -		unsigned	length = req->req.actual;
>> +	else
>> +		list_for_each_entry(req, &ep->queue, queue) {
>> +			unsigned int	length = req->req.actual;
>> 
>> -		seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> -				&req->req, length,
>> -				req->req.length, req->req.buf);
>> -	}
>> +			seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> +					&req->req, length,
>> +					req->req.length, req->req.buf);
>> +		}
> 
> Don't make unrelated white space changes.  It just makes the patch
> harder to review.  As you're writing the patch make note of any
> additional changes and do them later in a separate patch.
> 
> Also a multi-line indent gets curly braces for readability even though
> it's not required by C.  And then both sides would get curly braces.
> 
>> 	spin_unlock_irqrestore(&udc->lock, flags);
>> }
>> 
>> @@ -226,7 +227,7 @@ static int proc_udc_show(struct seq_file *s, void *unused)
>> 
>> 	if (udc->enabled && udc->vbus) {
>> 		proc_ep_show(s, &udc->ep[0]);
>> -		list_for_each_entry (ep, &udc->gadget.ep_list, ep.ep_list) {
>> +		list_for_each_entry(ep, &udc->gadget.ep_list, ep.ep_list) {
> 
> Another unrelated change.
> 
>> 			if (ep->ep.desc)
>> 				proc_ep_show(s, ep);
>> 		}
> 
> 
> [ snip ]

Thanks for pointing out, I'll remove the changes here and note them down
to send them separately.

> 
>> diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
>> index 7c38057dcb4a..bb59200f1596 100644
>> --- a/drivers/usb/gadget/udc/net2272.c
>> +++ b/drivers/usb/gadget/udc/net2272.c
>> @@ -926,7 +926,8 @@ static int
>> net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> {
>> 	struct net2272_ep *ep;
>> -	struct net2272_request *req;
>> +	struct net2272_request *req = NULL;
>> +	struct net2272_request *tmp;
>> 	unsigned long flags;
>> 	int stopped;
>> 
>> @@ -939,11 +940,13 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> 	ep->stopped = 1;
>> 
>> 	/* make sure it's still queued on this endpoint */
>> -	list_for_each_entry(req, &ep->queue, queue) {
>> -		if (&req->req == _req)
>> +	list_for_each_entry(tmp, &ep->queue, queue) {
>> +		if (&tmp->req == _req) {
>> +			req = tmp;
>> 			break;
>> +		}
>> 	}
>> -	if (&req->req != _req) {
>> +	if (!req) {
>> 		ep->stopped = stopped;
>> 		spin_unlock_irqrestore(&ep->dev->lock, flags);
>> 		return -EINVAL;
>> @@ -954,7 +957,6 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> 		dev_dbg(ep->dev->dev, "unlink (%s) pio\n", _ep->name);
>> 		net2272_done(ep, req, -ECONNRESET);
>> 	}
>> -	req = NULL;
> 
> Another unrelated change.  These are all good changes but send them as
> separate patches.

You are referring to the req = NULL, right?

I've changed the use of 'req' in the same function and assumed that I can
just remove the unnecessary statement. But if it's better to do separately
I'll do that.

> 
>> 	ep->stopped = stopped;
>> 
>> 	spin_unlock_irqrestore(&ep->dev->lock, flags);
> 
> regards,
> dan carpenter

thanks,
Jakob Koschel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
