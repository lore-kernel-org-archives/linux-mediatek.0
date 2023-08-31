Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6648C83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 06:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F1wpeekQbEsp22hBmrE+mMvravHQWF8aInpxsTQF98=; b=e241CZgksFDEtIHy9nqXmFCp7i
	EAahBwoMLX2bsD35Mbt9MxvcrahTKQB9t2J6XorriHw/cpJ1srT0jSrA51Wi0qjN+OVDVKjXby5pg
	zqCurrUR2aMVcku8YwYq8uu/OqwFfMB+Vtgb7P+bRzT+PJUEIpwpNM9sKoBI4VC0CeBEL1JZuyy4S
	ILMmQmU+WDIQj3q4LnpGgRzFbJgEnoMiXByXgiSm9XLD0TiwKHqaa5oKm0zaTP67gnCaV/v3psFad
	HWXPEPvPt3A8LFojhTPwrgM8a17sO5O7XojyM/Cc0Kg6h84o5Qm1NXAx6H9vZMm6xaS9zdvOGSb/B
	T7wwnHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbOb-00Elw0-1I;
	Thu, 31 Aug 2023 06:43:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbOW-00Elvh-2r
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 06:43:10 +0000
X-UUID: a245865447c911ee912e1518a6540028-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/F1wpeekQbEsp22hBmrE+mMvravHQWF8aInpxsTQF98=;
	b=UObPxWJAd0HhJZmDrHGYc/p/KE9FKj6JOpuvWi9ZbOJMbIq5ZHyfSCBptJ8+X2z9Z+JSs4Ss9dCYs+Vxs+DkWLbZLNkwInPMm3Y6KgfG8CI+NjGQ5RRsT0c1Dbxw0qTb928M3nH4tIiw5P3Krg4SU0NLU6SBbi5HJETbUVusX/c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:58537d67-6d37-4a8a-b638-8ea2e5f2855d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:17626413-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a245865447c911ee912e1518a6540028-20230830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1545391418; Wed, 30 Aug 2023 23:43:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 31 Aug 2023 14:23:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 31 Aug 2023 14:23:00 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Allen Ye <allen.ye@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/9] wifi: mt76: check sta rx control frame to multibss capability
Date: Thu, 31 Aug 2023 14:22:15 +0800
Message-ID: <20230831062221.20027-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230831062221.20027-1-shayne.chen@mediatek.com>
References: <20230831062221.20027-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_234308_938518_30DEB049 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

From: Allen Ye <allen.ye@mediatek.com>

Add CAP3_RX_CTRL_FRAME_TO_MULTIBSS check when setting sta_muru_tlv,
which is used to get stations's capability of receiving control frames
when running OFDMA with MBSSIDs.

Signed-off-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5cf45c5ce5e1..8350f84c7644 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -906,6 +906,8 @@ mt7915_mcu_sta_muru_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 		HE_MAC(CAP2_MU_CASCADING, elem->mac_cap_info[2]);
 	muru->ofdma_ul.uo_ra =
 		HE_MAC(CAP3_OFDMA_RA, elem->mac_cap_info[3]);
+	muru->ofdma_ul.rx_ctrl_frame_to_mbss =
+		HE_MAC(CAP3_RX_CTRL_FRAME_TO_MULTIBSS, elem->mac_cap_info[3]);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 6740c1111af4..b26396b2f87b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1173,6 +1173,8 @@ mt7996_mcu_sta_muru_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 		HE_MAC(CAP2_MU_CASCADING, elem->mac_cap_info[2]);
 	muru->ofdma_ul.uo_ra =
 		HE_MAC(CAP3_OFDMA_RA, elem->mac_cap_info[3]);
+	muru->ofdma_ul.rx_ctrl_frame_to_mbss =
+		HE_MAC(CAP3_RX_CTRL_FRAME_TO_MULTIBSS, elem->mac_cap_info[3]);
 }
 
 static inline bool
-- 
2.39.2


