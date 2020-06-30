Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE7AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 23:42:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E91206CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 23:42:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yD1YgPIH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="A08aIEHF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E91206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6inSlL6DhmVTNPz0tjzSmwUMZNfbz6UpdsW807ctTQ=; b=yD1YgPIHew+G7VBeQnQdQlQzED
	miTIIc9Ul6SJjXz9WOmo1rF5KaJRpayTuiHFEoeM9pVC5CIaXTRxcaFw8sGILwI04y5SiNqi79gjX
	F8kVXPETSXkczd5dQq6CpLsnwO5sEvCIpe4wV556OAF42c+9tYoOt78gAFFbiRkxp4Fer3orR9JZa
	gepMMZaAXBNHSEhuBN84PKAiDwLqhhuyQBYFv1bBZX1iJEVcXM1cVYxGgmaA/V56z0O6usqJabMWM
	CoUOecjmfRVGqVU5R6nxEGMJUPOWeGbRovCrhi/1/rk8jQnYDMKjWJTX1loq0/uS+SU9lEy1SK2oP
	7BVVb2qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqPtV-0002kd-9m; Tue, 30 Jun 2020 23:42:29 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqPtS-0002k5-PG
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 23:42:27 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id e192so24254078ybf.17
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 16:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=n7raTtIxzIsyGs4VWsPeosbmDVfxOPL6Kt3Xxdq+NzQ=;
 b=A08aIEHFxec2io4UGF3QU20z0l2BqR3XRZdtO0deY3xpDvUVhgUsaEA0fEJq8xLVv1
 8iCEpYwHEW+DpYTAYAhmywuVfaUUvalvMif/YEaUBGSUyzVMqL63Rsp0U5Ru387tHPZ+
 /fUOjy+s+z1U8vdgIPpCtI/0xDh2YjITOMhhvLn43fEsd8+265yQGgrr2glqwnWDdJ8K
 uz6cuejZtMwVxmLDE78AoZpJAyRmOBqX3S9faTinh0d0+P8tC+NoQk3w7V4yXR3zn5pI
 dR94lL+K0Kfj/bjLrk6DNrWqlH2Zk40NlXWbGZtj95aLheVuSpxG3LAHfny/GIJwuRr3
 YTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=n7raTtIxzIsyGs4VWsPeosbmDVfxOPL6Kt3Xxdq+NzQ=;
 b=cLlZFWoFMqds3dshLPKH8Q32jeK2YE5gTRHHixjSIa1eblhQaDQsH9vMWMjH7sXctE
 HZCQVOIC2sZReq++hk7Emv08o1c4IdXN60OE5t5xk2zTkni8TWJxQ9qKXANpLYfuxrTU
 d+epkOUyONIEpYB+zMuzYoKvqNX8SH87AAZ3zTBxQxCbPTGr/7m2vGSBXDN9TUDuJwFp
 Gp2lpIXj7JpkFgVGKrUx+WU+w2yFKAaqjeJUxtxgRJ+YcGTNpYz+V6CeE8617+o4t2gM
 zLpjygVvFq3e2v32cUsTNeISPudOTStNxq5xHCbY/46y0yT9irNr8aEr5MkAr06PDyF5
 sm/g==
X-Gm-Message-State: AOAM5310l3Ke5d33iFIgrqloxXSP/Yh5lDCvXNRWwFTIDY8xSn7HnK4f
 WdqI1w65aF17QypXEaoI+2to3aYk/eEJ9tv+5hbu
X-Google-Smtp-Source: ABdhPJywusfTFjpLcjnVuDSLKVbrHofdt3NFwsfza8+5TL1nTp3jEw6krmAW8VgpGWoTnARjWoermlh95MMUneiy1oeH
X-Received: by 2002:a25:5d04:: with SMTP id r4mr35391905ybb.290.1593560542263; 
 Tue, 30 Jun 2020 16:42:22 -0700 (PDT)
Date: Tue, 30 Jun 2020 16:42:11 -0700
Message-Id: <20200630164204.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] Revert "serial: 8250: Fix max baud limit in generic 8250 port"
From: Daniel Winkler <danielwinkler@google.com>
To: linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_194226_856558_4ECB0455 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Winkler <danielwinkler@google.com>, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Jiri Slaby <jslaby@suse.com>,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 0eeaf62981ecc79e8395ca8caa1570eaf3a12257.

The change regresses the QCA6174A-3 bluetooth chip, preventing
firmware from being properly loaded. We have verified that without
this patch, the chip works as intended.

Signed-off-by: Daniel Winkler <danielwinkler@google.com>
---

 drivers/tty/serial/8250/8250_port.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 1632f7d25acca..e057c65ac1580 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2618,8 +2618,6 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
 					     struct ktermios *termios,
 					     struct ktermios *old)
 {
-	unsigned int tolerance = port->uartclk / 100;
-
 	/*
 	 * Ask the core to calculate the divisor for us.
 	 * Allow 1% tolerance at the upper limit so uart clks marginally
@@ -2628,7 +2626,7 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
 	 */
 	return uart_get_baud_rate(port, termios, old,
 				  port->uartclk / 16 / UART_DIV_MAX,
-				  (port->uartclk + tolerance) / 16);
+				  port->uartclk);
 }
 
 void
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
