Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFE3C00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 12:08:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D242223C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 12:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alhb+f0K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OER6ydD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D242223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DGQP4xXKt42QSRS43pmsZhTTZfkBe5bXWvkhRMdzUNo=; b=alhb+f0KdXIXw2QA5gPaGjpLRi
	15/xK/ab+FRPtiENPq2G+4rx7/DM0px0oSyzS3sm8czhp0v8uLB+tyvbyIGmTRHMi3bI65Yt9gIy4
	Ygh1kKFGcKDhsT2p5lhzKp7fSi8ugysF5FQhD2XZAWYpxrhYrdUIkuiRveZGI0qiZyAPqF/Hk/ors
	2It+OpN4/I9wbonXEuXHUwnGikHEno6F0YxT5Q1IoXQufXV7DVhuN58R92tPnRRC3wN9HVI+XEByk
	vX7oU4BWlCV0/cOzwbo6OQl8OuAI0I9OF009s7Drb6vkwEApM8lvXKl6O7/0+jRNOvc37ic6SxK0D
	sj15sldw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYd3-00035E-8J; Mon, 02 Nov 2020 12:08:05 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYcy-00031r-6D
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 12:08:02 +0000
Received: by mail-pg1-x544.google.com with SMTP id k9so8920539pgt.9
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2020 04:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFM6/afG6N6GkffE6RVsA6XQhyhMXSUQ6Tq0CrN9TdE=;
 b=OER6ydD30mEycoQTkeJ2IEiFZdYdh0NneHHHSB7KDLQJaaFrFNIHAk7YS3b99bIBqf
 CY5P3j+LjyDibyo6PH6yMuXRpQ7mGTtlXVUKW7EjBLFMhrrAU0dIKL732N7CSpkrDwSg
 JyBBMOnObcDhu+y53bZi+INnV6NUX6CI2ZIJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFM6/afG6N6GkffE6RVsA6XQhyhMXSUQ6Tq0CrN9TdE=;
 b=dhQoxpgbd3v5ASGeH27RDjifNA648Z72EmJtaFNn+4LobmKbouf2hwfIxOGwydKRTk
 CaUO3YhP3cRQAKZrQVOrsw6GunJ/9EzmxI3FT3g+OBihE/V9KL/AGAxMUbvLIWy5rBC7
 ercpQGkjJK3SoPKKdNTnuaLYG1jAjiq6dXqvzV9Xy0mbu6mxLrW9XiJrfkWLDPK2dGqD
 y3S328OiZ7GoC20SqD3C/k7kZgF54l+T+Ap8PG1AN99ReldH61MlUO7gLZTPE2LXfXUG
 BsNTV0+pDnpRmC6DExNDOnQetzJa4BFNagf5owpEPyz6R8H7Z905yHuKLYDFQZXpeoTV
 498g==
X-Gm-Message-State: AOAM533MBERFPlkF1EHUEEgMn9UbhCVskhxvyeK6BaWDm1LZ0o5PvWL9
 O72Ue/Ne79o5wWXh/dpyF9SrKl4k8sS8Tw==
X-Google-Smtp-Source: ABdhPJwK6F4gpRDNplhBJ76hPT238QfpHnacXB+pi3j8WSLJHBoyl01NGnhMR9ZQeZeIkxPlSSGM+g==
X-Received: by 2002:a17:90b:30d2:: with SMTP id
 hi18mr5754162pjb.186.1604318875646; 
 Mon, 02 Nov 2020 04:07:55 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
 by smtp.gmail.com with ESMTPSA id h26sm11675226pfq.139.2020.11.02.04.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 04:07:54 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 andriy.shevchenko@linux.intel.com
Subject: [PATCH] serial: 8250_mtk: Fix uart_get_baud_rate warning
Date: Mon,  2 Nov 2020 20:07:49 +0800
Message-Id: <20201102120749.374458-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_070800_351112_3C37750B 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: changqi.hu@mediatek.com, linux-kernel@vger.kernel.org,
 Sergey.Semin@baikalelectronics.ru, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, hsinyi@chromium.org,
 Claire Chang <tientzu@chromium.org>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek 8250 port supports speed higher than uartclk / 16. If the baud
rates in both the new and the old termios setting are higher than
uartclk / 16, the WARN_ON in uart_get_baud_rate() will be triggered.
Passing NULL as the old termios so uart_get_baud_rate() will use
uartclk / 16 - 1 as the new baud rate which will be replaced by the
original baud rate later by tty_termios_encode_baud_rate() in
mtk8250_set_termios().

Fixes: 551e553f0d4a ("serial: 8250_mtk: Fix high-speed baud rates clamping")
Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/tty/serial/8250/8250_mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 41f4120abdf2..fa876e2c13e5 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -317,7 +317,7 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
 	 */
 	baud = tty_termios_baud_rate(termios);
 
-	serial8250_do_set_termios(port, termios, old);
+	serial8250_do_set_termios(port, termios, NULL);
 
 	tty_termios_encode_baud_rate(termios, baud, baud);
 
-- 
2.29.1.341.ge80a0c044ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
