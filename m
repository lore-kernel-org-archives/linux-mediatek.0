Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8C1D2F7E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 03:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvPi7sP8pm8AhaH8077Pb+442yN8gi4ybZ5FYjNqxvQ=; b=W5MwHDazi3IQK0kWgByXG+Bst7
	gsIP3M+a+pkvrdc3Fo0E8OzerlCStYSVim65mXAgdEK0mXhd8tYjWnck+fe8JIQA5fa+U6JJ4q7HX
	e7UtcU924zf3LiY2AACjtp/sjNmEhmPL2oL2GwkTuxwx/9kLaTAm0lgtdtoSLj5F4ocsOXbuuJXAU
	udhxseqJJTeuu5KA8dqNAZExbJVlZB6X9Qw/6DeP6CxoJ7SOAb38/Tkqs6FWV/c7IqMbmanN7HAlK
	CypnWc0THtT0je4scVR8W6S3o2h48YPamaDnyqsB3V1zf0poZpgJCk5yeiS4xHSQp1iWz113A0N5i
	bdLuJsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H8q-0000000DeZq-1s77;
	Thu, 17 Oct 2024 03:25:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H7U-0000000DeUt-2Yob;
	Thu, 17 Oct 2024 03:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PvPi7sP8pm8AhaH8077Pb+442yN8gi4ybZ5FYjNqxvQ=; b=RPjXuz3WMAuyc7oSf9t6gCNfZk
	zCy7AvWeAXY0dMTKJWdYim4tUeg6KYt5PmBd2Gdp1HnYOgoLqG/zizpjzv1Yfsi89s3b+rFoEDFQF
	9a8kXlOCrQty/NaADeMujDcfEeL2kOJdzl7pFZxcVq4zSH4ZCQPeI4jfsCl8X2bF6mMpYTPYBtWKq
	TBdeNzInaUUXaIziBL2HWktbWQ/XKLNwBsue8c9UWz1aUJQr5Ks8f/NXnmlPGFtPgaVySiHJKgsvb
	PjR5b198btY20Cvwy+aGBnQR0YhvXJYK62hz9FAJHC3COlzQBywr5O23U6/VdQFruHb4OeAAqmh6R
	RmORLtZg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H7L-000000072jF-2h26;
	Thu, 17 Oct 2024 03:24:10 +0000
X-UUID: 3dccee668c3711ef82ff63e91e7eb18c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PvPi7sP8pm8AhaH8077Pb+442yN8gi4ybZ5FYjNqxvQ=;
	b=ZqpswAq6r2EaIiG1141EVLZ85ztzy5hCOxEvkfOW1l3Xi+RgaQ9vTu5U/aHbOzXnuPOVx0qpSBFmGcrgZ2C7TNnVVkPzeR7Z8hZKh5YYAIqUc2aVlDPUww9OrX57DC6/KK/CL8/ulBOulH/9SbeteSvnVw0Npq1Npyx5AjoujVU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3e08c3b7-7fec-480e-ae20-cb6172f066fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:515f6065-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3dccee668c3711ef82ff63e91e7eb18c-20241016
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 494944123; Wed, 16 Oct 2024 20:23:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 20:23:52 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Oct 2024 11:23:53 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v2 2/3] net: phy: mediatek-ge-soc: Shrink line wrapping to 80 characters
Date: Thu, 17 Oct 2024 11:22:12 +0800
Message-ID: <20241017032213.22256-3-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
References: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_042404_605600_965467AC 
X-CRM114-Status: GOOD (  16.36  )
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

This patch shrinks line wrapping to 80 chars. Also, in
tx_amp_fill_result(), use FIELD_PREP() to prettify code.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek-ge-soc.c | 125 +++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 37 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index e9c422f..1d7719b 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -342,7 +342,8 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
 					MTK_PHY_RG_AD_CAL_CLK, reg_val,
 					reg_val & MTK_PHY_DA_CAL_CLK, 500,
