Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF36C531F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxWxssHVhFRefTL930FVm9qoAMC1Jxz+DZpyVb7piDU=; b=lumqfQXNVXAKQwK63evkoNd9Oo
	/uABJrIOVDMeP8dTIDpQHD8fnNabtZ8gJunJRMzSkcFvm7ndxGR7L9MX0YmnZ11Lt2w+2dF7PB+li
	3X5AJqQp1+fD0pC96Wqf/IeWkUaSy84+5TASHsCL0S1DcpYV0KzA0GT8dCdJ/McgkOipCMF7EoKNk
	dUUEcDVMGJPOADjI1XoX/FpRiGxlbRqPFDx5khfYP9TbUmY/O9pOf5mKh1lUFjmJvjT8BX+HhYWkB
	c37m8qQQ2qEYF6XqK88kJbHg0N+KDiUVMQO5yPuKr57mE3Kh3LzhXq/Q25eriqq0NqlP/AafLkG0R
	pKy2bVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLGD-0000000H7kg-24ia;
	Fri, 24 Jul 2026 19:08:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLG0-0000000H7bD-3yaI
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 19:08:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47640541585so516626f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784920107; x=1785524907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NxWxssHVhFRefTL930FVm9qoAMC1Jxz+DZpyVb7piDU=;
        b=S0u4ZeiD4Z1qHwHgX2Np6DkeDMUqt8F4zSuYUP+FCiujVygfqnJKW40xtnsSe4eF5Y
         hZct3mWz0Qr7Pxibz2f60x+/nLGN/qPSg/a0xtWVKCi8mp8aeG30ueAL2ICpK+jiWmWt
         OPk57HjH15zQHIVbm3PLywv2S77bN/iNTJN/PXEMNG8r0dpkkoXfVpAvD3+SJ9BGi67b
         gceU/7yaryhCmRU0GYl/CY+nHC6A95kgf7WSTYSAwJmoEmLTGKPh/b1JkCXx0SXBWPMB
         Mr5HU2XmaVryBc27L1CMJ3LL5Gc2gq+UnkZ6EXxtkussS68bz3NPUUHD0a4v97TMwaX2
         racw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784920107; x=1785524907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NxWxssHVhFRefTL930FVm9qoAMC1Jxz+DZpyVb7piDU=;
        b=Jwp/0/gDmDVhmroOI5Z1nUnf/wSGFQy4uueKiMI3zY9i4kftqHVd02EIx3xxtwaXrp
         DrgkRImxOl8T188S4ltmpUtvmCMFWHOU1oiwGpFNj3wPy57JelpJRowUakiUpNtlR5sG
         XZRylrVPhtKZA7GOXLlHCh5EliTgDrg7TcsWwdVqM1u5fBM3YqC8mUyArMh4PeiON3BE
         3U2JNV+R5Ly2ojRFfu0Ma2JGePFxp+H6JJRS6EMEcGR+21Tmg2y8Uvysfs02oAnbXave
         d3CWonGZOh3//YOkkBoxseT6tqeNeAkHO1VlUBmOlLPZ40rfLjhOfIOFLAKCrJyNdvR0
         QJJw==
X-Forwarded-Encrypted: i=1; AHgh+RphxpQTuYRxT2C3URXapbRape+sXQIQhaPYmdiMuaxBYNX7/8YuXtxxukCF9XtsaxY71+VnMHLmKa9+EWw3LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCHFoSipFf4K/UjzEU540w28S5jQprNL5G+1+of3HUR5CAEy1s
	dlqfapf3ahBl4z+uhscf0WHjCagd+SbYE/Kl2CmZsCxJQgR1fgwuHCB0
X-Gm-Gg: AR+sD126b+7cGu9MhOomA8w2b22Cjg6Agi++zgo2GsYrlDHipbLrSBDv7Ab35cK9ZZG
	jejSniQC2H0371dCUi0aob+tv47OVgAv4nJUWgV2hZuAKHg1AcCo3JDfiqQ4BDYg4LUNuMtKTzt
	9AspnQP0YKva+PD1C8v7Vok+NEixY0dTZcaqVFn7el+Qh15MMN7C7Nc1Ka32QapF/IP/9LpRYag
	snCasNv4lvkz3yXX8v/GdcYYvo6AJt5FWgI89cNAcgku+PEtfO2s2zmKit2uUopNmV3nJYhd9zT
	1Myo+vZYD2xjrkkgmqcACdOLL1XUJ/aF+bC4JWj1lyOMj3IOhZRuNH74I8XY5qPESS+zuakT482
	MsW7ecEJlLHWO3gMYST+O5M6zTBAuwwGM5auNCXMI6TVBtXMWtLG8k3Aep/lO4hlZkkNeKddcW+
	civuRyoSUmOjfkXK93a2lPbOk8XSTUuj9kVTi/Us8W8ayKgwE9uIwhP6h8EnB2waZl
X-Received: by 2002:a05:600c:3b92:b0:495:680a:ed19 with SMTP id 5b1f17b1804b1-49573d20b9emr92232435e9.32.1784920106714;
        Fri, 24 Jul 2026 12:08:26 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4c8d6b5sm5893755e9.2.2026.07.24.12.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:08:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 2/6] net: phy: mediatek: move MTK GE SoC registers define to dedicated header
