Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE3C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MwUIJnrccU0sOuwc06e3T/w6uq2nxB8dWICj2l+EXTc=; b=h49JZu6piFV1VVK2bCDsxprHV6
	Otb8JB5J19BAiDY3jiT+Hllld/Juz+cg62nZYT+9GVlwXva8gA5egdFVuonBeySWYhSoRPsnIzIzi
	EIoBr8mBffrXYJCUpIIoDz1jXw+EpF63308d4aDdb2sr187Pu+i9ygF6MmWViGDezwNXFXkLjEKuJ
	/spC7zfJC06S5SQf0SibKgLLqPTsjIXLhyJU0U/6bJkhwHcYaJVbs8AAXfoID5YNCuPU/XRGVzBcZ
	Kz0O1KS6IIQC4P3s2wgHmyyy1Bhbm4QXNIT4a7M9IBmnt34atXrU/SGnNHpdkrAB4h4VmMUAsmcNG
	EkY2JJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD48O-009SzD-Jq; Wed, 04 Jan 2023 13:48:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzpp-007wXi-Hq
	for linux-mediatek@lists.infradead.org; Wed, 04 Jan 2023 09:13:23 +0000
X-UUID: 9540d49afda3440eaae1cafc95fdcd41-20230104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MwUIJnrccU0sOuwc06e3T/w6uq2nxB8dWICj2l+EXTc=;
	b=Bqfqm1mODnzT9e2NAtjr9BVU5IcdVzl0bwMB8lmyaIgD3Sduu6wEoyAaVA/Q+h8vFPO07bPU6MjxhphCb3jD47gO7mIoKtfsYNm7a/rwIBFimdl3Hf6/1vGxnUAiR6MBnxQoesuIDR3XhDCMjnQA5v+hScT/jlP65EgDxCX3pe8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:21416d18-2a4d-48ee-88fd-0c8b2884e95a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.16,REQID:21416d18-2a4d-48ee-88fd-0c8b2884e95a,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:09771b1,CLOUDID:8b8a368b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230104171239B5APNSO9,BulkQuantity:3,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 9540d49afda3440eaae1cafc95fdcd41-20230104
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1514236975; Wed, 04 Jan 2023 02:13:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 4 Jan 2023 17:12:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 4 Jan 2023 17:12:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2] wifi: mt76: fix WED TxS reporting
Date: Wed, 4 Jan 2023 17:12:34 +0800
Message-ID: <2a9e0776c57c260e7734e46f2db8432ec80c1761.1672823371.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_011321_655464_F83D5958 
X-CRM114-Status: GOOD (  11.56  )
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

The previous commit forgot to remove a leftover check and set wrong bitmask
that led to unexpected tx_stat reporting.

Fixes: 43eaa3689507 ("wifi: mt76: add PPDU based TxS support for WED device")
Reported-By: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2 - correct bitmask
---
 drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h | 10 ++++------
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c       |  3 ---
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h
index f33171bcd343..39cdadcb3d07 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h
@@ -159,12 +159,10 @@ enum {
 #define MT_TXS4_TIMESTAMP		GENMASK(31, 0)
 
 /* PPDU based TXS */
-#define MT_TXS5_MPDU_TX_BYTE		GENMASK(22, 0)
-#define MT_TXS5_MPDU_TX_CNT		GENMASK(31, 23)
-
-#define MT_TXS6_MPDU_FAIL_CNT		GENMASK(31, 23)
-
-#define MT_TXS7_MPDU_RETRY_CNT		GENMASK(31, 23)
+#define MT_TXS5_MPDU_TX_BYTE		GENMASK(23, 0)
+#define MT_TXS5_MPDU_TX_CNT		GENMASK(31, 24)
+#define MT_TXS6_MPDU_FAIL_CNT		GENMASK(31, 24)
+#define MT_TXS7_MPDU_RETRY_CNT		GENMASK(31, 24)
 
 /* RXD DW1 */
 #define MT_RXD1_NORMAL_WLAN_IDX		GENMASK(9, 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index f0d5a3603902..1a6def77db57 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1061,9 +1061,6 @@ static void mt7915_mac_add_txs(struct mt7915_dev *dev, void *data)
 	u16 wcidx;
 	u8 pid;
 
-	if (le32_get_bits(txs_data[0], MT_TXS0_TXS_FORMAT) > 1)
-		return;
-
 	wcidx = le32_get_bits(txs_data[2], MT_TXS2_WCID);
 	pid = le32_get_bits(txs_data[3], MT_TXS3_PID);
 
-- 
2.18.0


