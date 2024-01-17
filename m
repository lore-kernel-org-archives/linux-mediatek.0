Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CCDC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KLRBn+3DLYBae+fZSY2Eh6FUkJf9zq3O48iNXhaul3Q=; b=0Gb/iAjcADoVEws7dCNc0VHdtl
	+GC2fqsIv5Ka84gXXxN4R+ThBlIQmZzZUeLuUWw/FUwk9mxoOqu0JaNLlUwWeW1Pl2TydwMZL4CJ+
	Ac+Q8668MahH3I2mIByAcgcJ5S4GxIixJl7dQqwqXq8n2R8dB9+is4QNV9xXmkjT1Af8grOZJJJXX
	udn3S9LZVG0hnp2M5vsUvbnD4EinMIpP4OH5vh1vwiD3gPyIPY0GV1w25agegkvFPtAJFXXAI9wkP
	7Mghuksum7XHfzTcT+2Fau0YWi3FA8oIXUKLNhLlqsJiFSlmM7yqUhplzZgPTI89WZyeAUsqyLU9H
	3hYSYMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ7L9-00HLKJ-0T;
	Wed, 17 Jan 2024 14:56:27 +0000
Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ7L5-00HLJX-2O;
	Wed, 17 Jan 2024 14:56:25 +0000
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:aa1:d2f0:f6b3:db6:44c:eeef])
	(Authenticated sender: isaias57@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4ECE77802D6;
	Wed, 17 Jan 2024 15:56:09 +0100 (CET)
From: Jean Thomas <jean.thomas@wifirst.fr>
To: sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jean Thomas <jean.thomas@wifirst.fr>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH v2 2/2] pinctrl: mediatek: mt7981: add additional emmc groups
Date: Wed, 17 Jan 2024 15:55:47 +0100
Message-Id: <20240117145547.3354242-1-jean.thomas@wifirst.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_065623_949691_8A84B097 
X-CRM114-Status: GOOD (  11.21  )
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

Add new emmc groups in the pinctrl driver for the
MediaTek MT7981 SoC:
* emmc reset, with pin 15.
* emmc 4-bit bus-width, with pins 16 to 19, and 24 to 25.
* emmc 8-bit bus-width, with pins 16 to 25.

The existing emmc_45 group is kept for legacy reasons, even
if this is the union of emmc_reset and emmc_8 groups.

Signed-off-by: Jean Thomas <jean.thomas@wifirst.fr>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index ca667ed25a4d..ef6123765885 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -700,6 +700,15 @@ static int mt7981_drv_vbus_pins[] = { 14, };
 static int mt7981_drv_vbus_funcs[] = { 1, };

 /* EMMC */
+static int mt7981_emmc_reset_pins[] = { 15, };
+static int mt7981_emmc_reset_funcs[] = { 2, };
+
+static int mt7981_emmc_4_pins[] = { 16, 17, 18, 19, 24, 25, };
+static int mt7981_emmc_4_funcs[] = { 2, 2, 2, 2, 2, 2, };
+
+static int mt7981_emmc_8_pins[] = { 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, };
+static int mt7981_emmc_8_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
+
 static int mt7981_emmc_45_pins[] = { 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, };
 static int mt7981_emmc_45_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };

@@ -854,6 +863,12 @@ static const struct group_desc mt7981_groups[] = {
 	PINCTRL_PIN_GROUP("udi", mt7981_udi),
 	/* @GPIO(14) DRV_VBUS(1) */
 	PINCTRL_PIN_GROUP("drv_vbus", mt7981_drv_vbus),
+	/* @GPIO(15): EMMC_RSTB(2) */
+	PINCTRL_PIN_GROUP("emmc_reset", mt7981_emmc_reset),
+	/* @GPIO(16,17,18,19,24,25): EMMC_DATx, EMMC_CLK, EMMC_CMD */
+	PINCTRL_PIN_GROUP("emmc_4", mt7981_emmc_4),
+	/* @GPIO(16,17,18,19,20,21,22,23,24,25): EMMC_DATx, EMMC_CLK, EMMC_CMD */
+	PINCTRL_PIN_GROUP("emmc_8", mt7981_emmc_8),
 	/* @GPIO(15,25): EMMC(2) */
 	PINCTRL_PIN_GROUP("emmc_45", mt7981_emmc_45),
 	/* @GPIO(16,21): SNFI(3) */
@@ -957,7 +972,7 @@ static const char *mt7981_i2c_groups[] = { "i2c0_0", "i2c0_1", "u2_phy_i2c",
 static const char *mt7981_pcm_groups[] = { "pcm", };
 static const char *mt7981_udi_groups[] = { "udi", };
 static const char *mt7981_usb_groups[] = { "drv_vbus", };
-static const char *mt7981_flash_groups[] = { "emmc_45", "snfi", };
+static const char *mt7981_flash_groups[] = { "emmc_reset", "emmc_4", "emmc_8", "emmc_45", "snfi", };
 static const char *mt7981_ethernet_groups[] = { "smi_mdc_mdio", "gbe_ext_mdc_mdio",
 	"wf0_mode1", "wf0_mode3", "mt7531_int", };
 static const char *mt7981_ant_groups[] = { "ant_sel", };
--
2.39.2

