Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DE0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSOs6zUQirLBN1JAYVn/+CkOGaCnw6v6r+kmkvDzR+Q=; b=oaJ1BYE6xTy/vfrosbQOFplSIP
	8SZ6LnKmeOqtbVz4jI3lW0Vymi7JIGOmXuhb5Sb/0hURgETmEyImP30JXd8gBcZz7jIwjpsZAP9PG
	mGajVMfAgCawedy9YBpkPVPA1ZVbSQ72ZPIRP2qo0pFK/sbqL+0MwraYhQK8uoecRykxztGSKzt8l
	MliDNJ5mwcvBgHweyLXsWrFRiw/dwrpT5YTEn3yx01ZNa2fSna0B6XmLC/vbY+MDYFgpFZ20U3N5C
	oYwEwZvXFPwCM7q5022KBTXCIOXQrKLgibW23k5J7/4yBlhJ6uKhdQab2eumD7ceEQRDv5Ac9R5e0
	UQo9GuMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZBA-002ANz-Ff; Tue, 20 Sep 2022 09:04:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8Z-0028zl-NA; Tue, 20 Sep 2022 09:01:53 +0000
X-UUID: 71043f755edc4384b03863544c420dc7-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kSOs6zUQirLBN1JAYVn/+CkOGaCnw6v6r+kmkvDzR+Q=;
	b=tHd9H4kQ7iz3Pr/RkYo96LIXjqHoejmgwoMetCXbFTOhWYV6YSzuUnot4SN/5G1/F/KkNUrpEJ0iWiWkeTSdmkWhuMQPyReRhviyAs7KzAxqWOd56POtiW7vPmSlg66NcKnucDJXbOlRSLQvM7y7PZTMY5MXXiDIZuxD+DmdgJ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ed77cedf-8c64-41e2-a8e5-bc9f5babcb30,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:39a5ff1,CLOUDID:60f1435e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 71043f755edc4384b03863544c420dc7-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 769939570; Tue, 20 Sep 2022 02:01:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 03/18] phy: mediatek: xsphy: remove macros used to prepare bitfield value
Date: Tue, 20 Sep 2022 17:00:23 +0800
Message-ID: <20220920090038.15133-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020151_840629_1061E574 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Prefer to make use of FIELD_PREP() macro to prepare bitfield value,
then no need local ones anymore.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 46 ++++++++++------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index c0cdb78f77fa..b222fbbd71d1 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -37,7 +37,6 @@
 #define XSP_U2FREQ_FMCR0	((SSUSB_SIFSLV_U2FREQ) + 0x00)
 #define P2F_RG_FREQDET_EN	BIT(24)
 #define P2F_RG_CYCLECNT		GENMASK(23, 0)
-#define P2F_RG_CYCLECNT_VAL(x)	((P2F_RG_CYCLECNT) & (x))
 
 #define XSP_U2FREQ_MMONR0  ((SSUSB_SIFSLV_U2FREQ) + 0x0c)
 
@@ -50,16 +49,12 @@
 
 #define XSP_USBPHYACR1		((SSUSB_SIFSLV_U2PHY_COM) + 0x04)
 #define P2A1_RG_INTR_CAL		GENMASK(23, 19)
-#define P2A1_RG_INTR_CAL_VAL(x)	((0x1f & (x)) << 19)
 #define P2A1_RG_VRT_SEL			GENMASK(14, 12)
-#define P2A1_RG_VRT_SEL_VAL(x)	((0x7 & (x)) << 12)
 #define P2A1_RG_TERM_SEL		GENMASK(10, 8)
-#define P2A1_RG_TERM_SEL_VAL(x)	((0x7 & (x)) << 8)
 
 #define XSP_USBPHYACR5		((SSUSB_SIFSLV_U2PHY_COM) + 0x014)
 #define P2A5_RG_HSTX_SRCAL_EN	BIT(15)
 #define P2A5_RG_HSTX_SRCTRL		GENMASK(14, 12)
-#define P2A5_RG_HSTX_SRCTRL_VAL(x)	((0x7 & (x)) << 12)
 
 #define XSP_USBPHYACR6		((SSUSB_SIFSLV_U2PHY_COM) + 0x018)
 #define P2A6_RG_BC11_SW_EN	BIT(23)
@@ -74,15 +69,12 @@
 
 #define SSPXTP_PHYA_GLB_00		((SSPXTP_SIFSLV_PHYA_GLB) + 0x00)
 #define RG_XTP_GLB_BIAS_INTR_CTRL		GENMASK(21, 16)
-#define RG_XTP_GLB_BIAS_INTR_CTRL_VAL(x)	((0x3f & (x)) << 16)
 
 #define SSPXTP_PHYA_LN_04	((SSPXTP_SIFSLV_PHYA_LN) + 0x04)
 #define RG_XTP_LN0_TX_IMPSEL		GENMASK(4, 0)
-#define RG_XTP_LN0_TX_IMPSEL_VAL(x)	(0x1f & (x))
 
 #define SSPXTP_PHYA_LN_14	((SSPXTP_SIFSLV_PHYA_LN) + 0x014)
 #define RG_XTP_LN0_RX_IMPSEL		GENMASK(4, 0)
