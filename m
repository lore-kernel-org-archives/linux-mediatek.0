Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79542C30659
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgdxjlgqPjA+N/a60WUCAtQK9GZWi4HYoDxh9IrR7fI=; b=FX1kFctbXJT9jZRm4Xev3n0ezV
	q6wCQ58s2sFlzR00zL29Ygq0JBhvufLkBB1V4moJ51AOwcPjIwS/GM8Beaj9OFUbgnExDioaL8Ggd
	cMS0UBGQR7YS097WYR1+Iijj0mZ+E7IGNEM8uadjC/MV7zscWuEs0wHq9SZUIOejCi0LaTsHHwWF+
	KCTf4WaL5OSznhTzfijavw8AOsSqRH8i/Gy9ysk4nzIgjhtuRbao2Qh5arfWUgmuC9wJVCpXQod+O
	KvE+yjSPYNfP9512j713+iEhBi49riuGPSx4t7G5h8YkWBrObKGqgFvW0V7wTi3I+uCXp12wA6pl7
	ncBmbmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQEB-00000006Qlg-4Aco;
	Wed, 26 Jun 2024 10:50:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQDS-00000006QHu-29Ay;
	Wed, 26 Jun 2024 10:49:36 +0000
X-UUID: c2033cc633a911ef9daba96ee3f3cc8c-20240626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jgdxjlgqPjA+N/a60WUCAtQK9GZWi4HYoDxh9IrR7fI=;
	b=gxrbRWRu/7sWO4jJB0JM6fYJtYgbC98zv0m8zAB27pT94TyYIQmdctOLPppGof2JBAJJYeMUF9jO2Opypw8pSIy4Ath4XRjpyFpQoxTiIB5Za7w4A8pCTMDvR9B7CIaNOZiTevGbsLy/ebLeBF1boA4FHnt+0TUGs7E7IvgSm0k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:b7e85bc4-ca5d-49ba-a917-d0cc7b09abc4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:df4a0c45-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: c2033cc633a911ef9daba96ee3f3cc8c-20240626
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1085761271; Wed, 26 Jun 2024 03:49:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jun 2024 18:49:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jun 2024 18:49:23 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v9 08/13] net: phy: mediatek: Change mtk-ge-soc.c line wrapping
Date: Wed, 26 Jun 2024 18:43:24 +0800
Message-ID: <20240626104329.11426-9-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240626104329.11426-1-SkyLake.Huang@mediatek.com>
References: <20240626104329.11426-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.130700-8.000000
X-TMASE-MatchedRID: ptJ0KTv/UXA9d1nHWxkekOKXavbHY/C1Ct59Uh3p/NWiXe5nNnUYtyAO
	g9E37d4vvT6pHvydqvemGallF1XuaE6M27pFjx1L7spMO3HwKCAEa8g1x8eqFz6BH6zbVSRYW+v
	0m5ycBq8e3c05NORFxx0BvcHhKs9ujNCnuZyJlEhH+PTjR9EWkvTcf8Av+QSAmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1VZLvl77XgncBHu70Y56PL/xrHMwUkSRUrtjPkyE1bgMbqn+ZdF0SF+jCd
	5IpKCDuW2XZLBse18l3EtoBQLXwIaN3P9GaabqVr9cWg8rSFn10BNB20+SxH7f8mJY57oZddJaB
	DYald1mHO0tVYDV4T0MMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.130700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C94014AC9CBB8B543986B9CDA681B0E4E028D6C870BFCB3A1D38798EE6A89D242000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_034930_808252_8343B2B6 
