Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C94C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=; b=cejwiCHgL/qCVXMELAY6KqXVng
	c7pnx+ukmT6YHCfU6157ES01hHJUt2h6mk2B4MJ3mDnud2qQj1BiRYXh+5sKCMZyINJD7NHzjrJE5
	aNVCCa286shh5gKKtCSLiIKig0vrx/oI4HHf44BdA9rjtnsXs1/Pq2LDGgJooCLGkkULJk07seS3u
	n4DZ6H1mEwSOP6JHufpv8faqIvxIdVmjNX2GcW92dzobDXk7nhyothssLc1kFOs8oeq8Nbwd0rgj7
	LCEVwVUNd/42jJ0O02vJUOEWNMJC4MvsRaD9gRByJmtwi9F79nZg+VxPaUDA4MfQ88C9nxmz9m0wn
	OqKy9lag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03T9-00A7MR-TV; Tue, 29 Nov 2022 16:28:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03T0-00A6y7-Jl
	for linux-mediatek@bombadil.infradead.org; Tue, 29 Nov 2022 16:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=; b=bUqce0yvyp+d/SzseRYW/TBauq
	E3X313wtJC/1abui+LSGU0neSqNlzerRPRcA56AOvC/WHtfVvB3sLpVYCHnX2xg8kEJO5sa6wV/UX
	ynQxiXIfyygqGhAMc/c/zE1EWoYzMMXrwq7uEDOCR7QqgocILZb/AGwCBKw7a4vFvSgP9MvnvBNln
	8I4tMU67bg4rhM4FG4ACgLRrLgnKRAhVcZvFXO6m7IOUhDw4PC89HztuZIqL8SDhzL6l11rsrOFEO
	oDvfBkHN4IsVwfoxv71QCLK+Yj9HE92DbALeZS/27ouSI6tLuHA3/TV+DowaykhyBwfkogqDWwHD4
	3BxqAawQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02yy-005qLl-Tz
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 15:57:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so54851wmi.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 07:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=q5AMfXNq+uEIyJlBR4JMMkREhMsydwCzKt+PI6ZOWnuCDxDC46sM+LhYOuqjwz3EnD
         MvIvJWH0uX5OqoygLr59MVBrhBGn4zxNvOBAmGOxJCWtvSlfFyAbKjzocozW2irPiXj6
         R137SUWyTFtJnCd79bN+9OmhsWSWnsZ6V3zvd4pHkctIuP/JE3QjpnroKOi/jLUBKLWE
         TlK7K35lzOrtnX9XMPQ4vA2AWzPUfT0sgc4WuV/SBrB/XQ5eHfuyi2B2If8p7yqJHTwY
         qwIRtHF1onChLN7ImTbtjmWCDrVMyCzrh4sRT368ZeiOC2wxS7ftcqYQQ8VoEisKtkOL
         6EEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=4K1It8th3czeDF6TxMd1xNwzctAKOQ44k2CfwzKzoG/HApcteXBTMxCaG82pjcyJC3
         8sjTqLOFljFrQhsIMfEWbvd7j5G2/nvBhnw29/QskiC8tkmKBmK431th9FaTla9HRhjN
         C/8bUHHyMEOssz0PawrgieBLzUfFZiktEzdI0yRrdZTKuT9VQcE/JkjsEEp/8ydI7O4P
         S1ydCGzRKjOag8z0GoPuqJDa7H4p8CweFeT6zKGdoZ1X8pbAgxKP5L5Stgdqwx7JQhez
         KZok7yL4MnhM2EejWWn7HgvONSIQYn0J5plDHaUwKLDd4OOjUYyc4AdFYk4BTa6fpRjm
         XDTQ==
X-Gm-Message-State: ANoB5pnA7pasi1+cxTDC5GLNlW1cRzNfIIBZS1CvkY5IWpVFzVc3yfsF
	CaM9pbxpXYtXDeMoCNu2BgijbA==
X-Google-Smtp-Source: AA0mqf7sdZ4IIewi7If1cBDpEQXvuDOrlh8xL7AZnFA8/lhkuWPov7WbfLsNIp8x1bWjFHnFCxtv5A==
X-Received: by 2002:a05:600c:554d:b0:3cf:af66:e5b9 with SMTP id iz13-20020a05600c554d00b003cfaf66e5b9mr28316339wmb.107.1669737434173;
        Tue, 29 Nov 2022 07:57:14 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f2-20020a7bc8c2000000b003cfb7c02542sm2601550wml.11.2022.11.29.07.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:57:13 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 29 Nov 2022 16:57:07 +0100
Subject: [PATCH v7 8/8] Input: mtk-pmic-keys: add MT6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v7-8-477e60126749@baylibre.com>
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>, Tianping Fang <tianping.fang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=K2/LktiwnSqpYUY/NYDB7cyyBwW4Kzl5Gx1VcVhpHIg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjhivPU87+tCEsv9wKvjsTZ/yHirCJ7tdj091I6KFc
 cLYo/HOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4YrzwAKCRArRkmdfjHURcWdD/
 48EXWvZZB8DrLR5D/bQxn+KzLEixITXwKeF9W7VwgXTaLu/tau7GP4Ufn0nxnCLdAsDrpdsvzJq0QK
 /v65pGhFyzpnPLEYjjeTH3EOPNut6s/b3hrBjy6ifTG+FPpGc2Kw5An18Yu3zeyyE/ZNOZ+cRtjzWZ
 mIRgdaQ1A1RBphVGCo/V85j69rx5o4bpiO0lG5/824rP0PL0tIY3fEczhcRMdRkjoZh2N3jifZ8bjo
 ydip/Z9ZRBnxUo60n4aBEOPDt4MyyICRaPZxeJPEJMEazM+Lx6uab+GsJfyPsqcVVSoGxfbJh26cL2
 k1qUigspT56CISzWQLajPdY8qfP3Sq7sdXNh7Dn0RirWU4S2sIR6RYqOUyv3+rUL7scCWnyLNyGDM0
 mvNQcd9sJZUS7YDR1Dv5KvUYicEY85mEQkSrXZgWesitz774zn9kJHwY1hnjoojtNbdWzClYFyTOIE
 ptNZy/QSdq7si5NhnoF8R8KxsjuCvjAfCLKVWrTtbmePCfCF2S6z8aH8DkwN+QUH/IJoG0zBlVwJCs
 poPK2zFmYYl7K2/fDUi1GS92cg+3jyLgNC07KZ/vJV1ucdGnfrVt6ZJDziMbBV8Wygk4aOiidIVOSp
 K1AbxZ1piDeC7nz4xEQxNl09oM/hvoJJvFOpjN1OjWNHEouWgkGFmXtLb2IQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_155717_181773_520C2AA7 
X-CRM114-Status: GOOD (  11.50  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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