-#define RG_XTP_LN0_RX_IMPSEL_VAL(x)	(0x1f & (x))
 
 #define XSP_REF_CLK		26	/* MHZ */
 #define XSP_SLEW_RATE_COEF	17
@@ -134,8 +126,8 @@ static void u2_phy_slew_rate_calibrate(struct mtk_xsphy *xsphy,
 	mtk_phy_set_bits(pbase + XSP_U2FREQ_FMMONR1, P2F_RG_FRCK_EN);
 
 	/* set cycle count as 1024 */
-	mtk_phy_update_bits(pbase + XSP_U2FREQ_FMCR0, P2F_RG_CYCLECNT,
-			    P2F_RG_CYCLECNT_VAL(XSP_FM_DET_CYCLE_CNT));
+	mtk_phy_update_field(pbase + XSP_U2FREQ_FMCR0, P2F_RG_CYCLECNT,
+			     XSP_FM_DET_CYCLE_CNT);
 
 	/* enable frequency meter */
 	mtk_phy_set_bits(pbase + XSP_U2FREQ_FMCR0, P2F_RG_FREQDET_EN);
@@ -166,8 +158,7 @@ static void u2_phy_slew_rate_calibrate(struct mtk_xsphy *xsphy,
 		xsphy->src_ref_clk, xsphy->src_coef);
 
 	/* set HS slew rate */
-	mtk_phy_update_bits(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCTRL,
-			    P2A5_RG_HSTX_SRCTRL_VAL(calib_val));
+	mtk_phy_update_field(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCTRL, calib_val);
 
 	/* disable USB ring oscillator */
 	mtk_phy_clear_bits(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCAL_EN);
@@ -280,20 +271,20 @@ static void u2_phy_props_set(struct mtk_xsphy *xsphy,
 	void __iomem *pbase = inst->port_base;
 
 	if (inst->efuse_intr)
-		mtk_phy_update_bits(pbase + XSP_USBPHYACR1, P2A1_RG_INTR_CAL,
-				    P2A1_RG_INTR_CAL_VAL(inst->efuse_intr));
+		mtk_phy_update_field(pbase + XSP_USBPHYACR1, P2A1_RG_INTR_CAL,
+				     inst->efuse_intr);
 
 	if (inst->eye_src)
-		mtk_phy_update_bits(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCTRL,
-				    P2A5_RG_HSTX_SRCTRL_VAL(inst->eye_src));
+		mtk_phy_update_field(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCTRL,
+				     inst->eye_src);
 
 	if (inst->eye_vrt)
-		mtk_phy_update_bits(pbase + XSP_USBPHYACR1, P2A1_RG_VRT_SEL,
-				    P2A1_RG_VRT_SEL_VAL(inst->eye_vrt));
+		mtk_phy_update_field(pbase + XSP_USBPHYACR1, P2A1_RG_VRT_SEL,
+				     inst->eye_vrt);
 
 	if (inst->eye_term)
-		mtk_phy_update_bits(pbase + XSP_USBPHYACR1, P2A1_RG_TERM_SEL,
-				    P2A1_RG_TERM_SEL_VAL(inst->eye_term));
+		mtk_phy_update_field(pbase + XSP_USBPHYACR1, P2A1_RG_TERM_SEL,
+				     inst->eye_term);
 }
 
 static void u3_phy_props_set(struct mtk_xsphy *xsphy,
@@ -302,19 +293,16 @@ static void u3_phy_props_set(struct mtk_xsphy *xsphy,
 	void __iomem *pbase = inst->port_base;
 
 	if (inst->efuse_intr)
-		mtk_phy_update_bits(xsphy->glb_base + SSPXTP_PHYA_GLB_00,
-				    RG_XTP_GLB_BIAS_INTR_CTRL,
-				    RG_XTP_GLB_BIAS_INTR_CTRL_VAL(inst->efuse_intr));
+		mtk_phy_update_field(xsphy->glb_base + SSPXTP_PHYA_GLB_00,
+				     RG_XTP_GLB_BIAS_INTR_CTRL, inst->efuse_intr);
 
 	if (inst->efuse_tx_imp)
-		mtk_phy_update_bits(pbase + SSPXTP_PHYA_LN_04,
-				    RG_XTP_LN0_TX_IMPSEL,
-				    RG_XTP_LN0_TX_IMPSEL_VAL(inst->efuse_tx_imp));
+		mtk_phy_update_field(pbase + SSPXTP_PHYA_LN_04,
+				     RG_XTP_LN0_TX_IMPSEL, inst->efuse_tx_imp);
 
 	if (inst->efuse_rx_imp)
-		mtk_phy_update_bits(pbase + SSPXTP_PHYA_LN_14,
-				    RG_XTP_LN0_RX_IMPSEL,
-				    RG_XTP_LN0_RX_IMPSEL_VAL(inst->efuse_rx_imp));
+		mtk_phy_update_field(pbase + SSPXTP_PHYA_LN_14,
+				     RG_XTP_LN0_RX_IMPSEL, inst->efuse_rx_imp);
 }
 
 static int mtk_phy_init(struct phy *phy)
-- 
2.18.0