Date: Fri, 24 Jul 2026 21:08:05 +0200
Message-ID: <20260724190811.198339-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724190811.198339-1-ansuelsmth@gmail.com>
References: <20260724190811.198339-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_120829_176183_28DF4525 
X-CRM114-Status: GOOD (  12.26  )
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

In preparation for support of special Software Calibration for Airoha
PHY, move the MTK GE SoC registers define to a dedicated header.

This is to keep cleaner code and permit sharing these define in multiple
source code.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                           |   1 +
 drivers/net/phy/mediatek/mtk-ge-soc.c | 340 +------------------------
 drivers/net/phy/mediatek/mtk-ge-soc.h | 348 ++++++++++++++++++++++++++
 3 files changed, 350 insertions(+), 339 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f72058a2f2..16e47aea84c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16512,6 +16512,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/phy/mediatek/mtk-2p5ge.c
 F:	drivers/net/phy/mediatek/mtk-ge-soc.c
+F:	drivers/net/phy/mediatek/mtk-ge-soc.h
 F:	drivers/net/phy/mediatek/mtk-phy-lib.c
 F:	drivers/net/phy/mediatek/mtk-ge.c
 F:	drivers/net/phy/mediatek/mtk.h
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 9a54949644d5..c25292f7178a 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -11,322 +11,10 @@
 
 #include "../phylib.h"
 #include "mtk.h"
+#include "mtk-ge-soc.h"
 
 #define MTK_PHY_MAX_LEDS			2
 
