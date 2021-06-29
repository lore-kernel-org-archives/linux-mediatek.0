Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78654C11F69
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 13:36:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43DD861DC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 13:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43DD861DC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruN75tSzU9qiTKgBhWY1Cr/RcwuPb0H8hEo3RGM8juk=; b=0WDPCUeUaflO3d
	EP/AXnsN+SEJf3fUo7YBmz18nYzA2HKqyguu4QTzn44g03+StBFjyuKIsrkZDISW+gFYUiqTtw8gi
	YGVCSdrhGqFqbFM//4HeBxrrW9tEOTjIRRpxH36A1Q0lG31AjU4p6ZSvnBu4gNrdy6aAgM8aH9aEo
	smGbIQT7JjnlxIvrNpPY6399vWSSZmpuRFYWyJAYEM39p4/7zeBg3rVRfN4/XX5mX7feplyAGYNd7
	znlzT4jp424sG6ia3nj5hEkG9D7K2E+gHE7nFvpfPvkAGvXihe1qh/BpJ4DOX2tqsXLCb4ByrTTrC
	iNaqJQSbWkY9pRg2ocDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyDui-00B5CK-JG; Tue, 29 Jun 2021 13:36:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyDQT-00AwLo-Gf
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 13:05:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id x16so17090289pfa.13
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKfmz8t47CqIM37pOlVCg+EhrWGwQj3fLRBm0vwCV98=;
 b=XVJAtzCWh1fWlHtSQEACZwh4PdAQ+zvld8uozuCGB4yNAN+Ee2zZ3IFXfQLnahmRGO
 cnfwQA8rr0KJPFcL8hxGdDp9TevcVABSag6SSyQ1h9Rus5xA81hIpcjyyv6VpCRS1Uc6
 p8Cy5kAnxtJfDFsl1tzSjdL8MMR97IrjRdN4vWWnahj5fgIuPM7AaRNr5AykNHjA/27U
 KGQp28XQY9ONzrc39xC93/+vONSgoZmmLzmNykXYLZWRHPwlBy+SoDG6ETFAh8ui9hnw
 Pdum5/G+ae1wtbivCbUIQSuVmCvPFlae/LhqqkkrL2ZFIvjX1pzy8lxuqOmkUkOU9vdF
 xLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKfmz8t47CqIM37pOlVCg+EhrWGwQj3fLRBm0vwCV98=;
 b=q9NXRr8utEaj80T3R5YzuhuNsrThlSltHki96vpJvnDL4RFOIwYwbdfZ5V+Q673Rg9
 B0ZRtE3HtDiI/R8B3Ky9KF8+O9dt+O4JZ9i4CfNvI1vGhd8o5L8npPyuub/DB3Esqp4A
 eGC38VcEuFcKM661jKGU7UZ4qvRr5GPi10xA385d+NspNjQt4tMbBGKiXyTNWL6AJUc0
 jmUyW0mb6SBqUYMDbyx+cDUCM6CyxKi8FP2XpB1pg7WUC85rKP4y9dash1ZLhUUnfR0y
 +EJBMvt0r4rT5QBp/wHf1XGhd58Q5nMUPAJ4q2jP3NpB8+eXqH9CDJuCClJaO3ZIrowR
 ktoA==
X-Gm-Message-State: AOAM531tfHARsMZY7BnW//WOyCDU4C+JaLZyRCsPedbEy240USph3sdF
 ZFxExRMJGd69AfjMYJNK43mMm0mJ9hYzp1l7
X-Google-Smtp-Source: ABdhPJyIyYg8JG/Z8Idkq/XBSEaaan7S0+wpaJ8uIBR2zpiPJFkaRA6re4WAPPyBUROAh7m5QKGBnw==
X-Received: by 2002:a63:f54f:: with SMTP id e15mr28671575pgk.64.1624971915852; 
 Tue, 29 Jun 2021 06:05:15 -0700 (PDT)
Received: from localhost.localdomain (122-117-179-2.HINET-IP.hinet.net.
 [122.117.179.2])
 by smtp.gmail.com with ESMTPSA id u13sm18766769pga.64.2021.06.29.06.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 06:05:15 -0700 (PDT)
