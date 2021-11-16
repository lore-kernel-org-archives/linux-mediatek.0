Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D3EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 13:57:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 585AB61B9F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 13:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 585AB61B9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbZ/Hwya7poNfNql0UdPDJx0jPRadAh12lW6zhfzFDk=; b=LaYOwoX19SEzid
	3MTxMdjJQ86G/COpHLOCg7kg3leq+DT561voFY6SrcP7ftzYsy2N7lErDlYEqcp2YdnQtXRUZczJZ
	sT4ObrCyMmSATWjflTTcj2MkAtRCN/Dwzo5kZwDSVaYuzZKHK6rTK2RkZlKBTCq4jUxiaJ663VpBs
	Ce8i46H9OVgOBOe59HCc6jZCV5pSUzWN3pJMpok8Qs4N/mm2YYpqSJ1sotUcpCOHUMKyayrzlmXC8
	PYUc6JKA0nrgZ2gONKlyUiuC9K5tj9K37pKr+b7+J3rR+GTHrI3S5TEkVnaq+CdgNnlT9WJmzgq+E
	JvHYQLTsiQwJJjGC+FjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmyxl-001ptV-85; Tue, 16 Nov 2021 13:57:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmyxW-001pr1-3O; Tue, 16 Nov 2021 13:57:17 +0000
X-UUID: 651c4597ce234c9da81c20977e47723a-20211116
X-UUID: 651c4597ce234c9da81c20977e47723a-20211116
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 989367316; Tue, 16 Nov 2021 06:57:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 05:57:04 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 16 Nov 2021 21:57:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Nov 2021 21:57:03 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mathieu.poirier@linaro.org>
CC: <bjorn.andersson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <ohad@wizery.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
Date: Tue, 16 Nov 2021 21:57:03 +0800
Message-ID: <20211116135703.19432-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CANLsYkzsoXw8vCC-OBqHyQv216Rbjf9ZR7FuFK-zxC7gMzt9Kg@mail.gmail.com>
References: <CANLsYkzsoXw8vCC-OBqHyQv216Rbjf9ZR7FuFK-zxC7gMzt9Kg@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_055714_176410_98F57781 
X-CRM114-Status: GOOD (  25.81  )
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

> > > > Use %pe format string to print return error code which
> > > > make the error message easier to understand.
> > > >
> > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index 502b6604b757..2242da320368 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > >                                            dma_get_mask(rproc->dev.parent));
> > > >         if (ret) {
> > > >                 dev_warn(dev,
> > > > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > > > -                        dma_get_mask(rproc->dev.parent), ret);
> > > > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > >
> > > Macro ERR_PTR() is used to convert error codes to pointer type when
> > > returning from a function - I fail to see how doing so in a dev_warn()
> > > context can make the message easier to understand.  Can you provide an
> > > example?
> >
> > Hi,
> >
> > When dma_coerce_mask_and_coherent() fail, the output log will be as following.
> >
> > format          log
> > %x              Trying to continue... fffffffb
> > %d              Trying to continue... -5
> > %pe             Trying to continue... -5        (if CONFIG_SYMBOLIC_ERRNAME is not set)
> > %pe             Trying to continue... -EIO      (if CONFIG_SYMBOLIC_ERRNAME=y)
>
> When failing, functions dma_coerce_mask_and_coherent() returns -EIO.
> Casting that to a (void *) with ERR_PTR() does not change that value.
> Since variable @ret is already declared as "int" the real fix is to
> change "%x" to "%d".

There're some other drivers do the same thing in the recent kernel, so I think
it's fine to casting the `ret` to a (void *) for more user friendly.
But I suppose it would depend on the maintainer's opinion.

So how about previous patch I sent, which also fix this issue by using %d.

https://lore.kernel.org/lkml/20211102120805.27137-1-mark-pk.tsai@mediatek.com/


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
