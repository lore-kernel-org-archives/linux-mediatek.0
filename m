Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4268C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWuvQSnkV5IpY3oKMfdZayMV8sQ3/pC/6sne26qy/j0=; b=O4iXabZ2LCccFkKSov9xBIIqY5
	/pGR67CV4DJtjYjNrbfKeJUIMGKY20WgpSUm8tB/KcST2Z25OHjWHwHapffhOvVtf8UxIJ/X+vfgO
	UmUHVXXPiiEoETUyLCknxKHm37mOm20fCtAcRDlCXsgyz5BT80R+ZOYsVRFEpuPTnjNvtKOdX3pNi
	DXR0gjleLIC0CnwV6Yzi8Zmt4Uz9otCF3D2Q4Ahm2+mm4aWIYTyf+krpBRty9Obns8Re0AjJ+Iu+i
	gwmgoaLpA0Bu6OfIJBbydDItOFexrZcUwjjjmDqwQJr5Fe3kfXS5x81+u+Ax7nxriYZB3lYNVTm0c
	gcQVJDag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVez-001Zh2-2R;
	Wed, 24 Jan 2024 05:18:49 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVev-001Zg7-1y;
	Wed, 24 Jan 2024 05:18:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rSVef-00011k-2e;
	Wed, 24 Jan 2024 05:18:31 +0000
Date: Wed, 24 Jan 2024 05:18:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>
Subject: [PATCH net] net: phy: mediatek-ge-soc: sync driver with MediaTek SDK
Message-ID: <f2195279c234c0f618946424b8236026126bc595.1706071311.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_211845_793920_E18E1A22 
X-CRM114-Status: GOOD (  16.37  )
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

Sync initialization and calibration routines with MediaTek's reference
driver. Improves compliance and resolves link stability issues with
CH340 IoT devices connected to MT798x built-in PHYs.

Fixes: 98c485eaf509 ("net: phy: add driver for MediaTek SoC built-in GE PHYs")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/mediatek-ge-soc.c | 147 ++++++++++++++++--------------
 1 file changed, 81 insertions(+), 66 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index 8a20d9889f105..0f3a1538a8b8e 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -489,7 +489,7 @@ static int tx_r50_fill_result(struct phy_device *phydev, u16 tx_r50_cal_val,
 	u16 reg, val;
 
 	if (phydev->drv->phy_id == MTK_GPHY_ID_MT7988)
-		bias = -2;
+		bias = -1;
 
 	val = clamp_val(bias + tx_r50_cal_val, 0, 63);
 
@@ -705,6 +705,11 @@ static int tx_vcm_cal_sw(struct phy_device *phydev, u8 rg_txreserve_x)
 static void mt798x_phy_common_finetune(struct phy_device *phydev)
 {
 	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
+	/* SlvDSPreadyTime = 24, MasDSPreadyTime = 24 */
+	__phy_write(phydev, 0x11, 0xc71);
+	__phy_write(phydev, 0x12, 0xc);
+	__phy_write(phydev, 0x10, 0x8fae);
+
 	/* EnabRandUpdTrig = 1 */
 	__phy_write(phydev, 0x11, 0x2f00);
 	__phy_write(phydev, 0x12, 0xe);
@@ -715,15 +720,56 @@ static void mt798x_phy_common_finetune(struct phy_device *phydev)
 	__phy_write(phydev, 0x12, 0x0);
 	__phy_write(phydev, 0x10, 0x83aa);
 
-	/* TrFreeze = 0 */
+	/* FfeUpdGainForce = 1(Enable), FfeUpdGainForceVal = 4 */
+	__phy_write(phydev, 0x11, 0x240);
+	__phy_write(phydev, 0x12, 0x0);
+	__phy_write(phydev, 0x10, 0x9680);
+
+	/* TrFreeze = 0 (mt7988 default) */
 	__phy_write(phydev, 0x11, 0x0);
 	__phy_write(phydev, 0x12, 0x0);
 	__phy_write(phydev, 0x10, 0x9686);
 
+	/* SSTrKp100 = 5 */
+	/* SSTrKf100 = 6 */
+	/* SSTrKp1000Mas = 5 */
+	/* SSTrKf1000Mas = 6 */
 	/* SSTrKp1000Slv = 5 */
+	/* SSTrKf1000Slv = 6 */
 	__phy_write(phydev, 0x11, 0xbaef);
 	__phy_write(phydev, 0x12, 0x2e);
 	__phy_write(phydev, 0x10, 0x968c);
+	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+}
+
+static void mt7981_phy_finetune(struct phy_device *phydev)
+{
+	u16 val[8] = { 0x01ce, 0x01c1,
+		       0x020f, 0x0202,
+		       0x03d0, 0x03c0,
+		       0x0013, 0x0005 };
+	int i, k;
+
+	/* 100M eye finetune:
+	 * Keep middle level of TX MLT3 shapper as default.
+	 * Only change TX MLT3 overshoot level here.
+	 */
+	for (k = 0, i = 1; i < 12; i++) {
+		if (i % 3 == 0)
+			continue;
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, i, val[k++]);
+	}
+
+	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
+	/* ResetSyncOffset = 6 */
+	__phy_write(phydev, 0x11, 0x600);
+	__phy_write(phydev, 0x12, 0x0);
+	__phy_write(phydev, 0x10, 0x8fc0);
+
+	/* VgaDecRate = 1 */
+	__phy_write(phydev, 0x11, 0x4c2a);
+	__phy_write(phydev, 0x12, 0x3e);
+	__phy_write(phydev, 0x10, 0x8fa4);
 
 	/* MrvlTrFix100Kp = 3, MrvlTrFix100Kf = 2,
 	 * MrvlTrFix1000Kp = 3, MrvlTrFix1000Kf = 2
@@ -738,7 +784,7 @@ static void mt798x_phy_common_finetune(struct phy_device *phydev)
 	__phy_write(phydev, 0x10, 0x8ec0);
 	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
 
-	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 9*/
+	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 9 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
 		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
 		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0x9));
