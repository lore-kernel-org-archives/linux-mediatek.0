Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02759FED9F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx9XOFf+F102qRgcBU1Wfi3j2xvaU33q9Wk8R7lTDqU=; b=glyOG3NWeFuDL2Tm98mq4hd0lp
	BntwPPLXNVI3HCetyIt0FykukVjAJrLXIdovWuHgq2ygBtlst1cyIe487Q3+dXi/QCMAIc+J6E4x+
	y3jfWIklvsQPhoF8BFyiPdgjJAn4bwsfDNHp1eb2r5zHzOfdIn8Rp2US0XaMTazeZ9fHk3G862HQO
	JQTJ6iH8TSvXUBCYk0EwPZznx2KehEtHNeCUxedF4I7ipnNmaDNyigyCIWaRj2Rau3qS/JegAf579
	4fUXlhTRxpYXT4IPX3jY7kAcTSTGbPQEzOipGjw9Vz1Rn7p/6w/rRXVOYrqHTUY12Xj4xKJpfhqwW
	4IF/epXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZR6-000000074kf-26Px;
	Tue, 17 Mar 2026 18:46:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZR3-000000074he-3PSs
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 18:46:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so69028885e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773191; x=1774377991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx9XOFf+F102qRgcBU1Wfi3j2xvaU33q9Wk8R7lTDqU=;
        b=DWXd646TlevQFpR13OsFKrJ//nJlU93t2cDQlK6yMhNyQYB8ZfboyljO1g6D9iU0T/
         tYYp1nu2rvfo5s6jWtIpDI1kpHQSHE88s5vgT6nWjOMj9V/CnFGz0eZJJ72d4e8C0+l5
         VJjQK7HZ7OI1i1jDgoEuA7EeBAOKtLi0bt79JevkOR6F1C1CetIekcAUhFf6ESr/4Up1
         fX/LhwlgE+WnwGD1l9tZoGPgcfu5wTbw0C3dwwvoDZmy6u8hI4LaMvCSjEcHpMHH2ZiF
         Do40r7mLi3KBb+8Prf01xyZJHvGvW3dvOaH5qd/WObjMkUFRX5HnIfQwii5KqqTRoowI
         IvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773191; x=1774377991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xx9XOFf+F102qRgcBU1Wfi3j2xvaU33q9Wk8R7lTDqU=;
        b=mi5mDbd1O++rFh28TLSxz9+XGWvynMHPeb6EuDhOLsXrvpVoscDsNhUjjOnzXlEALF
         BuvbfS3kjUCMYj3CyzWVLej0Mst/zwEc184JxwPju4YwDmZd+n4do5bFwbzCJOErijkF
         BkCdI51rD9GlXaeMjejIADeHcBVUe7tUap2ukOmtc2HzFMTjJdZm+RIOMWAZpUIdSZjx
         bYxZem71NxCYSwoyc7UwbouapVzRrPhUz9ZEHgw13fXjihHBVaiW7dLNio0qetHOTw9C
         ttWjicl4fTdnhY4ciyMxM5XMQYINS7x5Wua4IIAdvcdAmurIUXLIz+WjGJ4p+7JIapfs
         Tz7A==
X-Gm-Message-State: AOJu0YwR2fxf7WoznhBmfFnoEYIfsqIJSNFpksIN+hB3uici8eaCQvls
	tqL3/AkkZUqBqi+C2t1+Wd+vqsZt6IJdivX9W+TLd7YdKHPuIYmjxc+hu+eaZlhz
X-Gm-Gg: ATEYQzwuy2cLWjv3ehYfu4yL2z9E4YR040mM0/+ApRG0jbuAiiXhxlezjU/N3h1vJj1
	oqgR0TiGEkZAFFjx7W1Ozvzy/+RS3DKuRSpisiRgE8OCn1j1zNqiFel5m3qC07r8Z61DppcDDL8
	SGzDFoYSuUXfkck2m+0ao5afG4/LY4eIqyCsh4MM5IWwWspmTPRNwKZc4+phjjPai80oN0KK3Zl
	qWgxPWpfw355gYjpc+jZQU6GPFqN0nlizhukUzZlV9Adum4/pi7bkToACpuazitR1gNyrbrsXr9
	GxM3kQL64SpCAKUJGTw3dRlywbTwENMK0iOS4oTNLXQ1OlE8f7HvMUo/kvCdk1GONfU1WqXhA+7
	+z2bTN4Sl/PE5+kW+7E7A5UgTAokLO8fUyJhFOAmiir7ESgE2Q7memm5W+JledJklw/sJWoYWj0
	gui8EwopitO0uGM6nxnoQ=
X-Received: by 2002:a05:600c:a43:b0:485:5981:1423 with SMTP id 5b1f17b1804b1-486f442e6f0mr11506045e9.3.1773773191445;
        Tue, 17 Mar 2026 11:46:31 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:46:31 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 6/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Date: Tue, 17 Mar 2026 18:43:09 +0000
Message-ID: <20260317184507.523060-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114633_881000_A10A7998 
X-CRM114-Status: GOOD (  11.68  )
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


