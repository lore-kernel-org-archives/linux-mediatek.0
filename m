Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6897BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvBL0c3Vj9yCkzGeSIJ6S7cJM3ZewKXY+orXyyM3LhA=; b=vNnZX+94oR280U
	wX+FxKslIao8pi9djN8fDs9MXd444bCjuH7eRxryUMKqkK2rfffbIKZo0clShWHXG9xWAMLCXMv2n
	h9qnPpvByNgNqYoEbD/JLah4gbfhvQr9jxKi5NzmSvaiSO24T++JqGro0BHbI+7Wmj3z7D5HF+Fb3
	jL6Ckg2D6sDI1lKvDr9HkzoyOcA7cZRitdLaY00SLQANIIs0lfHir1s0QfNF41cJtrgsUTa6SVHWD
	GmHctsoJYH6dkLGqdpoF5TIkI6IMNVd6bJRoE5MXmvMBqAxJCysk/2TT4d+AdZYYA5Tz1visjQvu/
	r9R4yrV+DsDebehTIDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myIAh-00Bvgc-9G; Fri, 17 Dec 2021 18:41:35 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myHiH-00Bi8I-A9; Fri, 17 Dec 2021 18:12:14 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="237347663"
X-IronPort-AV: E=Sophos;i="5.88,214,1635231600"; d="scan'208";a="237347663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 10:10:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,214,1635231600"; d="scan'208";a="605965790"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 10:10:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1myHfd-007YU0-SR; Fri, 17 Dec 2021 20:09:29 +0200
Date: Fri, 17 Dec 2021 20:09:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] serial: 8520_mtk: Prepare for
 platform_get_irq_optional() changes
Message-ID: <YbzSWas9OfeZzY3o@smile.fi.intel.com>
References: <20211217151034.62046-1-andriy.shevchenko@linux.intel.com>
 <YbzA3y5jp5K5zL/+@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbzA3y5jp5K5zL/+@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_101213_470400_937B9DA7 
X-CRM114-Status: GOOD (  21.14  )
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

On Fri, Dec 17, 2021 at 05:54:55PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 17, 2021 at 05:10:34PM +0200, Andy Shevchenko wrote:
> > The platform_get_irq_optional() is going to be changed in a way
> > that the result of it:
> >    = 0 means no IRQ is provided
> >    < 0 means the error which needs to be propagated to the upper layers
> >    > 0 valid vIRQ is allocated
> 
> What about 0 being a valid irq?

For this driver it can't be possible. The driver is instantiated via DT only
and OF APIs never return 0 for IRQ. If it's the case, it's a regression in the
OF APIs.

I can elaborate in the commit message.

> > In this case, drop check for 0. Note, the 0 is not valid vIRQ and
> > platform_get_irq_optional() issues a big WARN() in such case,
> 
> But it still is a valid irq, so why did you just break things?  Yes, a
> warning will happen, but the driver and platform will still work.

In general yes, but not in this case. See above.

...

> > -	if (irq >= 0)
> > +	if (irq > 0)
> >  		disable_irq_wake(irq);
> 
> Why change this now?  What does this solve at this point in time?

As explained in the commit message, it's a preparation patch to fix the logic
behind platform_get_irq_optional().

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