-#define MTK_GPHY_ID_MT7981			0x03a29461
-#define MTK_GPHY_ID_MT7988			0x03a29481
-#define MTK_GPHY_ID_AN7581			0x03a294c1
-#define MTK_GPHY_ID_AN7583			0xc0ff0420
-
-#define MTK_EXT_PAGE_ACCESS			0x1f
-#define MTK_PHY_PAGE_STANDARD			0x0000
-#define MTK_PHY_PAGE_EXTENDED_3			0x0003
-
-#define MTK_PHY_LPI_REG_14			0x14
-#define MTK_PHY_LPI_WAKE_TIMER_1000_MASK	GENMASK(8, 0)
-
-#define MTK_PHY_LPI_REG_1c			0x1c
-#define MTK_PHY_SMI_DET_ON_THRESH_MASK		GENMASK(13, 8)
-
-#define MTK_PHY_PAGE_EXTENDED_2A30		0x2a30
-
-/* Registers on Token Ring debug nodes */
-/* ch_addr = 0x0, node_addr = 0x7, data_addr = 0x15 */
-/* NormMseLoThresh */
-#define NORMAL_MSE_LO_THRESH_MASK		GENMASK(15, 8)
-
-/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x3c */
-/* RemAckCntLimitCtrl */
-#define REMOTE_ACK_COUNT_LIMIT_CTRL_MASK	GENMASK(2, 1)
-
-/* ch_addr = 0x1, node_addr = 0xd, data_addr = 0x20 */
-/* VcoSlicerThreshBitsHigh */
-#define VCO_SLICER_THRESH_HIGH_MASK		GENMASK(23, 0)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x0 */
-/* DfeTailEnableVgaThresh1000 */
-#define DFE_TAIL_EANBLE_VGA_TRHESH_1000		GENMASK(5, 1)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
-/* MrvlTrFix100Kp */
-#define MRVL_TR_FIX_100KP_MASK			GENMASK(22, 20)
-/* MrvlTrFix100Kf */
-#define MRVL_TR_FIX_100KF_MASK			GENMASK(19, 17)
-/* MrvlTrFix1000Kp */
-#define MRVL_TR_FIX_1000KP_MASK			GENMASK(16, 14)
-/* MrvlTrFix1000Kf */
-#define MRVL_TR_FIX_1000KF_MASK			GENMASK(13, 11)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x12 */
-/* VgaDecRate */
-#define VGA_DECIMATION_RATE_MASK		GENMASK(8, 5)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x17 */
-/* SlvDSPreadyTime */
-#define SLAVE_DSP_READY_TIME_MASK		GENMASK(22, 15)
-/* MasDSPreadyTime */
-#define MASTER_DSP_READY_TIME_MASK		GENMASK(14, 7)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x18 */
-/* EnabRandUpdTrig */
-#define ENABLE_RANDOM_UPDOWN_COUNTER_TRIGGER	BIT(8)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x20 */
-/* ResetSyncOffset */
-#define RESET_SYNC_OFFSET_MASK			GENMASK(11, 8)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x0 */
-/* FfeUpdGainForceVal */
-#define FFE_UPDATE_GAIN_FORCE_VAL_MASK		GENMASK(9, 7)
-/* FfeUpdGainForce */
-#define FFE_UPDATE_GAIN_FORCE			BIT(6)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x3 */
-/* TrFreeze */
-#define TR_FREEZE_MASK				GENMASK(11, 0)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x6 */
-/* SS: Steady-state, KP: Proportional Gain */
-/* SSTrKp100 */
-#define SS_TR_KP100_MASK			GENMASK(21, 19)
-/* SSTrKf100 */
-#define SS_TR_KF100_MASK			GENMASK(18, 16)
-/* SSTrKp1000Mas */
-#define SS_TR_KP1000_MASTER_MASK		GENMASK(15, 13)
-/* SSTrKf1000Mas */
-#define SS_TR_KF1000_MASTER_MASK		GENMASK(12, 10)
-/* SSTrKp1000Slv */
-#define SS_TR_KP1000_SLAVE_MASK			GENMASK(9, 7)
-/* SSTrKf1000Slv */
-#define SS_TR_KF1000_SLAVE_MASK			GENMASK(6, 4)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x8 */
-/* clear this bit if wanna select from AFE */
-/* Regsigdet_sel_1000 */
-#define EEE1000_SELECT_SIGNAL_DETECTION_FROM_DFE	BIT(4)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xd */
-/* RegEEE_st2TrKf1000 */
-#define EEE1000_STAGE2_TR_KF_MASK		GENMASK(13, 11)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xf */
-/* RegEEE_slv_waketr_timer_tar */
-#define SLAVE_WAKETR_TIMER_MASK			GENMASK(20, 11)
-/* RegEEE_slv_remtx_timer_tar */
-#define SLAVE_REMTX_TIMER_MASK			GENMASK(10, 1)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x10 */
-/* RegEEE_slv_wake_int_timer_tar */
-#define SLAVE_WAKEINT_TIMER_MASK		GENMASK(10, 1)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x14 */
-/* RegEEE_trfreeze_timer2 */
-#define TR_FREEZE_TIMER2_MASK			GENMASK(9, 0)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x1c */
-/* RegEEE100Stg1_tar */
-#define EEE100_LPSYNC_STAGE1_UPDATE_TIMER_MASK	GENMASK(8, 0)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x25 */
-/* REGEEE_wake_slv_tr_wait_dfesigdet_en */
-#define WAKE_SLAVE_TR_WAIT_DFE_DETECTION_EN	BIT(11)
-
-#define ANALOG_INTERNAL_OPERATION_MAX_US	20
-#define TXRESERVE_MIN				0
-#define TXRESERVE_MAX				7
-
-#define MTK_PHY_ANARG_RG			0x10
-#define   MTK_PHY_TCLKOFFSET_MASK		GENMASK(12, 8)
-
-/* Registers on MDIO_MMD_VEND1 */
-#define MTK_PHY_TXVLD_DA_RG			0x12
-#define   MTK_PHY_DA_TX_I2MPB_A_GBE_MASK	GENMASK(15, 10)
-#define   MTK_PHY_DA_TX_I2MPB_A_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_A2		0x16
-#define   MTK_PHY_DA_TX_I2MPB_A_HBT_MASK	GENMASK(15, 10)
-#define   MTK_PHY_DA_TX_I2MPB_A_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_B1		0x17
-#define   MTK_PHY_DA_TX_I2MPB_B_GBE_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_B_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_B2		0x18
-#define   MTK_PHY_DA_TX_I2MPB_B_HBT_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_B_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_C1		0x19
-#define   MTK_PHY_DA_TX_I2MPB_C_GBE_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_C_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_C2		0x20
-#define   MTK_PHY_DA_TX_I2MPB_C_HBT_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_C_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_D1		0x21
-#define   MTK_PHY_DA_TX_I2MPB_D_GBE_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_D_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_D2		0x22
-#define   MTK_PHY_DA_TX_I2MPB_D_HBT_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_D_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_RXADC_CTRL_RG7			0xc6
-#define   MTK_PHY_DA_AD_BUF_BIAS_LP_MASK	GENMASK(9, 8)
-
-#define MTK_PHY_RXADC_CTRL_RG9			0xc8
-#define   MTK_PHY_DA_RX_PSBN_TBT_MASK		GENMASK(14, 12)
-#define   MTK_PHY_DA_RX_PSBN_HBT_MASK		GENMASK(10, 8)
-#define   MTK_PHY_DA_RX_PSBN_GBE_MASK		GENMASK(6, 4)
-#define   MTK_PHY_DA_RX_PSBN_LP_MASK		GENMASK(2, 0)
-
-#define MTK_PHY_LDO_OUTPUT_V			0xd7
-
-#define MTK_PHY_RG_ANA_CAL_RG0			0xdb
-#define   MTK_PHY_RG_CAL_CKINV			BIT(12)
-#define   MTK_PHY_RG_ANA_CALEN			BIT(8)
-#define   MTK_PHY_RG_ZCALEN_A			BIT(0)
-
-#define MTK_PHY_RG_ANA_CAL_RG1			0xdc
-#define   MTK_PHY_RG_ZCALEN_B			BIT(12)
-#define   MTK_PHY_RG_ZCALEN_C			BIT(8)
-#define   MTK_PHY_RG_ZCALEN_D			BIT(4)
-#define   MTK_PHY_RG_TXVOS_CALEN		BIT(0)
-
-#define MTK_PHY_RG_ANA_CAL_RG5			0xe0
-#define   MTK_PHY_RG_REXT_TRIM_MASK		GENMASK(13, 8)
-
-#define MTK_PHY_RG_TX_FILTER			0xfe
-
-#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG120	0x120
-#define   MTK_PHY_LPI_SIG_EN_LO_THRESH1000_MASK	GENMASK(12, 8)
-#define   MTK_PHY_LPI_SIG_EN_HI_THRESH1000_MASK	GENMASK(4, 0)
-
-#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122	0x122
-#define   MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK	GENMASK(7, 0)
-
-#define MTK_PHY_RG_TESTMUX_ADC_CTRL		0x144
-#define   MTK_PHY_RG_TXEN_DIG_MASK		GENMASK(5, 5)
-
-#define MTK_PHY_RG_CR_TX_AMP_OFFSET_A_B		0x172
-#define   MTK_PHY_CR_TX_AMP_OFFSET_A_MASK	GENMASK(13, 8)
-#define   MTK_PHY_CR_TX_AMP_OFFSET_B_MASK	GENMASK(6, 0)
-
-#define MTK_PHY_RG_CR_TX_AMP_OFFSET_C_D		0x173
-#define   MTK_PHY_CR_TX_AMP_OFFSET_C_MASK	GENMASK(13, 8)
-#define   MTK_PHY_CR_TX_AMP_OFFSET_D_MASK	GENMASK(6, 0)
-
-#define MTK_PHY_RG_AD_CAL_COMP			0x17a
-#define   MTK_PHY_AD_CAL_COMP_OUT_MASK		GENMASK(8, 8)
-
-#define MTK_PHY_RG_AD_CAL_CLK			0x17b
-#define   MTK_PHY_DA_CAL_CLK			BIT(0)
-
-#define MTK_PHY_RG_AD_CALIN			0x17c
-#define   MTK_PHY_DA_CALIN_FLAG			BIT(0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_A		0x17d
-#define   MTK_PHY_DASN_DAC_IN0_A_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_B		0x17e
-#define   MTK_PHY_DASN_DAC_IN0_B_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_C		0x17f
-#define   MTK_PHY_DASN_DAC_IN0_C_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_D		0x180
-#define   MTK_PHY_DASN_DAC_IN0_D_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_A		0x181
-#define   MTK_PHY_DASN_DAC_IN1_A_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_B		0x182
-#define   MTK_PHY_DASN_DAC_IN1_B_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_C		0x183
-#define   MTK_PHY_DASN_DAC_IN1_C_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_D		0x184
-#define   MTK_PHY_DASN_DAC_IN1_D_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DEV1E_REG19b			0x19b
-#define   MTK_PHY_BYPASS_DSP_LPI_READY		BIT(8)
-
-#define MTK_PHY_RG_LP_IIR2_K1_L			0x22a
-#define MTK_PHY_RG_LP_IIR2_K1_U			0x22b
-#define MTK_PHY_RG_LP_IIR2_K2_L			0x22c
-#define MTK_PHY_RG_LP_IIR2_K2_U			0x22d
-#define MTK_PHY_RG_LP_IIR2_K3_L			0x22e
-#define MTK_PHY_RG_LP_IIR2_K3_U			0x22f
-#define MTK_PHY_RG_LP_IIR2_K4_L			0x230
-#define MTK_PHY_RG_LP_IIR2_K4_U			0x231
-#define MTK_PHY_RG_LP_IIR2_K5_L			0x232
-#define MTK_PHY_RG_LP_IIR2_K5_U			0x233
-
-#define MTK_PHY_RG_DEV1E_REG234			0x234
-#define   MTK_PHY_TR_OPEN_LOOP_EN_MASK		GENMASK(0, 0)
-#define   MTK_PHY_LPF_X_AVERAGE_MASK		GENMASK(7, 4)
-#define   MTK_PHY_TR_LP_IIR_EEE_EN		BIT(12)
-
-#define MTK_PHY_RG_LPF_CNT_VAL			0x235
-
-#define MTK_PHY_RG_DEV1E_REG238			0x238
-#define   MTK_PHY_LPI_SLV_SEND_TX_TIMER_MASK	GENMASK(8, 0)
-#define   MTK_PHY_LPI_SLV_SEND_TX_EN		BIT(12)
-
-#define MTK_PHY_RG_DEV1E_REG239			0x239
-#define   MTK_PHY_LPI_SEND_LOC_TIMER_MASK	GENMASK(8, 0)
-#define   MTK_PHY_LPI_TXPCS_LOC_RCV		BIT(12)
-
-#define MTK_PHY_RG_DEV1E_REG27C			0x27c
-#define   MTK_PHY_VGASTATE_FFE_THR_ST1_MASK	GENMASK(12, 8)
-#define MTK_PHY_RG_DEV1E_REG27D			0x27d
-#define   MTK_PHY_VGASTATE_FFE_THR_ST2_MASK	GENMASK(4, 0)
-
-#define MTK_PHY_RG_DEV1E_REG2C7			0x2c7
-#define   MTK_PHY_MAX_GAIN_MASK			GENMASK(4, 0)
-#define   MTK_PHY_MIN_GAIN_MASK			GENMASK(12, 8)
-
-#define MTK_PHY_RG_DEV1E_REG2D1			0x2d1
-#define   MTK_PHY_VCO_SLICER_THRESH_BITS_HIGH_EEE_MASK	GENMASK(7, 0)
-#define   MTK_PHY_LPI_SKIP_SD_SLV_TR		BIT(8)
-#define   MTK_PHY_LPI_TR_READY			BIT(9)
-#define   MTK_PHY_LPI_VCO_EEE_STG0_EN		BIT(10)
-
-#define MTK_PHY_RG_DEV1E_REG323			0x323
-#define   MTK_PHY_EEE_WAKE_MAS_INT_DC		BIT(0)
-#define   MTK_PHY_EEE_WAKE_SLV_INT_DC		BIT(4)
-
-#define MTK_PHY_RG_DEV1E_REG324			0x324
-#define   MTK_PHY_SMI_DETCNT_MAX_MASK		GENMASK(5, 0)
-#define   MTK_PHY_SMI_DET_MAX_EN		BIT(8)
-
-#define MTK_PHY_RG_DEV1E_REG326			0x326
-#define   MTK_PHY_LPI_MODE_SD_ON		BIT(0)
-#define   MTK_PHY_RESET_RANDUPD_CNT		BIT(1)
-#define   MTK_PHY_TREC_UPDATE_ENAB_CLR		BIT(2)
-#define   MTK_PHY_LPI_QUIT_WAIT_DFE_SIG_DET_OFF	BIT(4)
-#define   MTK_PHY_TR_READY_SKIP_AFE_WAKEUP	BIT(5)
-
-#define MTK_PHY_LDO_PUMP_EN_PAIRAB		0x502
-#define MTK_PHY_LDO_PUMP_EN_PAIRCD		0x503
-
-#define MTK_PHY_DA_TX_R50_PAIR_A		0x53d
-#define MTK_PHY_DA_TX_R50_PAIR_B		0x53e
-#define MTK_PHY_DA_TX_R50_PAIR_C		0x53f
-#define MTK_PHY_DA_TX_R50_PAIR_D		0x540
-
-/* Registers on MDIO_MMD_VEND2 */
-#define MTK_PHY_LED1_DEFAULT_POLARITIES		BIT(1)
-
-#define MTK_PHY_RG_BG_RASEL			0x115
-#define   MTK_PHY_RG_BG_RASEL_MASK		GENMASK(2, 0)
-
-/* 'boottrap' register reflecting the configuration of the 4 PHY LEDs */
-#define RG_GPIO_MISC_TPBANK0			0x6f0
-#define   RG_GPIO_MISC_TPBANK0_BOOTMODE		GENMASK(11, 8)
-
 /* These macro privides efuse parsing for internal phy. */
 #define EFS_DA_TX_I2MPB_A(x)			(((x) >> 0) & GENMASK(5, 0))
 #define EFS_DA_TX_I2MPB_B(x)			(((x) >> 6) & GENMASK(5, 0))
