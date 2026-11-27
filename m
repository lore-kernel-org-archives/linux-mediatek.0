Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6408606A6A9
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M0b9DyLZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eL/0uOpU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kk8Ub2EjnXkAleZvf6MdfCnnB6yfflQAB02mxf95Lzc=; b=M0b9DyLZqFmvrtxvWKcMCmCR68
	zHMJBk+dFe8DcUZrBiXQnHnL5IgarLoJCRxpp10sqZDS6b1Ur+SpBzODyfGo4KVDtbT0Nb532poXw
	cai/2+yJmiuL65uUeNqseRgxsuMQl4Si1TQnSTh0ruhySWXa3FlOetnMXsG4g90OafCATm8BEfW+R
	Xrkdrb7JIfy1I60AnEzg1I48L3pP43rrV0Mw1JPoNZjlMwY2rqbDPvuOEtYPl9bBoziHne6PZayv7
	yMpsxUuPqA3PZSC/NHcG92RL4hKEgt3g922wbbeNiIoi5r/qLMHa+ONnGCkOjGmjuafi7K7tMUDol
	GaXIrtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQw-0000000FGEc-2AMH;
	Fri, 27 Nov 2026 08:35:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQi-0000000FG7A-2gz2;
	Fri, 27 Nov 2026 08:35:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 205BF44EB5;
	Fri, 27 Nov 2026 08:35:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768540;
	b=GcZU3gnoWHyy8lKxTORb9hEIZ/9ko962zqIc6sZk11NX+GwkDfwZRRc2EuLZfW+HBX27
	 UkIIRVcSocubxqdQpnP2QBYd7OR0WNMPp7DsxopDsy/WEXagahB1vScWHHB0tK4vWlGrH
	 wGSqZHKgHd7bfg7SPu3HX9tEOGpGrf5vGYspXNt9CtahNOTXGOMb+DunX0BKtqm199XTU
	 SB0Ub9g8SybuN4KJahQtMnfsD5QNZDqjqU2tHZvqvRbDuG3Zfsyz4aBzYQ8Wf0pwbHNBm
	 5cyPO764oAvijwZaCoXgIT0gxfa7Pd7zAydah3pCTQsbDU8Rff7Xo4p4pLhaRlkS+Sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768540;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Kk8Ub2EjnXkAleZvf6MdfCnnB6yfflQAB02mxf95Lzc=;
	b=rmXCKbBQQmMZj+u9gnaZiNaUfuWm+RyTNWWUj7z7+kBlT24W/qYIPGRYFqoAG7NMCIMo
	 ldfgFYNslrq5ZMSVvpUq+u+i5J+gYhnn8GkOj1J7T2eYhVOTEOtIWph5XEDmR8xnGg+VS
	 PZcwUsEg0suspEFmCQkPO7WpDWhUKamwF4U+pg8O/qiZyHMV+x4aRNx3taP/1jetuGeDf
	 nvuQ0EHIuVJuXQ+OpEJeiDaJ1ped6m2TIHx+s38v3yoTdqToUr9bIZ/AGSpHRf6N4yveQ
	 GBJWoNidDNBtPHFOGyfan69Kv0clOG+Tv1h5XyMTa2Cv5RdBgnxp2UO9YRQcOBMah7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36AC81F00899;
	Fri, 27 Nov 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768540;
	bh=Kk8Ub2EjnXkAleZvf6MdfCnnB6yfflQAB02mxf95Lzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eL/0uOpU6FNouZx6s3iqL7GvCy7V4fwG4aPR1RopvihoBw6ZZ3KxxGy/1SPokBB3V
	 ZuaQbjeHNa7dpXsBy0+xlvDBaODEBHWRvIgQEOVUD6AC4YPHnydKMCuFZv5m7QSd9i
	 7bPsMeBU74E9a09geGtBCqZj7F70e9FpaKz8f2/1MJUCWLr/tGmAEXySJoyDo3PUic
	 Rp4w8WDVJgPDQnnp9DYHk50DrvOBWM98yovRbxXLdoU0zbYzC++Yqmu/YGgb2022Bq
	 yg8FzUzjfVYTM7pDYKhdW5om/i6jbhxn2w0naaNjpLJ4bHDq5TQxB4Nz33nURsPO2Z
	 ZGvhM2w3aiDXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B41904B646;
	Fri, 27 Nov 2026 08:35:28 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 11:35:14 +0300
Subject: [PATCH 03/10] wifi: mt76: mt7603: set beacon and CAB queue index
 in the TXD directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-mt7603u-v1-3-369bee9846f8@gmail.com>
References: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
In-Reply-To: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=2103;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=1xCPoMQGae2Iwtm6u84oOfPkwqg+d/7HUejZdUysg1c=;
 b=yI671h+opbGqW13jJxa79LBJalQPoozFQcqNMDJW21JZTFumsn22W3KWMU5tzRkyVh9uOpAIk
 ekcSZmlwS4HBc37dHclxdalvnFa0ASxCp7fu9+SqMiQGHd3SNkIWoau
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: llamapersonaltv@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Murad Dadashev <llamapersonaltv@gmail.com>

mt7603_mac_write_txwi() looks up the TX queue to get the hardware queue
index for the TXD. Beacon and CAB frames always go to the BCN and BMC
hardware queues, so use those indices directly for MT_TXQ_BEACON and
MT_TXQ_CAB.

This lets a bus without dedicated beacon and CAB rings queue those
frames on another ring while still targeting the right hardware queue.

No functional change for MT7603E and MT76x8.

Signed-off-by: Murad Dadashev <llamapersonaltv@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index fa0bf9a201ce2d43b48981aab75b70ff21ff5c51..fb5e06d04e5a943a4536676fdf7676e6789db6df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -949,8 +949,8 @@ mt7603_mac_write_txwi(struct mt7603_dev *dev, __le32 *txwi,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_bar *bar = (struct ieee80211_bar *)skb->data;
 	struct ieee80211_vif *vif = info->control.vif;
-	struct mt76_queue *q = dev->mphy.q_tx[qid];
 	struct mt7603_vif *mvif;
+	u8 q_idx;
 	int wlan_idx;
 	int hdr_len = ieee80211_get_hdrlen_from_skb(skb);
 	int tx_count = 8;
@@ -961,6 +961,13 @@ mt7603_mac_write_txwi(struct mt7603_dev *dev, __le32 *txwi,
 	u32 val;
 	u8 bw;
 
+	if (qid == MT_TXQ_BEACON)
+		q_idx = MT_TX_HW_QUEUE_BCN;
+	else if (qid == MT_TXQ_CAB)
+		q_idx = MT_TX_HW_QUEUE_BMC;
+	else
+		q_idx = dev->mphy.q_tx[qid]->hw_idx;
+
 	if (vif) {
 		mvif = (struct mt7603_vif *)vif->drv_priv;
 		vif_idx = mvif->idx;
@@ -983,7 +990,7 @@ mt7603_mac_write_txwi(struct mt7603_dev *dev, __le32 *txwi,
 	frame_subtype = (fc & IEEE80211_FCTL_STYPE) >> 4;
 
 	val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + MT_TXD_SIZE) |
-	      FIELD_PREP(MT_TXD0_Q_IDX, q->hw_idx);
+	      FIELD_PREP(MT_TXD0_Q_IDX, q_idx);
 	txwi[0] = cpu_to_le32(val);
 
 	val = MT_TXD1_LONG_FORMAT |

-- 
2.47.3



