Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDAhp7oI3+mIXzlyOVBxeiiKrvPT74u2XcPFylDEGcg=; b=46Mq520Qs8x5us
	laBskLyk0M4t7J/cQNzA6S7CHX6rNXYzbzEnVZFGbeHuvytAbql2tpU1MKBdhVJnlU6hLWpEtgXJ4
	JJpkBNO3MWwvWfxWupWI7xm6mg6QmLHKW5d3TA3TerZMoGZAqeqpOxLfEGdwX82R8lV2gpZ+LNLWw
	53xIaLKP/7sMAQ4WZ4jngaoPK+j7l8GA4xGUSMdxZmdLXlLW8aiqQ01TBmzJk3OIcGQjHQtBZspqI
	ypxHLg4e33r869WqoZxdn9AKmEGk1Hxp0zOwRtRqUNmyqYTneTU7bJNq9UMl2DD9RPon4lnIxEKPq
	30V4t4SDFfV6fYYoypuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc4IE-005toa-T1; Wed, 06 Apr 2022 11:57:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc4I1-005thy-AA; Wed, 06 Apr 2022 11:57:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 89D031F4452C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649246250;
 bh=KeK63JgstL220HZeT8Eh0tNYtvHxor/1CeEp/mCXIg4=;
 h=From:To:Cc:Subject:Date:From;
 b=g0BD1LF33XBXk5bDckOc92DJvC+EWtN1wj7NORKaXCUpqG+9cOPZJVgOq5Ni+3ahf
 yjytUdiXEX9nXSsF3TjVgJ0WnzitjiZNCezEc9aH2Y11lfMJnHdYu3s06VCFmnBPJV
 wxEt11fauvCuNSXhoeHvrn7G7IJ5gR6N6nyDMvZ9HECatNjEG3lJbhggZZgG3+JAE1
 hqvpI12iQoRdBuCagB70QJZYL37OvkwqFAbVFrEpIcn2FFTCkJQpVDPu11Uf1QEl8M
 xZu/3hEzTQ8L8cjszOX4LFERAwFSwm6YeaJYSJ29lx4SJwiWTgbVM9uEcan1HPEzjC
 M8Y4tHajnI0RQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com, lv.ruyi@zte.com.cn,
 m.felsch@pengutronix.de, angelogioacchino.delregno@collabora.com,
 fengping.yu@mediatek.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Input: mt6779-keypad: Move iomem pointer to probe function
Date: Wed,  6 Apr 2022 13:56:54 +0200
Message-Id: <20220406115654.115093-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_045733_519551_36EE9305 
X-CRM114-Status: GOOD (  14.13  )
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

The mmio base address is used for the only purpose of initializing
regmap for this driver, hence it's not necessary to have it in the
main driver structure, as it is used only in the probe() callback.
Move it local to function mt6779_keypad_pdrv_probe().

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 0dbbddc7f298..2e7c9187c10f 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -24,7 +24,6 @@ struct mt6779_keypad {
 	struct regmap *regmap;
 	struct input_dev *input_dev;
 	struct clk *clk;
-	void __iomem *base;
 	u32 n_rows;
 	u32 n_cols;
 	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
@@ -91,6 +90,7 @@ static void mt6779_keypad_clk_disable(void *data)
 static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 {
 	struct mt6779_keypad *keypad;
+	void __iomem *base;
 	int irq;
 	u32 debounce;
 	bool wakeup;
@@ -100,11 +100,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	if (!keypad)
 		return -ENOMEM;
 
-	keypad->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(keypad->base))
-		return PTR_ERR(keypad->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	keypad->regmap = devm_regmap_init_mmio(&pdev->dev, keypad->base,
+	keypad->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &mt6779_keypad_regmap_cfg);
 	if (IS_ERR(keypad->regmap)) {
 		dev_err(&pdev->dev,
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
