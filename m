Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4FCC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD253217F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOliaFZ9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gAYYfkaW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD253217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oztSQh0f/SZot7mAWkGvs11CPuiiUh9ymy6qcRopMYU=; b=rOliaFZ9/iIUIr
	pc59EzhawM27ulz18eDUw4PGkxzz84A02VPs5B+Gl1+9RQM90VbwHBgp/HTgOQmz83+B4OINUjUs+
	/Ywdunxe0U9ls5nUXLeg0aVk0JV+urejV3nme6+wJITWTYvBAWFrvaxvZpMpSieJH9TZghKIIRsKW
	sMo1CMsoq+Kfn4EEBIl2vnirU7c9tRV/xACIbc5g1gpVMwK+PMqz/qB1O/zmRyh5IflzEBmHO5Zbb
	p4UwOYC4YehOhR7d1uolK0hcWJnFcdvveI3cUjkz9FXS53HDBCTshWUYRtW0XzZVDutTK95i4tzgl
	so/ogKxrJwHpSo2F3Nlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ituIA-0004oo-Nx; Tue, 21 Jan 2020 14:14:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ituI6-0004mh-2V
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 14:14:06 +0000
X-UUID: 63b817b954cc4534a889da3a532e0a0a-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gd37oZ0axLyEI/QyrcT0vJ08dR3b4hQAx7SsmCJF/Ng=; 
 b=gAYYfkaWEs65P/sTUUp6XFA8C1Ua62PPmFNawiG2zov4mkfqCdhmSBHrLr0PKnZldOqjOgNlXSibKE9LeA8mQA7EkZ+ZG2wwYv17gycOojfLisIUyzSVW/DrGcCTazyNT0hSXFxXX0oODUuqKJTyF5sB6+YoYhH10WQzk7lcaA0=;
X-UUID: 63b817b954cc4534a889da3a532e0a0a-20200121
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 448160651; Tue, 21 Jan 2020 06:13:57 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 06:14:55 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 22:14:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 21 Jan 2020 22:13:32 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 7/7] mt76: mt7615: switch mt7615_mcu_set_rx_ba to new MCU
 format
Date: Tue, 21 Jan 2020 22:13:42 +0800
Message-ID: <157c7f251ab1b436c18815cca3423360e0eec07c.1579237414.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
References: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_061402_115816_27DE134A 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To adapt new firmware version.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 62 ++++++++++---------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 73e4406dbf5a..d3bb96756889 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1640,29 +1640,11 @@ int mt7615_mcu_set_rx_ba(struct mt7615_dev *dev,
 {
 	struct mt7615_sta *msta = (struct mt7615_sta *)params->sta->drv_priv;
 	struct mt7615_vif *mvif = msta->vif;
-	struct {
-		struct wtbl_req_hdr hdr;
-		struct wtbl_ba ba;
-	} wtbl_req = {
-		.hdr = {
-			.wlan_idx = msta->wcid.idx,
-			.operation = WTBL_SET,
-			.tlv_num = cpu_to_le16(1),
-		},
-		.ba = {
-			.tag = cpu_to_le16(WTBL_BA),
-			.len = cpu_to_le16(sizeof(struct wtbl_ba)),
-			.tid = params->tid,
-			.ba_type = MT_BA_TYPE_RECIPIENT,
-			.rst_ba_tid = params->tid,
-			.rst_ba_sel = RST_BA_MAC_TID_MATCH,
-			.rst_ba_sb = 1,
-		},
-	};
 	struct {
 		struct sta_req_hdr hdr;
 		struct sta_rec_ba ba;
-	} sta_req = {
+		u8 buf[MT7615_WTBL_UPDATE_MAX_SIZE];
+	} __packed req = {
 		.hdr = {
 			.bss_idx = mvif->idx,
 			.wlan_idx = msta->wcid.idx,
@@ -1681,17 +1663,41 @@ int mt7615_mcu_set_rx_ba(struct mt7615_dev *dev,
 			.winsize = cpu_to_le16(params->buf_size),
 		},
 	};
-	int ret;
+	struct sta_rec_wtbl *wtbl = NULL;
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct wtbl_ba *wtbl_ba;
+	u8 *buf = req.buf;
 
-	memcpy(wtbl_req.ba.peer_addr, params->sta->addr, ETH_ALEN);
+	if (dev->fw_ver > MT7615_FIRMWARE_V1) {
+		req.hdr.tlv_num = cpu_to_le16(2);
+		wtbl = (struct sta_rec_wtbl *)buf;
+		wtbl->tag = cpu_to_le16(STA_REC_WTBL);
+		buf += sizeof(*wtbl);
+	}
 
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				  &sta_req, sizeof(sta_req), true);
-	if (ret || !add)
-		return ret;
+	wtbl_hdr = (struct wtbl_req_hdr *)buf;
+	buf += sizeof(*wtbl_hdr);
+	wtbl_hdr->wlan_idx = msta->wcid.idx;
+	wtbl_hdr->operation = WTBL_SET;
+	wtbl_hdr->tlv_num = cpu_to_le16(1);
 
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-				   &wtbl_req, sizeof(wtbl_req), true);
+	wtbl_ba = (struct wtbl_ba *)buf;
+	buf += sizeof(*wtbl_ba);
+	wtbl_ba->tag = cpu_to_le16(WTBL_BA);
+	wtbl_ba->len = cpu_to_le16(sizeof(*wtbl_ba));
+	wtbl_ba->tid = params->tid;
+	wtbl_ba->ba_type = MT_BA_TYPE_RECIPIENT;
+	wtbl_ba->rst_ba_tid = params->tid;
+	wtbl_ba->rst_ba_sel = RST_BA_MAC_TID_MATCH;
+	wtbl_ba->rst_ba_sb = 1;
+
+	memcpy(wtbl_ba->peer_addr, params->sta->addr, ETH_ALEN);
+
+	if (wtbl)
+		wtbl->len = cpu_to_le16(buf - (u8 *)wtbl_hdr);
+
+	return mt7615_mcu_send_sta_rec(dev, (u8 *)&req, (u8 *)wtbl_hdr,
+				       buf - (u8 *)wtbl_hdr, add);
 }
 
 int mt7615_mcu_get_temperature(struct mt7615_dev *dev, int index)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
