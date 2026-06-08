Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F881CD8C90
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 02:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/UZPLDL99uE79PZBqTgEFaV7YHrnGQJQrwQrbWdnDU=; b=b8ePdq1JfZ0xOB7AZJt4uOVgM6
	lfk74FX07YfILVqYqoxYiOj+DVyih0jMSG+uiqB3WTeYaeFp9qH8KgvkdcxvvTWgRjrDrUTWIKdX+
	KWF7O1bb5BKAE2XZNphicnF3PH3qXTrUx561MNSyxUuF1MYonPV3LBIjBqEca6vxfcL1Ujz00Rz7Y
	ZMBR9lBUJsRtVQxePBcKobMoKTw1U+4INI8ecvIDXH7YmX5+bz+rUaEv/l+yeI42LPPeHK4lYoyy7
	WsXzeBIfR74n6IIfXl797BdUxC7PhugG0NGOu78xnRYvsI/wnvfvM2iQEu72hAjQeKgve7omicGh+
	OIdy7hOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPS7-00000002i1R-0O0k;
	Mon, 08 Jun 2026 02:10:59 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPS4-00000002i0h-2Tfj
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 02:10:57 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8ccda0ac4fcso39585606d6.2
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Jun 2026 19:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780884655; x=1781489455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/UZPLDL99uE79PZBqTgEFaV7YHrnGQJQrwQrbWdnDU=;
        b=OYaaQw7w0fG/Kd510SAYS2WIeDUPM8UJ1Id/8N22R/De6OWnvxNl7AsBlgAIvyQfVp
         ebTjH0AOEGygilO6k1MiKezo3Pa4YNj9tUhConCcRTWLL+WT01/BbZWAFeku4DaugTGR
         k2FDKv2fH2oxyFCK7SEc2mdy+Fn2x6qV8W9GLsQqK6gWi4q+ayj+iUbLB4Aowy9h3DRZ
         UHqZVPCUhJGMiLtEuCkZVZqjnCATFomAQc3bAXAVky9ReZA2FHSmSuvBVvNClNsieMCx
         C13UhifPD863ool/cLIg6i3kg/B88zklkigmZ9rfG50DnYCVHV6y1e6qq1ByOwiIAxhH
         kC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780884655; x=1781489455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/UZPLDL99uE79PZBqTgEFaV7YHrnGQJQrwQrbWdnDU=;
        b=sBLrhr9xEhqiSkR1EpYfJBpJ5CqBh6UY01qbDX/YqwPLRpO2qVyZ2UvyIdi6/jkVTJ
         MbX+xlCLs4S7PsUPg2B5vXtXOEVwvfD4qIXoiRGnULmWMcwJcdZNIF7ABDwUA3siRGAR
         AgMVTCfz1Re3RS82htRazYpWxDVnCOarTr+pgnVc+VqG02ztbwsSpaPoMd4kKiMFSPYY
         5WRC9Xp9bpyuR0dx7EFbwLPlkmZ8hpDUttOXCYcQQcQ1LEln1YZUGnPjYhZtlvkp91LA
         sfBZzyM44dSy+7oqeKc3e6OOJ6tOj7xFzLe/hmTB+mnoNqOUZ1LkJ9JhKHFDCjCW5OHF
         2JLA==
X-Forwarded-Encrypted: i=1; AFNElJ+Db5R2tt7EJfwNNEd5WE4fl3TYyta06rDfA9r9o38bVmhbiEvffCp8ZoyvY8z9K4s0bAd87OiyNfqTMCrHPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDoEXpzHrLDCsammfw3BG8OKhqXuvf5j/VsZXkOpgvlps84jCb
	g/sjDHHX6vAwEaPnzPoXYeZUSvWQt2617UzxfAZ0O7MQA7PuYPIqo1r9+60pmckSIWk=
X-Gm-Gg: Acq92OH/qZzIUCjMgha42hExwWHHOjheMISOEN9hSzoVzM+XPS2kvF3XmjVwaaAZVt6
	SJUTsatErsxQdXIZCXQYlWkFZO0rcIAHU8VkXZ7QevpEM2+HQmcdIeWIjMk4oFvwfpx1giWQobN
	JQhRn40M7JNy6HNMoBqqijF8AnTSGgBf2iB6cMdQ4QNPUrr07adNY0WeFuMzEjWzQREAtWJIIDD
	2O/wIcSFks8Q0KoThtZAWBruTeMTZLumLsgkBvOPCD/jsWfvEAxnrfMEF2sLgsWc+2S604dmroQ
	8xgh2jAal5sceZDdLgN9S0RTUyGm3H8hL2GQ3vMifggyJcqN7ighW2W6m64h3YNsl+4EUEHiRtz
	KML9cTkFLt1A5NW+XYwIBg1Dwt9hSIMoowCgkwqpfkqUfZDodZZwtSymAVTkgni11HlC9Bmi3iL
	ei3u/PVEXl0/BA1QV5GIhehuqM4Cl2FZabmVGGjVDptBBnCtfx/90=
X-Received: by 2002:a05:6214:808b:b0:8cc:f135:52aa with SMTP id 6a1803df08f44-8cee5ffe18bmr244656026d6.21.1780884654739;
        Sun, 07 Jun 2026 19:10:54 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fc7dsm151466216d6.5.2026.06.07.19.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:10:54 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] mfd: mt6397-irq: Fix PM notifier use-after-free
Date: Sun,  7 Jun 2026 22:10:48 -0400
Message-ID: <20260608021048.2577577-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_191056_632517_A3495797 
X-CRM114-Status: GOOD (  12.92  )
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

mt6397_irq_init() registers chip->pm_nb with the global PM notifier
chain. The notifier callback uses container_of() to recover struct
mt6397_chip and then dereferences chip fields.

The chip structure is allocated with devm_kzalloc() in mt6397_probe().
If probe fails after mt6397_irq_init() succeeds, for example when
devm_mfd_add_devices() fails, devres can release the chip while the PM
notifier remains registered. The same lifetime mismatch exists when the
driver is unbound.

Check the register_pm_notifier() return value and add a devm cleanup
action to unregister the notifier before the devm-managed chip is freed.
If adding the cleanup action fails, devm_add_action_or_reset()
unregisters the notifier immediately; then remove the IRQ domain in the
remaining error path.

Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/mfd/mt6397-irq.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 5d2e5459f744..8947f7e732fa 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -169,6 +169,13 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 	return NOTIFY_DONE;
 }
 
+static void mt6397_irq_pm_notifier_unregister(void *data)
+{
+	struct mt6397_chip *chip = data;
+
+	unregister_pm_notifier(&chip->pm_nb);
+}
+
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
 	int ret;
@@ -233,6 +240,17 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		return ret;
 	}
 
-	register_pm_notifier(&chip->pm_nb);
-	return 0;
+	ret = register_pm_notifier(&chip->pm_nb);
+	if (ret) {
+		dev_err(chip->dev, "failed to register PM notifier: %d\n", ret);
+		irq_domain_remove(chip->irq_domain);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(chip->dev,
+				       mt6397_irq_pm_notifier_unregister, chip);
+	if (ret)
+		irq_domain_remove(chip->irq_domain);
+
+	return ret;
 }
-- 
2.43.0


