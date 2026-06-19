Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC034CD98F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RhDxX4cHuT4tfnpR0AipKseIEfBclnv+hzggOQhE2+U=; b=iEJN2fbblhQawQMvUbPBsxwNYv
	wCjrjh1y3MSbGLW3G0VkDh52Ixykt3lu+/OiR6wQpQzidk+8ixGtoz5zzXv1fNMWL3vXitLKq5wb7
	0iN+GSGYxrlWusGevwbneY2+AdKQbsNDw1zhHwY4T9XbhTmWfJmeJHk7A82TTJmRLaDKqG0ze3EDh
	cU5YyJKs6Uc+N7C4vpaDU5NwbXeppWWUFn93kr5RiRQMgdpCYzrhs7KEONpkJYQZU7/rsvx4nCLVm
	Xv4RkbnqA7qIlfNVduKn7rEQwgcdk3rrrlCFocsFqdzuhHA8jX7VdC1RhKpC8W9WLfTvq10TSUCdD
	4DuGMopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacWa-00000002njh-49xx;
	Fri, 19 Jun 2026 16:57:00 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacWZ-00000002nj0-049f
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 16:57:00 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51780bbc560so29478881cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781888217; x=1782493017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhDxX4cHuT4tfnpR0AipKseIEfBclnv+hzggOQhE2+U=;
        b=d09vqytijNjdE+YZnbADkCa7VssXbNtHrfp068cAVgeYlLJ46y/tU8fRi1bs0IMHl5
         VbBMB6rZ73/NsDP+RBE1VgleDAcFc0ZqV1hTyg+v4z09EhwaL8D5N1TVMaEvO2keWyEc
         O4KDOaAnovlZbyicIpT4QOW0y9HaicUkFrnHV/mrU7wPUFk2vK5mgRfhlbKvhcIkm63/
         hpaHxXT0KKxZewLFVKHmNHpzlQSMyk8FL81q5mfJhfMakS4qhwqOueo8/3b1hxMeA5M5
         SAWjQbJGPHZPyJ4RNbvMqY5tQMDmNjp2IOz7rEZuNAN1GG2S9MYBgW4c9Ch+Bg/ejD3b
         u0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781888217; x=1782493017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhDxX4cHuT4tfnpR0AipKseIEfBclnv+hzggOQhE2+U=;
        b=U9P/iVAYvIBgjDvtLo6U5osaOaTAM+gD2XjsW75kJuUN4yu98lVtY1aFuzESszBT3l
         n3E14kNR05Zdghkw3bQ4N2rATx4iRj2/Uk6NJHmZ6jtFTxXgXq5pYKcXz0jiMIA7rXBo
         b6rd/bHYlDD3CSUsJnh3e7nOwIt9wDmzZNWvcrkWmI9QR6MZ6zCNFW4y/uXPB3u81I2N
         rnd4QeVA2fD61vAJ5UTygmNsEU7i3ykWe6erVoPmVYRYx41lope6TgOBAfC3xISzzkeC
         Sp66yEM3gEkrO645Mg+zBACD6CwpGb2vSAngnYn8YhJ4yZ9i3Uznf37xdOYJdd6EkyML
         BbMg==
X-Forwarded-Encrypted: i=1; AFNElJ/CF5fCPyQMOjgDka/UuIHxzOKJmG0cZHx1ppo8LYZIe3CuHndbafKjaEtjZUdoy/U3AaU+I515EnE7VELS3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWHclRO1ruj6o8uUKy2wkAKOcwrcMrI3qZhsyVmrQGozhnMhuf
	6ze5ZiUjT/k7/BeR5n77QMLSfcUWyTE+TG+znQu/Mf0Nki4sU3REn8Ji
