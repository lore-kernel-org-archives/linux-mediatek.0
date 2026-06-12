Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954CFCD98CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=TZQi4CXOhG+fqr1jBUTk9hAU8B
	N+OUXIqZpwWlwC6HUGkt8x4djIeemlgTnlXQGFBrkbefyaCWhWjCO3cvusPaMxBVxymzCqrAIsEIs
	lV63Wa0zZvCEAL0kbQ+XuzgNgFP5ab5BHuHmtg0HskPtxRoJ6OjUubjCkW/kvgy7bBbGhW2ft12e2
	N4wf4YbtXV7BQHnIT3Pt8HL5n5gVfQ+UKLx79vnxAE/aAI/6J1sxPKWursiB1BRCuTi7WlwbSEHj7
	4ly83CKfXjo6Z4dCrUALpXnLy85R2ZI4YGctot/pNANVwK+LAWz6EWJgkXM5PT9TbypZqTUGImp2z
	iFg4+XVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8T9-0000000BY3o-2kKU;
	Fri, 12 Jun 2026 20:27:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8T7-0000000BY1r-0A4q
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 20:27:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-46019b190b6so1128661f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296027; x=1781900827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=eaOWZZbLbc09gvI4c7pzyiOzRrVVwCW/N5wJo1M1FpBdw0InNHxziMSqptopCjax/R
         9GJGbSnQLsAn821NPQHZYaBeTHSTQQyXcCvp2IsA3xnhcxNn5xVwEGQnABwFdbY+kRqW
         W9ucUQgqO7tjdqYkSG4oa826qMjkHG1YGuh324X5w6j/EA4Nr1o6tz4LeRl2NJc1hdKK
         d2H3v2OH8yzB4xtJgPm6QUkeDambtahoruSfbA7cryFPKbWYM8J3slac4Fk/4xOAPzvw
         r9NIFCrDgikBKjkk9pN4nOxHifCLvQBeFeKHhPQMCzv76JOPkSjbV2DF8aFoBcm7Zqi5
         dyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296027; x=1781900827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=jfIKoeqB51NUoKW4SydpZJAxf9lB9E6NhOZzgJISaH6No0aioQtD3lzZLSfZct7XV7
         hHiqRkbi5S0gKxbHOL3wr99F5wdpRR/YpDQPkIaefeTOeJ+N7O1CoRJyUgy97hNpiwEt
         M0h22428b9CWE982j9lVjZ4HbPk5WFyS5vFNTuIC6v/wmF0PhMseYNFxXLq2rQHvI7tM
         PTPzY0vPK/XaDCnoBtMHVcDHZxqhOIdWB7N1CZHR+HJPSs/aYaz+O/9Igs7+u+jJZ7Gf
         u+V+cEh4kWShUhL2L40qTu11NprrYDr3Vl5dJ2D398TFsQV/UaTrHPq6IL8iqWNjheG4
         vNCQ==
X-Gm-Message-State: AOJu0YxXq5in9uEkNPwWLVUe94sXnfQKj9NEzXEOjFH5fhLUYqChSB44
	kYSYDQk+s0hdxpNXnwjBZzSNb6sLW/ZFzM/yVxFjjl1IJMiP862lMUFcgGpzKxGS
X-Gm-Gg: Acq92OEcJDGs/iyUgfb+DfVufKPS2/YjMLgFht9UYdShPmHp47/3CiapF3tCC4TmoUp
	tOx3LK26+MSOVl/J65tp20NQ1FeFQecSKK/QScMtzSqCgIMeC/Y0y1rK+RX0T8IRUGZiXFl0+jl
	VauSLl87FenbGQP0Fv1b6jE/lu+uJYoJAIbayDOKos7FK98Nv3Mz+JMvhF9+9waTVn6tS5GHGK3
	bNYrWcSZUrgq4KjhR7Zt/OFyMnT9CNq17l1dPmawyNqnmVou245x6wIKkOUnqPKiN8lXMBG4OdT
	/nDocYib/cJOKodkq3T56Q3/K27n4BAN4OgDQerM5JyHiNeiYXU4pvc7mSC94d0+qeSH1kh4fYN
	H91F2XJjdehTlucX0Ow2uohgA80YJ5Cx8zGQs6N9Vo9DX2I+ZjslQCWNLMrYKYI0RSJyOoAL6kn
	kGv9ATuCIB4NTVyW3I
X-Received: by 2002:a05:6000:402a:b0:460:f4e:a481 with SMTP id ffacd0b85a97d-4607ebee2ccmr873998f8f.34.1781296026959;
        Fri, 12 Jun 2026 13:27:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:27:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 5/7] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Fri, 12 Jun 2026 22:04:10 +0200
Message-ID: <20260612200717.361018-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132709_095028_F8807C66 
X-CRM114-Status: GOOD (  11.29  )
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


