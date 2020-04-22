Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F0DC55185
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 18:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50FCB2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 18:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j7Rq2Xe0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QWRiLzip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50FCB2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+yerc2iULG0Zd3SzNeAQEhDG7zEbsx9oKGbuU3ZMtHo=; b=j7Rq2Xe0Jd96+8
	Sqq05g/BI9c9C0OHUJrps769CU9RyA16mufwfTij2MTVM5pyw+76zkC/XyZN2WC4E5PDHX7qypgr7
	NHS+9874qV3Kmj0cdtva33oU6o8r3wOCK/Ny1n1gHvGWOmVhDLeX4xKRvywbrn1ftVYGEGOa2GqLP
	0eBL+fT7lV7POv2tSmK2oQ7841Br+jJYPR6rWBEzoAvEYZ5EVKJQLZtgCQ7/lAsiqF69rVVh7sXoS
	O4EsnIoA2ZTgxz1v8DapAA0KCjEgs6zf4WoeHqTFuYHnT+0d6quo03WJ9oWsS+d8BVaEDo/RyhUQ6
	qpJLjXve9MPw6DvLzRQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRJha-0008NW-7W; Wed, 22 Apr 2020 18:02:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRJhX-0008Km-Q6; Wed, 22 Apr 2020 18:02:25 +0000
X-UUID: 6c98df8fdb7c440ab0b1c0199661244b-20200422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Wd/MOGLi3v8IcIouicrcERfGp8lHo02kJWYXWlv+S1A=; 
 b=QWRiLzipAoLjhsTOI/5Zdc5Pr6jnvLdu0murOZ8eSYQzZFdk4RewKgOwZ16sfh0i6YDrgkyJKaziX5CsijX0RQx3KLcnKcWL0yCrgfxfydfLl7T2myS481mccOaveytrkbhOFAjN6b0yEK7JBcw6by6mQQjYwoIggQythrBRhuk=;
X-UUID: 6c98df8fdb7c440ab0b1c0199661244b-20200422
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 875353991; Wed, 22 Apr 2020 10:02:03 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Apr 2020 11:02:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Apr 2020 02:02:06 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Apr 2020 02:02:05 +0800
From: <sean.wang@mediatek.com>
To: <gregkh@linuxfoundation.org>, <jslaby@suse.com>,
 <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
 <sr@denx.de>, <arnd@arndb.de>, <matthias.bgg@gmail.com>,
 <tthayer@opensource.altera.com>
Subject: [PATCH v3] tty: serial: don't do termios for BTIF
Date: Thu, 23 Apr 2020 02:02:08 +0800
Message-ID: <cc41ea10be9ab96568f0371784e3b9f8d9f434b9.1587577548.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_110223_879480_B7A1B4FA 
X-CRM114-Status: GOOD (  11.41  )
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

Fixes: 1c16ae65e250 ("serial: 8250: of: Add new port type for MediaTek BTIF controller on MT7622/23 SoC")
Cc: Steven Liu <steven.liu@mediatek.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

--
v1->v2:
no change on termios->c_cflag and refine commit message

v2->v3:
change the naming from NMOD to NTIO as TIO is a well established prefix
for termios IOCTLs.
---
 drivers/tty/serial/8250/8250.h      | 1 +
 drivers/tty/serial/8250/8250_port.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 33ad9d6de532..234d8db470c0 100644
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
index 0325f2e53b74..abc974b4113f 100644
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
@@ -2544,6 +2544,9 @@ serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
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
