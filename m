Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E1DC38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5+QZFcbrbdlvBI94QHYdMUXYBfJDdiyziCZQbmnSog=; b=Ay2xVyYtIUC1HnzoDTaby+PT1x
	T6q7qV8qP86ZIO6M2HEK6/dQcctmIm1O7JPdXZtT9OjGfYKGY7FQvkBV4kGO2vngjdi8nnDXS2zm2
	v3Ae7tjdsw6x2CnLZ6F2WEGkr4a3sX9iVecMhxfCETnEuiyhZVWcfdb0ufeA8o2Dv5nQ0XuoKcYl0
	NrJB7HTUXNe/JCtvwXuU8citQsJ8Sj5UABQrwn1/gNYrUfapv6YTAdn0eS6nV5B6sceD8EnjhRbWn
	4TMcAJOAAxz0hTIAyC5iegLTAu0DXWMefBy5jk5l3F6pZxIhYnljoikiIS3E9AHdVQUAJ7S/XqJi9
	9lnqD9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz2R-00GiPF-KV; Wed, 18 Jan 2023 03:22:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz26-00GiEp-WC; Wed, 18 Jan 2023 03:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O5+QZFcbrbdlvBI94QHYdMUXYBfJDdiyziCZQbmnSog=; b=TcXqZEtkcsZaZejychpK69t2W3
	lLahPi8M8nwIn2Z8nIgV/vsqfyU+q5rzGv7CM6w03YL4laOP/3cA/Dr8ZfbLXbWAGJTHvDhTXaZDk
	zKo7ZGKsiVdEfjHr3h3FihTU2dKu3xBCuswiWtMHbAav/wHDRVnA/jmaPSz8D6jtGrCuPeBGUMa3M
	3FUuJtEJAjJo6u6BZFv3ygkTSk5HEqWxqyVfVzmM3G9D6wZf9gMhWbaCyC6/E2M9tZvhsbqRqqXaI
	pwua+E+Leu1ixZ4718lL0iJ46fxN1tszYjJpS2EVva+WjYc6k7X/e3Ssr8c0oq0qr6KMyflZtvk7R
	IzCTXzzQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHz1s-0068il-1x;
	Wed, 18 Jan 2023 03:22:27 +0000
X-UUID: 574ba5de96df11eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O5+QZFcbrbdlvBI94QHYdMUXYBfJDdiyziCZQbmnSog=;
	b=JWD+9GzKwvVQnL4PpcwMltu6h1XCqMN+sP8vWhNgXMGxW9lH/xRKGBGzaw0mA87SpoAeRF2/ftGgtdxX69NJKj+SOCTu66LSt8AIXZlnlCnldmqYWDstT/CmknLvYjz7rPWsjV7d4SCOgZjDn+ie4YzlEAaxSSQ0h0zuiSe0KYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:3d015b8b-6556-438c-a510-184718724585,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:4f3120f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 574ba5de96df11eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1166440710; Tue, 17 Jan 2023 20:22:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:21:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:21:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 5/6] soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
Date: Wed, 18 Jan 2023 11:21:21 +0800
Message-ID: <20230118032122.29956-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118032122.29956-1-moudy.ho@mediatek.com>
References: <20230118032122.29956-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_032225_270749_C0E71C15 
X-CRM114-Status: GOOD (  15.89  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add mtk_mutex_set_mod support to set MOD1

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 33 +++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 582d4b04e353..d4124800c886 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -23,6 +23,7 @@
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
+#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
 #define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
 
@@ -791,7 +792,7 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	unsigned int offset;
+	u32 reg_offset, id_offset = 0;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -801,16 +802,34 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 		return -EINVAL;
 	}
 
-	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-				    mutex->id);
-	reg = readl_relaxed(mtx->regs + offset);
+	/*
+	 * Some SoCs may have multiple MUTEX_MOD registers as more than 32 mods
+	 * are present, hence requiring multiple 32-bits registers.
+	 *
+	 * The mutex_table_mod fully represents that by defining the number of
+	 * the mod sequentially, later used as a bit number, which can be more
+	 * than 0..31.
+	 *
+	 * In order to retain compatibility with older SoCs, we perform R/W on
+	 * the single 32 bits registers, but this requires us to translate the
+	 * mutex ID bit accordingly.
+	 */
+	if (mtx->data->mutex_table_mod[idx] < 32) {
+		reg_offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+						mutex->id);
+	} else {
+		reg_offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
+						 mutex->id);
+		id_offset = 32;
+	}
 
+	reg = readl_relaxed(mtx->regs + reg_offset);
 	if (clear)
-		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
+		reg &= ~BIT(mtx->data->mutex_table_mod[idx] - id_offset);
 	else
-		reg |= BIT(mtx->data->mutex_table_mod[idx]);
+		reg |= BIT(mtx->data->mutex_table_mod[idx] - id_offset);
 
-	writel_relaxed(reg, mtx->regs + offset);
+	writel_relaxed(reg, mtx->regs + reg_offset);
 
 	return 0;
 }
-- 
2.18.0


