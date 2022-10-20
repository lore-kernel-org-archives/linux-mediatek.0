Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443CBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=; b=FiWPI3MbUuglrfz5UerjfzUCJU
	fAEtyBXG3ORJ4tD0kP+4zXmOhNxGy6zIS9fezdEhgZt7GJiVJpyBh+/8eRAABPI4Fxg3LhyF7VopF
	fiKtPze1RS5c/cen6uQz19lVTe6tQ1m5EDbAia6SdnDrWxv7OPWE1krnqmYSZy4CSy2TyeegEUKCe
	v5zn/LqJw1zj+hPwKX8lWpbBkEax7o2V3AoRShwpFCFZUknDZ6uXy39e2GVwf2EJXWxRPSdKr5tAz
	f+aoqnhlUWzkU/Nqz3ZutBpOL6clg+7L9pbnoCBhchaLcDKtk1ZHcADBJEeAY9AqJuB3SBeIzii7Q
	AET5Vp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYLE-000I5R-Db; Thu, 20 Oct 2022 16:24:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYIJ-000GlO-Va
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 16:21:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id v11so244252wmd.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=4bkGk7hJ3/gLjKzcyaaVY4WHvFfZ/PYLiPSr23645Oe+YIeu5MQtu87/06UUV74DWt
         vjeIeuy545c3YWmN4F5u890dHccN6tX0FuXbuDRL9cN1BosH/MLEXrQVnPJ7sTq1mEt5
         Jaf0j8dfM6H7PxYZg8D8HKbagf/tVdLiR5KQBL5GtdIn7nlluYg1aDQgbb2JtKgUNgyA
         DULRMrKHxIgtNKU2wEaDALPuviN4CW0AwCoQ0X9GL4ampRj5nmJ5JRR9aP6xMM34qlXp
         zVXfOmzw7VSRV4Be3wXQVUr2J6tEvrKnKmPavpnipA1l8olLWTgjbM0e2J+AD5+hyZPk
         rMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI9uwBLCvWR3OgOlMBN6oypd3UQ7AbJ0Dp0NjT4lxFo=;
        b=w9eMYLxBKnygdP4VwYlIvKwxS0hyu9a6/wjcwLb5JOCkVuTGM70pnSXsohzDHYt9eb
         zsJqIW31BO6LxeBXmLBMwRiJM9VLOasUcpY5/Qna2hdm87/rClppAafzzew9cQVSzBC3
         ZUGs3Ea32x1O+VMZIZy8nvFryDbqLgpr6LQnXJfvxlDDUHvXf3JPrQRX64cMTgZGvBkf
         Q2RvKs3eoKQfMEBtMuZ0ZxL8hQqhc7DId1W/qC6NAiS/xJbLKeu7VOQ9BAsL5v7iRft6
         KnPvawfbVwtubXI+0U2+VkonLKuPPc2pDPxg/3gsH5+KcFztKQArKCAB6Ib2RICIGiRT
         xyYQ==
X-Gm-Message-State: ACrzQf0Ss8KdbKEp7RThOebBZCJ5uaGRXUaqy8MutwwlI6iRI9msRxyx
	+ad45O2NNM8ecjpFkeEEj9ZNZg==
X-Google-Smtp-Source: AMsMyM59O1Ens9WgNUevB39v9v24YyNwkvj33JjcvXYrs8vAqoPeTDo86MUcxITGL1VMMe8AHK3heA==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1dd with SMTP id h17-20020a05600c351100b003b4bb85f1ddmr10229689wmq.42.1666282875631;
        Thu, 20 Oct 2022 09:21:15 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m14-20020a05600c3b0e00b003b4fe03c881sm208028wms.48.2022.10.20.09.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 09:21:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Oct 2022 18:20:49 +0200
Subject: [PATCH v3 5/5] Input: mtk-pmic-keys: add MT6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v3-5-7e0bd7c315b2@baylibre.com>
References: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=K2/LktiwnSqpYUY/NYDB7cyyBwW4Kzl5Gx1VcVhpHIg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjUXV0iDb1YAXNizgwzlkkfM7Ta8EZ8gn6PwGStpFi
 gLELkyKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY1F1dAAKCRArRkmdfjHURU8oD/
 sFWNRnMZfn2cJP8Xi92PmsQjtSjIQBMJiweHO3Y1WhAVltQpeURhm1QH/EAUnhtesmXThIsZzpigI9
 tJA52SFGLbNp65c0YFxO4jon2VvX31XVtRMGEsM1L4YdJjuL32G38ScQqaKK4hGIFD9sxF5mIAyie+
 WjPr47ZocNTBhczo2Dc07VZcu/oTWsBZPthKx2oHGglsHgJTBQ3pcAsxseJGTv9Y/dXaaI/owDEa7Y
 89Or5TTOiaFHJpNx971Lw9eng+JI0FiQoH+RHGdw510zXFiINtsYdvRsm1Ee/NCiEvprOY9QdzEbiy
 Jw4lais2ggy7LkEEAjbVN8ovn4BSNhido0KzySqEqtnJFlPpcdV4f45tSF552VOFX8j8I0SH9wDekw
 TKQNf63p9fs1ptK7FUFMgrgWUYrxPfZPYIKxiEnS+0fAm4VY+7RXh1V6rRJzXY1HCllSmN5bcajER0
 uofbc+30YUOjtWZ+/22yPcLYOsW5kRh8G1sMo3OFBHFdew2qo2Y3m8s6qYbgqYKBaN14pyxpCQNisn
 R7/KpEG3f6sxUEfqBOWhbcY9kLp7M49mUZ56YFFgmPYKWq2nqwwh+f1pes+A9df7/pKmspkyDZnnwO
 aYWoIe3nLI1owUIr3N9CcN9MTXLgQm9Ko9lvNljcOvdfwtZ01c4BcCwZN1Zw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_092120_100282_C02AA8BF 
X-CRM114-Status: GOOD (  11.06  )
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

