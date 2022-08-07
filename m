Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0278C19F2A
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Aug 2022 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31kG5gjhviHwLsXux6Sn6owRjNJeuuOaVC6064XnvhM=; b=JUar/on7t/rSLGfcHVLcG92Zag
	gQGtn6fyazhNX607FZ2/Y2dbxtxqX8AXEMbdt1P+rkBJOy4UbAD0GJtc/QLpWxiMO6kpiloPO0YF0
	jgMxuKGMkAayUzFstgjTQLRXsiMyxhzMypwZwKn1xt6LgoqjBOYcT5Xh28luiSmAQJ04Z426nx4Nc
	gnp0zBH4f9XZJS3xo3v/Xxy4SmWn3GZuutrrBxVw0vqpwuGGhmjll1ILJ2Kp8uleShwU62dBNeDmv
	ewg4Lmtz6VrMOYb8rhFYRdSst6+pOUW35aDQOOwW8aHYcCLcA71SVvU188yD0iFbL88klLDNIPxee
	615lMqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKhep-00Dv26-Jz; Sun, 07 Aug 2022 14:53:35 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKheQ-00DuHM-LC; Sun, 07 Aug 2022 14:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1659883982; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=31kG5gjhviHwLsXux6Sn6owRjNJeuuOaVC6064XnvhM=;
	b=4RybMQjmOajH4LdLvd0aKYxNZvWQsWxpaRt1gNatYx4FW2YUt05DgcNXYmvIlHZhmkE7fd
	7HTCIOyEYtrHUbzxj352yIJ0tHmPkCZOabH8bbSQo5Wsbn+Ll12k/KAjPrl6gg4olcnSnO
	cIBQShE9MMRoiNOWlHyECVB888XgzQQ=
From: Paul Cercueil <paul@crapouillou.net>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 05/28] mfd: mt6397-irq: Remove #ifdef guards for PM related functions
Date: Sun,  7 Aug 2022 16:52:24 +0200
Message-Id: <20220807145247.46107-6-paul@crapouillou.net>
In-Reply-To: <20220807145247.46107-1-paul@crapouillou.net>
References: <20220807145247.46107-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_075310_886040_6ACE1ACB 
X-CRM114-Status: GOOD (  11.58  )
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

The advantage is then that these functions are now always compiled
independently of any Kconfig option, and thanks to that bugs and
regressions are easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/mfd/mt6397-irq.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 2924919da991..69009d119216 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -52,7 +52,6 @@ static void mt6397_irq_enable(struct irq_data *data)
 	mt6397->irq_masks_cur[reg] |= BIT(shift);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
 {
 	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
@@ -66,9 +65,6 @@ static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
 
 	return 0;
 }
-#else
-#define mt6397_irq_set_wake NULL
-#endif
 
 static struct irq_chip mt6397_irq_chip = {
 	.name = "mt6397-irq",
@@ -76,7 +72,7 @@ static struct irq_chip mt6397_irq_chip = {
 	.irq_bus_sync_unlock = mt6397_irq_sync_unlock,
 	.irq_enable = mt6397_irq_enable,
 	.irq_disable = mt6397_irq_disable,
-	.irq_set_wake = mt6397_irq_set_wake,
+	.irq_set_wake = pm_sleep_ptr(mt6397_irq_set_wake),
 };
 
 static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
-- 
2.35.1


