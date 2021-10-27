Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3455EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023B060C40
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 023B060C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8re0NGAEvxE3rFPciHf96+tiYnZDnTNpr72Aq98BQEM=; b=VZnrbIYSRfgNJ6
	+R71ekPJinrg7m1XhRWeJgDfhRZDXLRlxLfjz+cWQrWZe4xLCiwdlGfu7ajlxfn8ITFZv+uPg72z9
	KBpBEkvnfsy5i5O2hwqUhE8PZGZVBZZ1BQSXCfmSrNKfzwtDjxNwg/W1Y4yPuRrDwjNdoaOQ2NTUL
	URUQFYkaHiLpvRk+D3cWyeyUpVK0KrX3JbVmQO1SXOr6DlZ1n2ARic7vkHiVG+yGn2NBjb39l6Nfg
	k3E4t1Wb/eoTn6Hk4bc5UdWD5PDWCl24RQ7FK4ovPas8qPf2Wsg1AEzIjFlt82mcrijpJcqngV1Wv
	JWXbQwhAc9uo9pJdu8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffRY-004SXC-VF; Wed, 27 Oct 2021 09:42:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffRM-004SVD-Ix; Wed, 27 Oct 2021 09:41:49 +0000
X-UUID: 83a6a9d56f06497f8bf1512745f377ad-20211027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MRYbtZzHA6Ab8RM4gbu8m/VI2yKvhjNG510eYE06hMU=; 
 b=HqvBYS3uPi64EHmXz193uUhnyy4JjDzmQ9RTH17SnYGZJIDhG+3DChLkyXHCrGlxXPwyVxF27cubcUYy7Dh+sq42eYXMFKnrEuwh7hbLs0Dljpg5lYncC/3NpW5UO6Dn5wwn7PYRvEtmRSMTpMf+RJuJRtA7a0qTdTM1qN9RKB4=;
X-UUID: 83a6a9d56f06497f8bf1512745f377ad-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1048109679; Wed, 27 Oct 2021 02:41:45 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 02:36:01 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 17:35:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 17:35:58 +0800
Message-ID: <7811ffc8032eeb3201025085501da999e30a09d2.camel@mediatek.com>
Subject: Re: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>, "Mathias
 Nyman" <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 27 Oct 2021 17:35:58 +0800
In-Reply-To: <d7a7d79a-a1b9-3c3d-13e1-ab4ab8e9989a@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-21-s.shtylyov@omp.ru>
 <fee8297f6b34e530ef2e3da4e9bc9e324308b439.camel@mediatek.com>
 <d7a7d79a-a1b9-3c3d-13e1-ab4ab8e9989a@omp.ru>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_024148_653685_BB9AA940 
X-CRM114-Status: GOOD (  20.51  )
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

On Wed, 2021-10-27 at 12:25 +0300, Sergey Shtylyov wrote:
> On 27.10.2021 12:18, Chunfeng Yun wrote:
> 
> > > If platform_get_irq() returns IRQ0 (considered invalid according
> > > to
> > > Linus)
> > > the driver blithely passes it to usb_add_hcd() that treats IRQ0
> > > as no
> > > IRQ
> > > at all. Deny IRQ0 right away, returning -EINVAL from the probe()
> > > method...
> > > 
> > > Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host
> > > controller")
> > > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> > > ---
> > >   drivers/usb/host/xhci-mtk.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
> > > mtk.c
> > > index c53f6f276d5c..d2dc8d9863ee 100644
> > > --- a/drivers/usb/host/xhci-mtk.c
> > > +++ b/drivers/usb/host/xhci-mtk.c
> > > @@ -495,7 +495,7 @@ static int xhci_mtk_probe(struct
> > > platform_device
> > > *pdev)
> > >   		return ret;
> > >   
> > >   	irq = platform_get_irq_byname_optional(pdev, "host");
> > > -	if (irq < 0) {
> > > +	if (irq <= 0) {
> > >   		if (irq == -EPROBE_DEFER)
> > >   			return irq;
> > >   
> > > @@ -503,6 +503,8 @@ static int xhci_mtk_probe(struct
> > > platform_device
> > > *pdev)
> > >   		irq = platform_get_irq(pdev, 0);
Here, irq is updated again

> > >   		if (irq < 0)
> > >   			return irq;
> > > +		if (!irq)
> > 
> > it's "if (irq <= 0)"?
> 
>     No, if (irq == 0).
> 
> > > +			return -EINVAL;
add "else if (irq < 0), return irq;"?  but not -EINVAL only, this may
drop EPROBE_DEFER

> > >   	}
> > >   
> > >   	wakeup_irq = platform_get_irq_byname_optional(pdev,
> > > "wakeup");
> 
> MBR, Sergey
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
