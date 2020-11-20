Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51772C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:37:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD862225B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 16:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ELnxo1Bc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADD862225B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G28UO7h5o3NaFlvCI2/PceakFwtks1Yt56kQvCnYwc8=; b=ELnxo1Bcl0YFNqwH9jJ6RjTey
	w2JNoUs7jIXLuqTp5eTSVfd27gIF4OLUhlfzvLFa4QnN9iVA9QA9fcaG+U+YvLjOMzamq51VEvFh2
	AWVY4JEyj9rScjIsstDxzbKHiPB+FaWf3+lohbKXxEesZY/u4RDEmp/uQ03LuRUq++5GvYAP9X1pT
	0A7ZXEzI+gdGNQO+oePfTC0XhpfLir7swLQYcN4dYIl4A7DSGZLvXWwVG5wzeruSO6USAvFikMieX
	YO68TIBMYBYjWDzgpE1MeM2emC6sM4X5b25CCGHZMCmCc4uoTp8kTfRkjvkdQbs+54GveDCBtikrk
	dxunkILcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg9Pg-0003cR-3Y; Fri, 20 Nov 2020 16:37:32 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg9Pc-0003bI-7w
 for linux-mediatek@lists.infradead.org; Fri, 20 Nov 2020 16:37:29 +0000
Received: (qmail 620972 invoked by uid 1000); 20 Nov 2020 11:37:27 -0500
Date: Fri, 20 Nov 2020 11:37:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: musb: remove unused variable 'devctl'
Message-ID: <20201120163727.GC619708@rowland.harvard.edu>
References: <20201117082125.7619-1-min.guo@mediatek.com>
 <X7UKJtWtE0UZgqAQ@kroah.com> <1605854930.3995.8.camel@mhfsdcap03>
 <X7doKlP1k824LGGN@kroah.com> <1605858126.3995.14.camel@mhfsdcap03>
 <X7eAEaTN/fM3fkkp@kroah.com>
 <20201120161519.GA619708@rowland.harvard.edu>
 <X7fvrK4F2378+9Rl@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X7fvrK4F2378+9Rl@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_113728_369586_7785D72E 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 05:32:44PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 20, 2020 at 11:15:19AM -0500, Alan Stern wrote:
> > > Perhaps you might want to add a comment here so that people will not
> > > keep making this same mistake when they run auto-checkers on the
> > > codebase?
> > 
> > A better change would be
> > 
> > -			devctl = musb_readb(mbase, MUSB_DEVCTL);
> > +			(void) musb_readb(mbase, MUSB_DEVCTL);
> > 
> > and eliminate the unused variable.  Then there wouldn't be any compiler 
> > warning.
> 
> No need for the (void), the compiler shouldn't warn about that, right?

True, but it clearly indicates to a human reader that the value was 
intended to be read and thrown away.  Alternatively, the (void) cast 
could be left out and a comment added.

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
