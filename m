Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA500C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCg9CNB7W1hUChdW3h+A+ftPiD38kaKs4l/gFKZ2H4A=; b=OVek+0adxaGP7+
	pom+CbqoxOqBa1yOuv1cG6SlS+ooYy2rKLdqWnWvByO6iGpCwO6gxWrIWaFxm0M6s9O59/0uM/GOx
	wuref6m2mP/q+agWwrWILA8dkQ18aBoZJB5F6WcZYngx8w47wl2S9IFscy1pBmTSCD6N5XcyKDqGT
	fsTlCrevtUTdu2ZCVRx+EHedjFVB7i7GZW9NK5IxCvCHeAyp7V22fCdGf5YKIJoZIfd9uNprIfIgs
	NFvDpuq7AHuArMmNBpPOpXp0Axwh5sxpZ57imiqjPTLVnDUse09zi4p4acJ25E0NXBqCOG6/NL4eB
	cdS2+n5XVJ5FVvicxlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLiq-00Eokh-Cs; Tue, 26 Apr 2022 13:59:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdJ-00Em1H-M0
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id i5so6528747wrc.13
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qek8WhKX0R1hchr7sewuE/CWJLJNrj/b//Vrg13RV5s=;
 b=uM2UEk3aImwHE6qFhV3CyW6+TuirIyp6LnmblEvuDSJAZMIzZc1m+gOFbqP/RjTQEI
 HjG/j2jhXKM7AwvpWXiR3m/hN5fyUxXZFmNsHUxkOSgRW3lDZU/vryXlk85JzE/hFMs1
 B+7BTJUsQEAlPnrroSd49bUYmEjRxYx88fHT9axNXJZGKupxGuTs/3fnc7fbnkjrMlfm
 xxoF7nBpXQAaVNGgMHdtTLzd9B5dHKR8n+Dd5Kz8vlpMeA5Nm3W2E6RGleTrzyi/O9i6
 4bwhOeLOwvOla0GTEMCNp+04CH2vD2i0oNR8S9XF2vdlto4CU8JTvnGnAo7MvtTJc4cJ
 4hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qek8WhKX0R1hchr7sewuE/CWJLJNrj/b//Vrg13RV5s=;
 b=Uea3qnTAJUsnripBroBHhe4YOabV+VS1zF0tGbGxWFM/fYJW0Ts8U98i/TPuK948/x
 0HXB7+RnVNpcxZ1BakcLT4YG91MXfa1RYn0aKzSjcU2Y7aTud5KyLSeyGKRXs3osJZM5
 x99EpZhUdNWrNJRB2LSLz8qTbkrUfRBrj5HOWfO2OFJHcmwQXRxNImjycP4f7sQAFhg5
 mVImUhBo9WbFv+nKMEx7e5j3dTYWM6veYmcvjwPkMm+W2IHU8X2QI5x3vvIw4oWKwWvx
 DGatqt9oPIq2Vh989/JBA4cyxX78cKB54d2Vt853w8NyrGG0j97FUDLPiHUeunkhjUyD
 0Clg==
X-Gm-Message-State: AOAM530/LCvByN5sIeiOfrOCpowJE+2/VB1dhM5b9i0WB17ww/lg7xBV
 QvMhTfvpKdhtosD/C93jYl8q1g==
X-Google-Smtp-Source: ABdhPJxUR9Jtuqq119l4xJed5Lzq8/81nYLzjxAkVb3AcK+LTLpg18lkx0agwYhFDZnMSWgT2t7s5g==
X-Received: by 2002:a5d:47c3:0:b0:20a:d856:8a9c with SMTP id
 o3-20020a5d47c3000000b0020ad8568a9cmr9762114wrc.181.1650981216041; 
 Tue, 26 Apr 2022 06:53:36 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:35 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] Input: keyboard: mtk-pmic-keys: add support for MT6359
Date: Tue, 26 Apr 2022 15:53:11 +0200
Message-Id: <20220426135313.245466-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065338_078659_43C77CF5 
X-CRM114-Status: GOOD (  12.17  )
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

Add support for the MT6359 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 609b87afd020..115ed4aaae81 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
 #include <linux/mfd/mt6358/registers.h>
+#include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -87,6 +88,17 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 	.has_key_release_irqs = true,
 };
 
+static const struct mtk_pmic_keys_pdata mt6359_pdata = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+		0x2, MT6359_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+		0x8, MT6359_PSC_TOP_INT_CON0, 0xa),
+	.pmic_rst_reg = MT6359_TOP_RST_MISC,
+	.has_key_release_irqs = true,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -264,6 +276,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_pdata,
+	}, {
+		.compatible = "mediatek,mt6359-keys",
+		.data = &mt6359_pdata,
 	}, {
 		/* sentinel */
 	}
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
