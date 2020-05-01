Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191BFC47253
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3EBA2166E
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVl2Axm2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdeL6D9e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3EBA2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QJOdhyIX+spWgRw9TzfLWOKtSZwGUGSr9nFLMoyGWc=; b=ZVl2Axm2eUnc19
	ym65JeTg5E1VBuJ9Qo0HM5VtitqKreyigNcjQTOucLf8WNA2kd5ik+WUJkVD7yzcHjtb36+3NufNd
	PM5JmQuM65bcoNOKZPPyYxCSP7YWJyfZ799PvtM0+kfLV90ZIQIgkFedNPS8knOv4kc0CuWFq1Dx+
	A2c9MSgBqFXP863NCyYlNt9c+1eORWx5eLOPbYazlucIiJzjK7PvYT5irv1eeT/aODe2Sas2Xwx57
	7nQOrNnFY3WBh7AqeR6pDCEaKA5b46Rth6xyI8wMLiSDKX45jJLCxXK0mg+xlgYWGC38r3miR00ls
	uj9bEzeunguKloGMtNBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUT2A-0004OJ-PG; Fri, 01 May 2020 10:36:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUT27-0004ML-G0
 for linux-mediatek@lists.infradead.org; Fri, 01 May 2020 10:36:40 +0000
Received: from lore-desk.lan (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E174D206B8;
 Fri,  1 May 2020 10:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588329399;
 bh=syDh+CbWHG+FupzW7mAHePHKP5kwkV5zNnIQC5lcJzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pdeL6D9eFNTqqXkQiiryRrngFkHxXCFOWYPdBxmYTMCCorQ9k3Zx6udx9zZp1UFNH
 HnpIeb30gqz6aJWc5FUkU8pDJ6y8uChwdozpC1X9VOZJXX6qRRDdZzcSfr3Xu6Q2dB
 N4HomLA+HDAm/WEDVSjClKa2Vb4/zLszzg3Lmk24=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 2/7] mt76: mt7615: introduce mt7615_mcu_set_hif_suspend mcu
 command
Date: Fri,  1 May 2020 12:36:12 +0200
Message-Id: <4ad1f308b355118d26f2b854151a6b8d51154813.1588329170.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588329170.git.lorenzo@kernel.org>
References: <cover.1588329170.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_033639_578042_15AF21B5 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org,
 soul.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Introduce the mt7615_mcu_set_hif_suspend mcu command, which is usually
used to configure the interface including PCIe, USB or SDIO to the right
state during operation suspend / resume.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 36 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 ++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 0ae981a38f48..95cb239b03e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -194,7 +194,8 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int cmd,
 		break;
 	case MCU_UNI_CMD_DEV_INFO_UPDATE:
 	case MCU_UNI_CMD_BSS_INFO_UPDATE:
-	case MCU_UNI_CMD_STA_REC_UPDATE: {
+	case MCU_UNI_CMD_STA_REC_UPDATE:
+	case MCU_UNI_CMD_HIF_CTRL: {
 		struct mt7615_mcu_uni_event *event;
 
 		skb_pull(skb, sizeof(*rxd));
@@ -3212,3 +3213,36 @@ int mt7615_mcu_apply_tx_dpd(struct mt7615_phy *phy)
 
 	return ret;
 }
+
+int mt7615_mcu_set_hif_suspend(struct mt7615_dev *dev, bool suspend)
+{
+	struct {
+		struct {
+			u8 hif_type; /* 0x0: HIF_SDIO
+				      * 0x1: HIF_USB
+				      * 0x2: HIF_PCIE
+				      */
+			u8 pad[3];
+		} __packed hdr;
+		struct hif_suspend_tlv {
+			__le16 tag;
+			__le16 len;
+			u8 suspend;
+		} __packed hif_suspend;
+	} req = {
+		.hif_suspend = {
+			.tag = cpu_to_le16(0), /* 0: UNI_HIF_CTRL_BASIC */
+			.len = cpu_to_le16(sizeof(struct hif_suspend_tlv)),
+			.suspend = suspend,
+		},
+	};
+
+	if (mt76_is_mmio(&dev->mt76))
+		req.hdr.hif_type = 2;
+	else if (mt76_is_usb(&dev->mt76))
+		req.hdr.hif_type = 1;
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_HIF_CTRL,
+				   &req, sizeof(req), true);
+}
+EXPORT_SYMBOL_GPL(mt7615_mcu_set_hif_suspend);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 08dcfadceaf6..1579ad944479 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -280,6 +280,7 @@ enum {
 	MCU_UNI_CMD_DEV_INFO_UPDATE = MCU_UNI_PREFIX | 0x01,
 	MCU_UNI_CMD_BSS_INFO_UPDATE = MCU_UNI_PREFIX | 0x02,
 	MCU_UNI_CMD_STA_REC_UPDATE = MCU_UNI_PREFIX | 0x03,
+	MCU_UNI_CMD_HIF_CTRL = MCU_UNI_PREFIX | 0x07,
 };
 
 struct mt7615_mcu_uni_event {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index fdb20fbdfb90..6a26555dcce6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -531,6 +531,8 @@ int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy);
 int mt7615_init_debugfs(struct mt7615_dev *dev);
 int mt7615_mcu_wait_response(struct mt7615_dev *dev, int cmd, int seq);
 
+int mt7615_mcu_set_hif_suspend(struct mt7615_dev *dev, bool suspend);
+
 int __mt7663_load_firmware(struct mt7615_dev *dev);
 
 /* usb */
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
