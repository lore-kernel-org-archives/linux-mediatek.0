Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69115C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 12:41:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 340992242C
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 12:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="faSFf8xk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 340992242C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PuVhCs/TswNlfiRBm0LqPotgzZK/4fI9e0cje+AuYR4=; b=faSFf8xkknnr+7Xuca6x6wPTtH
	IJ11yO1Miai2oF2Ra0N0avTb4WVLbstEvY9x1RdP7Ji6Pg88A29mSYZWnbl/o6sDBEySX0scoTDBq
	3EALsJDd+HE3wR4YxL7fiRqeJ/icrPopJfXhw00dDxt5SJETpdGan3SA1p7Mq8EM9yy6VaJfAY27Y
	ss2XeTGlwnlks9oCOtK96nzliPPsbLlnkDv9G+TX+oKQLcuZu5mKQyXmeBAM+fQ+JtFIZA0ju4Pkp
	8gIpByQt1AW71lNvwA4Zjf0tNM8TsdhKAINWI6YUdkYrLDOCBg5aK+oqSS5LnfgXs8tq5Qx8dtaw+
	eDWO7wMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvKFf-00040d-5b; Tue, 14 Jul 2020 12:41:39 +0000
Received: from ns2.baikalelectronics.ru ([94.125.187.42]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvKFQ-0003qb-52; Tue, 14 Jul 2020 12:41:25 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id F1F208030809;
 Tue, 14 Jul 2020 12:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvIaP-V6CogS; Tue, 14 Jul 2020 15:41:18 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] serial: 8250_mtk: Fix high-speed baud rates clamping
Date: Tue, 14 Jul 2020 15:41:12 +0300
Message-ID: <20200714124113.20918-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_084124_638896_33E2C9EE 
X-CRM114-Status: GOOD (  15.10  )
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
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
 linux-serial@vger.kernel.org, Daniel Winkler <danielwinkler@google.com>,
 abhishekpandit@chromium.org, Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250
port") fixed limits of a baud rate setting for a generic 8250 port.
In other words since that commit the baud rate has been permitted to be
within [uartclk / 16 / UART_DIV_MAX; uartclk / 16], which is absolutely
normal for a standard 8250 UART port. But there are custom 8250 ports,
which provide extended baud rate limits. In particular the Mediatek 8250
port can work with baud rates up to "uartclk" speed.

Normally that and any other peculiarity is supposed to be handled in a
custom set_termios() callback implemented in the vendor-specific
8250-port glue-driver. Currently that is how it's done for the most of
the vendor-specific 8250 ports, but for some reason for Mediatek a
solution has been spread out to both the glue-driver and to the generic
8250-port code. Due to that a bug has been introduced, which permitted the
extended baud rate limit for all even for standard 8250-ports. The bug
has been fixed by the commit 7b668c064ec3 ("serial: 8250: Fix max baud
limit in generic 8250 port") by narrowing the baud rates limit back down to
the normal bounds. Unfortunately by doing so we also broke the
Mediatek-specific extended bauds feature.

A fix of the problem described above is twofold. First since we can't get
back the extended baud rate limits feature to the generic set_termios()
function and that method supports only a standard baud rates range, the
requested baud rate must be locally stored before calling it and then
restored back to the new termios structure after the generic set_termios()
finished its magic business. By doing so we still use the
serial8250_do_set_termios() method to set the LCR/MCR/FCR/etc. registers,
while the extended baud rate setting procedure will be performed later in
the custom Mediatek-specific set_termios() callback. Second since a true
baud rate is now fully calculated in the custom set_termios() method we
need to locally update the port timeout by calling the
uart_update_timeout() function. After the fixes described above are
implemented in the 8250_mtk.c driver, the Mediatek 8250-port should
get back to normally working with extended baud rates.

Link: https://lore.kernel.org/linux-serial/20200701211337.3027448-1-danielwinkler@google.com

Fixes: 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250 port")
Reported-by: Daniel Winkler <danielwinkler@google.com>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Folks, sorry for a delay with the problem fix. A solution is turned out to
be a bit more complicated than I originally thought in my comment to the
Daniel revert-patch.

Please also note, that I don't have a Mediatek hardware to test the
solution suggested in the patch. The code is written as on so called
the tip of the pen after digging into the 8250_mtk.c and 8250_port.c
drivers code. So please Daniel or someone with Mediatek 8250-port
available on a board test this patch first and report about the results in
reply to this emailing thread. After that, if your conclusion is positive
and there is no objection against the solution design the patch can be
merged in.

Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Daniel Winkler <danielwinkler@google.com>
Cc: Aaron Sierra <asierra@xes-inc.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-serial@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: BlueZ <linux-bluetooth@vger.kernel.org>
Cc: chromeos-bluetooth-upstreaming <chromeos-bluetooth-upstreaming@chromium.org>
Cc: abhishekpandit@chromium.org
Cc: stable@vger.kernel.org
---
 drivers/tty/serial/8250/8250_mtk.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index f839380c2f4c..98b8a3e30733 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -306,8 +306,21 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
 	}
 #endif
 
+	/*
+	 * Store the requested baud rate before calling the generic 8250
+	 * set_termios method. Standard 8250 port expects bauds to be
+	 * no higher than (uartclk / 16) so the baud will be clamped if it
+	 * gets out of that bound. Mediatek 8250 port supports speed
+	 * higher than that, therefore we'll get original baud rate back
+	 * after calling the generic set_termios method and recalculate
+	 * the speed later in this method.
+	 */
+	baud = tty_termios_baud_rate(termios);
+
 	serial8250_do_set_termios(port, termios, old);
 
+	tty_termios_encode_baud_rate(termios, baud, baud);
+
 	/*
 	 * Mediatek UARTs use an extra highspeed register (MTK_UART_HIGHS)
 	 *
@@ -339,6 +352,11 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
 	 */
 	spin_lock_irqsave(&port->lock, flags);
 
+	/*
+	 * Update the per-port timeout.
+	 */
+	uart_update_timeout(port, termios->c_cflag, baud);
+
 	/* set DLAB we have cval saved in up->lcr from the call to the core */
 	serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);
 	serial_dl_write(up, quot);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
