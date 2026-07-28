Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3AFC54F51
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhOoxyY9XuY/7ZJoPHMRfd57Gx1dlBIuWfd2YjK3Wy4=; b=ZXLAV6l+WoYE31lsFAoe9y8e0D
	cyvh87QCKRWaRRH+fJHcrpkM7CqBs+DpciR6uqejrPYpZDwEyRPDx3ZYZNAFNMxObmihbfGbSIALM
	KJIh5H5qzZNkTEypGFgxprv7H8DrX5dAVeP/nt1gKDX18et8W6qNdw0HynD5ZJ2BDPZY1QTne6ujA
	RwUkaBc1ULCA9/IeahUoti2B1JRnOYaspH4cgbXX/8Mt69RJ4ULd9hCOkWnUfH2RG8xtXs+U6nKJP
	HX4QcIFBV7mzVUrKDSPc5FTB1LP/C+hH60dNq09UqSiqnYyMClX+DDOroQJ1Bsyf24Jmq3XGIea5o
	fOmW9APw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopIE-00000006JW5-1afy;
	Tue, 28 Jul 2026 21:24:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopI5-00000006JQO-1IAw
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 21:24:46 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84e27035206so308727b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273884; x=1785878684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhOoxyY9XuY/7ZJoPHMRfd57Gx1dlBIuWfd2YjK3Wy4=;
        b=gHWA8h5s/Kj9mIpLglvYI3VdExma4PEvqG7y8C7+C9FMUvzTzyyaLzOVKWCGAkX12q
         AW+IYcLQhS8ikAKfWKdGjCs099d5+tgiO2g3fxId6ycqLURIFnRkiyWXaCCTChMCrHyI
         tvI89nlarWUqdNWusr/h8xl7HcbNEtV0ZRQPa0b/JfDhEEjnkDR+3WDIfyFCvpyQvyTK
         Mw/80sYH4pxMvG6ERS03ckYaoFFNWuD+mDQpeWABaOAcxSUzXdecGterqYtWmKn/8pX1
         g7pL6EVQdgcGMMekfWsS/O+5CNCuSmZCKv3Ran3TfpYcsw8yRPU9flHttN1qXXOFN/3D
         RE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273884; x=1785878684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhOoxyY9XuY/7ZJoPHMRfd57Gx1dlBIuWfd2YjK3Wy4=;
        b=SyodVha/3E4PvMONs9JA/F4uq+nbXTGKBQk2cXaSr3Y9k+IddfrLYU4dsd12zlGm39
         wVwgFUxZTSVfn0BDUb9VBxJrQZqxPEa37PtCOdA4Sdt7ex8kMPe6GOyrBW18/Uc0Y5sq
         cHOvsT9OkiQwKXHt3nKm0s1z6trIo62plPHX/+twg68wcCQveoLzQk0HkDEMp2acpk1l
         TVeKIaD5dyLXylyZMBdqo6hJB1rv6R4Ra4MMonfeetbOAUBdydm3MDiVZxNKMuYevF4l
         9QEQWD+wRV6r3bmbqKtc0eIDpCVf3AZbgVAPOb1qAw+/70es64rfaAiRn4ANdfOa9A8i
         QHBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrS2ciMCGBrzG6dwkMChKxtafcXmfDVJd1na16am6WGgL7lPPXrXs9QLHwWIZ6EgEvE6j2tsjNPDZRV5hNtow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo1nM2Qnymq5tdAeZryM22wrkS6A+O0QHlvVAbMipL503aDT2E
	2lmw1tmhu16s8IE94x86WyF5AA7pGA8OvvKNkpFQXb8X9lJ96fxUrEzw
X-Gm-Gg: AR+sD132R1oIK3ZmLxt0DPLhU298JCFOOYuhYL3J787Jb6OTOI8EiEIbA7c3NrBq4Yr
	MNDbFy2O1FWP/Bs+FE/H1TaB9s7ZTVzqZy2emCSO+X5Dt5FbhTJ8quwsJ8Bn1FaHwZyWK1uQgM9
	AteDeo/OuMnIwYvY92TWPBzw/6tL08/GvQsBxskSHsHqFA6rqzhrXZB2RrqUKdmu56w1i0oqY40
	DY3Njw0YXfGXD0vvnxPJFdTkhK1S4VlaGFIAsNIrmAADRFi+FDvbhJOTuKfC8zeK0Hylmg16ben
	HWbBBTqUw8mNz8FyBQ2eMUUmZ9bNc0MgGIQksrRN0V6AscgAkyxeT/4IrD/ajxzDtuzcCtJJqAG
	GbyrQ+mTUSKolsFvT57HLGoL+6lwWIdGGBNM9hlM67uqD7b71XFQxXEus/1TTQQnx2pzA7NHkZb
	OoceM9twH2NY/N9U+f62CTyKYkxK7cMR8/Ehpo/H60wz9GCwNt2U9Dzii+rUKf8cRLum5/o/wnO
	9Kj9SCZ2purjR3t0DjsTA22ib00Kk/YLFxpuP5iWISPHeVm2XbQdVcLcXp39gp/7h6TneomoSxu
	ZybiroywrvABX7jcdrFq7tv11n1uiyjhD92dEuNyXX3yQKGs
X-Received: by 2002:a05:6a00:10c6:b0:848:2f84:730 with SMTP id d2e1a72fcca58-84e932e462emr3887694b3a.67.1785273884409;
        Tue, 28 Jul 2026 14:24:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb83459f6sm80892a12.14.2026.07.28.14.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:24:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 1/2] Input: mtk-pmic-keys: use of_device_get_match_data()
Date: Tue, 28 Jul 2026 14:24:37 -0700
Message-ID: <20260728212438.54078-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728212438.54078-1-rosenp@gmail.com>
References: <20260728212438.54078-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_142445_351096_C1039BA5 
X-CRM114-Status: GOOD (  12.11  )
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

Instead of open coding it, use the proper function.

All entries have a corresponding data entry so a NULL check is not
applied here.

Remove of_device.h as a result.

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
2.55.0


