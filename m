Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24445C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E0061400
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E0061400
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=10OmsOy0R92PQJ+210563tFAZF7JLKpsSskTXl/JhHM=; b=m8xMg9jYLAMqYaC+SkcQij2CA
	6i2PiJOXv8AQUksZTfVCy/yQZjUrf0E6PmOUwiOhkxBSKE6XVpoeuuLXpvef+qM2JMjVmZLQhRO5G
	IAu86Km9AwaqAr4jkiL/IEjv5eLybs5QfbqLm7zmtneMUHPWTGjUCOzYKi1XD+edo4/4IjHcnhwyj
	+pPzaHypPhPkVGXFaTyI49JIeGwzTS9QabTtWol+O5NW39vsOzr098A4bMGs7nBJ1I4BXg1nXhM+F
	piBi9CXU/5k6byt+ldoDPXEM2i0CvsuC5mQIljpPn4ZLX7CmJOUyGW2/67/EbX/KKyaG+WZ2qaTnA
	zgwyBIwAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnHd-003rTJ-3f; Wed, 28 Apr 2021 16:43:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGj-003rH8-U3
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8MBBaDUhre2srLQsKuOsbdZLzzPzjDADAo7LfYVNdh0=; b=mtMuVsv3RK78xY17A8FTSoTLVd
 psvrmk/Y1Dly7uk0KNjNjpNw4TOkCEqeANYLJ2WJPKRXJ7ZwfyiBHb94qGBEQrRZT8ePvJdUqYkAc
 cjYRxUlbwMTniXRgoGymfn5WT4JCX3PZWKs7NM993o2+AacHHwDFPiSxE6XoNmk5NTrXfp5n5hSPJ
 b2E1uEKln+S/rZ2Lq60uYezFKlOou6Oc2LyKIX+XUv7hMJWY1wGZzf6gSMWWkptmv5lQonry8OYUJ
 5nzodG1urVKuHmqLfRKpUl4n/dW0lv9GrGqUxufPkpZvohsTKTNN528b1UO/3CMwjb1U2HyDEiqFx
 eWbCJLkA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGh-0001ft-Aj
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so7233588wmf.2
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8MBBaDUhre2srLQsKuOsbdZLzzPzjDADAo7LfYVNdh0=;
 b=dMf2Rf068EIMcUbF86uGcl7y+VrBjvrEi4miS1537sNXIbP9JquFm7dJ5IeYmFN76Z
 pGvXL3FrZO4lrlvufUenqE3iR66VJuHsxG6s8CYAd8JqLwKK8J6vtXO2JvN6a3UsPNB2
 5z26JFooDrce9sSy0NcayH18fKq18fogX8pAclxHfsf3f2jjC36M3nMpCwU8mbSYG5Y3
 Fu1OSc3ft1OuyDI7B2ulWyAHtJ4EwVE+QPl+nVw8ZYZsnxicGM+BxJsSAko3JvYJbgbl
 a/72V4mirXmmtfDg94OEWEjpjKeD+z7QOHkYiRIf9OOu0elrDUw1F84Z3llTyfLmntSh
 lbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8MBBaDUhre2srLQsKuOsbdZLzzPzjDADAo7LfYVNdh0=;
 b=IuwLjcXeBifoS5AzMnhpHvv96SG0oLeQfM9WbNlsGVNRTh/aYuzXCOOkPwOs+RbMfQ
 p3eK3/yUQgSP84QyrDNsdCGwXJYjeZTixyWs4D+FhRyDB1Szmfb06Hbf48pUCNAOp1sC
 zELQAxrRM6+n6oH9oUF3wtmpXYFY/TCvFw/iC/lfwSTmx7gmVZKhtIyv6rX6l55o/D7n
 Uy5d8HinlRpxFLogYQDk3VvkVyYx8wng7HvIqXXBnbANqjmqsW3LvnVymEBoNOPgFy3o
 qWD5jnuUKK5sVbYulTQccWrR2vB6+nqY1MMuzmSdp9qQCK06UF8htFIU5yg3U65Fy8c8
 3b8Q==
