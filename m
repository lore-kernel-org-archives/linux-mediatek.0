Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38406C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dMfDi3+Znr8A0gUAEd3a3w6M4rd+XmxRvj9Znrd8y2g=; b=h2M3dUoatL6iFB
	r9JTKKKy3bVekpeTqUrJ3FwepyZFMY0gr73WxGz39BLNjwnkVSoBzXTLYNpOKnP5Zm42puYu4btfo
	0LPQRCvMb7N09H9tvFKtcQuJjAGexxH3nuQAog3g7Zm5qewfxAnP9JbxlF0OMqgFK/J0xbhnRi/gc
	LTO9mp3X/2Sv63Bq+Ugaz08+HJFZqU9RTP5NlElo935kqQjmfMXxhgxYGPL79SrU6a6mj5pZawjn1
	/r0MFOqAcFgDxAkNzjfMKpLBHvGRtIBHKFpn2GuI9rPcRWrR4pzMipiZx6G2RMDKpzAdzN5wHx72s
	EVPsoUPCqm/XGCD7AYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5YmG-001GPz-8E; Thu, 06 Jan 2022 19:50:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5YmA-001GOr-Lx
 for linux-mediatek@lists.infradead.org; Thu, 06 Jan 2022 19:50:22 +0000
X-UUID: 031f7036ed0342b7a6a3fe5d3de082a3-20220106
X-UUID: 031f7036ed0342b7a6a3fe5d3de082a3-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 301412737; Thu, 06 Jan 2022 12:50:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 11:50:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 7 Jan 2022 03:50:11 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 03:50:11 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Leon
 Yen" <leon.yen@mediatek.com>
Subject: [PATCH] mt76: mt7921s: fix mt7921s_mcu_[fw|drv]_pmctrl
Date: Fri, 7 Jan 2022 03:50:10 +0800
Message-ID: <5d5622916a35bf3efedcd553b925e14f1d5bf46f.1641498203.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_115018_760915_4648BADD 
X-CRM114-Status: GOOD (  15.47  )
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

From: Leon Yen <leon.yen@mediatek.com>

According to the firmware behavior (even the oldest one in linux-firmware)
If the firmware is downloaded, MT7921S must rely on the additional mailbox
mechanism that resides in firmware to check if the device is the right
state for mt7921s_mcu_[fw|drv]_pmctrl. Otherwise, we still apply the old
way for that.

That is a necessary patch before we enable runtime pm for mt7921s as
default.

Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  | 38 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/sdio.h     |  2 +
 2 files changed, 40 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
index d20f2ff01be1..5d8af18c7026 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
@@ -49,6 +49,26 @@ mt7921s_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	return ret;
 }
 
+static u32 mt7921s_read_rm3r(struct mt7921_dev *dev)
+{
+	struct mt76_sdio *sdio = &dev->mt76.sdio;
+
+	return sdio_readl(sdio->func, MCR_D2HRM3R, NULL);
+}
+
+static u32 mt7921s_clear_rm3r_drv_own(struct mt7921_dev *dev)
+{
+	struct mt76_sdio *sdio = &dev->mt76.sdio;
+	u32 val;
+
+	val = sdio_readl(sdio->func, MCR_D2HRM3R, NULL);
+	if (val)
+		sdio_writel(sdio->func, H2D_SW_INT_CLEAR_MAILBOX_ACK,
+			    MCR_WSICR, NULL);
+
+	return val;
+}
+
 int mt7921s_mcu_init(struct mt7921_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7921s_mcu_ops = {
@@ -88,6 +108,12 @@ int mt7921s_mcu_drv_pmctrl(struct mt7921_dev *dev)
 
 	err = readx_poll_timeout(mt76s_read_pcr, &dev->mt76, status,
 				 status & WHLPCR_IS_DRIVER_OWN, 2000, 1000000);
+
+	if (!err && test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state))
+		err = readx_poll_timeout(mt7921s_read_rm3r, dev, status,
+					 status & D2HRM3R_IS_DRIVER_OWN,
+					 2000, 1000000);
+
 	sdio_release_host(func);
 
 	if (err < 0) {
@@ -115,12 +141,24 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
 
 	sdio_claim_host(func);
 
+	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state)) {
+		err = readx_poll_timeout(mt7921s_clear_rm3r_drv_own,
+					 dev, status,
+					 !(status & D2HRM3R_IS_DRIVER_OWN),
+					 2000, 1000000);
+		if (err < 0) {
+			dev_err(dev->mt76.dev, "mailbox ACK not cleared\n");
+			goto err;
+		}
+	}
+
 	sdio_writel(func, WHLPCR_FW_OWN_REQ_SET, MCR_WHLPCR, NULL);
 
 	err = readx_poll_timeout(mt76s_read_pcr, &dev->mt76, status,
 				 !(status & WHLPCR_IS_DRIVER_OWN), 2000, 1000000);
 	sdio_release_host(func);
 
+err:
 	if (err < 0) {
 		dev_err(dev->mt76.dev, "firmware own failed\n");
 		clear_bit(MT76_STATE_PM, &mphy->state);
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.h b/drivers/net/wireless/mediatek/mt76/sdio.h
index 99db4ad93b7c..27d5d2077eba 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.h
+++ b/drivers/net/wireless/mediatek/mt76/sdio.h
@@ -65,6 +65,7 @@
 #define MCR_H2DSM0R			0x0070
 #define H2D_SW_INT_READ			BIT(16)
 #define H2D_SW_INT_WRITE		BIT(17)
+#define H2D_SW_INT_CLEAR_MAILBOX_ACK	BIT(22)
 
 #define MCR_H2DSM1R			0x0074
 #define MCR_D2HRM0R			0x0078
@@ -109,6 +110,7 @@
 #define MCR_H2DSM2R			0x0160 /* supported in CONNAC2 */
 #define MCR_H2DSM3R			0x0164 /* supported in CONNAC2 */
 #define MCR_D2HRM3R			0x0174 /* supported in CONNAC2 */
+#define D2HRM3R_IS_DRIVER_OWN		BIT(0)
 #define MCR_WTQCR8			0x0190 /* supported in CONNAC2 */
 #define MCR_WTQCR9			0x0194 /* supported in CONNAC2 */
 #define MCR_WTQCR10			0x0198 /* supported in CONNAC2 */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
