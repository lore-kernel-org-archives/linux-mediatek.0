Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCCDC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rGevTo0TxQWBjnNLZAtO8QaXWz49rHiQrkaKxeAJxbo=; b=A9VkDj2yu5iUVfMBnKhN1EjN5f
	5HVrf6GdtMkl4jpAaW9fNzKHg5uuDCCvTfoO06BFvP4bTVVLB3/CwIZ14esCc6R32ElIpsvejHSaQ
	ao00i8TimkNcgyUZwuZjJfhmRDG7yF+JKnkKk62+tYZsjReomG1g87eAouWKRu76N7FO+jy5+Z8L6
	C7v976lyScEWSOASPtQfJBwWLEg1tpe53SGpQy/hBsDp2YoWo2T43+gqBKrTwuxuaHlCb/bX8yIHS
	xw8788g/Ihi0EoKZIoidGJp+QtIZBskylcgwqXZ2kPCIyV/3kuqEh02yW88wCcgFgVmssAVgwkNby
	XtnLfang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Sqn-000yoJ-1C;
	Tue, 06 Jun 2023 09:19:37 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Sqk-000ymx-1n
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 09:19:36 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bad102ce9eeso6558726276.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686043171; x=1688635171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGevTo0TxQWBjnNLZAtO8QaXWz49rHiQrkaKxeAJxbo=;
        b=X+lnGIqfj9O8lA2Ca9TiRtWIfHxjljaEh5reYjc1R1UKjZBJnVs/FhQpyes/Wowwgo
         iD8E/pSCYtA5ixJ//GPlCZo/kwNsFF2fg0wHuQ8YDEN4c2T7r72aGFKFlJi2e0BVu3uj
         90Hv//yDdkM67yzIxz3u5hZGP3mXT9m7UR1NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043171; x=1688635171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGevTo0TxQWBjnNLZAtO8QaXWz49rHiQrkaKxeAJxbo=;
        b=FI1j4IG9v2D8GAV0fAWROLzG38L8wah+Lqp/Emv4AlOA8DLpiZhte5AOAd8P10oohJ
         rfsUrrudo4wlvh933xWWK6bk2j0qtSP0dDy6HieE/Q+B4O/bNIvHftGX3NFAKajUsT4y
         /SrtCnv0RvG6CkDUO9QaoolBTviERf+uTWmdoW6/CvqZZsS0QLRFHoXtOzlNLl5/C8yy
         xJOHcz+gLakpHnHvMJd92ZdYw6wUQsapmCuiiVf6Yo/eQxVeV54ISC58c/xT9+a7cCGb
         sbYQS7cxZvkQisiAJlFYTtTPkUO4uXp4hapoBywAmn35MUYCWwFaeYTNqmOVvwGOSsLy
         YMHw==
X-Gm-Message-State: AC+VfDx/nxH7z/8vQZzPV7lQd9dqendFvtg4k5qt1YjUIJFuY1ZV9m/F
	O3gzWC3XBfjD5+eU5URA69Lp5w==
X-Google-Smtp-Source: ACHHUZ4ez/f43PgkvQz1Dr5YiS0CAYETU8SAy+uBG0YWdxWZmyH1Z+Gm2DTDz5LknyDaTYNXfOE6qA==
X-Received: by 2002:a5b:6cb:0:b0:b9e:8a8b:b073 with SMTP id r11-20020a5b06cb000000b00b9e8a8bb073mr1351788ybq.39.1686043171422;
        Tue, 06 Jun 2023 02:19:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:62f6:f76c:5e28:6293])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f54800b001993a1fce7bsm8042854plf.196.2023.06.06.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:19:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	John Ogness <john.ogness@linutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH] serial: 8250_mtk: Simplify clock sequencing and runtime PM
Date: Tue,  6 Jun 2023 17:17:45 +0800
Message-ID: <20230606091747.2031168-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_021934_595591_BA6D65CF 
X-CRM114-Status: GOOD (  18.32  )
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

