Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80366C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 15:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F0920671
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 15:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xln47b1C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F0920671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvzXAe7Zbv1sSd6oR5UAie5C3c/7OjKAJJ3sFJxTfYo=; b=Xln47b1CcIdPAP
	VOFacit09VVm62ZRjHnrNzs2v0u9tY2kI6IwynT7NxE+kwwIcuKcAgVOPU3QAlzZe+Dn0rCcbKyJm
	leOJAE2pfmogRINCbEVc6Nk1gmR6w+JiYTAwEmp/u/sfcZCzzdn4jfBgFRoHpNvW6b2LY9xI9VL1U
	q7BSmH+tsbcdcah5UVn3i0g8Y/WzM7/sMakjaweJSoeJLygTYMihWCarXsTAEjl3IShpRD0yYn2+s
	wA66S9FpH1d8nGIJJfkG6xw4wAiWbNFG7cxqlLinjQT9UuQYlLzF0CvPRAxwXDhjFwot1/OVgdbG1
	aDFJ10NgNyZU7+rrzC/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZc8M-0001dF-2B; Fri, 15 May 2020 15:20:22 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZc7w-0007TD-4w; Fri, 15 May 2020 15:19:57 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 534A98029EC9;
 Fri, 15 May 2020 15:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnymTfqmVuML; Fri, 15 May 2020 18:19:51 +0300 (MSK)
Date: Fri, 15 May 2020 18:19:48 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 4/4] serial: 8250_dw: Fix common clocks usage race
 condition
Message-ID: <20200515151948.264q2uktwv6xjgle@mobilestation>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-5-Sergey.Semin@baikalelectronics.ru>
 <20200515141046.GF1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515141046.GF1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_081956_550583_A3943897 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Paul Burton <paulburton@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Long Cheng <long.cheng@mediatek.com>, linux-mediatek@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-mips@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 05:10:46PM +0300, Andy Shevchenko wrote:
> On Thu, May 07, 2020 at 02:31:35AM +0300, Serge Semin wrote:
> > The race condition may happen if the UART reference clock is shared with
> > some other device (on Baikal-T1 SoC it's another DW UART port). In this
> > case if that device changes the clock rate while serial console is using
> > it the DW 8250 UART port might not only end up with an invalid uartclk
> > value saved, but may also experience a distorted output data since
> > baud-clock could have been changed. In order to fix this lets at least
> > try to adjust the 8250 port setting like UART clock rate in case if the
> > reference clock rate change is discovered. The driver will call the new
> > method to update 8250 UART port clock rate settings. It's done by means of
> > the clock event notifier registered at the port startup and unregistered
> > in the shutdown callback method.
> 
> I'm wondering if clock framework itself can provide such a notifier?
> 
> > Note 1. In order to avoid deadlocks we had to execute the UART port update
> > method in a dedicated deferred work. This is due to (in my opinion
> > redundant) the clock update implemented in the dw8250_set_termios()
> > method.
> 
> So, and how you propose to update the clock when ->set_termios() is called?

First of all If you are worried about the current implementation, please don't,
it still updates the clock in set_termios (please see the set_termios
code). The method hasn't changed much and does the updating the same way it did
before.

Secondly, 8250 driver should be using the same reference clock as it is
pre-defined by the platform with no change. The baud rate updates are supposed to
be performed by the divider embedded into the 8250 controller, otherwise the
divisor functionality is left completely unused. If a platform engineer needs to
speed the uart up, the ref clock rate can be tuned by for instance the
"assigned-clock-rates" property.

> 
> > Note 2. Before the ref clock is manually changed by the custom
> > set_termios() function we swap the port uartclk value with new rate
> > adjusted to be suitable for the requested baud. It is necessary in
> > order to effectively disable a functionality of the ref clock events
> > handler for the current UART port, since uartclk update will be done
> > a bit further in the generic serial8250_do_set_termios() function.
> 
> ...
> 
> > +	struct notifier_block	clk_notifier;
> > +	struct work_struct	clk_work;
> 
> Oh, this seems too much.
> Perhaps, the compatible based quirk with your initial approach is much better for time being.

It's already in 8250_dw, useful not for a single platform and won't hurt any
other one. So I'll leave it here and wait for the Greg feedback.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
