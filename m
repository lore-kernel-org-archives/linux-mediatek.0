Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB7AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tqKiheoiS4yq5jJKO080DEclkNiRCw8ceYhBPpYSW10=; b=jvKpuXAwZTrzfDF2xFyEosLhTQ
	T4nQy54gk59dn0ZMMzZ+e2nz7/qqsP4XVb9QpfukBwBEmO9eWnbjqU5cKiDlgTd3DASNyqVAO7Qeu
	DDb+AMCdfASLgqylJfCUL1FDdymsCIwfKDRSy6b7TWKPy8IjCWWt86a61JHn89bWcvpaDPIvBYczY
	PH2IEyEy4jNsnvDvUNziBSUcjVKzFxamNJoz0o9JtG3IFOEAzxY/Lc4Xlc99dQx/HFn3BdwxeG0nr
	rOtd2QAmX3K1I43Kzh6CDfcjUbk1xspA92Up+j1pG8FiYtCQvJq2OnBoRI9YlXj7dSxIM93DVvDSI
	B7Jc66KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27Mh-00G9RP-0t;
	Thu, 25 May 2023 09:34:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q27Md-00G9Q2-35;
	Thu, 25 May 2023 09:34:33 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685007268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tqKiheoiS4yq5jJKO080DEclkNiRCw8ceYhBPpYSW10=;
	b=re+Hu0Q6naTRkLuq5eU7bi7VBahJ3jr8aBUqXzdjEscO6fFefxJ4TqV6CgzTNijC2fRXEj
	nu/Rl1HplALQsfWCrafjfKln2JD4fEY/y4CGiBpm+F/utJGJna0zH65rWpmFIigo1OXnQ2
	JQOwRBFtYZ/Cr/UstwBmiZI5kldN8MsDZ+z2CLqSj4/zsFpK1nFj+ND1YuHsq6f0BVYhVJ
	0n0mY+Ob923slWcssK+rAXjXd+jb9VnRVIF4La9H/mq8kfbp++g2EkNcoBOP2b3btKuEIc
	0b6z9UrYO9ES6eAX8JQytY6NFHakxcLgBMMlOVqeDuclJyZOtbsuL46JyufeoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685007268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tqKiheoiS4yq5jJKO080DEclkNiRCw8ceYhBPpYSW10=;
	b=r4IBGzHnpEiWatgryztcx7z8+JEUnFfYdoY3NU/fQz+ApYAmVt2J4BJIgkGCYHlUDFC5l5
	NYrEmYigRZtQ8iBA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Mladek <pmladek@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Matthew Howell <matthew.howell@sealevel.com>,
	Tony Lindgren <tony@atomide.com>,
	Lukas Wunner <lukas@wunner.de>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-serial@vger.kernel.org,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH tty v1 0/8] synchronize UART_IER access against console write
Date: Thu, 25 May 2023 11:37:51 +0206
Message-Id: <20230525093159.223817-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_023432_154528_29451EF4 
X-CRM114-Status: GOOD (  15.74  )
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

Hi,

In preparation for making the 8250 serial driver the first driver to
support the upcoming atomic consoles [0], its console write()
callback (serial8250_console_write) was evaluated. For this callback
of the 8250 driver there are two critical writes to the UART_IER
register: once to disable all interrupts before transmitting a line
of text, and again after transmit to re-enable the previously enabled
interrupts. These two writes are performed under a single
synchronized section protected by the port lock.

I then checked all other access to UART_IER in the 8250 driver to see
if they always occurred under the port lock. If not, it would be
possible that the console write() callback could overwrite or restore
incorrect values to UART_IER. This is illustrated in the commit
message of the first patch.

Indeed several call sites were discovered where UART_IER is accessed
without the port lock. This series adds the missing locking in order
to ensure UART_IER access is always synchronized against the console
write() callback.

For call sites where UART_IER access was already performed under the
port lock, this series adds code comments and (when appropriate)
lockdep notation to help catch any future issues that may creep in.

Note that some of the new usage of port lock is not strictly
necessary, because (for example) the console is disabled before it
is suspended. However, these are not hot paths and by taking the port
lock it simplifies the synchronization semantics for UART_IER to
allow general lockdep usage.

Also note that none of these patches have been tagged for stable. The
possible stable candidates do include Fixes tags. But since the fixes
are not based on real-world reports, it probably is not necessary to
backport them.

John Ogness

[0] https://lore.kernel.org/lkml/20230302195618.156940-1-john.ogness@linutronix.de

John Ogness (8):
  serial: 8250: lock port in startup() callbacks
  serial: core: lock port for stop_rx() in uart_suspend_port()
  serial: 8250: lock port for stop_rx() in omap8250_irq()
  serial: core: lock port for start_rx() in uart_resume_port()
  serial: 8250: lock port for rx_dma() callback
  serial: 8250: lock port for omap8250_restore_regs()
  serial: 8250: lock port for UART_IER access in omap8250_irq()
  serial: 8250: synchronize and annotate UART_IER access

 drivers/tty/serial/8250/8250.h              |  6 ++
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  3 +
 drivers/tty/serial/8250/8250_bcm7271.c      |  4 ++
 drivers/tty/serial/8250/8250_exar.c         |  4 ++
 drivers/tty/serial/8250/8250_mtk.c          |  9 +++
 drivers/tty/serial/8250/8250_omap.c         | 41 +++++++++++-
 drivers/tty/serial/8250/8250_port.c         | 71 ++++++++++++++++++++-
 drivers/tty/serial/serial_core.c            | 10 ++-
 8 files changed, 141 insertions(+), 7 deletions(-)


base-commit: d5b3d02d0b107345f2a6ecb5b06f98356f5c97ab
-- 
2.30.2


