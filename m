Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB25AC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 23:12:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90281206BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 23:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CeKrRiUj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bTm89+YH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90281206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJb8xB8Lp4RxkJ7sruAGtUIuy8GNQFhDXAgY6sOfNBY=; b=CeKrRiUjOX2HF1IpJuYu820qLS
	N25YgMPWjAc6Jg4ozrRagVYcO6+ocMMjBhrlkFqwFtIp6a0D3OcOSYcrtcRpcr0cbNkUB4Uxq11uH
	ETHBFhPk+lZ3khegLNPsowqOy7nFgUTc05FTDmbY+Tg8Gp9opJCHmWWxSokSocq/A6ClWD6BMTUBU
	vByrR6GkiF92WRfooapxbImaORJwdm+2NkrNWf2fU83WxTH10BNTuq5zv+TU3K+QoxROgWMwmJoKQ
	vojuPFDhNLuuY3RIpGFiAYE/rBBWF1/sxyMM8VA4wkf/HX4ZoINTd30XE9szybH6PqRBwH0ziFnbH
	1WpO9tWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jswko-0000LM-PW; Tue, 07 Jul 2020 23:11:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jswkm-0000Kn-9o; Tue, 07 Jul 2020 23:11:57 +0000
X-UUID: d1877a88407d4894acfa86636b0e6cb5-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ACgdKKQvvl0IN9nE7D17jMhl6fwZEjwiF6CEjA4GWAU=; 
 b=bTm89+YH/yA0MGK3uRqbZrmHjlEWmbOKexvBsF3na05LkKKvQP83Q/kX+xidtAz7nUxAnkJeKF483JRPR7NYMkGmB+SgxazQh+IyeoVdWpMf8wMgQ7i1iT8kIq/oF/1wJj42pWR8ng1Bou3s+WO2nFQIGEEjCDDc8UkxLgyDyyk=;
X-UUID: d1877a88407d4894acfa86636b0e6cb5-20200707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1880710242; Tue, 07 Jul 2020 15:11:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 16:11:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 07:11:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 07:11:19 +0800
From: <sean.wang@mediatek.com>
To: <gregkh@linuxfoundation.org>, <jslaby@suse.com>,
 <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
 <sr@denx.de>, <arnd@arndb.de>, <matthias.bgg@gmail.com>,
 <tthayer@opensource.altera.com>
Subject: [PATCH v5] tty: serial: don't do termios for BTIF
Date: Wed, 8 Jul 2020 07:11:22 +0800
Message-ID: <7c67171728cdcc4ccc10adfaea1a14bfbcf8375a.1594163304.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4F28F1CAC5E7592B35293C87473BAF934B244B4F5546B2CBC7BAF98B527E8F2A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_191156_570132_A85CB664 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Ryder
 Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Bluetooth Interface (BTIF) is designed dedicatedly for MediaTek SOC with
BT in order to be instead of the UART interface between BT module and Host
CPU, and not exported to user space to access.

As the UART design, BTIF will be an APB slave and can transmit or receive
data by MCU access, but doesn't provide termios function like baudrate and
flow control setup.

Even LCR on offset 0xC that is just a FAKELCR
a. If FAKELCR[7] is equaled to 1, RBR(0x00), THR(0x00), IER(0x04)
   will not be readable/writable.

b. If FAKELCR is equaled to 0xBF, RBR(0x00), THR(0x00), IER(0x04),
   IIR(0x08), and LSR(0x14) will not be readable/writable.

So adding a new capability 'UART_CAP_NTIO' for the unusual unsupported
case.

The bluetooth driver would use BTIF device as a serdev. So the termios
still function would be called in kernelspace from ttyport_open in
drivers/tty/serdev/serdev-ttyprt.c.

Fixes: 1c16ae65e250 ("serial: 8250: of: Add new port type for MediaTek BTIF controller on MT7622/23 SoC")
Cc: Steven Liu <steven.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

--
v1->v2:
no change on termios->c_cflag and refine commit message

v2->v3:
change the naming from NMOD to NTIO as TIO is a well established prefix
for termios IOCTLs.

v3->v4:
1. remove appropriate tag
2. add the explanation why the termios is required even when the connection
   isn't exported to userspace.

v4->v5:
Use up->port.quirks UPQ_IGNORE_TERMIOS instead.
---
 drivers/tty/serial/8250/8250_core.c | 3 +++
 drivers/tty/serial/8250/8250_port.c | 3 +++
 include/linux/serial_core.h         | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index fc118f649887..b00060c615c2 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -490,6 +490,9 @@ static void univ8250_rsa_support(struct uart_ops *ops)
 static inline void serial8250_apply_quirks(struct uart_8250_port *up)
 {
 	up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
+
+	if (up->port.type == PORT_MTK_BTIF)
+		up->port.quirks |= UPQ_IGNORE_TERMIOS;
 }
 
 static void __init serial8250_isa_init_ports(void)
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 1632f7d25acc..be380649fefb 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2640,6 +2640,9 @@ serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
 	unsigned long flags;
 	unsigned int baud, quot, frac = 0;
 
+	if (port->quirks & UPQ_IGNORE_TERMIOS)
+		return;
+
 	if (up->capabilities & UART_CAP_MINI) {
 		termios->c_cflag &= ~(CSTOPB | PARENB | PARODD | CMSPAR);
 		if ((termios->c_cflag & CSIZE) == CS5 ||
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 9fd550e7946a..c46aae374e0e 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -155,6 +155,7 @@ struct uart_port {
 
 	/* quirks must be updated while holding port mutex */
 #define UPQ_NO_TXEN_TEST	BIT(0)
+#define UPQ_IGNORE_TERMIOS	BIT(1)
 
 	unsigned int		read_status_mask;	/* driver specific */
 	unsigned int		ignore_status_mask;	/* driver specific */
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
