Return-Path: <SRS0=uvF2=3V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7920FC33CB7
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:44:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E90206E6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LqUrB4Ec";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cbC9xVf3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E90206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78jMlZRmARX7o5a/1mQrMwDo/adxbzxDRqzDzAdk0EI=; b=LqUrB4EcU/amlL
	NVercyGY3jTZ4qRb74hPC4rTwUAL6aPGSsDc9w1u0NVYbUSUnz1ljUuv4CDvCzwv66Q7BR8N16L8S
	nLGqgE4/uUIy2uhsChpP+tl0WVsM2qaRfSBfw2hWepDYZlS/Eyil0dKlCBmaKNkDoanFLv5QVJ7Q4
	Hp9RuiPTbJy62/HanP0jQrRePid+XY/Luh+BndlTNZY0LGKTvygb/qg+au0rpvQL3Xlo+r0x9kR8o
	eZAR22Xth7VC8F1ti+noWWH/zY0T6MMM0aDgEhN9NlcnFt0zZoDMep4f9DdX1r4EuJ0Jbm1wT+KlP
	qWKhvctRZlNGFQjuEe2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixuwL-0000GC-1Q; Sat, 01 Feb 2020 15:44:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixuwI-0000ES-Dp
 for linux-mediatek@lists.infradead.org; Sat, 01 Feb 2020 15:44:07 +0000
X-UUID: f164016f54f44f2e8a8a536918f78af8-20200201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aQbmh620igvV3NDTNU693dnCanRuvWrzmm24DXTcmvA=; 
 b=cbC9xVf3CgXdv3THWl6rRHtBwSd/5BV5RFkgpLK85Gc+yXgaU+r9zd2O8rBbdmXRnjYaevvViTLk0txKKNoMnoB6xYZq9VEd5EKsWYHLduQ8X1VYftCmwZwYmea4NwzXsoXwOOh9popRddB+ou38D98GWdoR0VG5SdaalqaOZQI=;
X-UUID: f164016f54f44f2e8a8a536918f78af8-20200201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1547738659; Sat, 01 Feb 2020 07:44:00 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 07:34:30 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 23:33:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 1 Feb 2020 23:31:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 5/7] mt76: mt7615: use new tag sta_rec_wtbl
Date: Sat, 1 Feb 2020 23:33:50 +0800
Message-ID: <dd9cb430c3c3a6baa843663bc1478dc72dd7f188.1580565624.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1580565624.git.ryder.lee@mediatek.com>
References: <cover.1580565624.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0E33A85B1B71A70A95D4BAA585959583BBE5B8EE23FA693F907B92669DA033332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200201_074406_482435_969E2608 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Josh Boyer <jwboyer@kernel.org>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to reduce command/event times, newer firmware adds a tag
sta_rec_wtbl to take care of WTBL operations.

MCU_EXT_CMD_WTBL_UPDATE is deprecated.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 22 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  8 ++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index ce70e2c03956..58eac8fe5511 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1045,6 +1045,7 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 			.conn_type = cpu_to_le32(CONNECTION_INFRA_BC),
 		},
 	};
+	struct sta_rec_wtbl *wtbl = NULL;
 	struct wtbl_req_hdr *wtbl_hdr;
 	struct wtbl_generic *wtbl_g;
 	struct wtbl_rx *wtbl_rx;
@@ -1052,6 +1053,13 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 
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
@@ -1085,6 +1093,9 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 	wtbl_hdr->tlv_num = cpu_to_le16(2);
 
 out:
+	if (wtbl)
+		wtbl->len = cpu_to_le16(buf - (u8 *)wtbl_hdr);
+
 	return mt7615_mcu_send_sta_rec(dev, (u8 *)&req, (u8 *)wtbl_hdr,
 				       buf - (u8 *)wtbl_hdr, en);
 }
@@ -1113,6 +1124,7 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			.aid = cpu_to_le16(sta->aid),
 		},
 	};
+	struct sta_rec_wtbl *wtbl = NULL;
 	struct wtbl_req_hdr *wtbl_hdr;
 	struct wtbl_generic *wtbl_g;
 	struct wtbl_rx *wtbl_rx;
@@ -1176,6 +1188,13 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
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
@@ -1271,6 +1290,9 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	}
 
 out:
+	if (wtbl)
+		wtbl->len = cpu_to_le16(buf - (u8 *)wtbl_hdr);
+
 	wtbl_hdr->tlv_num = cpu_to_le16(wtlv);
 	req.hdr.tlv_num = cpu_to_le16(stlv);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 8d057c72366a..0af5e519f712 100644
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
@@ -523,6 +524,7 @@ enum {
 	STA_REC_HT,
 	STA_REC_VHT,
 	STA_REC_APPS,
+	STA_REC_WTBL = 13,
 	STA_REC_MAX_NUM
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