@@ -771,48 +817,6 @@ static void mt798x_phy_common_finetune(struct phy_device *phydev)
 	phy_write_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_LDO_OUTPUT_V, 0x2222);
 }
 
-static void mt7981_phy_finetune(struct phy_device *phydev)
-{
-	u16 val[8] = { 0x01ce, 0x01c1,
-		       0x020f, 0x0202,
-		       0x03d0, 0x03c0,
-		       0x0013, 0x0005 };
-	int i, k;
-
-	/* 100M eye finetune:
-	 * Keep middle level of TX MLT3 shapper as default.
-	 * Only change TX MLT3 overshoot level here.
-	 */
-	for (k = 0, i = 1; i < 12; i++) {
-		if (i % 3 == 0)
-			continue;
-		phy_write_mmd(phydev, MDIO_MMD_VEND1, i, val[k++]);
-	}
-
-	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
-	/* SlvDSPreadyTime = 24, MasDSPreadyTime = 24 */
-	__phy_write(phydev, 0x11, 0xc71);
-	__phy_write(phydev, 0x12, 0xc);
-	__phy_write(phydev, 0x10, 0x8fae);
-
-	/* ResetSyncOffset = 6 */
-	__phy_write(phydev, 0x11, 0x600);
-	__phy_write(phydev, 0x12, 0x0);
-	__phy_write(phydev, 0x10, 0x8fc0);
-
-	/* VgaDecRate = 1 */
-	__phy_write(phydev, 0x11, 0x4c2a);
-	__phy_write(phydev, 0x12, 0x3e);
-	__phy_write(phydev, 0x10, 0x8fa4);
-
-	/* FfeUpdGainForce = 4 */
-	__phy_write(phydev, 0x11, 0x240);
-	__phy_write(phydev, 0x12, 0x0);
-	__phy_write(phydev, 0x10, 0x9680);
-
-	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
-}
-
 static void mt7988_phy_finetune(struct phy_device *phydev)
 {
 	u16 val[12] = { 0x0187, 0x01cd, 0x01c8, 0x0182,
@@ -827,17 +831,7 @@ static void mt7988_phy_finetune(struct phy_device *phydev)
 	/* TCT finetune */
 	phy_write_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_TX_FILTER, 0x5);
 
-	/* Disable TX power saving */
-	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RXADC_CTRL_RG7,
-		       MTK_PHY_DA_AD_BUF_BIAS_LP_MASK, 0x3 << 8);
-
 	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
-
-	/* SlvDSPreadyTime = 24, MasDSPreadyTime = 12 */
-	__phy_write(phydev, 0x11, 0x671);
-	__phy_write(phydev, 0x12, 0xc);
-	__phy_write(phydev, 0x10, 0x8fae);
-
 	/* ResetSyncOffset = 5 */
 	__phy_write(phydev, 0x11, 0x500);
 	__phy_write(phydev, 0x12, 0x0);
