Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF18C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A7F217F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qDbZ88lY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WY5UFs3T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A7F217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=654922KVCi+0vdRQrKNjNCbHBWJQGnnBGuWK1AY8Pik=; b=qDbZ88lYsGLIa4
	9zc46qkLlwNsT6gt6HsoM7Cw/XgajGqDIqqMl0a3kv3GpjaiTPLuzaxQJhJzrFGhzloe7cA6gYYg1
	0tbsa4vkilAhHEXM06m0ML1D6D9zskOu81gKM7tx53u79q3VIJAHiO6j0qyAnznyP9wIvPhk2rmRR
	RpQh+zAz4dg33zMzwYkN714mwvdAmdVw4qU9z+gO6Fe3oHDnSSTJ6UJuVOdhthlXDyLynjiXQd83s
	7JLTSnHLMrcsqWR0+BheHzPOHvydk2k2GrFFr1Nl3bZb+tQikD2tcbCcLYzgG8tDBv/If/K3pvfo7
	e0K0uI916BZLL9InuhSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ituIA-0004nf-15; Tue, 21 Jan 2020 14:14:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ituI4-0004mb-Oj
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 14:14:04 +0000
X-UUID: 3a926c80b3a043e2b876f70c97f4e2c3-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5PijtlWhrJ3vYo3oL0POogoDCVJJn4dKgaURDq8yKg0=; 
 b=WY5UFs3TqfGsauR6MpZ44ittcHNpkE8aWyLHpZVb/NX2EdUt4bCIbhK0F6w/Qv48GfzO5awk00bYpR3/2R76O1UWebv3tfY4os0tkHnDv0UMxr3DUoNRyYIb9r8IQHQQgg3y0W2sKs+ck/D6ooaEEkrf6MS916ElyUyUWpKqeLE=;
X-UUID: 3a926c80b3a043e2b876f70c97f4e2c3-20200121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1752026346; Tue, 21 Jan 2020 06:13:53 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 06:14:51 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 22:13:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 21 Jan 2020 22:13:30 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 5/7] mt76: mt7615: add a tag sta_rec_wtbl for v2 firmware
Date: Tue, 21 Jan 2020 22:13:40 +0800
Message-ID: <f63355b98c04dc866d703e444e40401fe377cdb8.1579237414.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
References: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_061400_813706_A379E929 
X-CRM114-Status: UNSURE (   8.84  )
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

New firmware use tag sta_rec_wtbl to replace MCU_EXT_CMD_WTBL_UPDATE.
This can reduce command/event times.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 22 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  9 +++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index c055949b289c..8f4b8d8159db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1039,6 +1039,7 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 			.conn_type = cpu_to_le32(CONNECTION_INFRA_BC),
 		},
 	};
+	struct sta_rec_wtbl *wtbl = NULL;
 	struct wtbl_req_hdr *wtbl_hdr;
 	struct wtbl_generic *wtbl_g;
 	struct wtbl_rx *wtbl_rx;
@@ -1046,6 +1047,13 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 
 	eth_broadcast_addr(req.basic.peer_addr);
 
+	if (dev->fw_ver > MT7615_FIRMWARE_V1) {
+		req.hdr.tlv_num = cpu_to_le16(2);
+		wtbl = (struct sta_rec_wtbl *)buf;
+		wtbl->tag = cpu_to_le16(STA_REC_WTBL);
+		buf += sizeof(*wtbl);
+	}
+
 	wtbl_hdr = (struct wtbl_req_hdr *)buf;
 	buf += sizeof(*wtbl_hdr);
 	wtbl_hdr->wlan_idx = mvif->sta.wcid.idx;
@@ -1079,6 +1087,9 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 	wtbl_hdr->tlv_num = cpu_to_le16(2);
 
 out:
+	if (wtbl)
+		wtbl->len = cpu_to_le16(buf - (u8 *)wtbl_hdr);
+
 	return mt7615_mcu_send_sta_rec(dev, (u8 *)&req, (u8 *)wtbl_hdr,
 				       buf - (u8 *)wtbl_hdr, en);
 }
@@ -1107,6 +1118,7 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			.aid = cpu_to_le16(sta->aid),
 		},
 	};
+	struct sta_rec_wtbl *wtbl = NULL;
 	struct wtbl_req_hdr *wtbl_hdr;
 	struct wtbl_generic *wtbl_g;
 	struct wtbl_rx *wtbl_rx;
@@ -1170,6 +1182,13 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	}
 
 	/* wtbl */
+	if (dev->fw_ver > MT7615_FIRMWARE_V1) {
+		wtbl = (struct sta_rec_wtbl *)buf;
+		wtbl->tag = cpu_to_le16(STA_REC_WTBL);
+		buf += sizeof(*wtbl);
+		stlv++;
+	}
+
 	wtbl_hdr = (struct wtbl_req_hdr *)buf;
 	buf += sizeof(*wtbl_hdr);
 	wtbl_hdr->wlan_idx = msta->wcid.idx;
@@ -1265,6 +1284,9 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	}
 
 out:
+	if (wtbl)
+		wtbl->len = cpu_to_le16(buf - (u8 *)wtbl_hdr);
+
 	wtbl_hdr->tlv_num = cpu_to_le16(wtlv);
 	req.hdr.tlv_num = cpu_to_le16(stlv);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 8d057c72366a..d978b94aacc1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -506,9 +506,10 @@ struct sta_rec_ba {
 	__le16 winsize;
 } __packed;
 
-#define MT7615_STA_REC_UPDATE_MAX_SIZE (sizeof(struct sta_rec_basic) + \
-					sizeof(struct sta_rec_ht) + \
-					sizeof(struct sta_rec_vht))
+struct sta_rec_wtbl {
+	__le16 tag;
+	__le16 len;
+} __packed;
 
 enum {
 	STA_REC_BASIC,
@@ -523,6 +524,8 @@ enum {
 	STA_REC_HT,
 	STA_REC_VHT,
 	STA_REC_APPS,
+	STA_REC_KEY,
+	STA_REC_WTBL,
 	STA_REC_MAX_NUM
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
