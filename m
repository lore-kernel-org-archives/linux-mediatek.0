Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40191C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 21:14:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A12C20748
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 21:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2HUOHsDU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="cAUGuF/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A12C20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ecl0VjrmnFmJwlAe01HUGNaNJbA2BXORSJAasZv2aEU=; b=2HUOHsDU1PFbJpjb6NUNX5lX7
	gDHAqmU4c2+RCv/9pgF8x074HUC8ADXeNtGqb9G/1ciI3FqDh4DURm6ulm4I3nFMoFlMvlm1+R1dR
	maYWTxkbnxCs2DXAZA+qkEIPKGQA+ptkCIwhzcM5rXzDXGZCFaSzxNxUByygVE6xgSOWqOJMa0xhR
	w/38CUDcpvMJ2DWgRWxIjnQHKFhU7vRrce2Qwe/JJ35XrFp3HzLsP5vetLD4GyWnNN4Zawni7WYUO
	ouSdT3RLkVd/HjBpfigZg9wdq4R5FY/v2Fh0apMGGYiXlGNsUKciRTbsg38rhuqMjw8bbJvnekAjn
	Xs1RK0fgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqk3E-0000w1-HC; Wed, 01 Jul 2020 21:13:52 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqk3C-0000vF-FZ
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 21:13:51 +0000
Received: by mail-qv1-xf49.google.com with SMTP id 59so16976294qvb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=quzZPMbm7PpMHF0Uc8MBUiav44rFFBJoy1a7Ni+U048=;
 b=cAUGuF/bBZXzPwqEA2KmnUAiIBZh74Axkc9kR9B2TU+pfmr0Ih1xclQdRWGsusUH4P
 aQzareypjNzLHXiV125/yObqrFXl50tJFV/rUKCZRWbD/D/1d0v4lzxP6KOcZXlgjjmi
 sgNNbvNdLJJHNlKCd14hQXkgYAlLrBsKFbkHvUNF/F6nxwrpT8jdvRZYXVdR0PC1eAI+
 4S16qlMArXxPc8oAS/ZA1yBh3hZnNw3KUW8jxg5bA8R+t6SFI15vBdFvk1Iceo4cfGw7
 X0DgYL+QU5n2iQQVkAwshCPeU4e8v2RIOl8RM6la4Auqki927z9rPEsuDYZvWCyThq2u
 QdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=quzZPMbm7PpMHF0Uc8MBUiav44rFFBJoy1a7Ni+U048=;
 b=Hynii7McFpHQ2ABApa3qQtZs68m0SM3vcoqkKeKXvnAoi2Yf/WxvdYuWKXrx/ST1Az
 l6d20f7MY06Nof7ht11sRhJLEpUFTUSmpdPw+OnRI3f1kESDYHxPJitTqrDkZ0xSDKu7
 PQdDNLMNxGLns8OK0UTHPFmugbpWkMwXaW19gtuOh1MU86lse7qyMjadXAOhPIyjuhsd
 Juc8lBAiFXBdZquyLR2MZb7x7z55yKecaOWAIeZHgK3XhWrkw1kHbEpQYso9Wqn2hrET
 yPoUp/VrZSwqDiR1N/oFt3YhqbhGScCQwt83x+55Zl7hPi1MP9rwpF51He/6p77lXe6n
 Fk5g==
X-Gm-Message-State: AOAM533XywjtBDNZRfHBIwgBI/reKLHSAGFM+KgZiZ/K8sT4aevipgQq
 DN65X6Iw7fjdRoEldKjUlfq1mtXGdgH38aojSKxq
X-Google-Smtp-Source: ABdhPJweymvrG4WnmmEfQGpTdGKKPJnK+/o6UKqXb9nuHShRn93/877F29RoxTj0lr9gwAW3khi4TR681cXl8z12ryNZ
X-Received: by 2002:a05:6214:10e1:: with SMTP id
 q1mr25772358qvt.78.1593638026665; 
 Wed, 01 Jul 2020 14:13:46 -0700 (PDT)
Date: Wed,  1 Jul 2020 14:13:37 -0700
In-Reply-To: <20200701211337.3027448-1-danielwinkler@google.com>
Message-Id: <20200701141329.v2.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
Mime-Version: 1.0
References: <20200701211337.3027448-1-danielwinkler@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 1/1] Revert "serial: 8250: Fix max baud limit in generic
 8250 port"
From: Daniel Winkler <danielwinkler@google.com>
To: linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_171350_547882_6C1742F8 
X-CRM114-Status: UNSURE (   9.54  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Daniel Winkler <danielwinkler@google.com>, abhishekpandit@chromium.org,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 7b668c064ec33f3d687c3a413d05e355172e6c92.

Fixes: 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250
port")
Cc: stable@vger.kernel.org
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
