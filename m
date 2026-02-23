Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6D2EC110E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=; b=AVVr3YZdt68fCsxQti9A6MeVeC
	jaIRTB7PUivfXuZoo7V+VQQELBitP6XEhELmMf7AICm/jfBvidD7MM6bBoqW3jP4LIubC1ROb/Z+R
	dU8SgeoUHrsdVni68G3/HzZ+r/E55Ir5xkM4cIsW6ZfdsjYnGwH9ZdKo0F7fSUoU/dFUgonPK4SDi
	9K8X8JekgrSMYUQ5t/JI3Zf3Whx4p0gnBP8bZujsVfaUaPxDAWayFFKkKGtCAWHcBe0LY0Zc4NcXY
	WE4v9zqFCdi8biDl1izd5TJ5KuVLk/nUcoNU/pXlBsZes1ahG6DctC2Ka4D1VbTFJ7aIq6Jasqj2G
	qza3cfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZh-00000000kL9-3aLe;
	Mon, 23 Feb 2026 17:18:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZe-00000000kHx-3Ouj
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4359249bbacso3377915f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867101; x=1772471901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=;
        b=fJNDRUhCg5/ASAH1qplKMCuo3eB7ea2uScowp64K4U52B84UFjyEu7BgORaHrbKR3L
         ot2cjID/KNzkQMjOHeka4gpbi4AfJdK+1s+45vhuMfLreErdtFWerl65Yz6mw1+Ki23i
         kuUEQheh1FeaiDHQ5+LwI0CWysSbCTAOtnwNWG2IRgM7AwuRaTUpGTnoyQDJDZa89juC
         aq8BVTpQFRXC5KJaoStQNEiLFSGuKZC18/qjlrJMc0qwxyQ62X4zPFqO64aKESRcs+e5
         wrQdzAwi4xJ6SHDn08E1bwygd8TWDZNYUcB6SXkBBNU3yEHVqVUA0E18+gen6HVdho2y
         n27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867101; x=1772471901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=;
        b=nxNTdJ87J8w88NPzcHPgCu073GR12w8fu6GcnWYjB56d2XuOOgbdKTAVHIR5dOZy4j
         RndPqqy5TaLg5Gdx6sRA3wr73sE96j2STAPm5POxDGEjNwlajdzspO6Gc5vL719q+rbW
         FUxNi219dhFCcLDgi+Kt+8FRuvjVQ9ybNnExnZCv/3FUKsIj9M5KU3y6cpOH6EthAxbb
         C4qQRnnMCeWrrb984N5uxRYDxAQDvwKbz9V6BMiP+Vj3bMK6jAPxJGKIYjTqYjmiNpBO
         zWoojtC2Kq4tD16cQbWbtm5XoD80nsNEmzz12jHJ+NJAb3VuMkWXouvqJSw/ta/qtJG6
         Y4RA==
X-Gm-Message-State: AOJu0YwbsStH2EAmB429B4DGTaU4EdEgZHVWVCfvZ26s+M6rjyHBGQ/x
	OhTqT/Ew0LVqVEEHWeltVsVsL2ULas3cXTdvp4kWrdOb8+03P4CIxEzb442S9A==
X-Gm-Gg: ATEYQzzoJIbAm2zpHXBQsaSrwKC7iT7tHmj5RffjH+uZ1NeRpii8IsT0q5zdQfqoxN8
	lRSSMrQGopl8V559eOpm3fvFyBh7EV2fr4MQph9AabxlrXt7H7qJWerQ2wJ4P37nF54Q6eAB6vG
	QWBiEgtH/Qeor2DyY6xZJZUJTGC1a8zGgdW+9Y0Kai6GUfQzCoDiQRhBTMVeqnq7cg266GZOIbJ
	xk1586nducqIUE6CVwicdrLcf6bLuDikQY1IjUH14rLrEGaL5Gc9OLqfKQqTnY1oxgNYNrGsbG1
	m9LO5X+C0lTcwb+1W9y+GEmRSzewb2lhANWIWEmpRIwcMat4q0czL+kUO6j25dSp8X1mMA6MtGV
	TpFDVkvJQTGQo6fJs+P0NxEqR3NLndQ8vKOk9ciYmXsIxm7JHotfnRIF3R+bv2dmE8J4+SCxBPw
	nkVRzxlnSOCNhAe3kXwUA=
X-Received: by 2002:a05:6000:22c5:b0:436:549:e15d with SMTP id ffacd0b85a97d-4396ffd6befmr18768227f8f.18.1771867100114;
        Mon, 23 Feb 2026 09:18:20 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:19 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 7/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Date: Mon, 23 Feb 2026 17:12:46 +0000
Message-ID: <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091822_897875_DFC427F0 
X-CRM114-Status: GOOD (  11.15  )
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
---
 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..3b9a5b6bc470 100644
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
@@ -69,6 +70,17 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x2, MT6392_INT_MISC_CON, 0x10, MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x4, MT6392_INT_MISC_CON, 0x8, MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +313,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
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


