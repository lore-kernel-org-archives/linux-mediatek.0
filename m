Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE122C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 20:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F14420C09
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 20:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9R2to9t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YBER7Q2W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F14420C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cDSeusEErz4yyPRTh3lIRJClCFxa9tGvp4Zd5ZW0ySc=; b=a9R2to9tyiuois
	+11cngb1mEZxLHoghBiRUpVRRF9Q8p4I8M/UQcaYwzJrv3UDX/OgrzZEjKka+YFGrJVSP81aj8R9E
	ewvqMydBiDI85eZDb3bnD9fbBuzutWuOTPlpSJ3WgGWnfr3k17j/+LAG6WDq6SvL6Af9GjNb6Fk6o
	xN/lvswi4AManmclD2VWqKS/Eupad0jcLTF1jhc7cOBmjMymDTTCvDh50e9sxwMReXDNZdvmHhzjp
	Hcp6WJ6h5srgbUCpQ4c0is26dBnmsi8hSdgY0ymOeLk4U9mOKolgobJkmy8//+BrEMw3f2qUfYiUM
	TMh+g08vOfI61vpzq5MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmNKX-0001pX-2V; Fri, 19 Jun 2020 20:09:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmNKK-0001gR-I3; Fri, 19 Jun 2020 20:09:30 +0000
X-UUID: 712aac6958764fd99d30ded06fa6d129-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mQyV9oA90nw/l5PmfxypuRikaoz6DxZG8g7s7v+PD9k=; 
 b=YBER7Q2WRljruntiQ6zyStuFdkQtWZ7R6Tq0zW5RVVV5wSla9HrpOfeAWUZv668elKofn1ZgulLBHjDlUt+dtldpbWp4IwbXdWFolN03Qkp3BteheX+J6q7k2vn5WJOKtU1YjePZpTsckpRki5dbloIsyIAW+3XwZDqQ1ltiF5g=;
X-UUID: 712aac6958764fd99d30ded06fa6d129-20200619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1051897526; Fri, 19 Jun 2020 12:09:23 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 12:59:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Jun 2020 03:59:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 20 Jun 2020 03:59:11 +0800
From: <sean.wang@mediatek.com>
To: <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>, <jslaby@suse.com>,
 <andriy.shevchenko@linux.intel.com>, <robert.jarzmik@free.fr>,
 <arnd@arndb.de>, <p.zabel@pengutronix.de>, <joel@jms.id.au>,
 <david@lechnology.com>, <jan.kiszka@siemens.com>,
 <heikki.krogerus@linux.intel.com>, <hpeter@gmail.com>, <vigneshr@ti.com>,
 <matthias.bgg@gmail.com>, <tthayer@opensource.altera.com>
Subject: [PATCH v4] tty: serial: don't do termios for BTIF
Date: Sat, 20 Jun 2020 03:59:14 +0800
Message-ID: <78efa2b1e2599deff4d838b05b4054ec5ac2976a.1592595601.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: F0184A2B374C0FECDB916DDE74159AA926AA2C638F0BA363607752D2529A60792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_130928_604024_22B0B820 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Steven
 Liu <steven.liu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
---
 drivers/tty/serial/8250/8250.h      | 1 +
 drivers/tty/serial/8250/8250_port.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 52bb21205bb6..0d9d3bfe48af 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -82,6 +82,7 @@ struct serial8250_config {
 #define UART_CAP_MINI	(1 << 17)	/* Mini UART on BCM283X family lacks:
 					 * STOP PARITY EPAR SPAR WLEN5 WLEN6
 					 */
+#define UART_CAP_NTIO	(1 << 18)	/* UART doesn't do termios */
 
 #define UART_BUG_QUOT	(1 << 0)	/* UART has buggy quot LSB */
 #define UART_BUG_TXEN	(1 << 1)	/* UART has buggy TX IIR status */
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 1632f7d25acc..af54db877efe 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -286,7 +286,7 @@ static const struct serial8250_config uart_config[] = {
 		.tx_loadsz	= 16,
 		.fcr		= UART_FCR_ENABLE_FIFO |
 				  UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
-		.flags		= UART_CAP_FIFO,
+		.flags		= UART_CAP_FIFO | UART_CAP_NTIO,
 	},
 	[PORT_NPCM] = {
 		.name		= "Nuvoton 16550",
@@ -2640,6 +2640,9 @@ serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
 	unsigned long flags;
 	unsigned int baud, quot, frac = 0;
 
+	if (up->capabilities & UART_CAP_NTIO)
+		return;
+
 	if (up->capabilities & UART_CAP_MINI) {
 		termios->c_cflag &= ~(CSTOPB | PARENB | PARODD | CMSPAR);
 		if ((termios->c_cflag & CSIZE) == CS5 ||
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
