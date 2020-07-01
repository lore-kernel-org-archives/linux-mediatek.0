Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A962C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 22:37:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587392082F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 22:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVnCvBQ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587392082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L+l2zgYO+3JIlplVNO965zoUSs4GQj4U3a8UzzW02vA=; b=gVnCvBQ2idTHGwnxpOi64hZWX
	HoJk1wkwmzXnraSc8vT5DrMTqxqOM210V8UYxVs0IPCHbrJl6bbrdugqp95peDKxaJ8zM1ApBrX/D
	d04/yaYPoToUZPAy7cvck3HIgds0o+M2+hPZaoSEOhnPX/D7ma4J022ODSkd768DljXfdcX0y1iPA
	TmDHjW5Xdsmtw3PwJoWtMxqpbJClUJQZwR4WpJ7GivBkNmMoqTC9rhDGVX917mLp92PFNxLKMP0n3
	RxpOxH4NfsptO/THN+BG1v5TBiMD/uZ8jw+b4aUyeV4cJ3IbAGLCkiwd/lhzJemqA71CvxDY+Pq+G
	mJ+FzxDRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqlM7-0005Yo-1y; Wed, 01 Jul 2020 22:37:27 +0000
Received: from mx.baikalelectronics.com ([94.125.187.42]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqlM3-0005Y3-SA
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 22:37:25 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 1F473803202A;
 Wed,  1 Jul 2020 22:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHd7Fb6uuWwY; Thu,  2 Jul 2020 01:37:16 +0300 (MSK)
Date: Thu, 2 Jul 2020 01:37:13 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Daniel Winkler <danielwinkler@google.com>
Subject: Re: [PATCH v2 0/1] Revert "serial: 8250: Fix max baud limit in
 generic 8250 port"
Message-ID: <20200701223713.gavale4aramu3xnb@mobilestation>
References: <20200701211337.3027448-1-danielwinkler@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701211337.3027448-1-danielwinkler@google.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_183724_113695_EEF4A543 
X-CRM114-Status: GOOD (  16.60  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 abhishekpandit@chromium.org, Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 01, 2020 at 02:13:36PM -0700, Daniel Winkler wrote:
> 
> This change regresses the QCA6174A-3 bluetooth chip, preventing
> firmware from being properly loaded. Without this change, the
> chip works as intended.
> 
> The device is the Kukui Chromebook using the Mediatek chipset
> and the 8250_mtk uart. Initial controller baudrate is 115200
> and operating speed is 3000000. Our entire suite of bluetooth
> tests now fail on this platform due to an apparent failure to
> sync its firmware on initialization.

Ok. It's mediatek 8250 driver, which is responsible for the failure.
Then we'll have two options:

1) Add a new capability like UART_CAP_NO16DIV and take it into account
   in the serial8250_get_baud_rate() method.
 
I don't have a documentation for the Mediatek UART port, but it seems to me
that that controller calculates the baud rate differently from the standard
8250 port. A standard 8250 port does that by the next formulae:
  baud = uartclk / (16 * divisor).
While it seems to me that the Mediatek port uses the formulae like:
  baud = uartclk / divisor. (Please, correct me if I'm wrong)
If so, then we could introduce a new capability like UART_CAP_NO16DIV. The
8250_mtk driver will add it to the 8250-port capabilities field. The
serial8250_get_baud_rate() method should be altered in a way so one would check
whether the UART_CAP_NO16DIV flag is set and if it is then the
uart_get_baud_rate() function will be called without uartclk normalized by the
factor of 16.

2) Manually call serial8250_do_set_divisor() in the custom set_termios()
   callback.

Just add the uart_update_timeout() and serial8250_do_set_divisor() methods
invocation into the mtk8250_set_termios() function, which the original commit
81bb549fdf14 ("serial: 8250_mtk: support big baud rate") author should have
done in the first place.

-Sergey

> 
> The driver is in the cros tree at drivers/bluetooth/hci_qca.c
> and uses the serdev interface. Specifically, this is the
> QCA_ROME chipset.
> 
> 
> Daniel Winkler (1):
>   Revert "serial: 8250: Fix max baud limit in generic 8250 port"
> 
>  drivers/tty/serial/8250/8250_port.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> -- 
> 2.27.0.212.ge8ba1cc988-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