-					ANALOG_INTERNAL_OPERATION_MAX_US, false);
+					ANALOG_INTERNAL_OPERATION_MAX_US,
+					false);
 	if (ret) {
 		phydev_err(phydev, "Calibration cycle timeout\n");
 		return ret;
@@ -441,40 +442,72 @@ static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
 	}
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TXVLD_DA_RG,
-		       MTK_PHY_DA_TX_I2MPB_A_GBE_MASK, (buf[0] + bias[0]) << 10);
+		       MTK_PHY_DA_TX_I2MPB_A_GBE_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_A_GBE_MASK,
+				  buf[0] + bias[0]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TXVLD_DA_RG,
-		       MTK_PHY_DA_TX_I2MPB_A_TBT_MASK, buf[0] + bias[1]);
+		       MTK_PHY_DA_TX_I2MPB_A_TBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_A_TBT_MASK,
+				  buf[0] + bias[1]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_A2,
-		       MTK_PHY_DA_TX_I2MPB_A_HBT_MASK, (buf[0] + bias[2]) << 10);
+		       MTK_PHY_DA_TX_I2MPB_A_HBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_A_HBT_MASK,
+				  buf[0] + bias[2]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_A2,
-		       MTK_PHY_DA_TX_I2MPB_A_TST_MASK, buf[0] + bias[3]);
+		       MTK_PHY_DA_TX_I2MPB_A_TST_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_A_TST_MASK,
+				  buf[0] + bias[3]));
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B1,
-		       MTK_PHY_DA_TX_I2MPB_B_GBE_MASK, (buf[1] + bias[4]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_B_GBE_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_B_GBE_MASK,
+				  buf[1] + bias[4]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B1,
-		       MTK_PHY_DA_TX_I2MPB_B_TBT_MASK, buf[1] + bias[5]);
+		       MTK_PHY_DA_TX_I2MPB_B_TBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_B_TBT_MASK,
+				  buf[1] + bias[5]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B2,
-		       MTK_PHY_DA_TX_I2MPB_B_HBT_MASK, (buf[1] + bias[6]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_B_HBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_B_HBT_MASK,
+				  buf[1] + bias[6]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_B2,
-		       MTK_PHY_DA_TX_I2MPB_B_TST_MASK, buf[1] + bias[7]);
+		       MTK_PHY_DA_TX_I2MPB_B_TST_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_B_TST_MASK,
+				  buf[1] + bias[7]));
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C1,
-		       MTK_PHY_DA_TX_I2MPB_C_GBE_MASK, (buf[2] + bias[8]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_C_GBE_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_C_GBE_MASK,
+				  buf[2] + bias[8]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C1,
-		       MTK_PHY_DA_TX_I2MPB_C_TBT_MASK, buf[2] + bias[9]);
+		       MTK_PHY_DA_TX_I2MPB_C_TBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_C_TBT_MASK,
+				  buf[2] + bias[9]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C2,
-		       MTK_PHY_DA_TX_I2MPB_C_HBT_MASK, (buf[2] + bias[10]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_C_HBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_C_HBT_MASK,
+				  buf[2] + bias[10]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_C2,
-		       MTK_PHY_DA_TX_I2MPB_C_TST_MASK, buf[2] + bias[11]);
+		       MTK_PHY_DA_TX_I2MPB_C_TST_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_C_TST_MASK,
+				  buf[2] + bias[11]));
 
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D1,
-		       MTK_PHY_DA_TX_I2MPB_D_GBE_MASK, (buf[3] + bias[12]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_D_GBE_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_D_GBE_MASK,
+				  buf[3] + bias[12]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D1,
-		       MTK_PHY_DA_TX_I2MPB_D_TBT_MASK, buf[3] + bias[13]);
+		       MTK_PHY_DA_TX_I2MPB_D_TBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_D_TBT_MASK,
+				  buf[3] + bias[13]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D2,
-		       MTK_PHY_DA_TX_I2MPB_D_HBT_MASK, (buf[3] + bias[14]) << 8);
+		       MTK_PHY_DA_TX_I2MPB_D_HBT_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_D_HBT_MASK,
+				  buf[3] + bias[14]));
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TX_I2MPB_TEST_MODE_D2,
-		       MTK_PHY_DA_TX_I2MPB_D_TST_MASK, buf[3] + bias[15]);
+		       MTK_PHY_DA_TX_I2MPB_D_TST_MASK,
+		       FIELD_PREP(MTK_PHY_DA_TX_I2MPB_D_TST_MASK,
+				  buf[3] + bias[15]));
 
 	return 0;
 }