@@ -845,13 +839,27 @@ static void mt7988_phy_finetune(struct phy_device *phydev)
 
 	/* VgaDecRate is 1 at default on mt7988 */
 
-	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+	/* MrvlTrFix100Kp = 6, MrvlTrFix100Kf = 7,
+	 * MrvlTrFix1000Kp = 6, MrvlTrFix1000Kf = 7
+	 */
+	__phy_write(phydev, 0x11, 0xb90a);
+	__phy_write(phydev, 0x12, 0x6f);
+	__phy_write(phydev, 0x10, 0x8f82);
+
+	/* RemAckCntLimitCtrl = 1 */
+	__phy_write(phydev, 0x11, 0xfbba);
+	__phy_write(phydev, 0x12, 0xc3);
+	__phy_write(phydev, 0x10, 0x87f8);
 
-	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_2A30);
-	/* TxClkOffset = 2 */
-	__phy_modify(phydev, MTK_PHY_ANARG_RG, MTK_PHY_TCLKOFFSET_MASK,
-		     FIELD_PREP(MTK_PHY_TCLKOFFSET_MASK, 0x2));
 	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
+
+	/* TR_OPEN_LOOP_EN = 1, lpf_x_average = 10 */
+	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG234,
+		       MTK_PHY_TR_OPEN_LOOP_EN_MASK | MTK_PHY_LPF_X_AVERAGE_MASK,
+		       BIT(0) | FIELD_PREP(MTK_PHY_LPF_X_AVERAGE_MASK, 0xa));
+
+	/* rg_tr_lpf_cnt_val = 1023 */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_LPF_CNT_VAL, 0x3ff);
 }
 
 static void mt798x_phy_eee(struct phy_device *phydev)
@@ -884,11 +892,11 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 		       MTK_PHY_LPI_SLV_SEND_TX_EN,
 		       FIELD_PREP(MTK_PHY_LPI_SLV_SEND_TX_TIMER_MASK, 0x120));
 
-	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG239,
-		       MTK_PHY_LPI_SEND_LOC_TIMER_MASK |
-		       MTK_PHY_LPI_TXPCS_LOC_RCV,
-		       FIELD_PREP(MTK_PHY_LPI_SEND_LOC_TIMER_MASK, 0x117));
+	/* Keep MTK_PHY_LPI_SEND_LOC_TIMER as 375 */
+	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG239,
+			   MTK_PHY_LPI_TXPCS_LOC_RCV);
 
+	/* This also fixes some IoT issues, such as CH340 */
 	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_DEV1E_REG2C7,
 		       MTK_PHY_MAX_GAIN_MASK | MTK_PHY_MIN_GAIN_MASK,
 		       FIELD_PREP(MTK_PHY_MAX_GAIN_MASK, 0x8) |
@@ -922,7 +930,7 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	__phy_write(phydev, 0x12, 0x0);
 	__phy_write(phydev, 0x10, 0x9690);
 
-	/* REG_EEE_st2TrKf1000 = 3 */
+	/* REG_EEE_st2TrKf1000 = 2 */
 	__phy_write(phydev, 0x11, 0x114f);
 	__phy_write(phydev, 0x12, 0x2);
 	__phy_write(phydev, 0x10, 0x969a);
@@ -947,7 +955,7 @@ static void mt798x_phy_eee(struct phy_device *phydev)
 	__phy_write(phydev, 0x12, 0x0);
 	__phy_write(phydev, 0x10, 0x96b8);
 
-	/* REGEEE_wake_slv_tr_wait_dfesigdet_en = 1 */
+	/* REGEEE_wake_slv_tr_wait_dfesigdet_en = 0 */
 	__phy_write(phydev, 0x11, 0x1463);
 	__phy_write(phydev, 0x12, 0x0);
 	__phy_write(phydev, 0x10, 0x96ca);
@@ -1459,6 +1467,13 @@ static int mt7988_phy_probe(struct phy_device *phydev)
 	if (err)
 		return err;
 
+	/* Disable TX power saving at probing to:
+	 * 1. Meet common mode compliance test criteria
+	 * 2. Make sure that TX-VCM calibration works fine
+	 */
+	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RXADC_CTRL_RG7,
+		       MTK_PHY_DA_AD_BUF_BIAS_LP_MASK, 0x3 << 8);
+
 	return mt798x_phy_calibration(phydev);
 }
 
-- 
2.43.0


