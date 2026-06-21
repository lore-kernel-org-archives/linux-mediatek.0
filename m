Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E515CDB466
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 08:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=FUoYZdTlC33iKbhxg95duyZNgB
	vuTvymPjukjdi/u1B4P2lJi4f9SQGuxxUz2aX5NIuiJXPdNeP4SoFn+uh3hB4GtH11swlMEBAAbGT
	2228i7XsXXUnP3iGy+NE5eEumHSTSigXAtBwHURJuxU+6gBpu5uaFwUKsFrjwFG+z3jYzD3LC2mlg
	0f5yib3ri+tsnCM3bnsH5oEB6b9XD2m/zWY7qtNMTAza9f3bAhSSBdeWvh+FKguHHeKYUF0NjrANS
	NXCQYh8NhYm/zEWZnbBo6OiqJXYg999I99LTATRiOsic6qGs6QEF+bc33NPEmPEGg3A3D5Xyc7fy6
	UTpmHl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDNl-00000003q7b-1Cyi;
	Sun, 21 Jun 2026 08:18:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDNi-00000003q5E-3o7t
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Jun 2026 08:18:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so24781595e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jun 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029897; x=1782634697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=m5ouFtHhMhiCxqujRaH+uBSpmUJetoZcc+w8DJICUvKMcL9N9mwlVkYs6MGnXzRRNq
         BSrfEstDTO4IA9ZO4aGGaT2pTqvZUX7E/ezY3ztLcUvHHcxoqAUWaTpQWOJIUwvYyc1K
         HGop32ruIB6W2Db9JckK30o3S0ECWyXlz7Bb/GigfQ67XVIC3+0rfNBBS790c9rVN9zL
         ypxYgBuUuYmpsH4gaAasDSCZricqbcI5F/jyL/i7nMO3ZEG1PDhq6HdGGy+EtG/3gS1z
         T78/4zKwoKyTeHZ7P2di8423EaKyedQLOj6/CDA/T5d2EZR8RNoxcvNU1a8tgDn6STlv
         0ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029897; x=1782634697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=qpueHjbigEw+1gpdHvYNpxa26iZY+8gu0AuW3GV56wdKT3x8+PniyJ3flFDXjw20Ap
         qIKJwwRdtiY32iaEMKyb+LhpiXmt0rZpFN0ghVZVXAsckv3lruXUjYyjKnwrhRbtPtqv
         5msWO3UZgpXyA2+FxkKRer0bG2h+OVTSS6MDrdQwXh/IUKvAKu88XcO19KvjSv21UVfS
         1zgHxEAv96qGdIJOPeUM4DWhq+LtPUFfac63ivh6D47kQ7zGYmVWqkcVTQfyWtd8LLvm
         5R84Y4V54/SjAhPYsTpXkp7iEG+9O/MeXzPavHo5/czD4x3pdRQj4NPfVd2vKGN9IlFg
         5/Ag==
X-Gm-Message-State: AOJu0YwV5F/M/m+aFTf1r2b7EGPkdjGOsUHCBJYcKHFsmimLmeXExj5X
	woh1GS17g3RfRMkPD3B0KVjhwvFCbEFIbB5OOxUxaf1la+smBHB5KXwnFt6aM3X8
X-Gm-Gg: AfdE7clx3By2xWs+tJu18dbzj2IFn4/I1TjnV9QrlDSdiwecGjGwVnvYwbyx3iWznfN
	bV/sgh2jy56Pdmv9ADXEOxY/IHxl2Zp5ysIyBvd3XFVlUe0q97PLluFoOeAAZryScQEq1fVZ7/x
	GrtXVTNS6Q8kPp2ooznF5xF+ZfSRQhB7x2IlGJbXYVgkEXLIvBis6S2rfzl7csRvQysCmKv45bY
	B3pJoQDIyo+FcT4QVZl8TZGUdhN9Q6HKn0Th3kOLWQTlRCv6/2yeSogyKd531mjlT6vcyqSOCQO
	eCYCDXd6tFJc8wQ/4c7Y8ROuEetdT0d7KnJVWzNe43ZoE5jsY0wn7YA8d6kxsxuoQZiLYmriEnw
	b2babGz6D+R+5HzjEYGOtwY/pydOr4swWOlGeBBYayTAPFsOVIGgOybjWKpFlk11tfiwYTyC7g8
	jreX5/6w==
X-Received: by 2002:a05:600c:45d2:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-4923f596bbbmr163549115e9.37.1782029897128;
        Sun, 21 Jun 2026 01:18:17 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:18:16 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Sun, 21 Jun 2026 10:13:31 +0200
Message-ID: <20260621081634.467858-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_011819_049864_913DC200 
X-CRM114-Status: GOOD (  11.36  )
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


