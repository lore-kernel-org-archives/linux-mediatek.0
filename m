Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA11EC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677A7610FC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677A7610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4aj1ou4fChixGN6BjeNz6P5vEeCpYTblfLZdqAZPrDo=; b=Tgd8/fO+FiHhyv/BEX93cYG1M
	8yiZJlCnoYGjNwMX0Lmo90dnA2S3oSQrgp1YmxAzKX8fbRrFxL/KWHp/GlYkEyEBC9z0qRWU/oAKs
	2PmnfQhOwRQYrntwcLU8UmQCyyUdIrPtBa1qZj9BRl7IyVrjzmuHnatlKvmEmkfuDWPHtGJD+3c1S
	XPJBflsenU7XxYGMGTf9+xng6nEYYircvSPbsMhPPC3aE5eHd5j2+jQX/jqg+x6rRbAQtWtUMnn/3
	p8iK9Q+t96mssSutZkMpzCfOzFTnc3nmGXTGEpUIrsejnZeN44veJe2GdHnqacRsa86ry+XSSLjio
	gcZFT1d+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1legPD-004iky-Om; Thu, 06 May 2021 15:59:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg4E-004bfP-C8
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 15:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=; b=YYPTrSOMz2VUAN/NIE3ppno6VH
 8YJkcP0P7Y/UK/RChDcQqovPwil7Cray+NJVZ/0fcSxntJX7zVof2Gs1JSfyKR0VqtwGsgOiMYOeQ
 /z92PKm/9hGMWTTGNLkRoWZXC12sRndgPhZo0dXK2lOzjHLtF/ZNNKN6poBHaki5skLVryHFThhST
 MSww7MulK//dU3+7KZgajAzV2wc9L6LeqezdINRBAMV6vihSy309cd/74fPejWTGetepCuSZoVsDl
 peDdWQT/J89OMjLmMQfQFph2pz7lN3sFrkO5yIvPrp2nkISY4fqmzej8MCaQ0aN0drHJFTuH7IYyw
 /5mkZnsw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg4B-006AMP-Fx
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 15:37:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4998661wmc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
 b=V/zeaR1TaQIoeM9XJufp+iP5G92k1G7iWvx0YDJBs9KSTMlmsMkOC9Ez5goto83id3
 VXJxFioSnQras5VmtoC1mS86Qn6xMuxeNrsN/w4dmPcZZwzKkzT1j184TkYmlgqNOGsG
 D7mX3kuycZVBBaJHLTu1jL1YE7cH2iwDCqLePnMy8MsUUpKaZvLyUA9YciXt4I3M7J2n
 8bFSPupQId613OvNqc/ecuxQ67Bn2wha7tcANjBBO7oitXR669EwypI8JNq+BavI82WX
 5zjHjOWvU5ig2060eSyBeA0UVJAhBeNAgxSDXHRlho7sk2UkPALdYWnKdS8RBX5s+mOn
 Qjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
 b=XcPegryZ8JZrZuuzDybv47T/vakA34301V6EYxFX5Xh7NkiH9kRnkAnSikcSqryRxM
 UEAng2HLogDZ0PlteZgJTl94sPs0cfNa+ECbJiu5Gcoo2sRbIuIIEG8KaxltdYYQVffq
 RZNMtWPr2mGR2XuVtyn2E8gx1/HP+q4JuZWF3alp+XO6ufAEEBB7FYFOrpDXxpNSKgLv
 TwCtbikbQ/wIwzlgE8sAc1YHy3C8t/0I8bazv/1n+FgYcu5XX9OebvRhKjRvC6EdcyAe
 rDtnYhTEOolmAVKJopOHFNx0WUS8/+7Y1XlZ2JJVj0XzafC7wRePIuv81dzZ+pqSIAo5
 8EVA==
X-Gm-Message-State: AOAM531dn5KEuKynq+lemvjBdSX1aYSdYIdWy7PhzuQLRDD1gm9cG8zb
 dnlA5NA8UMS6tgiDNAoPQm23lg==
X-Google-Smtp-Source: ABdhPJxAlzAXFBB33Dmk47O2hysPZnFEIjDmjMGitDd9gQpK+W5laXn9eipEYkrU5GFJKGiqW4CfSw==
X-Received: by 2002:a05:600c:322a:: with SMTP id
 r42mr4723194wmp.98.1620315449674; 
 Thu, 06 May 2021 08:37:29 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5fe0:3a70:ad4a:a29b])
 by smtp.gmail.com with ESMTPSA id o13sm3788673wmh.34.2021.05.06.08.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 08:37:29 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] Input: mtk-pmic-keys - add support for MT6358
Date: Thu,  6 May 2021 17:37:18 +0200
Message-Id: <20210506153718.256903-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506153718.256903-1-mkorpershoek@baylibre.com>
References: <20210506153718.256903-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_083731_554433_207A0CA0 
X-CRM114-Status: GOOD (  19.23  )
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
index d1abf95d5701..5496a7020104 100644
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
@@ -285,6 +320,16 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
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
