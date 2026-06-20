Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8821CCDB46B
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2026 20:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=0jWQPOkGwGHVkv1h9wfjqAH0cl
	qcFYlCNDakkgtEcri1O8/CKDc1xVIysdWCQfPgMHfVrgdbIa59tJvH+/sz8Zi8Hnalgp7srlE4LBv
	2RtYdXkDkvnAGlfHhsbt4cF94qAitgciRojiq0K7Fj3fspM0uG/Yinu3AJlMlHs4734mJMP80vxA6
	NspWRsJG8j7DFDf7x3fT+IVFiFsS06y8Oc2VKI4ILfaEiiU1l0XsGMrQGabJ22CGPRO+UGJVXfk5U
	t6dddjwikRVtRnA0uW0TnUwG6W161O4WGpmfqKPj+AW9mzxV5T8UjHlw8eJDy7me4lcMZJ7N0hPRa
	w47ASxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1tS-00000003XAz-2J9f;
	Sat, 20 Jun 2026 20:02:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1tO-00000003X8R-3xUi
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Jun 2026 20:02:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4633193af19so2204002f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Jun 2026 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985733; x=1782590533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=KzRUle4T1yfP0EH8596leESJpU4Hnuo9A102Big0Zy/berseXbxCng7a/BLbdRWCNV
         0unHxiy/3+oy05T907imGq7DV2595QkpO7JhHs1d+m3BsFAfBrpfhPrzXefxNhhyKQll
         s5V75XW41JR42L8meMslUtICxGGGsSQNovyX+p51PLmQ6nIu88jtb6/KvZ1uYy9OYz9B
         5ikK/vuOM+J1c18GBb3RITzXYyn29sIeLOhoe07ztKeBghaDyftbGZCQXaX/Mq5FNxpq
         bHQfDcHGEM0XGXZ7ibX1i7P6DZos1VWsMmDEcEHAcxVNDtuyfWYW7VapjMJ7f23RtqqM
         8auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985733; x=1782590533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=FLrkM2++6luK5OeP/K3ADVlKDkGK2iwN5q3+5fw9vNONZSxqblhc+5LsXfGlG64qd4
         7IST/MLfttmJkml5teTB103k9J1SmLo9qgjQq324WJZ8EkKeeaQsl4sJ0MhvjjeoAbo5
         4oqv9zRFjTcRlAynRdkqeiwvDr5YOHotKp2spYIaj2e6kD+BSmZLqBwON4hSFQ9Ir7YC
         caNypxaKV8Dw0dTjfdA+4atLsqT7UnRodXM4fXOp62kBj713LcbdBF+YsayMPRGfL/lu
         JVxd4r0B948wwQlQALOdXdVPLScT9uP+JCwxR0q8K+tLN6+EKBHks2cCMc/F5Lhd5tPy
         SB8g==
X-Gm-Message-State: AOJu0YwOF/OsZX/bSS+sl3E08rGcTc94uho/1D/ANP7McFYgacznoQrV
	LDQmRBjm2yGZmK+jqsvYukushSLAJ5fdBcJ9rSO+fTNzWhhYq9gSkHsv02mOBJ7O
X-Gm-Gg: AfdE7clwhw4vuIIAUHDaVs0GRlbm/KQ6poTKd93g8Yh9NQ2hjr6nsBJv680a5kVguH7
	4R/W1EpgPcGLhks1105egyGIKxT7/f8T2V6caicTJ6St5gFe3pqP0qTiVg7V2d2g5MTFp+DwaoN
	R18rUyMTVhGyNGtfOdLY4JWpoVmsZmU/Dbj9nIwoUYfwuC9Ml9E0jMP5/okkDJh+WfcpNahbs9i
	pszIJ+J7tn3+LD9qmYgpoCQOwOCNlhaHBpZgv56sHBBxMhZgtyWhTz98FjFbzp0gnM+edBavgol
	FP0ZN7v5oIX/sSOKYy0OdjNewipR/M0c4dswgBM95suiwpDXjsVwp0tX8VhdkJ29mD8IqNYM5XR
	Zb8WnjjZ25YPWv8fI3IJ+2o6i0nIhHSh4uYFRZDbR85oEDuWJQaKWorAJvK0RBKExxreS0pd1WD
	VNeFx3HR8Kv23ZPr3H
X-Received: by 2002:a05:6000:41e6:b0:461:d369:ece6 with SMTP id ffacd0b85a97d-46662806a6fmr6772688f8f.30.1781985732911;
        Sat, 20 Jun 2026 13:02:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:02:11 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Subject: [PATCH v8 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Sat, 20 Jun 2026 21:56:52 +0200
Message-ID: <20260620200032.334192-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130215_017689_62EA1C5D 
X-CRM114-Status: GOOD (  11.42  )
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


