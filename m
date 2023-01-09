Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3838AC61DB3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVPGB0cO9lzZxQqdNU6cdCHWvpa/kh+fhSMQf9MJ5HE=; b=L8azli5WF0WJYQd4gcGFr4XRrW
	e2byU0fh/3r/VzcUU/9TvW+rr4PWZdj+3XiUYw+9zqNZT0sh/VrulC+PKL8Kaoqm+25vxD6HbhWOQ
	jdLy6mzgHvyxpk0XZ/17wokIL6wRNu6SNuJ/XkbT7pXaOYzve0XLXzz9ZQ0Vi9iM9B2W0kTXVm77i
	W6MfbX33/lVtvEnG43GzqQWokX1z5VhKevFfA/X5simY8CSiLaCOYx0mmdSRsz94OeoQM/EK+7LlK
	S6dxD+xL711FVc8GDCTQn5itFd4KEqgJjBif4RVD1Yx3uEcbOvuDc7Z+C2y9PCJRBBhnxwJpAyvvH
	BNYbbQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvU8-002jtI-8d; Mon, 09 Jan 2023 16:58:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvU4-002jq6-8F
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OVPGB0cO9lzZxQqdNU6cdCHWvpa/kh+fhSMQf9MJ5HE=; b=CEx1ahFpyv99YZeCLWW5Na6xNJ
	Ci0UqS7FyGGe0U2z19gjm6CFSRYiSucwvfdOdUfOXL94PvEUjPDVNLzVkbD39liRplp5wdCwrk8pI
	q2lYOt5XmNALPKtU37N5s96X2XBLdyH3b/jgrdNZS8LWMJJ+PfQHu35Jkj7Teob7PwMtpyG4SF3KB
	IB8ktq08mnceyKp3EW9h9UhVDHbUcOoKaWSF/4zOng86D4iPngv2zIeu2Jjc4B8jhoy2rQbkRANvp
	EqqhIIKvaan2aXcqpApvo9r6lUKsvvvLpxX0jutJeQ+2NKkBgbdP21qnFSp4XBOO/5f42lYEPnhgU
	GUKypN8g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTt-002mmu-1c
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:43 +0000
X-UUID: bb265311d4144359943ed8b8fa2d6d85-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OVPGB0cO9lzZxQqdNU6cdCHWvpa/kh+fhSMQf9MJ5HE=;
	b=YqQNH34caFF3HlihHiJFgt/lEhmh9dlQEoP2ibBn1Wv8xQN7BDAp3+bEh9QNgbJX8VpcG89HEEy21lHGWhJmIWEFwX9zTTsQUVjD3pEuI+0dkV+yIhnykCEkF2Nugl7YWYxjbX8hOeoFMSE4aUYfxtidxm1HCA8GRneDpFaCb08=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:0fa62556-4376-470b-a1eb-b6d61677a987,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:e5eebb8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: bb265311d4144359943ed8b8fa2d6d85-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1077690521; Mon, 09 Jan 2023 09:58:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:05 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 05/13] wifi: mt76: increase wcid size to 1088
Date: Tue, 10 Jan 2023 00:57:23 +0800
Message-ID: <20230109165731.682-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165842_064386_AD855CB8 
X-CRM114-Status: GOOD (  11.60  )
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

Increase wcid size to support up to 1024 station hw entries and
64 bcast/mcast hw entries.
This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h            | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 9fa8c5f63801..b3fd3abfdd9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -294,7 +294,7 @@ enum mt76_wcid_flags {
 	MT_WCID_FLAG_HDR_TRANS,
 };
 
-#define MT76_N_WCIDS 544
+#define MT76_N_WCIDS 1088
 
 /* stored in ieee80211_tx_info::hw_queue */
 #define MT_TX_HW_QUEUE_PHY		GENMASK(3, 2)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index e26c4e4a2a16..8926d1785c92 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1736,7 +1736,7 @@ mt76_connac_mcu_gen_dl_mode(struct mt76_dev *dev, u8 feature_set, bool is_wa)
 }
 
 #define to_wcid_lo(id)		FIELD_GET(GENMASK(7, 0), (u16)id)
-#define to_wcid_hi(id)		FIELD_GET(GENMASK(9, 8), (u16)id)
+#define to_wcid_hi(id)		FIELD_GET(GENMASK(10, 8), (u16)id)
 
 static inline void
 mt76_connac_mcu_get_wlan_idx(struct mt76_dev *dev, struct mt76_wcid *wcid,
-- 
2.25.1


