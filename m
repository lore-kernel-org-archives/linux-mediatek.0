Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34ACC47259
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 07:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A62BF20663
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 07:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/Rfi9PA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b6GeJ8UP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A62BF20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtUSScjHM7wtdVoxEW+m1VjcsOxdsaJAeekKufD3ZuU=; b=Y/Rfi9PA3Nbpsr
	cxkj6ouaOwB7IxI8gU9fQ9SjZy9wWdh21HpndzRRl2nvHVbs5AzyQhTxl6276+3CpqFOmdXq/P+Wj
	WB5dOJiZlFRs8ZSq2bLHJWkd5aYVjT09lBFXAstVwsm/nhH9+V/98WLTIf/GfIzK0bCTreZpJAsq4
	lQIlUE7jKgemklh5VyhXlE3tsFpvH/KKrIpi+HDW6Bv6Nd0/1YwqJ3AHeEVOG6kSNJrD7g0lQ8fgJ
	H01wmYIDIN+ZI0jEAunhsksMwPwAmoP1jOVZh/ipST0hCcvq1HF8PBaGDB7DiISQIto3LK7Moe9Rr
	PeCnekM6c53E1A/gR8ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWEP4-0002h2-6v; Wed, 06 May 2020 07:23:38 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWEP1-0002ek-S9
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 07:23:37 +0000
Received: by mail-pj1-x1044.google.com with SMTP id a7so432537pju.2
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 00:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fze5y+aKClh/oN5ITL+3asoB6Hf78k3jqX6stiIJKcY=;
 b=b6GeJ8UPMHmMtngVK6oP7jgFPERIM/MP+rQoEKWeDRP6IYT61AIk/DyPtbsELKkJjP
 NntpASpXHm/XVrfEFPd6iq0VNv4d7bhlHyBMQpbm7uq1Jg/VMi1K7cIBRrPNtMHAvDkt
 tB2YjES4xTYtAzvKwTUkasbONsz2/7ry000ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fze5y+aKClh/oN5ITL+3asoB6Hf78k3jqX6stiIJKcY=;
 b=ufFZGxZ2uzBr0xPtjzv90AvUssmIuxH1F/21Hu85ns/sr7P+JRZyzWAwNkqf9E66nQ
 +Ji4bDzYLGlaJgfelOHV3ef9AD/+DK0563fn1xrgRFQVjQa8BHwat05vqlqBclv4sOVj
 pRwxY5WO9cFuWfEYHr+zCmzS9MxKEr5EcAYAm345/+ZcEMEVzAkauyUqHWmYLF+2QY3y
 dU0WUnmJYITEpB8pazjix/COMC33AuRUNWD3FSVNj3KDIJHo6xXEnRXcwclt+SR7GAo6
 Rt+/tlNPRP/1DUVOnjW3UW2dBvLV2dc/13E0fTMueOAfXFEBBXLGu9rOUP7i1cThK2sQ
 Sy3Q==
X-Gm-Message-State: AGi0PuY0YvyKKJhYhdqq/XKj4dBxPS1M2Z0qVnBdlL/1tqouAShIY00p
 vPQ96q3rLEud8MD3jXGOjQHhJw==
X-Google-Smtp-Source: APiQypJEvMODLnMzIV3b0m4nrv11Ky4vgltOYbvUg4ZEskSuldeLgaEBh3RVHEyvggyqkyGztVJPAQ==
X-Received: by 2002:a17:90a:2949:: with SMTP id
 x9mr7656502pjf.33.1588749815268; 
 Wed, 06 May 2020 00:23:35 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:3db2:76bf:938b:be05])
 by smtp.gmail.com with ESMTPSA id o7sm948044pgs.35.2020.05.06.00.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 00:23:34 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: robh@kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
 long.cheng@mediatek.com, changqi.hu@mediatek.com
Subject: [PATCH 2/3] tty: serial_core: add wakeup_irq to support in-band wakeup
Date: Wed,  6 May 2020 15:23:13 +0800
Message-Id: <20200506072314.112409-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200506072314.112409-1-tientzu@chromium.org>
References: <20200506072314.112409-1-tientzu@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_002335_910012_040C484A 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Claire Chang <tientzu@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since some uart controllers may be off in S3, we won't be able to use
the normal in-band wakeup.

Take 8250_mtk.c as an example. The driver needs to allocate an edge
sensitive interrupt as the wakeup_irq and use an addtional pinctrl to
reconfigure Rx pin to normal GPIO in sleep state. Once host detects Rx
falling, an interrupt is triggered, and the system leaves sleep state.

Add the wakeup_irq logic in core to simplify and make the code more
generic. Also, we can align with the original wakeup behavior and
power/wakeup node.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/tty/serial/8250/8250_core.c | 1 +
 drivers/tty/serial/serial_core.c    | 8 +++++---
 include/linux/serial_core.h         | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 45d9117cab680..06214e9fdc8ff 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -1001,6 +1001,7 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
 		uart->port.membase      = up->port.membase;
 		uart->port.irq          = up->port.irq;
 		uart->port.irqflags     = up->port.irqflags;
+		uart->port.wakeup_irq	= up->port.wakeup_irq;
 		uart->port.uartclk      = up->port.uartclk;
 		uart->port.fifosize     = up->port.fifosize;
 		uart->port.regshift     = up->port.regshift;
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 66a5e2faf57ea..1796a33986613 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2165,12 +2165,13 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 	struct tty_port *port = &state->port;
 	struct device *tty_dev;
 	struct uart_match match = {uport, drv};
+	int irq = uport->wakeup_irq > 0 ? uport->wakeup_irq : uport->irq;
 
 	mutex_lock(&port->mutex);
 
 	tty_dev = device_find_child(uport->dev, &match, serial_match_port);
 	if (tty_dev && device_may_wakeup(tty_dev)) {
-		enable_irq_wake(uport->irq);
+		enable_irq_wake(irq);
 		put_device(tty_dev);
 		mutex_unlock(&port->mutex);
 		return 0;
@@ -2228,13 +2229,14 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 	struct device *tty_dev;
 	struct uart_match match = {uport, drv};
 	struct ktermios termios;
+	int irq = uport->wakeup_irq > 0 ? uport->wakeup_irq : uport->irq;
 
 	mutex_lock(&port->mutex);
 
 	tty_dev = device_find_child(uport->dev, &match, serial_match_port);
 	if (!uport->suspended && device_may_wakeup(tty_dev)) {
-		if (irqd_is_wakeup_set(irq_get_irq_data((uport->irq))))
-			disable_irq_wake(uport->irq);
+		if (irqd_is_wakeup_set(irq_get_irq_data((irq))))
+			disable_irq_wake(irq);
 		put_device(tty_dev);
 		mutex_unlock(&port->mutex);
 		return 0;
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 92f5eba860528..5764687b90a36 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -136,6 +136,7 @@ struct uart_port {
 						  struct serial_iso7816 *iso7816);
 	unsigned int		irq;			/* irq number */
 	unsigned long		irqflags;		/* irq flags  */
+	unsigned int		wakeup_irq;		/* wakeup irq number */
 	unsigned int		uartclk;		/* base uart clock */
 	unsigned int		fifosize;		/* tx fifo size */
 	unsigned char		x_char;			/* xon/xoff char */
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