X-CRM114-Status: GOOD (  14.09  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

This patch shrinks mtk-ge-soc.c line wrapping to 80 characters.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 67 +++++++++++++++++----------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 26c2183..cb6838b 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -295,7 +295,8 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
 					MTK_PHY_RG_AD_CAL_CLK, reg_val,
 					reg_val & MTK_PHY_DA_CAL_CLK, 500,
-					ANALOG_INTERNAL_OPERATION_MAX_US, false);
+					ANALOG_INTERNAL_OPERATION_MAX_US,
+					false);
 	if (ret) {
 		phydev_err(phydev, "Calibration cycle timeout\n");
 		return ret;
@@ -304,7 +305,7 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
 			   MTK_PHY_DA_CALIN_FLAG);
 	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP) >>
-			   MTK_PHY_AD_CAL_COMP_OUT_SHIFT;
+	      MTK_PHY_AD_CAL_COMP_OUT_SHIFT;
 	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
 
 	return ret;
@@ -394,38 +395,46 @@ static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
 	}
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TXVLD_DA_RG,
-		       MTK_PHY_DA_TX_I2MPB_A_GBE_MASK, (buf[0] + bias[0]) << 10);
+		       MTK_PHY_DA_TX_I2MPB_A_GBE_MASK,
+		       (buf[0] + bias[0]) << 10);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TXVLD_DA_RG,
 		       MTK_PHY_DA_TX_I2MPB_A_TBT_MASK, buf[0] + bias[1]);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_A2,
-		       MTK_PHY_DA_TX_I2MPB_A_HBT_MASK, (buf[0] + bias[2]) << 10);
+		       MTK_PHY_DA_TX_I2MPB_A_HBT_MASK,
+		       (buf[0] + bias[2]) << 10);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_A2,
 		       MTK_PHY_DA_TX_I2MPB_A_TST_MASK, buf[0] + bias[3]);
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B1,
-		       MTK_PHY_DA_TX_I2MPB_B_GBE_MASK, (buf[1] + bias[4]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_B_GBE_MASK,
+		       (buf[1] + bias[4]) << 8);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B1,
 		       MTK_PHY_DA_TX_I2MPB_B_TBT_MASK, buf[1] + bias[5]);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B2,
-		       MTK_PHY_DA_TX_I2MPB_B_HBT_MASK, (buf[1] + bias[6]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_B_HBT_MASK,
+		       (buf[1] + bias[6]) << 8);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B2,
 		       MTK_PHY_DA_TX_I2MPB_B_TST_MASK, buf[1] + bias[7]);
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C1,
-		       MTK_PHY_DA_TX_I2MPB_C_GBE_MASK, (buf[2] + bias[8]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_C_GBE_MASK,
+		       (buf[2] + bias[8]) << 8);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C1,
 		       MTK_PHY_DA_TX_I2MPB_C_TBT_MASK, buf[2] + bias[9]);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C2,
-		       MTK_PHY_DA_TX_I2MPB_C_HBT_MASK, (buf[2] + bias[10]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_C_HBT_MASK,
+		       (buf[2] + bias[10]) << 8);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C2,
 		       MTK_PHY_DA_TX_I2MPB_C_TST_MASK, buf[2] + bias[11]);
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D1,
-		       MTK_PHY_DA_TX_I2MPB_D_GBE_MASK, (buf[3] + bias[12]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_D_GBE_MASK,
+		       (buf[3] + bias[12]) << 8);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D1,
 		       MTK_PHY_DA_TX_I2MPB_D_TBT_MASK, buf[3] + bias[13]);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D2,
-		       MTK_PHY_DA_TX_I2MPB_D_HBT_MASK, (buf[3] + bias[14]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_D_HBT_MASK,
+		       (buf[3] + bias[14]) << 8);
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D2,
 		       MTK_PHY_DA_TX_I2MPB_D_TST_MASK, buf[3] + bias[15]);
 
