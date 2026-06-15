Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A85FCD98C5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=H+O7zdBFJVlEUsQyDpFfdaBOri
	xAQIx0Sgpq4c7/eRLFf/GHLLKcEJgEPCNmU7MpdEw6f5eo2cdUc5BhwsvE4lgXGdgsrMk6w34gyDD
	bzpTunu7wuWp8ru12tAFT+jwjUvv0piUSinWvc5+lLsQpJ6pu2Tg6qDBeduOdfrbjwJWCyvUQnwVm
	hFHrOJPwUrTBN9NwQPNpuXahK/fuAlErsTb23YMkv4ou+ZdtON7NeSNG5zYy9GTRb/psqFJgqQlo6
	KGFqmf95U7jRrRZ+/V638+qnjeXfMt1okurTEW4utRe2wW3h2B6H3VV86zfx4BiHrh5Mi0YEfIZkO
	1sFZHfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1cC-0000000DlyA-12ha;
	Mon, 15 Jun 2026 07:20:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1c9-0000000Dlw3-3Ikg
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 07:20:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4619990ca5fso355269f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508008; x=1782112808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=QKwcSfySm/5xKV+om9wR2Ud6w7bIBdbbOeuDqzjLunMKZp9S8SPysICXkcXYAVfXOr
         kaPrX0XKcJw/yCdf7Fc0vD5kiKAYhgfLRxsShSrZVAai3gFDu7sg+1oBWHx6JLvZOlj1
         4hgaLL8Qf0O6XVBgJEcNsxqZcltL0b5xJlM5nKQbdRXjfKL7+lKrQ2zxj8AqSD6ff1pU
         xhPOtOL/i3QH9gXANi6vsRA3uaGvHReEd1rcQuMD5OU5P3pVxRcQRoeRmHmHQUleWdGY
         ZFHh38DBZScIyBqE72W11uyFrx04hs2GZCmEoKEPORLzY08L3cLiShcdX/YlOJr1/9XO
         PEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508008; x=1782112808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=CSuCB5eUOEltLAyVE9Skx9VrCe+1aFTzJ/KVkHnlzvgK3jUzdDJl54kHGd5a1ofxrC
         15IO/zOcwQlJ2ZMY2P4ZJj0iHwPVKgNXC2zYATc1lzEeX5bxGgiB+CahXaCUbmTpVCrQ
         +fKZC6IKYC4iu7KhdGtZXi3oaOX7WKOPSq1hxSCk4uaqYBEI+jUh6OHhfjqToXLoJ3W7
         Uozmyw37ewyrH4cp/s2M8jtMoCPWn8fV/OXBv92ixXQtVgNdtzG0YVt2znRrJJhDbzSr
         mmunAEJ/4Kq60mBKfUmUXF60L/zktg01wsGWzDLm1NO76xJVLDE6X3fOLHQN5NfMmY7x
         8uvA==
X-Gm-Message-State: AOJu0YzVdx2820ni1hxy22FnAVvItExmXsRkWY4msV+aXyBfJJ1EjmuV
	3LpZ3JiYyBojW3g7giPzzEtCK9Jt0uhDn6bVjgw3GggJIoRt4ebcSqTTXWKvOCiZ
X-Gm-Gg: Acq92OH4qQKPhxg7bcurPVgQ00sBhMerYRLbfgTvnnI8rTuY+qxgufmTfvujWblxKTd
	SWMQXkGnZmC/ZBuOp+vXP7HRUGWTKK4/YNtqjNQh1f9To8PoFCFuCGDUXWagjdG5TdymRw4P1DR
	NFtnhtgLxmo6SEEO6pf3N3gYpE0gGntr8ETFuiAymQpqUfv9Qo6k4KTVwDdKhpvHBSlY8Njm3YK
	kTLF58por8GoX+MBYIwkDmRctpcUH+D7mQCNt7TgXLRJB6Lu7Cs2dz40yanJ+jOGGBU7d1DBhq1
	Q7YPTtkskw5URqspCo1wz9yVNoKPhYzBtZeFAkIXfpWF+4YYavK5IJikvvvnC4gUaThJ3TJjLRk
	EWdnnaMz258quqYBe1SPN58c6AwR9NfR5yttW7ZtzubyhogMoPQdhYWrtlz0unnzaJkpMjfeRNm
	V+afZrV1476jN4LdLV
X-Received: by 2002:a7b:c7c1:0:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-492200e7bf4mr83916975e9.28.1781508007746;
        Mon, 15 Jun 2026 00:20:07 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:20:06 -0700 (PDT)
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
Subject: [PATCH v7 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 15 Jun 2026 09:16:12 +0200
Message-ID: <20260615071836.362883-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_002009_849701_5E67DA82 
X-CRM114-Status: GOOD (  11.80  )
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


