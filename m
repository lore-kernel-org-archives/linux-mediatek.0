Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54B4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skMeAJn6X/DfnTFTyz+7tfbCy+mA2SK4FMYFrEHr5lo=; b=v2zYLo3E2fI84a
	vVSLM4/edcrVagxO22O0vdAWPc+gNRktyen+ywsb9MM+TYjl7VnJRXj4sOAqDQ/s1NSnfw996PH+3
	wkGyJDMWhhriD1qztOK+yMf5fkqV00OZcfrigvKvx7cwY6D2kfQujLlKWAYRu9ixknx2xaL5AcAP7
	a/Agz1uGBxsZjQwqARtmRypgaCuMnOVXBzblKcVKnIT0hm7dcLd/FIms35/cV6rLCG4sYM1iiPfzV
	7x8lfzxOWktalLvF0JBeZhrKgNNRDOHryi9AEwXkU/s26PbiHjgQhvM8kX9gPmLXQP3yQdsOv9A9V
	KnStezhQyCRIOe3Cl3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuWP-00FHuD-AY; Fri, 21 Jan 2022 14:04:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuVm-00FHfJ-6S
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 14:03:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id v123so18196402wme.2
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Jan 2022 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ubz92V3MNOcnXuX2tQRXSV5KJOVjCllK6LUruWkrRxU=;
 b=kHpYdrnVSjlgT6Y7rsIIE25S3iFVvp2QHcJfQ0aPOci6HIAGnbZ1yuN19J+BcTT0Bw
 YtGdz1Xb7wbSVWlfVFcs13ntB8C/N38MquVtWtAmKuOowMBdEZ2w5JtWg2Ctb4eiowtE
 Dqq6WTpe9lbyxxKoF23+0JVx+JGH2W4L3FpuBEs6zI0qjTDwlkOhqQ0AA/SZL3Iirrgr
 ewlGeeTaxzI3UKDAG5NBpv/Oyh01b9s+LDK6vMJfOqpsxKFFREbM/vsI5lgywsksGlST
 UBsRRY+4pBkKgCVN/4WeqltsOoZGvS3uFtzc8qLvpo7jbhOnJWCZnSGzFACJ4I5Bubai
 gpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubz92V3MNOcnXuX2tQRXSV5KJOVjCllK6LUruWkrRxU=;
 b=RimvNEcxMnFRc2AGYQGZnwJYqfE+bnrN3vMhTsuied0o6hAegr2fTe9l8Apc9OM4KS
 BYeAChb6lpmFcQCTcLU+fnpduG3ylPelV6sE0qNWAuJcfVQIH6Vs6MvIGrbbOWp635k8
 Qme+F4fzglhG1/yQ9zw+wpl/Jw5A4hraTmSYf3U2JrJHIyNSNXh1Aifpe6eo7cd7nQOC
 C0EXhVp71VAPaqauSHtyVlpL1Syz8pTrM6t/mgGb32w5aC/S3zAv+ABu5ft3drR/Rgh0
 kxlMoj4qtMUidHP0hA16wLv+peEkh7TGbiNWTU0heWz9PCFV9weUWV7S87yNh++Gbb/w
 B9YA==
X-Gm-Message-State: AOAM531S8NjZ+cxs7bJXml4zskSEncwUWRjxsLpfUFFh5uoMZckuHCeP
 aLmUAb+t2VkSqqnj5Ydn0ikODQ==
X-Google-Smtp-Source: ABdhPJyT2dSh0BWpE3RsPLYyk9pNAlhiRIXgl2BBXrgRPQOeTr7YVMe4x28OyBuQ/pfFpeQImqsXhw==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr3927973wrr.403.1642773808449; 
 Fri, 21 Jan 2022 06:03:28 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr.
 [86.201.52.205])
 by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 06:03:28 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v4 1/4] Input: mtk-pmic-keys - use get_irq_byname() instead of
 index
Date: Fri, 21 Jan 2022 15:03:20 +0100
Message-Id: <20220121140323.4080640-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060330_299330_190B6290 
X-CRM114-Status: GOOD (  13.24  )
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

Some pmics of the mt6397 family (such as MT6358), have two IRQs per
physical key: one for press event, another for release event.

The mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 62391d6c7da6..d1abf95d5701 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -241,6 +241,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
+	static const char *const irqnames[] = { "powerkey", "homekey" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -268,7 +269,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.version = 0x0001;
 
 	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT) {
+	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
+	    keycount > ARRAY_SIZE(irqnames)) {
 		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
 		return -EINVAL;
 	}
@@ -276,7 +278,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	for_each_child_of_node(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
-		keys->keys[index].irq = platform_get_irq(pdev, index);
+		keys->keys[index].irq =
+			platform_get_irq_byname(pdev, irqnames[index]);
 		if (keys->keys[index].irq < 0) {
 			of_node_put(child);
 			return keys->keys[index].irq;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
