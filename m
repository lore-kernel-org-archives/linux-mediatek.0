Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fdi2QFq4U7j0etg9MSACnp17wUmVLTtOXwuzh/f2HuA=; b=yjN5+PSF1VSuPZ
	4/tWGCtu28RkkGfczklIXGNPjRfcfKKcZpAGNa4QoEojYllGHZzcMIftaUNIoBhheE0LtSnVILZC8
	l+K5P3+JVEDvRH48MbHDNjGCAUwlkJWc8pfNKVsYkIao/HxHbB5VOAJM/2P3u9BOblU4Q8a0OCxS1
	TnDSzv015ylGeqf2bBCCFI7SlKwcaUpNTMAkkfenQzrLNv5Ok0t068kbvOTrkVukemWUK5g373Bcs
	q2ML2JP2ZOW00j37wNuLtI+IfA1F8mrIM3qRWkr2fVaPhCGKr8ouf+DI4IrfPENBtN5R/7pAdALhz
	KzX/WmjIwXGX/YXmHFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwocJ-00Ajdx-8s; Mon, 13 Dec 2021 16:55:59 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwoc3-00AjXd-P9
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 16:55:45 +0000
Received: by mail-pf1-x434.google.com with SMTP id g19so15462290pfb.8
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 08:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Otkd94Ddo+0y+d19P9705aLyzrf8R+OhLjXGWeBBDgI=;
 b=D2pQ/ahpacnzEw4VKDE+IWQG9HUL/EEsWexNqmtOR4aNU5XRNcTMGIcFE4kTfkdg0u
 Urd3qw/wp/ybiCNZNvxY6XJqtkpMjR7QhPecu67jMtnbj8hmJRn7kKShA1+mgYpvL4D9
 oJ+CQnNFirWc+8lo2KnWjDX25k+depiKcixPXsbzZLKTktNrWBdmAfNhMUPhXTPMeaC2
 FaS6wUQ2IcWiOerE3Pyg6w+scfVh9PTa34b3UVdXWWrmV5TO7oDfLZvKZNzeU2MkUqEa
 DLItbA1GxSmg2iPv/Kl/jc/yWytd88vFon1VNR3NZdFRymNAlInFzVkcL5HrNEtJUZ4a
 gcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Otkd94Ddo+0y+d19P9705aLyzrf8R+OhLjXGWeBBDgI=;
 b=q7CPoIUpbTIZ/OmJHD+7EtCwTGZ12V4l+f3ZIW7n8oyV+OBdT8EEtNGalMVvl6dL+O
 JZWNCERycGxrdOes7x5spBfnosMFVTQRjkPsS+n3Cmwr/pXOWq6A69cVyGy5vI7bJiHv
 fVuh6jqkW/h6Oqop4YW0QCxk4gEKe/iK/GD3fDS0rDIu0jt781jycM8F+MGofJuLeu5J
 Qg2YAFELW7gQafrXHEvuQxL4AqzJhNPkYGrXtF9rMaxof5RIhnyZcohV8dvhEk5efjDQ
 voxDZMoTWCf8mdfXJTpxuuV0FdbzDLxYZ8Z59JECBmW+NqRuDr1GpRnTNHshRuRFPinK
 Gsiw==
X-Gm-Message-State: AOAM530dyT1JxhZN6Hq74cUlh17vDFjrEV8JXTj9rOFbk6xUNdxA6B6B
 WktbikuR1JG7TerfAucno+A8Ng==
X-Google-Smtp-Source: ABdhPJxcG+pDaR82nQIpiGgA+GsZ94Xtzp0Mh0VcEJpkpsk7NgrveddXN3qtbe4XWzRsAWtKejnyUw==
X-Received: by 2002:a65:6557:: with SMTP id a23mr12921258pgw.451.1639414541767; 
 Mon, 13 Dec 2021 08:55:41 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id r6sm7378794pjz.56.2021.12.13.08.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:55:40 -0800 (PST)
Date: Mon, 13 Dec 2021 09:55:38 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
 ohad@wizery.com, yj.chiang@mediatek.com
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
Message-ID: <20211213165538.GA1396405@p14s>
References: <20211116162933.GA2318486@p14s>
 <20211213072015.32235-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213072015.32235-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_085543_831315_DEE5044D 
X-CRM114-Status: GOOD (  33.45  )
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

On Mon, Dec 13, 2021 at 03:20:15PM +0800, Mark-PK Tsai wrote:
> > Good day,
> > 
> > On Tue, Nov 16, 2021 at 09:57:03PM +0800, Mark-PK Tsai wrote:
> > > > > > > Use %pe format string to print return error code which
> > > > > > > make the error message easier to understand.
> > > > > > >
> > > > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > > > ---
> > > > > > >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > > > > index 502b6604b757..2242da320368 100644
> > > > > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > > > > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > > > > >                                            dma_get_mask(rproc->dev.parent));
> > > > > > >         if (ret) {
> > > > > > >                 dev_warn(dev,
> > > > > > > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > > > > > > -                        dma_get_mask(rproc->dev.parent), ret);
> > > > > > > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > > > > > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > > > > >
> > > > > > Macro ERR_PTR() is used to convert error codes to pointer type when
> > > > > > returning from a function - I fail to see how doing so in a dev_warn()
> > > > > > context can make the message easier to understand.  Can you provide an
> > > > > > example?
> > > > >
> > > > > Hi,
> > > > >
> > > > > When dma_coerce_mask_and_coherent() fail, the output log will be as following.
> > > > >
> > > > > format          log
> > > > > %x              Trying to continue... fffffffb
> > > > > %d              Trying to continue... -5
> > > > > %pe             Trying to continue... -5        (if CONFIG_SYMBOLIC_ERRNAME is not set)
> > > > > %pe             Trying to continue... -EIO      (if CONFIG_SYMBOLIC_ERRNAME=y)
> > > >
> > > > When failing, functions dma_coerce_mask_and_coherent() returns -EIO.
> > > > Casting that to a (void *) with ERR_PTR() does not change that value.
> > > > Since variable @ret is already declared as "int" the real fix is to
> > > > change "%x" to "%d".
> > > 
> > > There're some other drivers do the same thing in the recent kernel, so I think
> > > it's fine to casting the `ret` to a (void *) for more user friendly.
> > > But I suppose it would depend on the maintainer's opinion.
> > > 
> > > So how about previous patch I sent, which also fix this issue by using %d.
> > > 
> > > https://lore.kernel.org/lkml/20211102120805.27137-1-mark-pk.tsai@mediatek.com/
> > 
> > I had not seen Russell's reply in the link you posted above.  I am not
> > completely sure about his solution but his insight and guidance in kernel
> > programming have precedence over mine.
> > 
> > I will take this patch.
> > 
> > Thanks,
> > Mathieu
> > 
> 
> Hi,
> 
> Sorry to disturb you.
> Is this patch queued?
> Just want to make sure it has not been forgotten.

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=for-next


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
