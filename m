Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C9CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LEzJ4YCcZTK5iSxuGcCtaKYesf8mH4mh88+OJy8Eek=; b=lZcoR9B7PIQSiHxXTpX6nFXPRx
	vtq6kN/QqOU88mi7WvPwLelS+ZCvn63/caB1N9HfNlydN4sUGfcaxUkE/+e3CB6SpH66GaUg8FG3I
	RcxN4HfGOdDiZ7NuVB+3CsCHHAHzab2LPD9MGeobmRad9RcAbBhDgkFwwUnJCZS1vvRiX06i0/pOd
	QAU8CrAmMU11nCNWxBmpSTGPBpz7YP1q7oPTtsZpiFkZMl+BZ4HJwqnirxSjgi5KWSo0+UsbmU2cF
	J+2IaQlG1giybghTPwxF6ny4++yshnl3Ld20IqopKDlohzCX/gpacHfCo7tBbCu4EcvdQ5ResVT0W
	S4g3Z/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5qw-00Ei6J-Cf; Wed, 05 Oct 2022 14:58:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5qH-00EhnC-9A
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 14:57:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a3so14072052wrt.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=5LEzJ4YCcZTK5iSxuGcCtaKYesf8mH4mh88+OJy8Eek=;
        b=Z0relTcGaADogcmitxZSOKrdaUpVfsm9MGuGr/CaYAJCr6pD4x6Kuo0vGjhuNUjOR0
         m4tRsM2rax7gyedn8FMTUFRuHpRkfDRsSO7ffhEH7Cp9f+n2A1e1xVXP77w8sXMfEh0M
         xR9n/U8mgmIOVtkd4opFpN0i+NmS+ERxxICjyYnQzFAuk9Vx2XUFS9pchGvJaxj3iYTg
         adElNm9hkda9I/struStqpEsd7/KkjXiw1iEbU3fGBx8hlfEd/4Q84sWtSPJo87RGwrh
         70aYx0hsI2QEtbXc2cU8q/edTx8UzN4hb89M1vn2m5AhneErnQuKBhh3OfUAEhx9SNK4
         VHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5LEzJ4YCcZTK5iSxuGcCtaKYesf8mH4mh88+OJy8Eek=;
        b=Q4PJBo2mUPSWs5ZISp9ZGwvLgcDEah/sQYmYSwUIyOklBBMJP/Jyx09N0Rok1bgw80
         2Ig//8nRJ69izAaREr/inVXkB4H5IMialpeyyX8aOg3x/uOS29D0WQGyV+0Y7F3/D/r+
         TRu0cud0WHbVYWnnis2ShxSZcq6NZWu1/BK2HwenFTTuqqzoDlaTs49tZhcilCgNAZ/h
         SjYVtZRsjiIhzOKt0Oe8ACrwuZmHwXgl6BffXMkuRxBh+0QSd4T8611QNP7g1bYZCOJB
         Abc8HuSGWsuaVngW6XZyJ2iwxHRFV8h2QGPtuqV+1biOUL48UZ2k2AVwpNjbJW6B9uRw
         an2Q==
X-Gm-Message-State: ACrzQf0iYoMEW9hC0P2o8NBRBrJRjN9GB2gp4oLBhCEMifzDzN6HEuuQ
	htuTt18Yv25jUu0wGpS5WXwBUQ==
X-Google-Smtp-Source: AMsMyM5RIDOP0SBHTgVz9cIeHQ3xf/675SJ1zg0vkMRJgYQZ0smzOghgKmsChaaTYVdn8lhx3g56VQ==
X-Received: by 2002:adf:fb05:0:b0:228:6463:b15d with SMTP id c5-20020adffb05000000b002286463b15dmr95901wrr.534.1664981866717;
        Wed, 05 Oct 2022 07:57:46 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id k38-20020a05600c1ca600b003a3170a7af9sm2313758wms.4.2022.10.05.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 07:57:45 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Oct 2022 16:57:25 +0200
Subject: [PATCH v2 5/5] Input: mtk-pmic-keys: add MT6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v2-5-f17ba2d2d0a9@baylibre.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=K+NtkSoTyty3WNtqny3ZNRZqV9d7SWTjFAQ6sSNyyMw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjPZtiUzTmaPYNKYUV3W/stU4RFeLEKuVzt2ZzEqp/
 Eq6ivv+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCYz2bYgAKCRArRkmdfjHURUSiD/
 9sA4ZHNufNW0mMKCBepfnBrZ6W30ICWNvG+puYQvyX/jwxtj2IuDK+24Mh1zWfMtIUQeSW0T57XDoi
 0ghn+UGPc1bfvlMsd9/XBIEzfqJBNYOsGZDXJekiMu2RnvOsUDnpwTn5f/mvhXLTURVzqDugUc6Oz3
 /PHQNz/FNtHEo1vN8BPoGboWkKJf7QsfaQzD6yljthQ86IyLobiFeTS0umNxK3d7YRWLsUUoxNdxA+
 3iLXSyPZc2o1a8bi5CfWL/zvbWSauPcgj3BpN4jY4+GeUSz32+j1PqxE1vkcfO7SAxSPBr3qzUTnC/
 IKwuSMqmMNxoD8NiMcH6tX2CXOSxhNHnTHlyvjOGNDv7krLQyVjGORuKvRS9UVXAO/OCqeOpGNZIhQ
 JciObzKUp3Q1XfnaczjG/Mh3Hk2EDAkCg+lWTC8s6LI9h2kmuJIsomFnAUs5yfqJspDRTPSdYB3u4w
 oQ5kxjH7JMve0b8aqTPkQ6hz2Nftwl5bGl1aPtQUUG8viXIvRaucyPrZjhEWAUUeqKdcC99BLlRJjM
 AmyUMcmlvzo2OwGaVEe8Gw3tIsBer+cDkRvEg3vxGM+Hs2awbUPmNjvBiRI3AzF/JJ1kQ2mYPYYneA
 mrSVR3VxVlZw0HzMwiz0qDW5WY4BVztDoCexJRkFvYB9qLvqWrx1Y+sTWc2A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_075749_373424_6DE42590 
X-CRM114-Status: GOOD (  11.88  )
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

From: Fabien Parent <fparent@baylibre.com>

Add PMIC Keys support on MT6357 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 9b34da0ec260..2a63e0718eb6 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
 #include <linux/mfd/mt6331/registers.h>
+#include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
@@ -90,6 +91,19 @@ static const struct mtk_pmic_regs mt6331_regs = {
 	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6357_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+				   0x2, MT6357_PSC_TOP_INT_CON0, 0x5,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+				   0x8, MT6357_PSC_TOP_INT_CON0, 0xa,
+				   MTK_PMIC_HOMEKEY_INDEX),
+	.pmic_rst_reg = MT6357_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6358_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
@@ -276,6 +290,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6331-keys",
 		.data = &mt6331_regs,
+	}, {
+		.compatible = "mediatek,mt6357-keys",
+		.data = &mt6357_regs,
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_regs,

-- 
b4 0.10.1