X-Gm-Gg: AfdE7cm1yMlesZ8osEBs5DwX0UpS5AQsesRb+aZEmqiLqxggWPJrkG9i2gxFTA+SxSl
	cQCHK7hSQZqCxZBl/o3ywSqMmkDlvikcjK4/2NAUQsLCvpIH2N7KrMS36MFqRdVWYVbV/VvB0o+
	mxn44qpVEyvNWxxh7LdSvTkF/zyyzPI2jyP+U5hFlIhpIstXxA6IFaDvppCvyj8tQwXAQuHLbI0
	ZwKjPfxZ/52l1f08fr5EVbWo6vXR47bsI4cnz+b0LKFPWQrlx58fzUGoyhnNoVcu+xtcNmLxNUD
	8rVudULbDqAoSXdY4z0NM/UrUlkmic48Owcms9Ew1JEJ8CTsP3aP7y1wnRHC3kBwuGNiFJroKAk
	H9W4hWzgheka4UbvbmUm5BSgrso1WfW9DExsUOZxmLXR85Dc+sjcyvNwHgqxSQFm0sxYvL+TGjH
	1PtWC65MQmMyC6EtWhXl8lom0W6IOL+g==
X-Received: by 2002:ac8:7fd5:0:b0:50f:b61c:ec4c with SMTP id d75a77b69052e-519e6618f84mr51242181cf.7.1781888217426;
        Fri, 19 Jun 2026 09:56:57 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-519e6127858sm24687081cf.27.2026.06.19.09.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:56:56 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] mfd: mt6397-irq: Fix PM notifier and IRQ domain teardown
Date: Fri, 19 Jun 2026 12:56:49 -0400
Message-ID: <20260619165649.1067266-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_095659_077748_88A53CBA 
X-CRM114-Status: GOOD (  18.08  )
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

mt6397_irq_init() registers a PM notifier and creates an irq_domain. Both
objects point back to the devm-managed mt6397_chip.

The notifier was not unregistered on probe failure or unbind, so a later PM
transition could dereference freed chip state. The irq_domain had the
opposite lifetime problem: it could be removed while the devm-managed
parent IRQ was still active, but it was leaked on successful unbind.

Manage both lifetimes with devm actions. Register the domain cleanup before
requesting the parent IRQ, so devres frees the parent IRQ before removing
child mappings and the irq_domain. This keeps the domain alive while the
parent IRQ handler can still run.

Also serialize PM notifier mask writes with irqlock. While suspend is in
progress, keep wake_mask programmed in hardware even if a concurrent IRQ
sync updates irq_masks_cur in software.

Fixes: a4872e80ce7d ("mfd: mt6397: Extract IRQ related code from core driver")
Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes in v2:
- Use devm actions for PM notifier and irq_domain cleanup.
- Remove direct irq_domain_remove() calls from failure paths.
- Serialize PM notifier mask writes with irqlock.
---
 drivers/mfd/mt6397-core.c       |  4 +-
 drivers/mfd/mt6397-irq.c        | 85 +++++++++++++++++++++++----------
 include/linux/mfd/mt6397/core.h |  1 +
 3 files changed, 63 insertions(+), 27 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 1bdacda9a933..ff1e393202ee 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -389,10 +389,8 @@ static int mt6397_probe(struct platform_device *pdev)
 	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
 				   pmic_core->cells, pmic_core->cell_size,
 				   NULL, 0, pmic->irq_domain);
-	if (ret) {
-		irq_domain_remove(pmic->irq_domain);
+	if (ret)
 		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
-	}
 
 	return ret;
 }
diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 5d2e5459f744..4be74d8325cd 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -25,17 +25,23 @@ static void mt6397_irq_lock(struct irq_data *data)
 	mutex_lock(&mt6397->irqlock);
 }
 
