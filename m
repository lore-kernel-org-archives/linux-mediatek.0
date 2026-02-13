Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C3DEF48DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Feb 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2STdLaYuCNMXqLtR8ZHygOV0ZDC+dDAI3w5ajot7auI=; b=H8+h2/SRPZX8yrURlFvH6NtDhS
	zJdFIfpHjUSLM+hrl6UxGqovr9VKaxq/hxthk4EgXORbQ0qUN6cqRWattibp7gxDCy5Y45/hOCO06
	/CpLruBNyPQWJuWwP+twhbhctwJmOQKOxSglQIPyyZxzT8HvnqPFhewkjMbVDYx7g5zgtxEcXXAvS
	9NW1o87R7T4qFMCwr7WDnoMLp555xEue1yJHRNC6RAJ5Gjdmz2syYVGMAKGBHRNEVQwZAgN8DQEIq
	pwKukIY6cLY4OROJFMdRwjXjAfN8Ti1HC+h/iNgDnUXJuR1FOmhpql4QTWpoTH/QXqcKt3Zvh6KIq
	5gyRI3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqo6Y-000000038QM-2KGA;
	Fri, 13 Feb 2026 08:00:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqo6W-000000038Px-2VF4
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Feb 2026 08:00:45 +0000
X-UUID: 167dc08008b211f1a16f0188aa809bee-20260213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2STdLaYuCNMXqLtR8ZHygOV0ZDC+dDAI3w5ajot7auI=;
	b=hgfGejTKipP/rjTgiXtbX78KuZc2FIYn6ChH+NyYNH18iz68sj3lrAETw0NqoACuj0R+wG1It3kW+UY8MHN/0riFQZ/TX2PlrdyECF07EIJw2E/NbweOS+ZPtsV4gZzQRxSeVKJsZhSm5Ozo6DUZUS7aSNZ6PPAaDhk1WDRVSIc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d5abb6a1-da0c-4c84-b84b-62eab854677f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:e22d425b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 167dc08008b211f1a16f0188aa809bee-20260213
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1588839225; Fri, 13 Feb 2026 01:00:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Feb 2026 16:00:37 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Feb 2026 16:00:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: Disable Rx hdr_trans in monitor mode
Date: Fri, 13 Feb 2026 00:00:29 -0800
Message-ID: <04008426d6cd5de3995beefb98f9d13f35526c25.1770969275.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_000044_671155_7F581FB3 
X-CRM114-Status: UNSURE (   6.85  )
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

Ensure raw frames are captured without header modification.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 7046bf26d8ed..bd3409b296b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -485,6 +485,8 @@ static void mt7996_set_monitor(struct mt7996_phy *phy, bool enabled)
 
 	mt76_rmw_field(dev, MT_DMA_DCR0(phy->mt76->band_idx),
 		       MT_DMA_DCR0_RXD_G5_EN, enabled);
+	mt76_rmw_field(dev, MT_MDP_DCR0,
+		       MT_MDP_DCR0_RX_HDR_TRANS_EN, !enabled);
 	mt7996_phy_set_rxfilter(phy);
 	mt7996_mcu_set_sniffer_mode(phy, enabled);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index e48e0e575b64..393faae2d52b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -159,6 +159,9 @@ enum offs_rev {
 #define MT_MDP_BASE				0x820cc000
 #define MT_MDP(ofs)				(MT_MDP_BASE + (ofs))
 
+#define MT_MDP_DCR0				MT_MDP(0x800)
+#define MT_MDP_DCR0_RX_HDR_TRANS_EN		BIT(19)
+
 #define MT_MDP_DCR2				MT_MDP(0x8e8)
 #define MT_MDP_DCR2_RX_TRANS_SHORT		BIT(2)
 
-- 
2.45.2