@@ -663,7 +696,8 @@ static int tx_vcm_cal_sw(struct phy_device *phydev, u8 rg_txreserve_x)
 		goto restore;
 
 	/* We calibrate TX-VCM in different logic. Check upper index and then
-	 * lower index. If this calibration is valid, apply lower index's result.
+	 * lower index. If this calibration is valid, apply lower index's
+	 * result.
 	 */
 	ret = upper_ret - lower_ret;
 	if (ret == 1) {
@@ -692,7 +726,8 @@ static int tx_vcm_cal_sw(struct phy_device *phydev, u8 rg_txreserve_x)
 	} else if (upper_idx == TXRESERVE_MAX && upper_ret == 0 &&
 		   lower_ret == 0) {
 		ret = 0;
-		phydev_warn(phydev, "TX-VCM SW cal result at high margin 0x%x\n",
+		phydev_warn(phydev,
+			    "TX-VCM SW cal result at high margin 0x%x\n",
 			    upper_idx);
 	} else {
 		ret = -EINVAL;
@@ -796,7 +831,8 @@ static void mt7981_phy_finetune(struct phy_device *phydev)
 
 	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 9 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
-		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
+		       MTK_PHY_TR_OPEN_LOOP_EN_MASK |
+		       MTK_PHY_LPF_X_AVERAGE_MASK,
 		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0x9));
 
 	/* rg_tr_lpf_cnt_val = 512 */
@@ -865,7 +901,8 @@ static void mt7988_phy_finetune(struct phy_device *phydev)
 
 	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 10 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
-		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
+		       MTK_PHY_TR_OPEN_LOOP_EN_MASK |
+		       MTK_PHY_LPF_X_AVERAGE_MASK,
 		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0xa));
 
 	/* rg_tr_lpf_cnt_val = 1023 */
@@ -977,7 +1014,8 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
 
 	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_3);
-	__phy_modify(phydev, MTK_PHY_LPI_REG_14, MTK_PHY_LPI_WAKE_TIMER_1000_MASK,
+	__phy_modify(phydev, MTK_PHY_LPI_REG_14,
+		     MTK_PHY_LPI_WAKE_TIMER_1000_MASK,
 		     FIELD_PREP(MTK_PHY_LPI_WAKE_TIMER_1000_MASK, 0x19c));
 
 	__phy_modify(phydev, MTK_PHY_LPI_REG_1c, MTK_PHY_SMI_DET_ON_THRESH_MASK,
@@ -987,7 +1025,8 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1,
 		       MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122,
 		       MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK,
-		       FIELD_PREP(MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK, 0xff));
+		       FIELD_PREP(MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK,
+				  0xff));
 }
 
 static int cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,
@@ -1147,7 +1186,8 @@ static int mt798x_phy_hw_led_on_set(struct phy_device *phydev, u8 index,
 					(index ? 16 : 0), &priv->led_state);
 	if (changed)
 		return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
-				      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
+				      MTK_PHY_LED1_ON_CTRL :
+				      MTK_PHY_LED0_ON_CTRL,
 				      MTK_PHY_LED_ON_MASK,
 				      on ? MTK_PHY_LED_ON_FORCE_ON : 0);
 	else