@@ -616,7 +625,8 @@ static int tx_vcm_cal_sw(struct phy_device *phydev, u8 rg_txreserve_x)
 		goto restore;
 
 	/* We calibrate TX-VCM in different logic. Check upper index and then
-	 * lower index. If this calibration is valid, apply lower index's result.
+	 * lower index. If this calibration is valid, apply lower index's
+	 * result.
 	 */
 	ret = upper_ret - lower_ret;
 	if (ret == 1) {
@@ -645,7 +655,8 @@ static int tx_vcm_cal_sw(struct phy_device *phydev, u8 rg_txreserve_x)
 	} else if (upper_idx == TXRESERVE_MAX && upper_ret == 0 &&
 		   lower_ret == 0) {
 		ret = 0;
-		phydev_warn(phydev, "TX-VCM SW cal result at high margin 0x%x\n",
+		phydev_warn(phydev,
+			    "TX-VCM SW cal result at high margin 0x%x\n",
 			    upper_idx);
 	} else {
 		ret = -EINVAL;
@@ -749,7 +760,8 @@ static void mt7981_phy_finetune(struct phy_device *phydev)
 
 	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 9 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
-		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
+		       MTK_PHY_TR_OPEN_LOOP_EN_MASK |
+		       MTK_PHY_LPF_X_AVERAGE_MASK,
 		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0x9));
 
 	/* rg_tr_lpf_cnt_val = 512 */
@@ -818,7 +830,8 @@ static void mt7988_phy_finetune(struct phy_device *phydev)
 
 	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 10 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
-		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
+		       MTK_PHY_TR_OPEN_LOOP_EN_MASK |
+		       MTK_PHY_LPF_X_AVERAGE_MASK,
 		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0xa));
 
 	/* rg_tr_lpf_cnt_val = 1023 */
@@ -930,7 +943,8 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
 
 	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_3);
-	__phy_modify(phydev, MTK_PHY_LPI_REG_14, MTK_PHY_LPI_WAKE_TIMER_1000_MASK,
+	__phy_modify(phydev, MTK_PHY_LPI_REG_14,
+		     MTK_PHY_LPI_WAKE_TIMER_1000_MASK,
 		     FIELD_PREP(MTK_PHY_LPI_WAKE_TIMER_1000_MASK, 0x19c));
 
 	__phy_modify(phydev, MTK_PHY_LPI_REG_1c, MTK_PHY_SMI_DET_ON_THRESH_MASK,
@@ -940,7 +954,8 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1,
 		       MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122,
 		       MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK,
-		       FIELD_PREP(MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK, 0xff));
+		       FIELD_PREP(MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK,
+				  0xff));
 }
 
 static int cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,
@@ -1119,14 +1134,15 @@ static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
 				     MTK_GPHY_LED_ON_MASK, (value != LED_OFF));
 }
 
-static const unsigned long supported_triggers = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
-						 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
-						 BIT(TRIGGER_NETDEV_LINK)        |
-						 BIT(TRIGGER_NETDEV_LINK_10)     |
-						 BIT(TRIGGER_NETDEV_LINK_100)    |
-						 BIT(TRIGGER_NETDEV_LINK_1000)   |
-						 BIT(TRIGGER_NETDEV_RX)          |
-						 BIT(TRIGGER_NETDEV_TX));
+static const unsigned long supported_triggers =
+	(BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	 BIT(TRIGGER_NETDEV_LINK)        |
+	 BIT(TRIGGER_NETDEV_LINK_10)     |
+	 BIT(TRIGGER_NETDEV_LINK_100)    |
+	 BIT(TRIGGER_NETDEV_LINK_1000)   |
+	 BIT(TRIGGER_NETDEV_RX)          |
+	 BIT(TRIGGER_NETDEV_TX));
 
 static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 					  unsigned long rules)
@@ -1189,7 +1205,8 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 	/* Only now setup pinctrl to avoid bogus blinking */
 	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
 	if (IS_ERR(pinctrl))
-		dev_err(&phydev->mdio.bus->dev, "Failed to setup PHY LED pinctrl\n");
+		dev_err(&phydev->mdio.bus->dev,
+			"Failed to setup PHY LED pinctrl\n");
 
 	return 0;
 }
-- 
2.18.0


