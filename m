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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B756CC33CB3
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:34:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E95D206F0
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2020 15:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EW9wmH9h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HZWJLoBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E95D206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAmkAChKmGnnqUOzzQDMGLZPb2ULVzggCCsr7KpGLd8=; b=EW9wmH9hcHNFrV
	mLknvjLSBaXYTiuomiBFwGOa7heMHQF8PqtuC7v74vVQhVDmNHVgc25YJ9unf+K89AbVNM43DGiNR
	Uk+Kibp5gugrAY09dJoz9pd2EJmpwIOjZvLwvL43/0uNmiFVCDyx/iJ99Mjcb1ikLB5VntkLpJ9VS
	2mbhzDAVlyAJNbUzzXz+XD5e6h9bF92fQmVY0eQlrdpKrO6vh0KRxUyEftvz5ZD+hFD+dYtSsgI5b
	SifFzTyfDlhHGKlxpYTatgU84BidH1WyTEuwI7GYqovzBqitH3ToOz1Qr/3Cm8kGW+2KPttwKzzIm
	o7s9RvwLEUrmriui48Fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixumj-0004or-Ip; Sat, 01 Feb 2020 15:34:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixumg-0004oA-St
 for linux-mediatek@lists.infradead.org; Sat, 01 Feb 2020 15:34:12 +0000
X-UUID: 1e9ff7840fbf484c883cf56238be49b0-20200201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yuPIAAalJI7V6zSDuiapuZAUnXw2pqdb6RVynu9ZCJQ=; 
 b=HZWJLoBL8o3aDUNXbdS3/5hjLfQsz78xP0B5U91coblSKimcA+jfYQnynXZp5AdOrGXeyeiETgJTJiPpK8zVUxSLLJMEDjZjRPGhKdCaKqzsJjTX8FvHwWsm47deqLjt0UbZYU9YuR4NNiCeybaB7prro9PLlHJ+KmzzKblEmxA=;
X-UUID: 1e9ff7840fbf484c883cf56238be49b0-20200201
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1686463486; Sat, 01 Feb 2020 07:34:04 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 07:34:32 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 1 Feb 2020 23:34:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 1 Feb 2020 23:31:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 7/7] mt76: mt7615: switch mt7615_mcu_set_rx_ba to v2 format
Date: Sat, 1 Feb 2020 23:33:52 +0800
Message-ID: <21e5b635042aed4d2c8d3c1b75c96136f2e20d6d.1580565624.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1580565624.git.ryder.lee@mediatek.com>
References: <cover.1580565624.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200201_073410_949263_EFB2E884 
X-CRM114-Status: UNSURE (   8.73  )
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
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 62 ++++++++++---------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index a7c4538e56fc..6639f9291721 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1646,29 +1646,11 @@ int mt7615_mcu_set_rx_ba(struct mt7615_dev *dev,
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
@@ -1687,17 +1669,41 @@ int mt7615_mcu_set_rx_ba(struct mt7615_dev *dev,
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
