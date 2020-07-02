Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5E8C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 07:37:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AAE20899
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 07:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZnOz5mMo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmcMFIrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AAE20899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lizkPHIEjZmhrZcaN/IJ3ZeES4B2ka5zFs9I0VZgE5o=; b=ZnOz5mMoWXJwO5yAPxsHevpX0
	+JaG1gsGLE8jVth/n7qM4YZXpEPIiK6a/rAO9oqR8/MKXHlRxAHJ7y5zN7qDPdgbOmMjrbGSnWXuz
	rlGe8X63PCdGhZ6iKidWMyh54B8CQNG+hZUWGQI+PqVu+/0e9+RPYxMBa3HdmZQi/Ybl8/0rczjor
	yNkxi7w8S+zJf0NcIBmA3aOyXUcgauwgzriMZeJ3AK30jmTCTU9t2U8VdCUdTIXVvf97MapIj/RKV
	h84EdZbakQfS/1fVJUT6oLZmJ/PZd/mCVy6/FrUxp+ppz6jDWbVDkJCop6uN3EIKs2cCPPWFLlCZ2
	fMtsIyrjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqtmZ-0008AL-AQ; Thu, 02 Jul 2020 07:37:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqtmW-00089g-Pw
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 07:37:17 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A27F2085B;
 Thu,  2 Jul 2020 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593675436;
 bh=vpifWVwgbjHSUaEegAAHzDiKupI4P46wI+RPjm/wU9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KmcMFIrPlH/DYGVA69kjk8PKCY/DCTSfxA7mi8F7SUmgwxhtcI3ae4CZwpCU359bq
 O48jck5Plf9ZR0KbrKdFvmTivRigbjS7x7dcIjocdZd0fcyNBPP6IoFm28o+ZJ2gwT
 rN71msrjI6cYKrnS0UT2QSDl1Lxr4H8miKM1euLk=
Date: Thu, 2 Jul 2020 09:37:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v2 0/1] Revert "serial: 8250: Fix max baud limit in
 generic 8250 port"
Message-ID: <20200702073720.GE1073011@kroah.com>
References: <20200701211337.3027448-1-danielwinkler@google.com>
 <20200701223713.gavale4aramu3xnb@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701223713.gavale4aramu3xnb@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_033716_936940_D151C0DC 
X-CRM114-Status: GOOD (  23.44  )
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
Cc: chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
 linux-serial@vger.kernel.org, Daniel Winkler <danielwinkler@google.com>,
 abhishekpandit@chromium.org, Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2020 at 01:37:13AM +0300, Serge Semin wrote:
> On Wed, Jul 01, 2020 at 02:13:36PM -0700, Daniel Winkler wrote:
> > 
> > This change regresses the QCA6174A-3 bluetooth chip, preventing
> > firmware from being properly loaded. Without this change, the
> > chip works as intended.
> > 
> > The device is the Kukui Chromebook using the Mediatek chipset
> > and the 8250_mtk uart. Initial controller baudrate is 115200
> > and operating speed is 3000000. Our entire suite of bluetooth
> > tests now fail on this platform due to an apparent failure to
> > sync its firmware on initialization.
> 
> Ok. It's mediatek 8250 driver, which is responsible for the failure.
> Then we'll have two options:
> 
> 1) Add a new capability like UART_CAP_NO16DIV and take it into account
>    in the serial8250_get_baud_rate() method.
>  
> I don't have a documentation for the Mediatek UART port, but it seems to me
> that that controller calculates the baud rate differently from the standard
> 8250 port. A standard 8250 port does that by the next formulae:
>   baud = uartclk / (16 * divisor).
> While it seems to me that the Mediatek port uses the formulae like:
>   baud = uartclk / divisor. (Please, correct me if I'm wrong)
> If so, then we could introduce a new capability like UART_CAP_NO16DIV. The
> 8250_mtk driver will add it to the 8250-port capabilities field. The
> serial8250_get_baud_rate() method should be altered in a way so one would check
> whether the UART_CAP_NO16DIV flag is set and if it is then the
> uart_get_baud_rate() function will be called without uartclk normalized by the
> factor of 16.
> 
> 2) Manually call serial8250_do_set_divisor() in the custom set_termios()
>    callback.
> 
> Just add the uart_update_timeout() and serial8250_do_set_divisor() methods
> invocation into the mtk8250_set_termios() function, which the original commit
> 81bb549fdf14 ("serial: 8250_mtk: support big baud rate") author should have
> done in the first place.

Sounds like a sane fix, thanks for looking into this.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
