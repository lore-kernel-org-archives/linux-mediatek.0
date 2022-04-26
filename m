Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA94C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VxYkcSmENSyo93a7oGYwEW4781rzDfTvBrGwvu64OY=; b=fqJwMW+VK3nUuX
	zdJD6RMDN91vXLoITT83VdYsRzMqdMhgYM4Xl2AmZB03A5ePSTG0kD1kb3FbytKztg0dpWnAgLQJX
	qtkywqZiYFhvVKIiCnWoSa181+KdWTVfA3z/F0Yzv8gomXFJNi+WDAwfWB0lPyg1ITSk615Ojhszw
	4XIpjyLDQ33yy6s5bDpwqa8FPgTMp2yAII+zEX05ZwSCro/qIZjPXenhy29hjm3N28/OHf6nGNmUS
	uSlsgac/A078hnLp4DhvP+Zwrufc1OfE2tcD8plRyFnXk5tiMy5KCIY/GO4xSmoW6H7OwJk8i3bjt
	0FJBOErU6F/Vtlrv/law==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLfX-00En8W-7E; Tue, 26 Apr 2022 13:55:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdG-00Ely8-Ck
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id s21so10890587wrb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+gbDSzBgFUstx3vAtmhMB1WWymTnfkPpJ2BBVAe7qM8=;
 b=rKgrTIQRTjHY+QtRVm3uhXuRFy9GFwVJ+lzbD98t1fgh6Poc221of/XAj8KerkZ42P
 C+ZpiNzei59SNOB+AUmWV1elGYyJXlD6pwT3ljgBTCzetjBTv1c59yHXNpqqge4WmlQk
 wwFEZYUhg2JR/SuOq9ZImZumt/sgw1EifvF+gqLEkzjxoMYwF+iK4EQZHUBqyjqAFPvX
 G5cKhophLSD4/4JyT/A59hgiD+wBF5X6tnmj6VrHc0x8DHoqfYPvvyPCkc/QmPE4xAiK
 GeX3jgVTSWIiM0DauIDMHuhIMOU6Hm0djgvd/jX4ajMRk+EkVGdcOp2W9TNeRNLUTY2T
 pnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+gbDSzBgFUstx3vAtmhMB1WWymTnfkPpJ2BBVAe7qM8=;
 b=vjeQTG22ErdJLrAUdKOFGPkokXOvliSN3HlorByudZ9GEliJn7iq/+7qdltzIaeEFc
 FL2nfx7ZpoBIc7yAn8RzqqelHIjlhASyihIU2PQ2aRW5mtSFFoWNyJheLIOQlUk36TkI
 NI4IvzgBIZCro3GSWwP1AaeP6vsrh6sD2p6ymUsUU+8NmiTF76HY8CUwvWEftHoD8g9g
 rLEdugT79GOPnfpiRhvrTbrqk94YTVSgoO5EE1qUpSYyGQKrvUUFfgiZ8+E51SbRfO7S
 Czu8pjId7/Adirx+vyFv5ssXW8FfpH7PmqKsaFMxPDUU/48ZBQYKbqf09I+hgZAypkEl
 NugA==
X-Gm-Message-State: AOAM531okV5lsNILk4CS5MGrptAa7lZOq5SYHw4G5+Dw1WitG+CJDidY
 j3zi4DJRaL5EilCHJBMq83eBNw==
X-Google-Smtp-Source: ABdhPJzGergTCkU6GvmqVNI+eV3Y2g5B9Ab+BVFa+qIK916IBxpfV6Rc8j9IOJ8+9NUGUw3fktwZMg==
X-Received: by 2002:a05:6000:1789:b0:20a:9fbc:b1b5 with SMTP id
 e9-20020a056000178900b0020a9fbcb1b5mr18208596wrg.581.1650981212914; 
 Tue, 26 Apr 2022 06:53:32 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:32 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] Input: mtk-pmic-keys: rename platform data struct
Date: Tue, 26 Apr 2022 15:53:09 +0200
Message-Id: <20220426135313.245466-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065334_491607_5F6DB5E7 
X-CRM114-Status: GOOD (  15.28  )
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

Rename the struct that is given to the .data field of the of_device_id
entries to reflect that this structure will not only contain register
definitions but also other platform data.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin
---
v2: no changes

 drivers/input/keyboard/mtk-pmic-keys.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c31ab4368388..a0da644fe93d 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -50,12 +50,12 @@ struct mtk_pmic_keys_regs {
 	.intsel_mask		= _intsel_mask,		\
 }
 
-struct mtk_pmic_regs {
+struct mtk_pmic_keys_pdata {
 	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
 	u32 pmic_rst_reg;
 };
 
-static const struct mtk_pmic_regs mt6397_regs = {
+static const struct mtk_pmic_keys_pdata mt6397_pdata = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6397_CHRSTATUS,
 		0x8, MT6397_INT_RSV, 0x10),
@@ -65,7 +65,7 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.pmic_rst_reg = MT6397_TOP_RST_MISC,
 };
 
-static const struct mtk_pmic_regs mt6323_regs = {
+static const struct mtk_pmic_keys_pdata mt6323_pdata = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
 		0x2, MT6323_INT_MISC_CON, 0x10),
@@ -75,7 +75,7 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
 };
 
-static const struct mtk_pmic_regs mt6358_regs = {
+static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
 				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
@@ -255,13 +255,13 @@ static SIMPLE_DEV_PM_OPS(mtk_pmic_keys_pm_ops, mtk_pmic_keys_suspend,
 static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
-		.data = &mt6397_regs,
+		.data = &mt6397_pdata,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
-		.data = &mt6323_regs,
+		.data = &mt6323_pdata,
 	}, {
 		.compatible = "mediatek,mt6358-keys",
-		.data = &mt6358_regs,
+		.data = &mt6358_pdata,
 	}, {
 		/* sentinel */
 	}
@@ -277,7 +277,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	static const char *const irqnames[] = { "powerkey", "homekey" };
 	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
-	const struct mtk_pmic_regs *mtk_pmic_regs;
+	const struct mtk_pmic_keys_pdata *mtk_pmic_keys_pdata;
 	struct input_dev *input_dev;
 	const struct of_device_id *of_id =
 		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
@@ -288,7 +288,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 
 	keys->dev = &pdev->dev;
 	keys->regmap = pmic_chip->regmap;
-	mtk_pmic_regs = of_id->data;
+	mtk_pmic_keys_pdata = of_id->data;
 
 	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
 	if (!input_dev) {
@@ -310,7 +310,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	}
 
 	for_each_child_of_node(node, child) {
-		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
+		keys->keys[index].regs = &mtk_pmic_keys_pdata->keys_regs[index];
 
 		keys->keys[index].irq =
 			platform_get_irq_byname(pdev, irqnames[index]);
@@ -358,7 +358,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs->pmic_rst_reg);
+	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_keys_pdata->pmic_rst_reg);
 
 	platform_set_drvdata(pdev, keys);
 
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
