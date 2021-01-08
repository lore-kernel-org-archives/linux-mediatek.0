Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1227FC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 06:12:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F036233FB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 06:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F036233FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iz596gq2NXX+PhGqUttPadUXANSiYu8+3gqp8S6EFM8=; b=B4RLghKUrWoj2PTrPLzFAe4e/
	Ellg62ijXIVKDKzvJUEZMG6GnXV0eKMgZqF//Ymw4CZQEItO4IirGIxRe13zcPypgOq3ViNBeah/W
	PcN7hHs5Ddjn9QmyxjYffzfYipw9Smg/zn6PJCz5Cggl0HWfjhDgpVXmDV+/SmlsVPlRSI1TuC/86
	PmNCcIXvohTbfGdMpDgJ1dkm4blpZiOSNBDWYHrya6OeT41KboSdfEjSjeID2WUYvGFLPMPnbGaQ1
	7TBIx99JMubfOdBlabniAZrvZI9vfpFtJ0m+vMG8egI5XXX2bZPuoLO3Sl1uLKVl8RSVhCte3HHpI
	ukqMUyZdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxl0L-00070v-RF; Fri, 08 Jan 2021 06:12:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxl0G-00070A-U0; Fri, 08 Jan 2021 06:12:06 +0000
X-UUID: 2524992b217e4fb0832aa6d98888427b-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LDkX9dGv4KvdYnnhzQPG/2hc+NN7U1uTjI1C2TIOKEU=; 
 b=e3oFH22iXVHk04QvgGDGtJing67Y3GCnTz7LpvDFRvhm2eM5b+nC2GCTP/9ZcEu1yOYhfJLWTV0fcnYYMQzjUVqF6AtuJVMxKj6jcvNW2RFTCOPesRCWe45JU7jARvPYfpwpmEoRGwAyYNX4q6ZVj9LXS9DSEgWwdIYd4turv8U=;
X-UUID: 2524992b217e4fb0832aa6d98888427b-20210107
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1902843895; Thu, 07 Jan 2021 22:11:58 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 22:11:56 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Jan 2021 14:11:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jan 2021 14:11:48 +0800
Message-ID: <1610086308.24856.30.camel@mhfsdcap03>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Fri, 8 Jan 2021 14:11:48 +0800
In-Reply-To: <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 12678802E42F6808826D6958AF777C2230A087B39BF15A09308AD3209AE099362000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_011205_745245_4252476D 
X-CRM114-Status: GOOD (  23.76  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-07 at 13:09 +0200, Mathias Nyman wrote:
> On 29.12.2020 8.24, Ikjoon Jang wrote:
> > xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > to handle its own sw bandwidth managements and stores bandwidth data
> > into internal table every time add_endpoint() is called,
> > so when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> > 
> > This patch adds two more hooks from check_bandwidth() and
> > reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > from reset_bandwidth().
> > 
> > Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > 
> 
> ...
> 
> > 
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index d4a8d0efbbc4..e1fcd3cf723f 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -2882,6 +2882,12 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> >  	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
> >  	virt_dev = xhci->devs[udev->slot_id];
> >  
> > +	if (xhci->quirks & XHCI_MTK_HOST) {
> > +		ret = xhci_mtk_check_bandwidth(hcd, udev);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> 
> Just noticed that XHCI_MTK_HOST quirk is only set in xhci-mtk.c.
> xhci-mtk.c calls xhci_init_driver(..., xhci_mtk_overrides) with a .reset override function.
> 
> why not add override functions for .check_bandwidth and .reset_bandwidth to xhci_mtk_overrides instead?
> 
> Another patch to add similar overrides for .add_endpoint and .drop_endpoint should probably be
> done so that we can get rid of the xhci_mtk_add/drop_ep_quirk() calls in xhci.c as well
You mean, we can export xhci_add/drop_endpoint()?

> 
> Thanks
> -Mathias
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
