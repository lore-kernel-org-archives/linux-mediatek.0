Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3368DC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 07:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0301A20721
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 07:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D0r9ktb6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iphw8LOH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0301A20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xAmSms9AUKyeZYbboik+AX/85GQ+huDxHegKIcc1iY=; b=D0r9ktb6iVRLnl
	A7nGc2UumFHS8lpjoVnJOFiJFvEw5BG/MnBlv4U5xWLtjN9OileXM8ltMUHHPYIJ1ACCzFYQ39VTe
	BVTM964Im8cn4uquOJn2yaxCu2YgiEpuu7sEK0xoXFE5lxWLBP84Y7KRGb1sEwPZmiO6L/0SgZv0e
	oyFXd/0qNrlrpJ0aFyqQ/6wt25gklu6XQ/Okz7mg2elmNNEet7kvnLdImiq1KsD8ahi6HtDUiQvY5
	PlsZVhnk8l4B405PGCwpX1cDFtX29Ab2jgPVlQCnYrBKnqJicLAs7txq898b+bxV93Uzn6Pzrx9wo
	NzYWMDecRVFLWb2we8Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWEP8-0002k8-1d; Wed, 06 May 2020 07:23:42 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWEP5-0002i2-7h
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 07:23:40 +0000
Received: by mail-pf1-x443.google.com with SMTP id 145so542396pfw.13
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5LGrd0GCp2GzoXCciri6QP/vYjybcGcRtj9Gm0aAra8=;
 b=iphw8LOHvc14me23EkcDGAveepL+5oyVXgA/7aVqeoEgbqB/kHqW7UDZshvRhYen0n
 Phl9jDxNaaJWm//QIjLLLSHud5Tr5atoUUu0Gu+K+/HzYd0qIGMH+h04d3AooOrF2bEU
 84xw9tqPnkasKhkgaE0aNrQBUtzcxyTwUu7Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5LGrd0GCp2GzoXCciri6QP/vYjybcGcRtj9Gm0aAra8=;
 b=MLKUdSzqWsPY1qSyvUviX4DvuufzGpC30AwfkkJ649Obkk/9zS3R7krXBtBgenekpQ
 E0uqhYfhP5rV50QyxJOCKeH2c0f8WEkboj82MVTwRKaEU+fV8eFA7vK3VLGqS84mVRRe
 LKAfDZIPVQbE8L8AYQdW/aiM1Styw0q06zcXkEtGlSBCoJiOYHF1TrQkyyW+kEtW+jnG
 l91J+yiiPeQeMfhZfoLZu1JPGCjEmyNghnPQAI9IlykTRmnYwACj7Zptt5pEM2haskcz
 N3jUjLrhjJm5GalLuqWvfux14nqvJZaBOUYSdBb0GdtgTEwSZbt8AHYS+AB/WnSx9/ME
 JIfQ==
X-Gm-Message-State: AGi0PuY6bcmadjX9SfU6Cs3UFHVt0B9qwu08N0BCjvMuOf2H7IYCEWh2
 Hqr2wblNmPmpjcUdtFUWsElV1A==
X-Google-Smtp-Source: APiQypKo1Sd/AT6g8MTRHUbLALuWztAtTilmBnoQG2IBw8cdHyWnDYPoOcoAWJvi465bvD3/LJF4qA==
X-Received: by 2002:aa7:982a:: with SMTP id q10mr6950169pfl.212.1588749818693; 
 Wed, 06 May 2020 00:23:38 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:3db2:76bf:938b:be05])
 by smtp.gmail.com with ESMTPSA id i18sm3980351pjx.33.2020.05.06.00.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 00:23:38 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: robh@kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
 long.cheng@mediatek.com, changqi.hu@mediatek.com
Subject: [PATCH 3/3] uart: mediatek: move the in-band wakeup logic to core
Date: Wed,  6 May 2020 15:23:14 +0800
Message-Id: <20200506072314.112409-4-tientzu@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200506072314.112409-1-tientzu@chromium.org>
References: <20200506072314.112409-1-tientzu@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_002339_279128_B392CD7B 
X-CRM114-Status: GOOD (  10.23  )
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

Move the in-band wakeup logic to core so that we can control the wakeup
behavior by serdev controller's power/wakeup node and align with other
serial drivers.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/tty/serial/8250/8250_mtk.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index f839380c2f4c1..52cb41e4e493d 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -71,7 +71,6 @@ struct mtk8250_data {
 #ifdef CONFIG_SERIAL_8250_DMA
 	enum dma_rx_status	rx_status;
 #endif
-	int			rx_wakeup_irq;
 };
 
 /* flow control mode */
@@ -496,6 +495,8 @@ static int mtk8250_probe(struct platform_device *pdev)
 	struct uart_8250_port uart = {};
 	struct resource *regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct resource *irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	struct resource *wakeup_irq =
+		platform_get_resource(pdev, IORESOURCE_IRQ, 1);
 	struct mtk8250_data *data;
 	int err;
 
@@ -525,6 +526,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	spin_lock_init(&uart.port.lock);
 	uart.port.mapbase = regs->start;
 	uart.port.irq = irq->start;
+	uart.port.wakeup_irq = wakeup_irq ? wakeup_irq->start : -ENXIO;
 	uart.port.pm = mtk8250_do_pm;
 	uart.port.type = PORT_16550;
 	uart.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT;
@@ -556,8 +558,6 @@ static int mtk8250_probe(struct platform_device *pdev)
 	if (data->line < 0)
 		return data->line;
 
-	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
-
 	return 0;
 }
 
@@ -581,23 +581,9 @@ static int mtk8250_remove(struct platform_device *pdev)
 static int __maybe_unused mtk8250_suspend(struct device *dev)
 {
 	struct mtk8250_data *data = dev_get_drvdata(dev);
-	int irq = data->rx_wakeup_irq;
-	int err;
 
 	serial8250_suspend_port(data->line);
-
 	pinctrl_pm_select_sleep_state(dev);
-	if (irq >= 0) {
-		err = enable_irq_wake(irq);
-		if (err) {
-			dev_err(dev,
-				"failed to enable irq wake on IRQ %d: %d\n",
-				irq, err);
-			pinctrl_pm_select_default_state(dev);
-			serial8250_resume_port(data->line);
-			return err;
-		}
-	}
 
 	return 0;
 }
@@ -605,12 +591,8 @@ static int __maybe_unused mtk8250_suspend(struct device *dev)
 static int __maybe_unused mtk8250_resume(struct device *dev)
 {
 	struct mtk8250_data *data = dev_get_drvdata(dev);
-	int irq = data->rx_wakeup_irq;
 
-	if (irq >= 0)
-		disable_irq_wake(irq);
 	pinctrl_pm_select_default_state(dev);
-
 	serial8250_resume_port(data->line);
 
 	return 0;
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
