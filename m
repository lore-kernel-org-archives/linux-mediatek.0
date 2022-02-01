Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2Ay+bAXhSqDp7YpFeSlmD08E+KwXUedalnhHo+V44o=; b=Zgr11j28IOjZXL
	2Ih8QIhvwM/sBLwxMSESI63H6d4eDrud8DsuFNWLVNAksOkOxkBf5j+MJ+9mMCFMiRyu2VOLNHXoM
	6VBmqcOelXiO8rotnHSZyFfvre8volwaayruw1tVYh4IjkPFtoxlmohYUd1mg9rf/ICTR3yz4KGcV
	/z84mSk8HbT8GT7wR3HOS4rKiA7KAq2CFaWKG+VW/86cT3MwW0X5Kioz6C8Ai2dh66eC9yg+D1wLy
	mZgWOiP3QFlOzG3NxL/7rvTvbaouArO9eAyi6Y2fDx50uWFhlzz0Nb4x3e5d39BOkCzBvtNKxYLPj
	fVOyewYCYzn2na8gmAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nErtf-00BxQe-UE; Tue, 01 Feb 2022 12:04:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nErsn-00Bx2g-Rc; Tue, 01 Feb 2022 12:03:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E717B82D99;
 Tue,  1 Feb 2022 12:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC71C34100;
 Tue,  1 Feb 2022 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643717013;
 bh=KWL2fyg8MRHueo+NEu+eGDCCCAKrlXyhb1IXYgaqrtc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B3lw4d52fFz0bapRJ7Z+VB64gw4orIeO2n4aUWIS1xj1maM2zUFnCYYEGjk9ioEni
 ZjiEII/ommlLCge/BjAbg71DLtnW/N7qVTiA1O5lr1KbCE6v9eL60Y1E1KFiJPNPeM
 L7CtPZ3UEogF11sClIaCMNaBXxtiIf/OHEwNB5cYTRpWR4cg4hZe+FG8quXBJTNHSd
 5Bmq4jlKxYsYSqoXwtbOacpEAM0j2u2okX6V2//Ul53CwcqX1XtppJ/vMP1IbNsrXL
 HZ2DjI10BIMbqeu3lr7djOOCQlutkQTiZiOz0d6G0+PDDB92CNUjRltnCEXUF7yx10
 /guNYAFOce1gQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nErsh-004d46-OT; Tue, 01 Feb 2022 12:03:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH 07/12] gpio: omap: Move PM device over to irq domain
Date: Tue,  1 Feb 2022 12:03:05 +0000
Message-Id: <20220201120310.878267-8-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201120310.878267-1-maz@kernel.org>
References: <20220201120310.878267-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, matthias.bgg@gmail.com,
 grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
 tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 kernel@esmil.dk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_040338_209576_28E479D6 
X-CRM114-Status: GOOD (  15.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move the reference to the device over to the irq domain.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpio-omap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index e099c39e0355..80ddc43fd875 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -986,7 +986,8 @@ static void omap_gpio_mod_init(struct gpio_bank *bank)
 		writel_relaxed(0, base + bank->regs->ctrl);
 }
 
-static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
+static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
+			       struct device *pm_dev)
 {
 	struct gpio_irq_chip *irq;
 	static int gpio;
@@ -1052,6 +1053,7 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 	if (ret)
 		return dev_err_probe(bank->chip.parent, ret, "Could not register gpio chip\n");
 
+	irq_domain_set_pm_device(bank->chip.irq.domain, pm_dev);
 	ret = devm_request_irq(bank->chip.parent, bank->irq,
 			       omap_gpio_irq_handler,
 			       0, dev_name(bank->chip.parent), bank);
@@ -1402,7 +1404,6 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	irqc->irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,
 	irqc->name = dev_name(&pdev->dev);
 	irqc->flags = IRQCHIP_MASK_ON_SUSPEND;
-	irqc->parent_device = dev;
 
 	bank->irq = platform_get_irq(pdev, 0);
 	if (bank->irq <= 0) {
@@ -1466,7 +1467,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 
 	omap_gpio_mod_init(bank);
 
-	ret = omap_gpio_chip_init(bank, irqc);
+	ret = omap_gpio_chip_init(bank, irqc, dev);
 	if (ret) {
 		pm_runtime_put_sync(dev);
 		pm_runtime_disable(dev);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
