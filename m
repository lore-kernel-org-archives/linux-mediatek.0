Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9327C5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=S6tOS7BUKGnOg7EQqT7FgZM+T9
	AV8v+5aRf9ClG/Z36yl1PIZktNoE4GBLZfBL6StA7a6Sj9lMkWFG3RKrT1Oy0KDYNJCdCg/MuPSvg
	Y2SwBQzQVhLUELf9TfOLzHgU3Ha/ty/VfNCTcI+CYGWZnROQtEW8qpkeBGZvvdsoMiywaNs92PgoL
	au9Irq6R2e4UkZrNbbJ8WHScYvE76wkvGpNnQCfmRYq3VcmRHthBLxCjxv1/oJXBwZTLmwfv9wAhF
	WTrqQs6NHqYe3FSHp5KABz5dIuCQC1ZfQgLn4dsbT3bNQE781gnnb9moKn56OR6BXJuiCxTwczMLL
	7wOlTtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1rE-0000000BXVg-0Vmh;
	Thu, 20 Aug 2026 12:26:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1rA-0000000BXRm-2XGE
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 12:26:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47fd4531020so1356669f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228811; x=1787833611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=qyd/cezee1l8o/hAMkGexmI+EkaeZH0+T778bhu3V6wcUwL5Dw7Q6NG2Rky5qfD4yy
         gpO86ui3w6dTvbr16PJXkD6W4ZtUrlOSPSM8mF0PHrKQGj4z0q5iJ8nGblCirGUU+hKL
         avkx5xKEUMXua9hQPF7M+TRqsmQIVdomaAK1gRQEdPTlpQn1d2uoEJ7SPr5Y7d4kdHC5
         YSFUWk8rh3/KVjbhLjxP4GdnnNJg8lWHxFf0Hhqg0LGVMJOSGEOVUBv7AfW44Hm0Go2L
         DQpCRALOTbQNF+V9qTBkaQagFYo/OSUbZWfYzTd+3b/Ntz61frdlSNueQmcniL12ivXq
         wJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228811; x=1787833611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=Zmguxtatv3oVnmnvIr/Sn6WGQPPWrvTefYbUb0sNYn5WPL48AAC4T4oqW0QaZiSYB1
         ly44OeWsSW91ZIl8LzzUfmYi+uDoP2lg5AkVm2LbDVi3Az0Q1p8StNPVOO8Vu6JvlvgA
         ygTrT5a9v4TV1Z77e6bAidfRXW7uP2oaXNKBgOzEwgiJpRbGLH92egLj3ZBOsxCNwdKl
         EUJjKWx4Ia3obSaZxmoQTBd80q3DMDWkfHOAbZ4vSzPxszvQ1bE8Wr0SJR3/4V0jxEHb
         Ozpj8cneFU5pZAXuTAgxb9Z0WW7MO3A/pcxHZFhDiCd0Rh4/o58oKmjWkIpZ3M0OK27+
         x5ug==
X-Gm-Message-State: AOJu0YwoF44+mvk4380Q8aL8l22ImD3FxHjG+gTvLCzBreMSROgG8MSM
	Gmm3zKYG1COPDFFmUgay9kWW0B5Y9IF5wX4axOAVcuSRLFsgSWofZETE5xga3MGo
X-Gm-Gg: AR+sD10axMdJC/bqFXg3tk3mW71mCWIfOFLAHxLFSNPS45dQTS9AvmG1kPggOJtU3Wq
	lUS2pIJcwHxg6T82uXvjvokbfJ1kIZbCk0cbrrPQxlQ2tnHkM1uX266gKG6bQWMiHDRP7xZbxOX
	4P4mPdkI6GSCZz75OVHo29tQz6CRG2uVf62j2s1H81bH3zeJr9XT88VaYWpdcH2r/owZ37jVOsq
	UeJD4vSbLz3ZGrcuWIAhCUm4x6hr5uPm6cX073dzb8MZ7bWWF9IZmeXHmSxoaWa9EqQtPlnDJFv
	XuBVNRIHjOydvIlmfXuX1LtNTgi4D60kd2PJjKNCklrPeA7nE1fiSAaxpHeVLRzfejAogubDdlS
	xs8OPtC+71GZYRPtz7OC883IceSUKSTOHMPaplnVOMCHinerl3ochI2wrqHi2msbtTD8XrGRuC5
	HczAhPBV0QS9CERxF9HLXICPnxJdXfTSHTxf9g5KazqPC/WdNsS+rEGQ==
X-Received: by 2002:a05:600c:3f18:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-499aa194df0mr233187165e9.4.1787228810718;
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
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
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu, 20 Aug 2026 14:20:04 +0200
Message-ID: <20260820122242.120039-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052652_672724_EDFFD309 
X-CRM114-Status: GOOD (  12.22  )
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


