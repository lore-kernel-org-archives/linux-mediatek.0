Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36922CD343F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 04:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N1NeYPzkew/lg8N5iZf3wRciXirvXJuukKHofoQ/xo4=; b=oySKM00MzqRb+RzX8Az8SJx2sN
	BHHMUKbonJJws2dAKPAKK37uu/ADsSZ2fs7z9QccIMZLCdZOR6BbHt0bBYk/03iX+q1OwkPdOx+o6
	vD3wxtUOxyBeSYDrzgsT5baBrqFKDEA246TDDLgKnwvniEFM7ybuRKz0WkbB9OP6/u7ZlZitMrHv4
	wbICW9RHBmh1UZWgU7BvD+RHf+pN8/zTejeGhu4XM93epkzlzew7QGYLrIKkiCBWCJLoZ5Lqf+g/7
	Kg5RqdMAuZRWAuG5+ta/IWRu2QXICnKiHTJbjcRMpPHibpgpy3PAMXo6mHgjQaBDnYLsrmZzqMtrp
	30TVSfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTX-0000000E94q-3drB;
	Mon, 18 May 2026 04:21:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTV-0000000E93I-23Li
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 04:21:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b458ca2296so12373595ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 17 May 2026 21:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779078064; x=1779682864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1NeYPzkew/lg8N5iZf3wRciXirvXJuukKHofoQ/xo4=;
        b=IY3HwRLjN4HN6qXWpO0Trq2X3i7W2oz/FIL+ZWS8x5aRkpeM7nY8BFnkHEtkGCWKED
         BWkpejkjZI4qJT2OaD0NJkpuhN4JgjhQk5Of+Cf3W1DSbgMs8iOt8Ivan/+3aDSR8MPQ
         dK90rI2CH3zP7tdno97/KFDYE/Cq4H76a7WXYmq5v4MmG2BCaLSMGtkZ6RztNccQNgGY
         tR+08pE4POatt9VQCLD8vG80Gf4UBsS1pINo+V37J+MH+XZ7L/LhK+I/SgeCIbmwnw3e
         BrU6gMHPrsZfyyoRaTF7F6ptWu8SMoFgfZO9DXx1SHpxDIbtQnSBJV9HbTlBf/F7aFCE
         kYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779078064; x=1779682864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1NeYPzkew/lg8N5iZf3wRciXirvXJuukKHofoQ/xo4=;
        b=ZD0QwzCon04vF5HmbuTdqGzlbGpxs34j6gsXLdSxb4rQzcELn7ORA1EN276Ix/DznI
         TUIO2QjR5czfDzvp5dtaPekOngesghQXD+7aqGH1t3bFHv5in8mObIgj+J130LcrB/la
         jVD8xVdz7sT1tGoMekAG57ELTYXdfM9QHe9YIkZATN7hamvdKDHIorD++v4e7QDsFwAb
         WvJtCrv/q2ZNeJNNBrUZdwJZfUlphnl7snpfvUgv3/Q0cKswInFc12mKoy7JdPfZyrab
         tlg9fcdMMjZ1BF0LoENScv0htNm0OIXH4kt1j1NU0VZrydBUQCXDeXTUCO0ojtTX4YoT
         7gPA==
X-Forwarded-Encrypted: i=1; AFNElJ83J4+JKirHi+icII9/A5n1b6Dc7Ca3kl+b7S9OoljP6j+K1HKbnvy5dxWNJAD/cJ32Vf1hya+hFrFobh0UXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvvzAXY3wOT6rU2HBpIsNOqu+CXruabJZvu/KOzJsalz3Qqa8w
	/vHb5CQ//daGZPv3TPGfzzWZWiyvZodEnUrCxPUVJpv9xOI673Ply6fR
X-Gm-Gg: Acq92OEIpGsnIn2WD3bIJ4OVb9iyiXpGJPzqGmb6hIe4aaKRJKQkioxdme3EY7IpqKk
	VI+GEVl6meJyg9eWra8AFKgBKYSW1XdDcvj4ccOKlDQ5cS9bNff1yRw8TR7DgyETXgNnnrAlUia
	LjxR88s6R6GFHXCxl9WlPj4v3tLXrN3h6CaWwjR+MgRffwOO/y9rh/xMShRqVQs/Z2VUWJe/oNT
	a6lvbFkunbrA4G4eyBHtHSAa5yqZaNfVgB3Azv1I6TPCz8yFaZwc58t8wifyUgCtTqIaViBUkeF
	Jpao/D7fw/h6BOOrgOVgSLAOMa21uRjZm+ympsG4sOiNmJFSJ5rxI0WJYnERNzKnfXKZaReedIN
	tEwbKs0hFbcti4ywtXU21n7yVLCxev37JmKBrgBZOfLSkcgvHntaC5AS58UwfAM5LtCY2AjcG66
	7gSOgrgYPIrH17izIxoTsCtPxTT5hJ19a8nAq6wBdtgEIy7gwr6KL5ZJ0qAaM8ZsSs1PiW1b09p
	5XFliK6sXNHuXsULK5kwEJudW4z5J3O7og=
X-Received: by 2002:a17:902:c194:b0:2ba:6013:eeaf with SMTP id d9443c01a7336-2bd7e8fbda6mr106088815ad.19.1779078064386;
        Sun, 17 May 2026 21:21:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe51sm130747005ad.2.2026.05.17.21.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 21:21:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] Input: mtk-pmic-keys - use of_device_get_match_data()
Date: Sun, 17 May 2026 21:20:46 -0700
Message-ID: <20260518042046.981861-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_212105_529435_AC903B43 
X-CRM114-Status: GOOD (  10.88  )
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

Use of_device_get_match_data() to fetch the PMIC key register data directly instead of open-coding an of_match_device() lookup.

This also lets the driver drop the of_device.h include.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..fd684ac16938 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -16,7 +16,6 @@
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -333,8 +332,6 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
-	const struct of_device_id *of_id =
-		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
@@ -342,7 +339,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 
 	keys->dev = &pdev->dev;
 	keys->regmap = pmic_chip->regmap;
-	mtk_pmic_regs = of_id->data;
+	mtk_pmic_regs = of_device_get_match_data(&pdev->dev);
 
 	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
 	if (!input_dev) {
-- 
2.54.0


