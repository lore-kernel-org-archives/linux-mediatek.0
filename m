Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57D3CF2590
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 04:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uf/e3DAHKED+lpAIBTLeE5GHaYqy/l3X9mBcF2NkYOg=; b=vbhzyXnV8y2GS733qIT+3KehAJ
	UpB1lKe62I4iyhoWbaP3Y5JE3+Hc5c+Lf0YvbfuiPFspK4tPIG3bF/l6vZgROpupCyjvg5+tOZhZZ
	nD/V63d047Ec8FY3FyxChkwmNPML7N3hQ2YWwU+nELqWWazJPgHhkK/L3zxzn+Cw5TnqaYRoWdHn9
	PstTeK82pgO37CezFbGk3yHtZRByALFFpUBQZwsizag+MahTbH4BPZfRv5HcomqPs4ciC3EHgcPYD
	eoraGDq0Sjk5Nbl7bXR9TbmqumCaj3Ufr2BVhzlWLPyrxmpNCfPzXezjIYJ/iswvGsQ8cvJevUUz6
	vLD1EEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0CKx-00000003gGJ-47TT;
	Mon, 14 Oct 2024 04:05:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0CKv-00000003gFY-0VFH;
	Mon, 14 Oct 2024 04:05:38 +0000
X-UUID: 8b5437aa89e111efb3adad29d29602c1-20241013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Uf/e3DAHKED+lpAIBTLeE5GHaYqy/l3X9mBcF2NkYOg=;
	b=B6IqJal/v2IsZWxqBnqJ3CVlw+ka3e+Pkcj8bCiZXDw8v1JbF7J4vTCutCQWwZ5d4A1/IlkGFTH6Bnc3fsgR4N0tNrMiDnfbzpODJg1NKNdxQI9QihqxsNdnYu7tARivOjhIaXzm+tkFCf8sKQvP79Fjar3/orQRh+CFpPmoiEc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:190b7fcb-b9c5-4722-a615-8551d6c473a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:7c313165-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8b5437aa89e111efb3adad29d29602c1-20241013
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1077791320; Sun, 13 Oct 2024 21:05:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 12:05:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 12:05:23 +0800
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
Subject: [PATCH net-next 1/1] net: phy: Refactor mediatek-ge-soc.c for clarity and correctness
Date: Mon, 14 Oct 2024 12:05:21 +0800
Message-ID: <20241014040521.24949-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.458400-8.000000
X-TMASE-MatchedRID: zUgs7dey+BiGVqG4eYPDVmivjLE8DPtZI7OxeNfmD+xUjspoiX02F0pf
	KXQfMT86eW+YAd80z84+ta/415QhvsZEoJx1HltlFYJUGv4DL3w7r2Gtb9iBYb/A+0D1to6PhCY
	Q0GRRnBM2EmwJ14p7Go3/d0NuPcI1RpYY54qZBhDqsFlQXzLr6F3KZkFy4YZECeczN3c5GkGf27
	pkMe/LtxTFHRulpTWld7JjTNi4iyv31EmIMyYYYq4bq+ny2THnJjoAtfwU0s4rYyNNmvu5tSe6L
	5ZD16Ut6b45UQKD4HRiF1CeDcNmgynqwKmU0oYzJhFEQZiq2ZTSlWtltt+KSL/tumWFs8JCQZbI
	KVCFCS9f/JaSUU8WoGZAxbsIhgaePddTF47kT4vJ1E/nrJFED30tCKdnhB589yM15V5aWpj6C0e
	Ps7A07SAJgyd9wrc8OFU4ZjJKmMVffhx7MGdIe/hUEO1vMvIvotQ1Us5pzkzcifiwhcTWXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.458400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 257D25B92A8140EDFC0BA0B51F1272C64C2B47B38B5C3C2F8FDCDF2CCBEF49272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_210537_212506_ED40E81F 
X-CRM114-Status: GOOD (  17.15  )
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

This patch does the following clean-up:
1. Fix spelling errors and rearrange variables with reverse
   Xmas tree order.
2. Shrink mtk-ge-soc.c line wrapping to 80 characters.
3. Propagate error code correctly in cal_cycle().
4. Fix some functions with FIELD_PREP()/FIELD_GET().
5. Remove unnecessary outer parens of supported_triggers var.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
This patch is derived from Message ID:
20241004102413.5838-9-SkyLake.Huang@mediatek.com
---
 drivers/net/phy/mediatek-ge-soc.c | 169 ++++++++++++++++++++----------
 1 file changed, 112 insertions(+), 57 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index f4f9412..a931832 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -110,7 +110,7 @@
 #define   MTK_PHY_CR_TX_AMP_OFFSET_D_MASK	GENMASK(6, 0)
 
 #define MTK_PHY_RG_AD_CAL_COMP			0x17a
