Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60BEC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FBECTcdeQLfSp5bHcYAa/1zAvqLKLLp0tQ+VpGze+A=; b=rlyGEbDOaM3LXYuzuCK41lbtXg
	7YDvvTSFubqyVbgqv8Wuz6xCoPkgIxvyKc7J4F1SSRIFbHlmUA4LUP44707pWDFmXAAIfDJoUd151
	frQ8mNx1UIRDD41kI0n7CTtS8o70J5OLbobzwOf5Aeku05ZE3EQ+JVoJWaEJYanyj6SAbMT+G0yNM
	V+lnza1/TrEkvTjRLGo6qao/G6Orue1xBrfQlx+v9AMckr/ZsYjKH80qc5M+onmwfov1W65r8q/Wb
	lEtGRe4QfBM7FXEqyUpKV92IyUsnwQWAw2DXNoWSWOveIoxHzekl4KFaFXBmKbfjQHG+hTucAswDR
	IRP87ExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omXbh-00EsjI-5Q; Sun, 23 Oct 2022 09:49:25 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omXbW-00EsfV-7i; Sun, 23 Oct 2022 09:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1666518546; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FBECTcdeQLfSp5bHcYAa/1zAvqLKLLp0tQ+VpGze+A=;
	b=WMXviK4znNH+cxAIFAOQi3B1ykMnVrOcVU4hf2Rqqlk058V80E+qnyk8E0LlkDXjEPWIXm
	5qVkv3kePJ7wNXzCipfnq9MYT16MVBahctpgvp0h4oxMOe2Waq01lOVUy6yVlaUaKThAzq
	zocXklgI+/PciXSlgUahWpIe9bqshyo=
From: Paul Cercueil <paul@crapouillou.net>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 05/28] mfd: mt6397-irq: Remove #ifdef guards for PM related functions
Date: Sun, 23 Oct 2022 10:48:29 +0100
Message-Id: <20221023094852.8035-6-paul@crapouillou.net>
In-Reply-To: <20221023094852.8035-1-paul@crapouillou.net>
References: <20221023094852.8035-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_024914_464698_40627B8D 
X-CRM114-Status: GOOD (  11.96  )
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

Use the new pm_sleep_ptr() macro to handle the .irq_set_wake() callback.

This macro allows the mt6397_irq_set_wake() function to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

 drivers/mfd/mt6397-irq.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index eff53fed8fe7..72f923e47752 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -54,7 +54,6 @@ static void mt6397_irq_enable(struct irq_data *data)
 	mt6397->irq_masks_cur[reg] |= BIT(shift);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
 {
 	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
@@ -68,9 +67,6 @@ static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
 
 	return 0;
 }
-#else
-#define mt6397_irq_set_wake NULL
-#endif
 
 static struct irq_chip mt6397_irq_chip = {
 	.name = "mt6397-irq",
@@ -78,7 +74,7 @@ static struct irq_chip mt6397_irq_chip = {
 	.irq_bus_sync_unlock = mt6397_irq_sync_unlock,
 	.irq_enable = mt6397_irq_enable,
 	.irq_disable = mt6397_irq_disable,
-	.irq_set_wake = mt6397_irq_set_wake,
+	.irq_set_wake = pm_sleep_ptr(mt6397_irq_set_wake),
 };
 
 static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
-- 
2.35.1


