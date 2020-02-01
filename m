Return-Path: <SRS0=uvF2=3V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58583C33CB3
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18956206F0
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHOvbhHl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ekeI1kib"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18956206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIbTWqrqCc/fZeG6NkHL3jDM1mz3YVCJnL+ORM9FOQY=; b=UHOvbhHl0evAe+
	5+ovfwVOjP0rZV22C7E+NLkr0Oy9Fc7xFM4McHWUgbTQTG1V4SP/33mhLJxKfkdXbx//dDHFMfNll
	3dWcmBmWesiMFq0NPx46zg5eUu0p31nUQ6QNFFL+N2KUzmEgSp8aDegEy9MafiAKTmuD6JCHUKCnz
	VIeQ9ijlfTd8uXinZmboNA9QpxYfUglt/6/zPbfHmNRsxoNITvcJYhyU00TQZqdy6FTVs5lpMbI1b
	0m//zwlWr7i6WOUofumRqcmIa+N5+66KGL3jqbYbnzithmaGoWmnf8KYfJsArBMNPaOyDB9VSr2IQ
	QXnafTFR3AZOcOClupRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixumv-0004s8-6t; Sat, 01 Feb 2020 15:34:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixumr-0004qv-Ot
 for linux-mediatek@lists.infradead.org; Sat, 01 Feb 2020 15:34:23 +0000
X-UUID: feeba40bbd734b70b2a6b68009e683f5-20200201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x0RcsqRquhcXQty96nPHhZqu/2xMH1iLFFxG59uudt4=; 
 b=ekeI1kib4OZbY95KWnv1hvLFb3mJHgU0mePx7mP5yxLYXu5Ydceh3QSDgPaJ+UYAer2Mr8jdPQJuZ66yr1ItAA4b9hnn6CZbYEVjfp3RIBp89L3yiph/aLiZAzYqKjeu9yofsCaDyHGe3py7T1s5eHCISpgOJb4y73apKxm7rW8=;
X-UUID: feeba40bbd734b70b2a6b68009e683f5-20200201
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 140594365; Sat, 01 Feb 2020 07:34:09 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 07:34:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 23:34:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 1 Feb 2020 23:31:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 6/7] mt76: mt7615: switch mt7615_mcu_set_tx_ba to v2 format
Date: Sat, 1 Feb 2020 23:33:51 +0800
Message-ID: <d2ec8d96e98d289af203e38c5c0d62634065b15a.1580565624.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1580565624.git.ryder.lee@mediatek.com>
References: <cover.1580565624.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200201_073421_813293_26D6F48C 
X-CRM114-Status: UNSURE (   9.06  )
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

To adapt new firmware version.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 60 ++++++++++---------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 58eac8fe5511..a7c4538e56fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1572,28 +1572,11 @@ int mt7615_mcu_set_tx_ba(struct mt7615_dev *dev,
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
-			.ba_type = MT_BA_TYPE_ORIGINATOR,
-			.sn = add ? cpu_to_le16(params->ssn) : 0,
-			.ba_en = add,
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
@@ -1612,7 +1595,32 @@ int mt7615_mcu_set_tx_ba(struct mt7615_dev *dev,
 			.winsize = cpu_to_le16(params->buf_size),
 		},
 	};
-	int ret;
+	struct sta_rec_wtbl *wtbl = NULL;
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct wtbl_ba *wtbl_ba;
+	u8 *buf = req.buf;
+
+	if (dev->fw_ver > MT7615_FIRMWARE_V1) {
+		req.hdr.tlv_num = cpu_to_le16(2);
+		wtbl = (struct sta_rec_wtbl *)buf;
+		wtbl->tag = cpu_to_le16(STA_REC_WTBL);
+		buf += sizeof(*wtbl);
+	}
+
+	wtbl_hdr = (struct wtbl_req_hdr *)buf;
+	buf += sizeof(*wtbl_hdr);
+	wtbl_hdr->wlan_idx = msta->wcid.idx;
+	wtbl_hdr->operation = WTBL_SET;
+	wtbl_hdr->tlv_num = cpu_to_le16(1);
+
+	wtbl_ba = (struct wtbl_ba *)buf;
+	buf += sizeof(*wtbl_ba);
+	wtbl_ba->tag = cpu_to_le16(WTBL_BA);
+	wtbl_ba->len = cpu_to_le16(sizeof(*wtbl_ba));
+	wtbl_ba->tid = params->tid;
+	wtbl_ba->ba_type = MT_BA_TYPE_ORIGINATOR;
+	wtbl_ba->sn = add ? cpu_to_le16(params->ssn) : 0;
+	wtbl_ba->ba_en = add;
 
 	if (add) {
 		u8 idx, ba_range[] = { 4, 8, 12, 24, 36, 48, 54, 64 };
@@ -1622,16 +1630,14 @@ int mt7615_mcu_set_tx_ba(struct mt7615_dev *dev,
 				break;
 		}
 
-		wtbl_req.ba.ba_winsize_idx = idx;
+		wtbl_ba->ba_winsize_idx = idx;
 	}
 
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-				  &wtbl_req, sizeof(wtbl_req), true);
-	if (ret)
-		return ret;
+	if (wtbl)
+		wtbl->len = cpu_to_le16(buf - (u8 *)wtbl_hdr);
 
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				   &sta_req, sizeof(sta_req), true);
+	return mt7615_mcu_send_sta_rec(dev, (u8 *)&req, (u8 *)wtbl_hdr,
+				       buf - (u8 *)wtbl_hdr, true);
 }
 
 int mt7615_mcu_set_rx_ba(struct mt7615_dev *dev,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
