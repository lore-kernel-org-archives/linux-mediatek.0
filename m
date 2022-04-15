Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84141C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrFwJriajaPL58KVXWfye+AhMD+ebB/eddvJ/hTnDfY=; b=y/kc6275aEbLc/
	xKPev9xsMFqVwT6e4DMfY9MShB6UpZk/lIpckdJOJVLNyLE+LyMysz7YUqaazZj1tTw5FF4mcLE5m
	0kTQqV0Jj/UbXLVWDA+sM99JpIYW+3WZ42qXwgnFfEsGt1R5S6R2sc1MM7wCkcvVHR+Imq6QstN+Q
	R0yHyJJM/rdONasrvkZqEED1aj4s7YF45Qse5yw2hSdVuiRbCD9LH9jOjvpW62e8jMVinJVO64vnQ
	11WORI9lD43+ojaMgXXWL+B4CUzxCF7cOiT/vDMGUTxxc9OBcm9AKxrwarAZBIs1lfAhEVcOwDK3I
	NZQxokX22yQ3aVA2AeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOXG-00Ap8b-Hp; Fri, 15 Apr 2022 16:11:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0N-00AbRC-9L
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso7942060wme.5
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WDWruGhytuHi8Hvh9Dd5EXmCI8L1q6rKOX9fLidj6Ec=;
 b=7PMInzua21fpHF4kYL57dFlermowOW/PqKGwQW3jR3av/kD270Yz7hbxnumJtgBQZe
 qTv0oUPTjvZJ/BIK4h9Rfj2/YizFRGCoEJTPeJV7gLczJ9GUhdouEgHr4dTvJcvc7DWA
 ie3j/T1pAG0eWAf8WjtV3bekFzyv+C2k78Igwue3O8AULtfm08Hb0K5xw19m0BWHGPUL
 /0YZN1+SUuUsmv8pGx7v5SS6Mdpln+x0dEEX9NoSK5i5fdB+ZqNwDcGkZuPaB3q9g9HQ
 am556YuRXY6z19YPvt+WqjCMBWDsjvB5lX8ib7SaCcTkaBKkrVxYzfJdHgMY0U79NvcT
 veIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WDWruGhytuHi8Hvh9Dd5EXmCI8L1q6rKOX9fLidj6Ec=;
 b=FtpyGaJUY46e2Pkh7vQcYZ0dfzDPFs3H01cvtQ45k9iPKQxgj38CJJX3qudPCLJFFR
 HXzfC/If2MhJIz+7iaLH7lQjub1l0iZWDGB7EvR0YLae9JhX4nwdyWDnVtZG5R5ZrC9b
 980Sj354ZYBNiQcgI9vK75EfYumJPodJrkAi4QUbsQ3gw9MGaW2MHRGIQL+KdSjlduRP
 A8brjY44BnAewNxfAHlkw3Lj5eQ6LM1ewdQEqi4Mq35a9s60OnOfIYOXosZhu1dgrnCt
 PNnT36497a/1y8R4KleqYcww/aMCZJAeHZPOrNk1SYuCJ5pMAGpcIRxsLz8qO45ORoed
 mNfg==
X-Gm-Message-State: AOAM530jSOfIH3Fg7SdxyuIuScsEJjvrxLmro1ROLFkZPp46lVUlEbrg
 HrAOrYn1TOGa2xo+qgggo4GcAQ==
X-Google-Smtp-Source: ABdhPJw+A/iRYwe+lAeKns1b6yTF/VsCPkstrY3ipuTjcg6HrcxfTo54JB/+0tA8BqHvGSAeVJOP9Q==
X-Received: by 2002:a1c:2b05:0:b0:392:5bfb:a0e2 with SMTP id
 r5-20020a1c2b05000000b003925bfba0e2mr521128wmr.165.1650037021444; 
 Fri, 15 Apr 2022 08:37:01 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:37:01 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] Input: mtk-pmic-keys: rename platform data struct
Date: Fri, 15 Apr 2022 17:36:26 +0200
Message-Id: <20220415153629.1817202-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083703_410896_84A066B1 
X-CRM114-Status: GOOD (  14.85  )
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
---
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
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
