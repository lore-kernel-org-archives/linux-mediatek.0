Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E68DE7C712
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXB0+0Sg2pfC35kylvAjuCz4Drna/EyW34HThP0io6I=; b=dfz+8FcbZA0oSKiGLnmLNECCqJ
	50lhoruuq5DAk/5ZfmN2cWwFwp7mEjOg4/8UnFL2329JfEc0u+YFQA+E4lwqFCzj8FVreKnxkv/jd
	rZJ5E91ijoTtikMEw5XBOcmwrp2zhRczsHKSNxaYPxih2ITt2AHZN9YULKD28MB3ZB7MBMFtykMEa
	E1TdpvH5qOaQ6dJVNobLIF2BS1r/mXaG7X9LjsubE5QknlWLUbdseyPVsYAeWEBP79QieaucPz90c
	ztn+OGn8cdb9LdaPGRFu0nF/jZJyfONQ100omCLAcaCyHa3fA1nOlQ4XlgiZ7lXI7jDB3yuQu0nQZ
	J7VRp7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmolS-00000004cX8-1swP;
	Mon, 02 Feb 2026 07:54:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmolN-00000004cUE-1ubG
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 07:54:28 +0000
X-UUID: 6012e4fe000c11f1ad39f32c34db0b1c-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DXB0+0Sg2pfC35kylvAjuCz4Drna/EyW34HThP0io6I=;
	b=BNLZDBcrcOv2QAVf1XKenDATHks1bECrN674avnEyDXfpu11zfEu6PMJr8/lUxt49c1aiHdWX7Km0FYERq19NUPE52ItvRIXEtnlTjJprS5yf/xhS7ZSvopr2mS+fTze0peCGj0jhLAdVfvXJJ6XcG1nReng5HzMzlc5ZOfA/UI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f2858f08-6471-4797-a163-4e8b099fc759,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:cb467c7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6012e4fe000c11f1ad39f32c34db0b1c-20260202
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 348302993; Mon, 02 Feb 2026 00:54:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 15:54:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 15:54:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
	<shayne.chen@mediatek.com>
Subject: [PATCH 2/5] wifi: mt76: mt7996: fix wrong DMAD length when using MAC TXP
Date: Mon, 2 Feb 2026 15:53:07 +0800
Message-ID: <20260202075311.365673-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202075311.365673-1-shayne.chen@mediatek.com>
References: <20260202075311.365673-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_235425_506865_52EEB367 
X-CRM114-Status: GOOD (  10.42  )
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

The struct mt76_connac_fw_txp is used for HIF TXP. Change to use the
struct mt76_connac_hw_txp to fix the wrong DMAD length for MAC TXP.

Fixes: cb6ebbdffef2 ("wifi: mt76: mt7996: support writing MAC TXD for AddBA Request")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 77a036ac043c..3b09eff216c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1099,10 +1099,10 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	 * req
 	 */
 	if (le32_to_cpu(ptr[7]) & MT_TXD7_MAC_TXD) {
-		u32 val;
+		u32 val, mac_txp_size = sizeof(struct mt76_connac_hw_txp);
 
 		ptr = (__le32 *)(txwi + MT_TXD_SIZE);
-		memset((void *)ptr, 0, sizeof(struct mt76_connac_fw_txp));
+		memset((void *)ptr, 0, mac_txp_size);
 
 		val = FIELD_PREP(MT_TXP0_TOKEN_ID0, id) |
 		      MT_TXP0_TOKEN_ID0_VALID_MASK;
@@ -1121,6 +1121,8 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				  tx_info->buf[1].addr >> 32);
 #endif
 		ptr[3] = cpu_to_le32(val);
+
+		tx_info->buf[0].len = MT_TXD_SIZE + mac_txp_size;
 	} else {
 		struct mt76_connac_txp_common *txp;
 
-- 
2.51.0