@@ -346,32 +34,6 @@
 #define EFS_RG_BG_RASEL(x)			(((x) >> 4) & GENMASK(2, 0))
 #define EFS_RG_REXT_TRIM(x)			(((x) >> 7) & GENMASK(5, 0))
 
-enum {
-	NO_PAIR,
-	PAIR_A,
-	PAIR_B,
-	PAIR_C,
-	PAIR_D,
-};
-
-enum calibration_mode {
-	EFUSE_K,
-	SW_K
-};
-
-enum CAL_ITEM {
-	REXT,
-	TX_OFFSET,
-	TX_AMP,
-	TX_R50,
-	TX_VCM
-};
-
-enum CAL_MODE {
-	EFUSE_M,
-	SW_M
-};
-
 struct mtk_socphy_shared {
 	u32			boottrap;
 	struct mtk_socphy_priv	priv[4];
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
new file mode 100644
index 000000000000..349dfbdff1fa
--- /dev/null
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -0,0 +1,348 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _MTK_GE_SOC_H_
+#define _MTK_GE_SOC_H_
+
+#include <linux/bitfield.h>
+
+#define MTK_GPHY_ID_MT7981			0x03a29461
+#define MTK_GPHY_ID_MT7988			0x03a29481
+#define MTK_GPHY_ID_AN7581			0x03a294c1
+#define MTK_GPHY_ID_AN7583			0xc0ff0420
+
+#define MTK_EXT_PAGE_ACCESS			0x1f
+#define MTK_PHY_PAGE_STANDARD			0x0000
+#define MTK_PHY_PAGE_EXTENDED_3			0x0003
+
+#define MTK_PHY_LPI_REG_14			0x14
+#define MTK_PHY_LPI_WAKE_TIMER_1000_MASK	GENMASK(8, 0)
+
+#define MTK_PHY_LPI_REG_1c			0x1c
+#define MTK_PHY_SMI_DET_ON_THRESH_MASK		GENMASK(13, 8)
+
+#define MTK_PHY_PAGE_EXTENDED_2A30		0x2a30
+
+/* Registers on Token Ring debug nodes */
+/* ch_addr = 0x0, node_addr = 0x7, data_addr = 0x15 */
+/* NormMseLoThresh */
+#define NORMAL_MSE_LO_THRESH_MASK		GENMASK(15, 8)
+
+/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x3c */
+/* RemAckCntLimitCtrl */
+#define REMOTE_ACK_COUNT_LIMIT_CTRL_MASK	GENMASK(2, 1)
+
+/* ch_addr = 0x1, node_addr = 0xd, data_addr = 0x20 */
+/* VcoSlicerThreshBitsHigh */
+#define VCO_SLICER_THRESH_HIGH_MASK		GENMASK(23, 0)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x0 */
+/* DfeTailEnableVgaThresh1000 */
+#define DFE_TAIL_EANBLE_VGA_TRHESH_1000		GENMASK(5, 1)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
+/* MrvlTrFix100Kp */
+#define MRVL_TR_FIX_100KP_MASK			GENMASK(22, 20)
+/* MrvlTrFix100Kf */
+#define MRVL_TR_FIX_100KF_MASK			GENMASK(19, 17)
+/* MrvlTrFix1000Kp */
+#define MRVL_TR_FIX_1000KP_MASK			GENMASK(16, 14)
+/* MrvlTrFix1000Kf */
+#define MRVL_TR_FIX_1000KF_MASK			GENMASK(13, 11)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x12 */
+/* VgaDecRate */
+#define VGA_DECIMATION_RATE_MASK		GENMASK(8, 5)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x17 */
+/* SlvDSPreadyTime */
+#define SLAVE_DSP_READY_TIME_MASK		GENMASK(22, 15)
+/* MasDSPreadyTime */
+#define MASTER_DSP_READY_TIME_MASK		GENMASK(14, 7)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x18 */
+/* EnabRandUpdTrig */
+#define ENABLE_RANDOM_UPDOWN_COUNTER_TRIGGER	BIT(8)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x20 */
+/* ResetSyncOffset */
+#define RESET_SYNC_OFFSET_MASK			GENMASK(11, 8)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x0 */
+/* FfeUpdGainForceVal */
+#define FFE_UPDATE_GAIN_FORCE_VAL_MASK		GENMASK(9, 7)
+/* FfeUpdGainForce */
+#define FFE_UPDATE_GAIN_FORCE			BIT(6)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x3 */
+/* TrFreeze */
+#define TR_FREEZE_MASK				GENMASK(11, 0)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x6 */
+/* SS: Steady-state, KP: Proportional Gain */
+/* SSTrKp100 */
+#define SS_TR_KP100_MASK			GENMASK(21, 19)
+/* SSTrKf100 */
+#define SS_TR_KF100_MASK			GENMASK(18, 16)
+/* SSTrKp1000Mas */
+#define SS_TR_KP1000_MASTER_MASK		GENMASK(15, 13)
+/* SSTrKf1000Mas */
+#define SS_TR_KF1000_MASTER_MASK		GENMASK(12, 10)
+/* SSTrKp1000Slv */
+#define SS_TR_KP1000_SLAVE_MASK			GENMASK(9, 7)
+/* SSTrKf1000Slv */
+#define SS_TR_KF1000_SLAVE_MASK			GENMASK(6, 4)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x8 */
+/* clear this bit if wanna select from AFE */
+/* Regsigdet_sel_1000 */
+#define EEE1000_SELECT_SIGNAL_DETECTION_FROM_DFE	BIT(4)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xd */
+/* RegEEE_st2TrKf1000 */
+#define EEE1000_STAGE2_TR_KF_MASK		GENMASK(13, 11)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xf */
+/* RegEEE_slv_waketr_timer_tar */
+#define SLAVE_WAKETR_TIMER_MASK			GENMASK(20, 11)
+/* RegEEE_slv_remtx_timer_tar */
+#define SLAVE_REMTX_TIMER_MASK			GENMASK(10, 1)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x10 */
+/* RegEEE_slv_wake_int_timer_tar */
+#define SLAVE_WAKEINT_TIMER_MASK		GENMASK(10, 1)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x14 */
+/* RegEEE_trfreeze_timer2 */
+#define TR_FREEZE_TIMER2_MASK			GENMASK(9, 0)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x1c */
+/* RegEEE100Stg1_tar */
+#define EEE100_LPSYNC_STAGE1_UPDATE_TIMER_MASK	GENMASK(8, 0)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x25 */
+/* REGEEE_wake_slv_tr_wait_dfesigdet_en */
+#define WAKE_SLAVE_TR_WAIT_DFE_DETECTION_EN	BIT(11)
+
+#define ANALOG_INTERNAL_OPERATION_MAX_US	20
+#define TXRESERVE_MIN				0
+#define TXRESERVE_MAX				7
+
+#define MTK_PHY_ANARG_RG			0x10
+#define   MTK_PHY_TCLKOFFSET_MASK		GENMASK(12, 8)
+
+/* Registers on MDIO_MMD_VEND1 */
+#define MTK_PHY_TXVLD_DA_RG			0x12
+#define   MTK_PHY_DA_TX_I2MPB_A_GBE_MASK	GENMASK(15, 10)
+#define   MTK_PHY_DA_TX_I2MPB_A_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_A2		0x16
+#define   MTK_PHY_DA_TX_I2MPB_A_HBT_MASK	GENMASK(15, 10)
+#define   MTK_PHY_DA_TX_I2MPB_A_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_B1		0x17
+#define   MTK_PHY_DA_TX_I2MPB_B_GBE_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_B_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_B2		0x18
+#define   MTK_PHY_DA_TX_I2MPB_B_HBT_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_B_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_C1		0x19
+#define   MTK_PHY_DA_TX_I2MPB_C_GBE_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_C_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_C2		0x20
+#define   MTK_PHY_DA_TX_I2MPB_C_HBT_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_C_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_D1		0x21
+#define   MTK_PHY_DA_TX_I2MPB_D_GBE_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_D_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_D2		0x22
+#define   MTK_PHY_DA_TX_I2MPB_D_HBT_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_D_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_RXADC_CTRL_RG7			0xc6
+#define   MTK_PHY_DA_AD_BUF_BIAS_LP_MASK	GENMASK(9, 8)
+
+#define MTK_PHY_RXADC_CTRL_RG9			0xc8
+#define   MTK_PHY_DA_RX_PSBN_TBT_MASK		GENMASK(14, 12)
+#define   MTK_PHY_DA_RX_PSBN_HBT_MASK		GENMASK(10, 8)
+#define   MTK_PHY_DA_RX_PSBN_GBE_MASK		GENMASK(6, 4)
+#define   MTK_PHY_DA_RX_PSBN_LP_MASK		GENMASK(2, 0)
+
+#define MTK_PHY_LDO_OUTPUT_V			0xd7
+
+#define MTK_PHY_RG_ANA_CAL_RG0			0xdb
+#define   MTK_PHY_RG_CAL_CKINV			BIT(12)
+#define   MTK_PHY_RG_ANA_CALEN			BIT(8)
+#define   MTK_PHY_RG_ZCALEN_A			BIT(0)
+
+#define MTK_PHY_RG_ANA_CAL_RG1			0xdc
+#define   MTK_PHY_RG_ZCALEN_B			BIT(12)
+#define   MTK_PHY_RG_ZCALEN_C			BIT(8)
+#define   MTK_PHY_RG_ZCALEN_D			BIT(4)
+#define   MTK_PHY_RG_TXVOS_CALEN		BIT(0)
+
+#define MTK_PHY_RG_ANA_CAL_RG5			0xe0
+#define   MTK_PHY_RG_REXT_TRIM_MASK		GENMASK(13, 8)
+
+#define MTK_PHY_RG_TX_FILTER			0xfe
+
+#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG120	0x120
+#define   MTK_PHY_LPI_SIG_EN_LO_THRESH1000_MASK	GENMASK(12, 8)
+#define   MTK_PHY_LPI_SIG_EN_HI_THRESH1000_MASK	GENMASK(4, 0)
+
+#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122	0x122
+#define   MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK	GENMASK(7, 0)
+
+#define MTK_PHY_RG_TESTMUX_ADC_CTRL		0x144
+#define   MTK_PHY_RG_TXEN_DIG_MASK		GENMASK(5, 5)
+
+#define MTK_PHY_RG_CR_TX_AMP_OFFSET_A_B		0x172
+#define   MTK_PHY_CR_TX_AMP_OFFSET_A_MASK	GENMASK(13, 8)
+#define   MTK_PHY_CR_TX_AMP_OFFSET_B_MASK	GENMASK(6, 0)
+
+#define MTK_PHY_RG_CR_TX_AMP_OFFSET_C_D		0x173
+#define   MTK_PHY_CR_TX_AMP_OFFSET_C_MASK	GENMASK(13, 8)
+#define   MTK_PHY_CR_TX_AMP_OFFSET_D_MASK	GENMASK(6, 0)
+
+#define MTK_PHY_RG_AD_CAL_COMP			0x17a
+#define   MTK_PHY_AD_CAL_COMP_OUT_MASK		GENMASK(8, 8)
+
+#define MTK_PHY_RG_AD_CAL_CLK			0x17b
+#define   MTK_PHY_DA_CAL_CLK			BIT(0)
+
+#define MTK_PHY_RG_AD_CALIN			0x17c
+#define   MTK_PHY_DA_CALIN_FLAG			BIT(0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_A		0x17d
+#define   MTK_PHY_DASN_DAC_IN0_A_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_B		0x17e
+#define   MTK_PHY_DASN_DAC_IN0_B_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_C		0x17f
+#define   MTK_PHY_DASN_DAC_IN0_C_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_D		0x180
+#define   MTK_PHY_DASN_DAC_IN0_D_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_A		0x181
+#define   MTK_PHY_DASN_DAC_IN1_A_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_B		0x182
+#define   MTK_PHY_DASN_DAC_IN1_B_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_C		0x183
+#define   MTK_PHY_DASN_DAC_IN1_C_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_D		0x184
+#define   MTK_PHY_DASN_DAC_IN1_D_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DEV1E_REG19b			0x19b
+#define   MTK_PHY_BYPASS_DSP_LPI_READY		BIT(8)
+
+#define MTK_PHY_RG_LP_IIR2_K1_L			0x22a
+#define MTK_PHY_RG_LP_IIR2_K1_U			0x22b
+#define MTK_PHY_RG_LP_IIR2_K2_L			0x22c
+#define MTK_PHY_RG_LP_IIR2_K2_U			0x22d
+#define MTK_PHY_RG_LP_IIR2_K3_L			0x22e
+#define MTK_PHY_RG_LP_IIR2_K3_U			0x22f
+#define MTK_PHY_RG_LP_IIR2_K4_L			0x230
+#define MTK_PHY_RG_LP_IIR2_K4_U			0x231
+#define MTK_PHY_RG_LP_IIR2_K5_L			0x232
+#define MTK_PHY_RG_LP_IIR2_K5_U			0x233
+
+#define MTK_PHY_RG_DEV1E_REG234			0x234
+#define   MTK_PHY_TR_OPEN_LOOP_EN_MASK		GENMASK(0, 0)
+#define   MTK_PHY_LPF_X_AVERAGE_MASK		GENMASK(7, 4)
+#define   MTK_PHY_TR_LP_IIR_EEE_EN		BIT(12)
+
+#define MTK_PHY_RG_LPF_CNT_VAL			0x235
+
+#define MTK_PHY_RG_DEV1E_REG238			0x238
+#define   MTK_PHY_LPI_SLV_SEND_TX_TIMER_MASK	GENMASK(8, 0)
+#define   MTK_PHY_LPI_SLV_SEND_TX_EN		BIT(12)
+
+#define MTK_PHY_RG_DEV1E_REG239			0x239
+#define   MTK_PHY_LPI_SEND_LOC_TIMER_MASK	GENMASK(8, 0)
+#define   MTK_PHY_LPI_TXPCS_LOC_RCV		BIT(12)
+
+#define MTK_PHY_RG_DEV1E_REG27C			0x27c
+#define   MTK_PHY_VGASTATE_FFE_THR_ST1_MASK	GENMASK(12, 8)
+#define MTK_PHY_RG_DEV1E_REG27D			0x27d
+#define   MTK_PHY_VGASTATE_FFE_THR_ST2_MASK	GENMASK(4, 0)
+
+#define MTK_PHY_RG_DEV1E_REG2C7			0x2c7
+#define   MTK_PHY_MAX_GAIN_MASK			GENMASK(4, 0)
+#define   MTK_PHY_MIN_GAIN_MASK			GENMASK(12, 8)
+
+#define MTK_PHY_RG_DEV1E_REG2D1			0x2d1
+#define   MTK_PHY_VCO_SLICER_THRESH_BITS_HIGH_EEE_MASK	GENMASK(7, 0)
+#define   MTK_PHY_LPI_SKIP_SD_SLV_TR		BIT(8)
+#define   MTK_PHY_LPI_TR_READY			BIT(9)
+#define   MTK_PHY_LPI_VCO_EEE_STG0_EN		BIT(10)
+
+#define MTK_PHY_RG_DEV1E_REG323			0x323
+#define   MTK_PHY_EEE_WAKE_MAS_INT_DC		BIT(0)
+#define   MTK_PHY_EEE_WAKE_SLV_INT_DC		BIT(4)
+
+#define MTK_PHY_RG_DEV1E_REG324			0x324
+#define   MTK_PHY_SMI_DETCNT_MAX_MASK		GENMASK(5, 0)
+#define   MTK_PHY_SMI_DET_MAX_EN		BIT(8)
+
+#define MTK_PHY_RG_DEV1E_REG326			0x326
+#define   MTK_PHY_LPI_MODE_SD_ON		BIT(0)
+#define   MTK_PHY_RESET_RANDUPD_CNT		BIT(1)
+#define   MTK_PHY_TREC_UPDATE_ENAB_CLR		BIT(2)
+#define   MTK_PHY_LPI_QUIT_WAIT_DFE_SIG_DET_OFF	BIT(4)
+#define   MTK_PHY_TR_READY_SKIP_AFE_WAKEUP	BIT(5)
+
+#define MTK_PHY_LDO_PUMP_EN_PAIRAB		0x502
+#define MTK_PHY_LDO_PUMP_EN_PAIRCD		0x503
+
+#define MTK_PHY_DA_TX_R50_PAIR_A		0x53d
+#define MTK_PHY_DA_TX_R50_PAIR_B		0x53e
+#define MTK_PHY_DA_TX_R50_PAIR_C		0x53f
+#define MTK_PHY_DA_TX_R50_PAIR_D		0x540
+
+/* Registers on MDIO_MMD_VEND2 */
+#define MTK_PHY_LED1_DEFAULT_POLARITIES		BIT(1)
+
+#define MTK_PHY_RG_BG_RASEL			0x115
+#define   MTK_PHY_RG_BG_RASEL_MASK		GENMASK(2, 0)
+
+/* 'boottrap' register reflecting the configuration of the 4 PHY LEDs */
+#define RG_GPIO_MISC_TPBANK0			0x6f0
+#define   RG_GPIO_MISC_TPBANK0_BOOTMODE		GENMASK(11, 8)
+
+enum CAL_ITEM {
+	REXT,
+	TX_OFFSET,
+	TX_AMP,
+	TX_R50,
+	TX_VCM,
+	RX_OFFSET,
+};
+
+enum {
+	NO_PAIR,
+	PAIR_A,
+	PAIR_B,
+	PAIR_C,
+	PAIR_D,
+};
+
+enum calibration_mode {
+	EFUSE_K,
+	SW_K
+};
+
+enum CAL_MODE {
+	EFUSE_M,
+	SW_M
+};
+
+#endif /* _MTK_GE_SOC_H_ */
-- 
2.53.0


