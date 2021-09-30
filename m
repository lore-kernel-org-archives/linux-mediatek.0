Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6237CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 15:18:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264E861881
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 15:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 264E861881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIECMI3HNSoEM64qSnMoEOfKSykeu6NiEAvBj3Tj2zA=; b=mLD6WHk7gNcFID
	8+ApulpWmeoRohl1JTmjw9BayzyhWTy2bTqSvhAMLNXDs1bqW4avMzecGda6I8rh+r+bqCgMVerX5
	n72eNf7vb09hHL2h6pyURMOEuIEJidZOJluEFZpZrx1cUfK77U2bkikgc3BObevBkVe17Pmh00c93
	gbkuJEIDPdIxG+rhBgwumYE9RqmdELw2Qc6z//AUiZ3rP3sfo+CpQuDbjpMU5BByIwWmKQtXRvzD8
	wRhzyNKvrlKf5Bl7HeKN70Z6b/bGP8UG/rmSAi4ZufVAiCZXlf6efcQaEIwYpUGodnbe+hao31fsG
	lX3U24SpVN/XA5+8R7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVxpV-00EvOH-8O; Thu, 30 Sep 2021 15:18:37 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVxpI-00EvKp-92
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 15:18:26 +0000
Received: (qmail 472189 invoked by uid 1000); 30 Sep 2021 11:18:19 -0400
Date: Thu, 30 Sep 2021 11:18:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Hayes Wang <hayeswang@realtek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "hsinyi@google.com" <hsinyi@google.com>, nic_swsd <nic_swsd@realtek.com>
Subject: Re: [PATCH] r8152: stop submitting rx for -EPROTO
Message-ID: <20210930151819.GC464826@rowland.harvard.edu>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
 <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
 <274ec862-86cf-9d83-7ea7-5786e30ca4a7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <274ec862-86cf-9d83-7ea7-5786e30ca4a7@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_081824_471611_D5F57D67 
X-CRM114-Status: GOOD (  20.28  )
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

On Thu, Sep 30, 2021 at 11:30:17AM +0200, Oliver Neukum wrote:
> 
> On 29.09.21 11:52, Jason-ch Chen wrote:
> > On Wed, 2021-09-29 at 08:14 +0000, Hayes Wang wrote:
> >>
> > Hi Hayes,
> >
> > Sometimes Rx submits rapidly and the USB kernel driver of opensource
> > cannot receive any disconnect event due to CPU heavy loading, which
> > finally causes a system crash.
> > Do you have any suggestions to modify the r8152 driver to prevent this
> > situation happened?
> >
> > Regards,
> > Jason
> >
> Hi,
> 
> Hayes proposed a solution. Basically you solve this the way HID or WDM do it
> delaying resubmission. This makes me wonder whether this problem is specific
> to any driver. If it is not, as I would argue, do we have a deficiency
> in our API?
> 
> Should we have something like: usb_submit_delayed_urb() ?

There has been some discussion about this in the past.

In general, -EPROTO is almost always a non-recoverable error.  In 
usually occurs when a USB cable has been unplugged, before the 
upstream hub has notified the kernel about the unplug event.  It also 
can occur when the device's firmware has crashed.

I do tend to think there is a deficiency in our API, and that it 
should be fixed by making the core logically disable an endpoint 
(clear the ep->enabled flag) whenever an URB for that endpoint 
completes with -EPROTO, -EILSEQ, or -ETIME status.  (In retrospect, 
using three distinct status codes for these errors was a mistake.)  
Then we wouldn't have to go through this piecemeal approach, 
modifying individual drivers to make them give up whenever they get 
one of these errors.

But then we'd have also have to make sure drivers have a way to 
logically re-enable endpoints, for the unlikely case that the error 
can be recovered from.  Certainly set-config, set-interface, and 
clear-halt should do this.  Anything else?

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