X-Gm-Message-State: AOAM531boqk6tXj/SKPYBE6i2ttq3adkEDHJ5RDW7CgxLL7dRZGh4EAF
 Yu44e7WX0TmZAXVDsJ36+IJEfw==
X-Google-Smtp-Source: ABdhPJzqx+5Jrn6TxR9YemEiPetOXDFd1ci6biCyGonApUTwl6FfBsvBadevq0hrO5ugKbb/NwxzKA==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr33059054wmb.12.1619628150175; 
 Wed, 28 Apr 2021 09:42:30 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:29 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] Input: mtk-pmic-keys - add support for MT6358
Date: Wed, 28 Apr 2021 18:42:17 +0200
Message-Id: <20210428164219.1115537-6-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094231_393720_042E3CB6 
X-CRM114-Status: GOOD (  18.95  )
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

MT6358 pmic keys behave differently than mt6397 and mt6323: there are
two interrupts per key: one for press, the other one for release (_r)

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 49 ++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index b877bf98db38..c635d612bd44 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -74,11 +75,22 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
 };
 
+static const struct mtk_pmic_regs mt6358_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
+		0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
+		0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
+	.pmic_rst_reg = MT6358_TOP_RST_MISC,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
 	unsigned int keycode;
 	int irq;
+	int irq_r; /* optional: release irq if different */
 	bool wakeup:1;
 };
 
@@ -188,6 +200,19 @@ static int mtk_pmic_key_setup(struct mtk_pmic_keys *keys,
 		return ret;
 	}
 
+	if (info->irq_r > 0) {
+		ret = devm_request_threaded_irq(
+			keys->dev, info->irq_r, NULL,
+			mtk_pmic_keys_irq_handler_thread,
+			IRQF_ONESHOT | IRQF_TRIGGER_HIGH, "mtk-pmic-keys",
+			info);
+		if (ret) {
+			dev_err(keys->dev, "Failed to request IRQ_r: %d: %d\n",
+				info->irq, ret);
+			return ret;
+		}
+	}
+
 	input_set_capability(keys->input_dev, EV_KEY, info->keycode);
 
 	return 0;
@@ -199,8 +224,11 @@ static int __maybe_unused mtk_pmic_keys_suspend(struct device *dev)
 	int index;
 
 	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
-		if (keys->keys[index].wakeup)
+		if (keys->keys[index].wakeup) {
 			enable_irq_wake(keys->keys[index].irq);
+			if (keys->keys[index].irq_r > 0)
+				enable_irq_wake(keys->keys[index].irq_r);
+		}
 	}
 
 	return 0;
@@ -212,8 +240,11 @@ static int __maybe_unused mtk_pmic_keys_resume(struct device *dev)
 	int index;
 
 	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
-		if (keys->keys[index].wakeup)
+		if (keys->keys[index].wakeup) {
 			disable_irq_wake(keys->keys[index].irq);
+			if (keys->keys[index].irq_r > 0)
+				disable_irq_wake(keys->keys[index].irq_r);
+		}
 	}
 
 	return 0;
@@ -229,6 +260,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6358-keys",
+		.data = &mt6358_regs,
 	}, {
 		/* sentinel */
 	}
@@ -242,6 +276,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
 	static const char *const irqnames[] = { "powerkey", "homekey" };
+	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -288,6 +323,16 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			return keys->keys[index].irq;
 		}
 
+		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
+			keys->keys[index].irq_r = platform_get_irq_byname(
+				pdev, irqnames_r[index]);
+
+			if (keys->keys[index].irq_r < 0) {
+				of_node_put(child);
+				return keys->keys[index].irq_r;
+			}
+		}
+
 		error = of_property_read_u32(child,
 			"linux,keycodes", &keys->keys[index].keycode);
 		if (error) {
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
