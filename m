Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2EFC11F69
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F87613D3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F87613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aj1ou4fChixGN6BjeNz6P5vEeCpYTblfLZdqAZPrDo=; b=T39+wShV97NIDI
	XyPzPpwmKHpBqLqIPDxfT72cA+25BrLzdisSSs0HFh0ZPNTFIhxYmVFPgmEq5ZbdYc9cxV62qPiug
	K11KqIZTDAmMfy8YqWUUQZkS3o11SEUYaI3Mlt+QC667QpkAi0hFVCWRqHJpDR45/wSj1Y4ROqNk0
	jo9oQ8ldM/OtF6HCLHi4JGFUiO88pyAjd4zcrOm5pdtfsXDVvUowWkB0vItMRA/Z8FG49MNYVeIbd
	mdlD49f/0E5ucpFjvKPS1syLzhSVF2LzjLQrPyXaCgrtmMiDkRf+srkTubdvowGjoq7ZWArtD0Nql
	pv1IxJRNPsuFeMS70R1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJT8-0039Q8-0J; Fri, 02 Jul 2021 13:44:34 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJS3-00393B-TC
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 13:43:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id a8so857445wrp.5
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
 b=oww/EIcYIkkGjYZeUZhdFMuaI/3hIzPWI+E0BV41zo/upZHpHgjKSmWv/rt8AcOayF
 p1OcudJNb6uX5mfCUjL+BLpj3pk+0oeRyUbDoEZz0YOAgU6mPUtMw6Qpm4Fpe4Ab6VMe
 AvYm/b9U3vkmB/LcPaf00sRbmqOunnJbmsi2fADxIqQGhZE7+IXUqnBuQqqxwmMneEhz
 Y+tBt7uihF3lYsN1j4O+8oJZJ9eahTis77T1N3tTXkza1yq5XC8YOia71tlG5XUCuDSG
 TfXOWyhklJidLU/YHElIXmJ4YhnBzMx7h/nlYbH8KLELC/X2RQZMlmvHxZFfPXcVlpfx
 9SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IEDSCcz9DuURhhNfs/tK0QYp1lnSjVV5pxew10G8dSk=;
 b=pmlFWV8sR39iBTkz9iccj8OzyDS4SwekJQu8JDEjcbDnJbN0XMB4R1b3mI/djuiTMF
 Ci6MQk5qxot9ODBszUIB2K0czDBPZ73pKonxsAtglbUqUAfi32nFy9EpKMODTeaUqNZ9
 5hF5GZBOrg7xbcz+OElPfG4ajuGnxKEHYGiW1zLdiD9XebGlaxaOKeM5Y89z8btKqmbi
 Nu2bMbPTuiMCcKBcjDJiKLcpci2tA/9nJvKFxofqUlQQ3d6oKsFOj3teQBi+gJ4tQ50Q
 gahQfOIhgLGeSbGnN55CBtbuuF46M7b8/KQVs+jrUFslZ7VPw09S2v99JRXLet/W81GR
 aEYQ==
X-Gm-Message-State: AOAM531QBIF3eXm/UY7zs2e+QgDefZjBJph1BpigGzG6VOAP6wQyoH4m
 Ncr1HL27il/lWSL1iOp2i+mgHQ==
X-Google-Smtp-Source: ABdhPJw2So7Imsur+MFkTU8FDDV/9iBuIT90pZGEkhPsGPQkJRg76z1mW/l4fUwTrTI5R3Q6dIn5DQ==
X-Received: by 2002:adf:cd85:: with SMTP id q5mr6032107wrj.214.1625233405464; 
 Fri, 02 Jul 2021 06:43:25 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
 by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:43:25 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 3/4] Input: mtk-pmic-keys - add support for MT6358
Date: Fri,  2 Jul 2021 15:43:09 +0200
Message-Id: <20210702134310.3451560-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_064328_008565_FDA7D96C 
X-CRM114-Status: GOOD (  20.06  )
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
