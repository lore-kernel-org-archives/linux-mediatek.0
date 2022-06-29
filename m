Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FiHfHhuJxRbKO2ZEqOegUqQO3i26pqdBinQstYyXhE=; b=fO4x9LI8lrcOZnuX3RzMu55JGk
	GhXPVHKTGhP8KIdjDJoa1/eVQ2szd/5moTnQ7VxeEDjNT+7qqs20sylR5aKra96BBwqPl6SVAGPD/
	U3kzQaGQsocVR2flipDjsYYw5tUeEloghlKSavpVRfVSrDWdiz1ySwMXgY17i1fYUFtxxopPdOhr5
	BBRMzmSka/14a8GbfUv26FCLcEczDGTFSMkdr51bWOTn9E8zgOoqDR2KGNRWet+YakC4XJZ3ZVyly
	NanOPml9RwzcK94+WI7VQrkLusNQFG1XC/V/hq6Yozl87fmqb8H74vUhgTwDM0v4F/oBLwkAceS9L
	qlr6TteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UqK-00AzlY-EL; Wed, 29 Jun 2022 10:22:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UqH-00AzkL-UM
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 10:22:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E590B60E2C;
	Wed, 29 Jun 2022 10:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DA1C34114;
	Wed, 29 Jun 2022 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656498160;
	bh=Nhr8coyi2sWavxuJtuttlu+qQbvUb4AavW/PlugHUZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIY3TeLb3Xh/sualnXPLQwqAz1ws2rDVJ9PokTnaVyO/61b/UX6GZqnSmQtUNWtL3
	 v3qYzY+RzT8K7SGobkFhFh4A08kK/6YKqAkCjLWrP4fNlnx2rW3y8NKSugEv6/yixG
	 HszVtn7gtOL1RIoCDwrpBtuqk9pDTGSoKTv4XL3U=
Date: Wed, 29 Jun 2022 12:22:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: support USB 3.2 function remote wake
Message-ID: <Yrwn6Y7OMdPtN+g/@kroah.com>
References: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_032242_072460_19226B23 
X-CRM114-Status: GOOD (  15.62  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 29, 2022 at 05:02:54PM +0800, Chunfeng Yun wrote:
> Hi,
> 
> I plan to support function remote wakeup on our usb3 device controller
> driver.

Is this based on dwc3 or some new silicon?

> A function may signal that it wants to exit from Function Suspend by
> sending a Function Wake Notification to the host, and the notification
> need knows the first interface number in this function.
> But the current gadget ops:
>     int (*wakeup)(struct usb_gadget *);
> does not provide information about interface number;

Why would the interface matter as you need to do this for the whole
device, not just one interface, right?

> There seems to be two ways:
> 1. add a new parameter as below,
>     int (*wakeup)(struct usb_gadget *, u8 intf);
> 2. add a new ops, such as,
>     int (*function_wakeup)(struct usb_gadget *, u8 intf);
> 
> Do you have any suggestions?

Look at what the existing ones do, I do not think you have different
suspend levels per USB interface, but rather the whole device.  Try it
and see.

thanks,

greg k-h

