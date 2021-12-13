Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2124BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IHnd2wQB44J5OLF/bMJ0pY2a+Mfs8xnSH85RNuc6X4=; b=OTpA8SACvBIQTr
	0X/6wGlCJpmt+u5X0UgTSRdlIWg2CUDpaXxqjDDuIpeUdfxY2N97+MOAl5XyxK6wNDRVyiye83fKs
	0nHICJQ32CJQ1MRlq5H9E3O83W3xGdMcwQWKxuKd3sDbMl2uaMi5Qrc2/HLf3tPGhJaTMd8bgXr6P
	4JE0VRhbrr4KgVnaEsZiIFb+hhvHDrU1vZ2900ItklJhu+UO12cOdOTgc8q1roNBd4EZqGNQu/ssj
	mfYFx6I+2fMiVe4Du1OXwZn6EPSEukShUoj9aQYPIjJ2ijcVxOaWt5WwriRzh8+Pku4GfacrqPi4X
	gsbz0xYAZR1vgoB4S/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfnN-0085sK-GI; Mon, 13 Dec 2021 07:30:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfmy-0085l7-2S; Mon, 13 Dec 2021 07:30:27 +0000
X-UUID: 263184e1ea5149ae98d34181d66c76d8-20211213
X-UUID: 263184e1ea5149ae98d34181d66c76d8-20211213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1777616443; Mon, 13 Dec 2021 00:30:20 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Dec 2021 23:20:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Dec 2021 15:20:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 13 Dec 2021 15:20:15 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mathieu.poirier@linaro.org>
CC: <bjorn.andersson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <ohad@wizery.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
Date: Mon, 13 Dec 2021 15:20:15 +0800
Message-ID: <20211213072015.32235-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211116162933.GA2318486@p14s>
References: <20211116162933.GA2318486@p14s>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_233024_156008_BC3C05DA 
X-CRM114-Status: GOOD (  31.09  )
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

> Good day,
> 
> On Tue, Nov 16, 2021 at 09:57:03PM +0800, Mark-PK Tsai wrote:
> > > > > > Use %pe format string to print return error code which
> > > > > > make the error message easier to understand.
> > > > > >
> > > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > > > index 502b6604b757..2242da320368 100644
> > > > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > > > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > > > >                                            dma_get_mask(rproc->dev.parent));
> > > > > >         if (ret) {
> > > > > >                 dev_warn(dev,
> > > > > > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > > > > > -                        dma_get_mask(rproc->dev.parent), ret);
> > > > > > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > > > > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > > > >
> > > > > Macro ERR_PTR() is used to convert error codes to pointer type when
> > > > > returning from a function - I fail to see how doing so in a dev_warn()
> > > > > context can make the message easier to understand.  Can you provide an
> > > > > example?
> > > >
> > > > Hi,
> > > >
> > > > When dma_coerce_mask_and_coherent() fail, the output log will be as following.
> > > >
> > > > format          log
> > > > %x              Trying to continue... fffffffb
> > > > %d              Trying to continue... -5
> > > > %pe             Trying to continue... -5        (if CONFIG_SYMBOLIC_ERRNAME is not set)
> > > > %pe             Trying to continue... -EIO      (if CONFIG_SYMBOLIC_ERRNAME=y)
> > >
> > > When failing, functions dma_coerce_mask_and_coherent() returns -EIO.
> > > Casting that to a (void *) with ERR_PTR() does not change that value.
> > > Since variable @ret is already declared as "int" the real fix is to
> > > change "%x" to "%d".
> > 
> > There're some other drivers do the same thing in the recent kernel, so I think
> > it's fine to casting the `ret` to a (void *) for more user friendly.
> > But I suppose it would depend on the maintainer's opinion.
> > 
> > So how about previous patch I sent, which also fix this issue by using %d.
> > 
> > https://lore.kernel.org/lkml/20211102120805.27137-1-mark-pk.tsai@mediatek.com/
> 
> I had not seen Russell's reply in the link you posted above.  I am not
> completely sure about his solution but his insight and guidance in kernel
> programming have precedence over mine.
> 
> I will take this patch.
> 
> Thanks,
> Mathieu
> 

Hi,

Sorry to disturb you.
Is this patch queued?
Just want to make sure it has not been forgotten.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