From: Axel Lin <axel.lin@ingics.com>
To: Mark Brown <broonie@kernel.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Henry Chen <henryc.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Wen Su <wen.su@mediatek.com>, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/3] regulator: mt6359: Remove shift fields from struct
 mt6359_regulator_info
Date: Tue, 29 Jun 2021 21:05:02 +0800
Message-Id: <20210629130503.2183574-2-axel.lin@ingics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629130503.2183574-1-axel.lin@ingics.com>
References: <20210629130503.2183574-1-axel.lin@ingics.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_060517_615686_20F517C1 
X-CRM114-Status: GOOD (  13.68  )
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

The shift setting can be calculated via the corresponding mask field,
so remove these shift fields.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/regulator/mt6359-regulator.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index 7ce0bd377a08..de3b0462832c 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -27,7 +27,6 @@
  * @qi: Mask for query enable signal status of regulators.
  * @modeset_reg: for operating AUTO/PWM mode register.
  * @modeset_mask: MASK for operating modeset register.
- * @modeset_shift: SHIFT for operating modeset register.
  */
 struct mt6359_regulator_info {
 	struct regulator_desc desc;
@@ -35,10 +34,8 @@ struct mt6359_regulator_info {
 	u32 qi;
 	u32 modeset_reg;
 	u32 modeset_mask;
-	u32 modeset_shift;
 	u32 lp_mode_reg;
 	u32 lp_mode_mask;
-	u32 lp_mode_shift;
 };
 
 #define MT6359_BUCK(match, _name, min, max, step,		\
@@ -68,10 +65,8 @@ struct mt6359_regulator_info {
 	.qi = BIT(0),						\
 	.lp_mode_reg = _lp_mode_reg,				\
 	.lp_mode_mask = BIT(_lp_mode_shift),			\
-	.lp_mode_shift = _lp_mode_shift,			\
 	.modeset_reg = _modeset_reg,				\
 	.modeset_mask = BIT(_modeset_shift),			\
-	.modeset_shift = _modeset_shift				\
 }
 
 #define MT6359_LDO_LINEAR(match, _name, min, max, step,		\
@@ -282,8 +277,10 @@ static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 		return ret;
 	}
 
-	if ((regval & info->modeset_mask) >> info->modeset_shift ==
-		MT6359_BUCK_MODE_FORCE_PWM)
+	regval &= info->modeset_mask;
+	regval >>= ffs(info->modeset_mask) - 1;
+
+	if (regval == MT6359_BUCK_MODE_FORCE_PWM)
 		return REGULATOR_MODE_FAST;
 
 	ret = regmap_read(rdev->regmap, info->lp_mode_reg, &regval);
@@ -310,7 +307,7 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
 		val = MT6359_BUCK_MODE_FORCE_PWM;
-		val <<= info->modeset_shift;
+		val <<= ffs(info->modeset_mask) - 1;
 		ret = regmap_update_bits(rdev->regmap,
 					 info->modeset_reg,
 					 info->modeset_mask,
@@ -319,14 +316,14 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 	case REGULATOR_MODE_NORMAL:
 		if (curr_mode == REGULATOR_MODE_FAST) {
 			val = MT6359_BUCK_MODE_AUTO;
-			val <<= info->modeset_shift;
+			val <<= ffs(info->modeset_mask) - 1;
 			ret = regmap_update_bits(rdev->regmap,
 						 info->modeset_reg,
 						 info->modeset_mask,
 						 val);
 		} else if (curr_mode == REGULATOR_MODE_IDLE) {
 			val = MT6359_BUCK_MODE_NORMAL;
-			val <<= info->lp_mode_shift;
+			val <<= ffs(info->lp_mode_mask) - 1;
 			ret = regmap_update_bits(rdev->regmap,
 						 info->lp_mode_reg,
 						 info->lp_mode_mask,
@@ -336,7 +333,7 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 		break;
 	case REGULATOR_MODE_IDLE:
 		val = MT6359_BUCK_MODE_LP >> 1;
-		val <<= info->lp_mode_shift;
+		val <<= ffs(info->lp_mode_mask) - 1;
 		ret = regmap_update_bits(rdev->regmap,
 					 info->lp_mode_reg,
 					 info->lp_mode_mask,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