-#define   MTK_PHY_AD_CAL_COMP_OUT_SHIFT		(8)
+#define   MTK_PHY_AD_CAL_COMP_OUT_MASK		GENMASK(8, 8)
 
 #define MTK_PHY_RG_AD_CAL_CLK			0x17b
 #define   MTK_PHY_DA_CAL_CLK			BIT(0)
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
@@ -350,8 +351,10 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 
 	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
 			   MTK_PHY_DA_CALIN_FLAG);
-	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP) >>
-			   MTK_PHY_AD_CAL_COMP_OUT_SHIFT;
+	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
+	if (ret < 0)
+		return ret;
+	ret = FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
 	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
 
 	return ret;
@@ -408,16 +411,17 @@ static int tx_offset_cal_efuse(struct phy_device *phydev, u32 *buf)
 
 static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
 {
-	int i;
-	int bias[16] = {};
-	const int vals_9461[16] = { 7, 1, 4, 7,
-				    7, 1, 4, 7,
-				    7, 1, 4, 7,
-				    7, 1, 4, 7 };
 	const int vals_9481[16] = { 10, 6, 6, 10,
 				    10, 6, 6, 10,
 				    10, 6, 6, 10,
 				    10, 6, 6, 10 };
+	const int vals_9461[16] = { 7, 1, 4, 7,
+				    7, 1, 4, 7,
+				    7, 1, 4, 7,
+				    7, 1, 4, 7 };
+	int bias[16] = {};
+	int i;
+
 	switch (phydev->drv->phy_id) {
 	case MTK_GPHY_ID_MT7981:
 		/* We add some calibration to efuse values
@@ -440,40 +444,72 @@ static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
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
@@ -662,7 +698,8 @@ static int tx_vcm_cal_sw(struct phy_device *phydev, u8 rg_txreserve_x)
 		goto restore;
 
 	/* We calibrate TX-VCM in different logic. Check upper index and then
-	 * lower index. If this calibration is valid, apply lower index's result.
+	 * lower index. If this calibration is valid, apply lower index's
+	 * result.
 	 */
 	ret = upper_ret - lower_ret;
 	if (ret == 1) {
@@ -691,7 +728,8 @@ static int tx_vcm_cal_sw(struct phy_device *phydev, u8 rg_txreserve_x)
 	} else if (upper_idx == TXRESERVE_MAX && upper_ret == 0 &&
 		   lower_ret == 0) {
 		ret = 0;
-		phydev_warn(phydev, "TX-VCM SW cal result at high margin 0x%x\n",
+		phydev_warn(phydev,
+			    "TX-VCM SW cal result at high margin 0x%x\n",
 			    upper_idx);
 	} else {
 		ret = -EINVAL;
@@ -795,7 +833,8 @@ static void mt7981_phy_finetune(struct phy_device *phydev)
 
 	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 9 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
-		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
+		       MTK_PHY_TR_OPEN_LOOP_EN_MASK |
+		       MTK_PHY_LPF_X_AVERAGE_MASK,
 		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0x9));
 
 	/* rg_tr_lpf_cnt_val = 512 */
@@ -864,7 +903,8 @@ static void mt7988_phy_finetune(struct phy_device *phydev)
 
 	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 10 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
-		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
+		       MTK_PHY_TR_OPEN_LOOP_EN_MASK |
+		       MTK_PHY_LPF_X_AVERAGE_MASK,
 		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0xa));
 
 	/* rg_tr_lpf_cnt_val = 1023 */
@@ -976,7 +1016,8 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
 
 	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_3);
-	__phy_modify(phydev, MTK_PHY_LPI_REG_14, MTK_PHY_LPI_WAKE_TIMER_1000_MASK,
+	__phy_modify(phydev, MTK_PHY_LPI_REG_14,
+		     MTK_PHY_LPI_WAKE_TIMER_1000_MASK,
 		     FIELD_PREP(MTK_PHY_LPI_WAKE_TIMER_1000_MASK, 0x19c));
 
 	__phy_modify(phydev, MTK_PHY_LPI_REG_1c, MTK_PHY_SMI_DET_ON_THRESH_MASK,
@@ -986,7 +1027,8 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1,
 		       MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122,
 		       MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK,
-		       FIELD_PREP(MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK, 0xff));
+		       FIELD_PREP(MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK,
+				  0xff));
 }
 
 static int cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,
