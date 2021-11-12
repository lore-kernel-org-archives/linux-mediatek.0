Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B741C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 02:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD9C60E94
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 02:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DD9C60E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uWKA7LrF8v4A2vKsjDDr367Cs/h61nG/KvL8UZ8JJc=; b=XXPDxvjvEFQWdS
	CLd1kH6lbGJLo8Of2ZAsDbhMraHoP8epO4uyTU/UUi/fQ+vteObQHfqid10QNtv0pEKUVHIrmZImZ
	YADwru7qkR7KaRE1ygDC+UgSjVSHLsSLRGwJZImPbVTVCZc/ARLwS56PfME0lp3ksrV/1HPSNUssT
	X0k2Ew5GsY99fnfuDp91xwnJGhH/Pvnw65hDYBs0zKC2PbHiS6zpZvn1mS3AfBJef19GJ0Zc7yXjq
	+DHPbuNJDklsqB7bhmI1WHMZ5NKP4hRAMa+VHyQzBMyviH8CGJtlMIPacoiP3d1LxIcQ0Wps3f3PN
	CRV/P/MNl3zzYbrI8apA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlM4S-009EjI-N7; Fri, 12 Nov 2021 02:13:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlM4F-009Eh9-B7; Fri, 12 Nov 2021 02:13:28 +0000
X-UUID: c73e48f2be8e4031bba6d4999a5f1138-20211111
X-UUID: c73e48f2be8e4031bba6d4999a5f1138-20211111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1694210797; Thu, 11 Nov 2021 19:13:25 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 18:13:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 12 Nov 2021 10:13:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Nov 2021 10:13:10 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mathieu.poirier@linaro.org>
CC: <bjorn.andersson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <ohad@wizery.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
Date: Fri, 12 Nov 2021 10:13:10 +0800
Message-ID: <20211112021310.19493-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CANLsYkyLgvMDx-CMLZPEdJ8rUuGX-=QgB++5fz_h_ordm_q1aA@mail.gmail.com>
References: <CANLsYkyLgvMDx-CMLZPEdJ8rUuGX-=QgB++5fz_h_ordm_q1aA@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_181327_468550_F54B56C0 
X-CRM114-Status: GOOD (  18.42  )
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

> Hi Mark,
>
>
> >
> > Use %pe format string to print return error code which
> > make the error message easier to understand.
> >
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 502b6604b757..2242da320368 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >                                            dma_get_mask(rproc->dev.parent));
> >         if (ret) {
> >                 dev_warn(dev,
> > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > -                        dma_get_mask(rproc->dev.parent), ret);
> > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
>
> Macro ERR_PTR() is used to convert error codes to pointer type when
> returning from a function - I fail to see how doing so in a dev_warn()
> context can make the message easier to understand.  Can you provide an
> example?

Hi,

When dma_coerce_mask_and_coherent() fail, the output log will be as following.

format		log
%x		Trying to continue... fffffffb
%d		Trying to continue... -5
%pe		Trying to continue... -5	(if CONFIG_SYMBOLIC_ERRNAME is not set)
%pe		Trying to continue... -EIO	(if CONFIG_SYMBOLIC_ERRNAME=y)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
