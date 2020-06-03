Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBD4C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 13:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3BC20738
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 13:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bm1IpNvm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Vm6d7M2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D3BC20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEzKtUwG9kQD1g4e9mN3jaN0QUfVkqQP8JxCqXU0JHc=; b=bm1IpNvmGdEe7Q
	1LIRGfYiJwr6Yv+uhiMHv6ts8iP0m/ErjsJlnOtle8bm5/SJDlpRPwK3YeLplS2/7B+JambWfGQ6c
	saOe+1qGMYAcuKECFOMVv8TUR5aB6DXIdW+TjrQmolXKVklf6iug3JrbbVFTXQIa7bKsiZIssT8yV
	99rsLv8w/uQnOg2JK82AA/Ac2Kv1Ab3VcZZX1BwCxZS0ROcae/ZD1t5yy4MBbirzu/otGKYuV27vA
	WMAqORweiwg+NuWLXz09YY/CbTNbmU1Czd47dSc7GRc9rnToa0yOB9TDBm02hy1A4XU1FmmGxE0OS
	WrmJ5BFjEVSgF/5fK4LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgT1e-0003jT-5B; Wed, 03 Jun 2020 13:01:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgT1b-0003j0-6e; Wed, 03 Jun 2020 13:01:44 +0000
X-UUID: 0f564a730245468984ee339ef768c81b-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4T4GZu2BhBmei0L8cxQIJh1W9EQOektqEZeHV+JC9ko=; 
 b=Vm6d7M2iXShnUXPqPG/6Uw7SJYLRssCcEXVgJODiqyHSSQG1tBCE9WULJBnW0tf4gClUKWe1Cpk7LccVeSXEIvJx4csFxIYToGazbUHfu0LrwU8wHoY86pAxbO3Ck7L1qpQj5caTQwhJHFt2dQOGvSd23bTl3kkLoMbWupal5HU=;
X-UUID: 0f564a730245468984ee339ef768c81b-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1347354342; Wed, 03 Jun 2020 05:01:23 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 06:01:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 21:01:20 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 21:01:22 +0800
Message-ID: <1591189283.23525.67.camel@mtkswgap22>
Subject: Re: [PATCH] usb: host: xhci-mtk: avoid runtime suspend when
 removing hcd
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Wed, 3 Jun 2020 21:01:23 +0800
In-Reply-To: <ebd32a2b-c4ba-8891-b13e-f6c641a94276@linux.intel.com>
References: <1590726569-28248-1-git-send-email-macpaul.lin@mediatek.com>
 <ebd32a2b-c4ba-8891-b13e-f6c641a94276@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_060143_360493_0D51283E 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-03 at 14:47 +0300, Mathias Nyman wrote:
> On 29.5.2020 7.29, Macpaul Lin wrote:
> > When runtime suspend was enabled, runtime suspend might happened
> > when xhci is removing hcd. This might cause kernel panic when hcd
> > has been freed but runtime pm suspend related handle need to
> > reference it.
> > 
> > Change-Id: I70a5dc8006207caeecbac6955ce8e5345dcc70e6
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >  drivers/usb/host/xhci-mtk.c |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index bfbdb3c..641d24e 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -587,6 +587,9 @@ static int xhci_mtk_remove(struct platform_device *dev)
> >  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
> >  	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
> >  
> > +	pm_runtime_put_sync(&dev->dev);
> 
> Might runtime suspend here.
> It's a lot better than before, no panic as hcd isn't released, but a bit unnecessary.
> 
> how about this sequence instead:
> pm_runtime_disable()
> pm_runtime_put_noidle()
> 
> > +	pm_runtime_disable(&dev->dev);
> > +
> 
> -Mathias

Thanks for your suggestion!
Will it better to put no idle before disable? 
pm_runtime_put_noidle()
pm_runtime_disable()

I've found pm_runtime_put_noidle is called in pm_runtime_disable() when
there is a pending request.

I will send patch v3 as noidle() called earlier than disable(). Please
help to comment it if disable() should go before.

Thanks!
Macpaul Lin 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