The 8250_mtk driver's runtime PM support has some issues:

- The bus clock is enabled (through runtime PM callback) later than a
  register write
- runtime PM resume callback directly called in probe, but no
  pm_runtime_set_active() call is present
- UART PM function calls the callbacks directly, _and_ calls runtime
  PM API
- runtime PM callbacks try to do reference counting, adding yet another
  count between runtime PM and clocks

This fragile setup worked in a way, but broke recently with runtime PM
support added to the serial core. The system would hang when the UART
console was probed and brought up.

Tony provided some potential fixes [1][2], though they were still a bit
complicated. The 8250_dw driver, which the 8250_mtk driver might have
been based on, has a similar structure but simpler runtime PM usage.

Simplify clock sequencing and runtime PM support in the 8250_mtk driver.
Specifically, the clock is acquired enabled and assumed to be active,
unless toggled through runtime PM suspend/resume. Reference counting is
removed and left to the runtime PM core. The serial pm function now
only calls the runtime PM API.

[1] https://lore.kernel.org/linux-serial/20230602092701.GP14287@atomide.com/
[2] https://lore.kernel.org/linux-serial/20230605061511.GW14287@atomide.com/

Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/tty/serial/8250/8250_mtk.c | 50 ++++++------------------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index aa8e98164d68..74da5676ce67 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -431,12 +431,7 @@ static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
 	while
 		(serial_in(up, MTK_UART_DEBUG0));
 
-	if (data->clk_count == 0U) {
-		dev_dbg(dev, "%s clock count is 0\n", __func__);
-	} else {
-		clk_disable_unprepare(data->bus_clk);
-		data->clk_count--;
-	}
+	clk_disable_unprepare(data->bus_clk);
 
 	return 0;
 }
@@ -444,19 +439,8 @@ static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
 static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
 {
 	struct mtk8250_data *data = dev_get_drvdata(dev);
-	int err;
 
-	if (data->clk_count > 0U) {
-		dev_dbg(dev, "%s clock count is %d\n", __func__,
-			data->clk_count);
-	} else {
-		err = clk_prepare_enable(data->bus_clk);
-		if (err) {
-			dev_warn(dev, "Can't enable bus clock\n");
-			return err;
-		}
-		data->clk_count++;
-	}
+	clk_prepare_enable(data->bus_clk);
 
 	return 0;
 }
@@ -465,14 +449,12 @@ static void
 mtk8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
 	if (!state)
-		if (!mtk8250_runtime_resume(port->dev))
-			pm_runtime_get_sync(port->dev);
+		pm_runtime_get_sync(port->dev);
 
 	serial8250_do_pm(port, state, old);
 
 	if (state)
-		if (!pm_runtime_put_sync_suspend(port->dev))
-			mtk8250_runtime_suspend(port->dev);
+		pm_runtime_put_sync_suspend(port->dev);
 }
 
 #ifdef CONFIG_SERIAL_8250_DMA
@@ -504,7 +486,7 @@ static int mtk8250_probe_of(struct platform_device *pdev, struct uart_port *p,
 		return 0;
 	}
 
-	data->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	data->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 	if (IS_ERR(data->bus_clk))
 		return PTR_ERR(data->bus_clk);
 
@@ -587,25 +569,16 @@ static int mtk8250_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	pm_runtime_enable(&pdev->dev);
-	err = mtk8250_runtime_resume(&pdev->dev);
-	if (err)
-		goto err_pm_disable;
-
 	data->line = serial8250_register_8250_port(&uart);
-	if (data->line < 0) {
-		err = data->line;
-		goto err_pm_disable;
-	}
+	if (data->line < 0)
+		return data->line;
 
 	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
 
-	return 0;
-
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 
-	return err;
+	return 0;
 }
 
 static int mtk8250_remove(struct platform_device *pdev)
@@ -619,9 +592,6 @@ static int mtk8250_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mtk8250_runtime_suspend(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog


