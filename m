Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E864C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ft2UWVlsBll20sNblz1ZBVneGMRF/ndP0OGby3/eMY=; b=W6TFBHgVqBU8yM
	6YUMsENVvhQOd6tW5wusH/Xrhn/Xhq3i4mNdo4bjcnIfXrTZIDOU5P+EV37ylys4OXQJTk/Uk2KI/
	n7khaapv85jSWmEzXCQ9NnZ5krS/cojxiUEwy36/lmVGNbUiVS1Pw6Tl1sg5ix0LUz3J73DwU40ey
	yfvtrJC89/JQBeLSm+uBXVaTgphVutQtTJkw/SpKb7cI0fHYpVHxi9v6P1pyabfCySivNVg4hSBr3
	hT4G8/EUFQBI6QGLZhgUXSz8/59DvpcUs5LDvQmMniaGQVgbAVo6rFosr5SJ2HbFQtjtD1gt8OJco
	l7Yw6Nbnz4ZePlO+00aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns28C-00CUOq-H9; Fri, 20 May 2022 12:53:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns26Z-00CTcC-Jg; Fri, 20 May 2022 12:51:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F1D721F423B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653051102;
 bh=aGNhalei7MTlis1YULrl5Fs8KJfg4KuWW/LGY2qYzzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YzxX2VQ5Lmit5fkHF5MGtIeY6eXozJ2LH+ZiqMZsQvCbmZ7tNDR1f7sPEKwFp3RKc
 mckQrai2C+dyB3GdIj+hB41WEqMDYPvKNmutzoSyPWnvPZf3FIZ+gysI21tFw4p22f
 Z2XbTbJEOEpgwldgd7YgXAVy5/jkrb9Yj7+ZpBDDJVAW9huA+jaQ6VKqUldqNPWsqj
 eLsh2NUKMDYR9AcijhJUxq6ayfEQiX/SGed7RgSVRabQ72TYWcsnfRYaWvl/5AF5QS
 qg7LoKlXrtpVJ3DeGTEFY4V98ffQyJR1yr0RFCSrqXJ0DNN1Ko+yMq5GwyghW2SrzH
 L3MsoZ0lLstZQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] Input: mtk-pmic-keys - Add kerneldoc to driver structures
Date: Fri, 20 May 2022 14:51:28 +0200
Message-Id: <20220520125132.229191-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_055143_900876_1254F999 
X-CRM114-Status: GOOD (  12.28  )
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

To enhance human readability, add kerneldoc to all driver structs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 30 +++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c31ab4368388..8e4fa7cd16e6 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -34,6 +34,13 @@
 #define MTK_PMIC_HOMEKEY_INDEX	1
 #define MTK_PMIC_MAX_KEY_COUNT	2
 
+/**
+ * struct mtk_pmic_keys_regs - PMIC keys per-key registers
+ * @deb_reg:             Debounced key status register
+ * @deb_mask:            Bitmask of this key in status register
+ * @intsel_reg:          Interrupt selector register
+ * @intsel_mask:         Bitmask of this key in interrupt selector
+ */
 struct mtk_pmic_keys_regs {
 	u32 deb_reg;
 	u32 deb_mask;
@@ -50,6 +57,11 @@ struct mtk_pmic_keys_regs {
 	.intsel_mask		= _intsel_mask,		\
 }
 
+/**
+ * struct mtk_pmic_regs - PMIC Keys registers
+ * @keys_regs:           Specific key registers
+ * @pmic_rst_reg:        PMIC Keys reset register
+ */
 struct mtk_pmic_regs {
 	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
 	u32 pmic_rst_reg;
@@ -85,15 +97,31 @@ static const struct mtk_pmic_regs mt6358_regs = {
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
 };
 
+/**
+ * struct mtk_pmic_keys_info - PMIC Keys per-key params
+ * @keys:                Pointer to main driver structure
+ * @regs:                Register offsets/masks for this key
+ * @keycode:             Key code for this key
+ * @irq:                 Keypress or press/release interrupt
+ * @irq_r:               Key release interrupt (optional)
+ * @wakeup:              Indicates whether to use this key as a wakeup source
+ */
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
 	unsigned int keycode;
 	int irq;
-	int irq_r; /* optional: release irq if different */
+	int irq_r;
 	bool wakeup:1;
 };
 
+/**
+ * struct mtk_pmic_keys - Main driver structure
+ * @input_dev:           Input device pointer
+ * @dev:                 Device pointer
+ * @regmap:              Regmap handle
+ * @keys:                Per-key parameters
+ */
 struct mtk_pmic_keys {
 	struct input_dev *input_dev;
 	struct device *dev;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
