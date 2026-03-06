Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81872F01830
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97jIgM6P/d9EfNIE9WeYwD3m3n8Lqle2XokpQhzkWdM=; b=xYnD0wu+tskPNLlEyf2KHl5+y7
	3gJ9oJsUsYVQOhG0tf6JOHQ+Pn6qyFXvCKyRUFskRryL2YX76ncKgcDEW/VBtRnLZzngL2ByS0edZ
	0IyeYmmGBzIVC70V1GCJ5QoeqqTBuEovqgWhXMi2cYsgTvJtFpmdZ0UC7dL0UN4vum6gfF9dVTBlU
	8UYDfk8ZeXG3t1egmNI0LZJvsPqdvZ/Tk0Olrb+AUYsC2Dj1wVNFDlxTdreUfUaVNq9qb20u++t+e
	+Xsd041AYTJvD5tlwCEw3NDSgJL7X0ax1alTZ3p8CsaDDvRa2FJk4qCOn7niSjD0jXdpHm+UJTBsA
	7gZtg7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTxO-00000003bpc-1B94;
	Fri, 06 Mar 2026 12:07:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTxL-00000003bmi-1h7V
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 12:07:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439b790af67so3396403f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 04:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798817; x=1773403617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97jIgM6P/d9EfNIE9WeYwD3m3n8Lqle2XokpQhzkWdM=;
        b=OuKqq//Hy9DZhjsmAuhQRYPStAXyrxAgnpVpb3n2PEAdKODs2bgfPhyE+bLJwfHzbc
         WhcGM6tGQqZ7MNkBdGMjFywz/EfobOtrh4GxtTfolh8g1EuTEttNf/aPaAJ7+NmWMyba
         q5gzLD13BWLP7QX7/Lwag7OjzIFrzRDosnuHzljRGCRL5G3z6DmEH55F4Up5mhy67xjb
         uWgbaLmgaYBpHd6U0WXosvN6hF/8ANEBWNbldLIYilH7+iHU/7+7r/YhDgH3nOzYMaOi
         +XYhUtS7b21GrPUhUm98EtbuK0hXwp8958472n/TJqeNmtuVIeBAZOS4Znf7J1si4g+V
         zbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798817; x=1773403617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97jIgM6P/d9EfNIE9WeYwD3m3n8Lqle2XokpQhzkWdM=;
        b=DWejyAD90AyjLOppyxcjl1+KoytwQlzN/6YKegB/mu2wqPbeGPHX7VXy4y9QErl9V/
         scy5nukqGQRcc/6YZFk7m94t8h5TCC1yb3wShHOuAE2cb/8Wg7/CXFRuJikKLVKY1PYS
         J8Q9R0ztIiOWEHvzFw6NI+bQG0dng8tivHRD2D27Zznf+e0+QNMyz0tNMkQW1BF6eVBQ
         uNYyVJtg0cXsj3UugfOmU21LFdnQiHy4nUWul0JPf3VVbdR5JqEJb0LWQfuqzCzUqd52
         OyO2ZYuncJIwmF634H7jvsBTDhQLVf/opeW7U9Mhq5i5CZpkAuUvKqdNqRtk/oEAPQp6
         4emQ==
X-Gm-Message-State: AOJu0Yx9RLfYsNrKyC6jg30nviKMhzEwKWqywzcEN7NP4PJWNgH4cNHA
	3eaKSG9uZMksfNp6Oj65NuGN0wCyZ8oh9Lwjbt5KxRMVCO5GvIDfuzbTzxgQnlUr
X-Gm-Gg: ATEYQzx9aVxRX/5MwVb7THU+5/prUFYsKVkhqg9jUgKpPrB6tw9+CLm9Zg+RZZSfRW0
	CiKFAXTy/I5ACF9baa7AaLPSch9UwA40oGUtdw9Z57fJQzvETHo0i722lQiEIqk1Vy38x3Hj80q
	C9niDA2n7E3baSkD2h6LXm9Plvwo+j3DJn1XjLT0thEvWdUyYQPhSZzt2speQd0A3cKWBkBH/ua
	DjqFdglJOZyqQx+RzRh7IxNqdp/79GoWlzZ32aLKoobtniEClEid8L/nX1VERUsiDYDnYCbBBnE
	AH4umg8XF/bDs5dfHMvP+npVY7g9gCj2PkgUV9EKCVUMZaR84nOvXt9S1gXMiGd8JeP9pDThUBu
	KZ+To0mT38425EzunNwhknNffxAg2HJoJc9zY3yPiZ1mMDs1cV/YCvteA0fy7061HzO4SVlhv5t
	HZrWFLMHlGJ2UF5n0d3ZY=
X-Received: by 2002:a05:6000:40df:b0:439:c018:60e1 with SMTP id ffacd0b85a97d-439cfd76d02mr10149414f8f.21.1772798816912;
        Fri, 06 Mar 2026 04:06:56 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:06:56 -0800 (PST)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/7] input: keyboard: mtk-pmic-keys: add MT6392 support
Date: Fri,  6 Mar 2026 12:03:10 +0000
Message-ID: <20260306120521.163654-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040659_460328_4128A316 
X-CRM114-Status: GOOD (  10.84  )
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


