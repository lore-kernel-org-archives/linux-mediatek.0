Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7116C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z75PLQFF6MBsYNZ8Gk/5zXO71niZdUcwk0ZmJXJ+pVE=; b=2WyPn6LkDuCjcw
	uoLSAZx/4W/RbPZlxt4SI9UONs6FxN33S0Nt3L4A0AIg4N4uVH68zsAuFfugDxlX29H/yWkxbKoX3
	TnAib3GSNfISK/hEhP8hQaO6SYAyvfrPKc8QybP0/Hlc4j1tTnycbBPhL954WRj/C7X/14aG2ICdK
	sxSg3gjAFGSlsNF+hFiTwh7Zkk7uR4zzKjaf7fSB23BVsiotLX1ukC8eiQ3Pwea4AO2OiwMCrLUzP
	nZUBQzPspEqNgA3StvyxaCVCsVc4dNma1bjQb9SNX+J+erSlCQV7s3Ox/VkQAytVepiQVSzte9cBW
	0da97tJDmAsS9rU2Jgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuXf-00FId2-Oj; Fri, 21 Jan 2022 14:05:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuVn-00FHgw-DS
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 14:03:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so22565613wms.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Jan 2022 06:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uRUXk6sZwU1Dm8EnlU4ajTADGqEPVssNhNqpXeZPCjA=;
 b=HF6giAfhg21Z5Qj/qkjxfQOUQRc4KU/MZ+sn7rii/tbyuHasWMuJsBSluXAxe4GNXJ
 Zf4CRVGJdDzd8MfK56tOy81sGGzsz7dUREw+lld47qx2EM3EZ5/NMkVE17dMaLJLYsXW
 Jtj4wx8GmbAn82DoRfiSPGxlPpgBB5bPWQRZCsAXuAyUoe8XmHNOwcK8SSxTtUe2fZpW
 BNjoK3EJ/C4FE99eD+JnZ2wX3VwrUrTwiiVWc3XE2t9OtufQN6fhh2RPEMEKQYQ0hzc3
 ZDlKrgnk52QFWuXf7vmkMHVvIIOeINFUsQnOJ5JFSXC4R80SXAipnRwAj11JoRcb2jHw
 38kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uRUXk6sZwU1Dm8EnlU4ajTADGqEPVssNhNqpXeZPCjA=;
 b=v9bNj2yc2ki+fU+8dz9JB+xJR5GeBGSHW2WVKoNZ5HgDRs33A/wMTTQkdxKR4HssXS
 D3vd7roaZUENBvYs1z2Rh0Yr3H/LkUplCr1I9gBfCVcQS1MHubSYzIQ2r2NuaZXfZOxW
 O0RdCLoIItmaxySAvWflse7sPL0jWB3bThR9jHsTJlN5/BEO6cj3zGQMNf9z6w2Ul03L
 5BaEdnA+Nl4bnFdwizq2LGL66VHt6Q49AnsGm7iTBhf2DmjkzIl14ggPr93c7Q3mHtKd
 uhQRYP9+F+E1lOgunaV1K+xXvfjP53MM6vDOkmIta3HY4tXfhdIZ6/LYXdykBmFYpsmq
 nBsg==
X-Gm-Message-State: AOAM533aFzXpjDMfKz+k+EwbJBrQX4kfIblUVgGBKzv4JLX23X+EQidf
 BL/+r7PqWOvWWUNOnqvp0EjlXg==
X-Google-Smtp-Source: ABdhPJztvymbqeQLyXvFc9GTnJXQZ2XHJGlWZcHHjT1pmHeXoPL3qFS4e4Uv1hxCx2kJb08Byfirbg==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr3998916wrd.495.1642773810098; 
 Fri, 21 Jan 2022 06:03:30 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr.
 [86.201.52.205])
 by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 06:03:29 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v4 3/4] Input: mtk-pmic-keys - add support for MT6358
Date: Fri, 21 Jan 2022 15:03:22 +0100
Message-Id: <20220121140323.4080640-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060331_493926_FC5802D5 
X-CRM114-Status: GOOD (  18.69  )
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
 drivers/input/keyboard/mtk-pmic-keys.c | 48 ++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index d1abf95d5701..c31ab4368388 100644
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
+				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
+				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
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
 
@@ -188,6 +200,18 @@ static int mtk_pmic_key_setup(struct mtk_pmic_keys *keys,
 		return ret;
 	}
 
+	if (info->irq_r > 0) {
+		ret = devm_request_threaded_irq(keys->dev, info->irq_r, NULL,
+						mtk_pmic_keys_irq_handler_thread,
+						IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
+						"mtk-pmic-keys", info);
+		if (ret) {
+			dev_err(keys->dev, "Failed to request IRQ_r: %d: %d\n",
+				info->irq, ret);
+			return ret;
+		}
+	}
+
 	input_set_capability(keys->input_dev, EV_KEY, info->keycode);
 
 	return 0;
@@ -199,8 +223,11 @@ static int __maybe_unused mtk_pmic_keys_suspend(struct device *dev)
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
@@ -212,8 +239,11 @@ static int __maybe_unused mtk_pmic_keys_resume(struct device *dev)
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
@@ -229,6 +259,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6358-keys",
+		.data = &mt6358_regs,
 	}, {
 		/* sentinel */
 	}
@@ -242,6 +275,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
 	static const char *const irqnames[] = { "powerkey", "homekey" };
+	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -285,6 +319,16 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			return keys->keys[index].irq;
 		}
 
+		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
+			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
+									  irqnames_r[index]);
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
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