@@ -1069,10 +1111,10 @@ static int start_cal(struct phy_device *phydev, enum CAL_ITEM cal_item,
 
 static int mt798x_phy_calibration(struct phy_device *phydev)
 {
+	struct nvmem_cell *cell;
 	int ret = 0;
-	u32 *buf;
 	size_t len;
-	struct nvmem_cell *cell;
+	u32 *buf;
 
 	cell = nvmem_cell_get(&phydev->mdio.dev, "phy-cal-data");
 	if (IS_ERR(cell)) {
@@ -1146,7 +1188,8 @@ static int mt798x_phy_hw_led_on_set(struct phy_device *phydev, u8 index,
 					(index ? 16 : 0), &priv->led_state);
 	if (changed)
 		return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
-				      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
+				      MTK_PHY_LED1_ON_CTRL :
+				      MTK_PHY_LED0_ON_CTRL,
 				      MTK_PHY_LED_ON_MASK,
 				      on ? MTK_PHY_LED_ON_FORCE_ON : 0);
 	else
@@ -1156,7 +1199,8 @@ static int mt798x_phy_hw_led_on_set(struct phy_device *phydev, u8 index,
 static int mt798x_phy_hw_led_blink_set(struct phy_device *phydev, u8 index,
 				       bool blinking)
 {
-	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK + (index ? 16 : 0);
+	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK +
+				 (index ? 16 : 0);
 	struct mtk_socphy_priv *priv = phydev->priv;
 	bool changed;
 
@@ -1169,8 +1213,10 @@ static int mt798x_phy_hw_led_blink_set(struct phy_device *phydev, u8 index,
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
@@ -1210,14 +1256,15 @@ static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
 	return mt798x_phy_hw_led_on_set(phydev, index, (value != LED_OFF));
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
+	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	BIT(TRIGGER_NETDEV_LINK)        |
+	BIT(TRIGGER_NETDEV_LINK_10)     |
+	BIT(TRIGGER_NETDEV_LINK_100)    |
+	BIT(TRIGGER_NETDEV_LINK_1000)   |
+	BIT(TRIGGER_NETDEV_RX)          |
+	BIT(TRIGGER_NETDEV_TX);
 
 static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 					  unsigned long rules)
@@ -1235,7 +1282,8 @@ static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
 					 unsigned long *rules)
 {
-	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK + (index ? 16 : 0);
+	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK +
+				 (index ? 16 : 0);
 	unsigned int bit_netdev = MTK_PHY_LED_STATE_NETDEV + (index ? 16 : 0);
 	unsigned int bit_on = MTK_PHY_LED_STATE_FORCE_ON + (index ? 16 : 0);
 	struct mtk_socphy_priv *priv = phydev->priv;
@@ -1256,8 +1304,8 @@ static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
 	if (blink < 0)
 		return -EIO;
 
-	if ((on & (MTK_PHY_LED_ON_LINK | MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX |
-		   MTK_PHY_LED_ON_LINKDOWN)) ||
+	if ((on & (MTK_PHY_LED_ON_LINK | MTK_PHY_LED_ON_FDX |
+		   MTK_PHY_LED_ON_HDX | MTK_PHY_LED_ON_LINKDOWN)) ||
 	    (blink & (MTK_PHY_LED_BLINK_RX | MTK_PHY_LED_BLINK_TX)))
 		set_bit(bit_netdev, &priv->led_state);
 	else
@@ -1331,17 +1379,23 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 
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
 
@@ -1398,7 +1452,8 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 	/* Only now setup pinctrl to avoid bogus blinking */
 	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
 	if (IS_ERR(pinctrl))
-		dev_err(&phydev->mdio.bus->dev, "Failed to setup PHY LED pinctrl\n");
+		dev_err(&phydev->mdio.bus->dev,
+			"Failed to setup PHY LED pinctrl\n");
 
 	return 0;
 }
@@ -1415,7 +1470,7 @@ static int mt7988_phy_probe_shared(struct phy_device *phydev)
 	 * LED_C and LED_D respectively. At the same time those pins are used to
 	 * bootstrap configuration of the reference clock source (LED_A),
 	 * DRAM DDRx16b x2/x1 (LED_B) and boot device (LED_C, LED_D).
-	 * In practise this is done using a LED and a resistor pulling the pin
+	 * In practice this is done using a LED and a resistor pulling the pin
 	 * either to GND or to VIO.
 	 * The detected value at boot time is accessible at run-time using the
 	 * TPBANK0 register located in the gpio base of the pinctrl, in order
-- 
2.45.2