+static void mt6397_irq_write_masks(struct mt6397_chip *mt6397,
+				   const u16 *masks)
+{
+	regmap_write(mt6397->regmap, mt6397->int_con[0], masks[0]);
+	regmap_write(mt6397->regmap, mt6397->int_con[1], masks[1]);
+	if (mt6397->int_con[2])
+		regmap_write(mt6397->regmap, mt6397->int_con[2], masks[2]);
+}
+
 static void mt6397_irq_sync_unlock(struct irq_data *data)
 {
 	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
+	const u16 *masks;
 
-	regmap_write(mt6397->regmap, mt6397->int_con[0],
-		     mt6397->irq_masks_cur[0]);
-	regmap_write(mt6397->regmap, mt6397->int_con[1],
-		     mt6397->irq_masks_cur[1]);
-	if (mt6397->int_con[2])
-		regmap_write(mt6397->regmap, mt6397->int_con[2],
-			     mt6397->irq_masks_cur[2]);
+	masks = mt6397->irq_suspended ? mt6397->wake_mask :
+					mt6397->irq_masks_cur;
+	mt6397_irq_write_masks(mt6397, masks);
 
 	mutex_unlock(&mt6397->irqlock);
 }
@@ -141,24 +147,20 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 
 	switch (pm_event) {
 	case PM_SUSPEND_PREPARE:
-		regmap_write(chip->regmap,
-			     chip->int_con[0], chip->wake_mask[0]);
-		regmap_write(chip->regmap,
-			     chip->int_con[1], chip->wake_mask[1]);
-		if (chip->int_con[2])
-			regmap_write(chip->regmap,
-				     chip->int_con[2], chip->wake_mask[2]);
+		mutex_lock(&chip->irqlock);
+		chip->irq_suspended = true;
+		mt6397_irq_write_masks(chip, chip->wake_mask);
+		mutex_unlock(&chip->irqlock);
+
 		enable_irq_wake(chip->irq);
 		break;
 
 	case PM_POST_SUSPEND:
-		regmap_write(chip->regmap,
-			     chip->int_con[0], chip->irq_masks_cur[0]);
-		regmap_write(chip->regmap,
-			     chip->int_con[1], chip->irq_masks_cur[1]);
-		if (chip->int_con[2])
-			regmap_write(chip->regmap,
-				     chip->int_con[2], chip->irq_masks_cur[2]);
+		mutex_lock(&chip->irqlock);
+		chip->irq_suspended = false;
+		mt6397_irq_write_masks(chip, chip->irq_masks_cur);
+		mutex_unlock(&chip->irqlock);
+
 		disable_irq_wake(chip->irq);
 		break;
 
@@ -169,6 +171,29 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 	return NOTIFY_DONE;
 }
 
+static void mt6397_irq_pm_notifier_unregister(void *data)
+{
+	struct mt6397_chip *chip = data;
+
+	unregister_pm_notifier(&chip->pm_nb);
+}
+
+static void mt6397_irq_domain_remove(void *data)
+{
+	struct mt6397_chip *chip = data;
+	unsigned int hwirq;
+	unsigned int virq;
+
+	for (hwirq = 0; hwirq < MT6397_IRQ_NR; hwirq++) {
+		virq = irq_find_mapping(chip->irq_domain, hwirq);
+		if (virq)
+			irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(chip->irq_domain);
+	chip->irq_domain = NULL;
+}
+
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
 	int ret;
@@ -223,16 +248,28 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		return -ENOMEM;
 	}
 
+	ret = devm_add_action_or_reset(chip->dev, mt6397_irq_domain_remove,
+				       chip);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
 					mt6397_irq_thread, IRQF_ONESHOT,
 					"mt6397-pmic", chip);
 	if (ret) {
 		dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
 			chip->irq, ret);
-		irq_domain_remove(chip->irq_domain);
 		return ret;
 	}
 
-	register_pm_notifier(&chip->pm_nb);
-	return 0;
+	ret = register_pm_notifier(&chip->pm_nb);
+	if (ret) {
+		dev_err(chip->dev, "failed to register PM notifier: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(chip->dev,
+				       mt6397_irq_pm_notifier_unregister, chip);
+
+	return ret;
 }
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 340fc72e22aa..f9c2cbd17c5c 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -66,6 +66,7 @@ struct mt6397_chip {
 	int irq;
 	struct irq_domain *irq_domain;
 	struct mutex irqlock;
+	bool irq_suspended;
 	u16 wake_mask[3];
 	u16 irq_masks_cur[3];
 	u16 irq_masks_cache[3];
-- 
2.43.0