@@ -1157,7 +1197,8 @@ static int mt798x_phy_hw_led_on_set(struct phy_device *phydev, u8 index,
 static int mt798x_phy_hw_led_blink_set(struct phy_device *phydev, u8 index,
 				       bool blinking)
 {
-	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK + (index ? 16 : 0);
+	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK +
+				 (index ? 16 : 0);
 	struct mtk_socphy_priv *priv = phydev->priv;
 	bool changed;
 
@@ -1170,8 +1211,10 @@ static int mt798x_phy_hw_led_blink_set(struct phy_device *phydev, u8 index,
 			      (index ? 16 : 0), &priv->led_state);
 	if (changed)
 		return phy_write_mmd(phydev, MDIO_MMD_VEND2, index ?
-				     MTK_PHY_LED1_BLINK_CTRL : MTK_PHY_LED0_BLINK_CTRL,
-				     blinking ? MTK_PHY_LED_BLINK_FORCE_BLINK : 0);
+				     MTK_PHY_LED1_BLINK_CTRL :
+				     MTK_PHY_LED0_BLINK_CTRL,
+				     blinking ?
+				     MTK_PHY_LED_BLINK_FORCE_BLINK : 0);
 	else
 		return 0;
 }
@@ -1237,7 +1280,8 @@ static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
 					 unsigned long *rules)
 {
-	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK + (index ? 16 : 0);
+	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK +
+				 (index ? 16 : 0);
 	unsigned int bit_netdev = MTK_PHY_LED_STATE_NETDEV + (index ? 16 : 0);
 	unsigned int bit_on = MTK_PHY_LED_STATE_FORCE_ON + (index ? 16 : 0);
 	struct mtk_socphy_priv *priv = phydev->priv;
@@ -1258,8 +1302,8 @@ static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
 	if (blink < 0)
 		return -EIO;
 
-	if ((on & (MTK_PHY_LED_ON_LINK | MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX |
-		   MTK_PHY_LED_ON_LINKDOWN)) ||
+	if ((on & (MTK_PHY_LED_ON_LINK | MTK_PHY_LED_ON_FDX |
+		   MTK_PHY_LED_ON_HDX | MTK_PHY_LED_ON_LINKDOWN)) ||
 	    (blink & (MTK_PHY_LED_BLINK_RX | MTK_PHY_LED_BLINK_TX)))
 		set_bit(bit_netdev, &priv->led_state);
 	else
@@ -1333,17 +1377,23 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 
 	if (rules & BIT(TRIGGER_NETDEV_RX)) {
 		blink |= (on & MTK_PHY_LED_ON_LINK) ?
-			  (((on & MTK_PHY_LED_ON_LINK10) ? MTK_PHY_LED_BLINK_10RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK100) ? MTK_PHY_LED_BLINK_100RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK1000) ? MTK_PHY_LED_BLINK_1000RX : 0)) :
+			  (((on & MTK_PHY_LED_ON_LINK10) ?
+			    MTK_PHY_LED_BLINK_10RX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK100) ?
+			    MTK_PHY_LED_BLINK_100RX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK1000) ?
+			    MTK_PHY_LED_BLINK_1000RX : 0)) :
 			  MTK_PHY_LED_BLINK_RX;
 	}
 
 	if (rules & BIT(TRIGGER_NETDEV_TX)) {
 		blink |= (on & MTK_PHY_LED_ON_LINK) ?
-			  (((on & MTK_PHY_LED_ON_LINK10) ? MTK_PHY_LED_BLINK_10TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK100) ? MTK_PHY_LED_BLINK_100TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK1000) ? MTK_PHY_LED_BLINK_1000TX : 0)) :
+			  (((on & MTK_PHY_LED_ON_LINK10) ?
+			    MTK_PHY_LED_BLINK_10TX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK100) ?
+			    MTK_PHY_LED_BLINK_100TX : 0) |
+			   ((on & MTK_PHY_LED_ON_LINK1000) ?
+			    MTK_PHY_LED_BLINK_1000TX : 0)) :
 			  MTK_PHY_LED_BLINK_TX;
 	}
 
@@ -1400,7 +1450,8 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 	/* Only now setup pinctrl to avoid bogus blinking */
 	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
 	if (IS_ERR(pinctrl))
-		dev_err(&phydev->mdio.bus->dev, "Failed to setup PHY LED pinctrl\n");
+		dev_err(&phydev->mdio.bus->dev,
+			"Failed to setup PHY LED pinctrl\n");
 
 	return 0;
 }
-- 
2.45.2


