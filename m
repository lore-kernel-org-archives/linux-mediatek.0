Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D621FEA807
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 03:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAcAj41Nboaxy537cdMv9ttueCZpamwxsdWgeZCwTvU=; b=G//7x4n58wqDzG1mxCw2UIkgrl
	uUBexqwLaaWafEsJfDeHc01+aJzzMu/4ygxrZ16dHca7nFCokUDnCFCNiY9LLMPHkMxXAPaaqArUC
	sM+ISBxpQD5iS66eDO3AkDhbzlFkrN5oMyXnJw5q3W2EXnB0KK9pAgiZRDKQhogM9kAN4d5zSPPWQ
	2J02gVa6THcFRNf8R6o1JBbXDTydat/3ywYl6xsEVq/7UcscoanKI6m3DiDCXP5vjMPkXlfkKYkPj
	MWPrjDBALjHcAS7fMs0p3J72p3SiN09ni41pr0TIWtoPvXZsBi/K2uHL8lNY56OHulUik4OWY5SKk
	5y6nUeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FPQ-00000002dPK-1o4f;
	Wed, 25 Mar 2026 03:59:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FPL-00000002dMV-3xPV
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 03:59:54 +0000
X-UUID: 104b88d427ff11f19e7563141e833ce8-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CAcAj41Nboaxy537cdMv9ttueCZpamwxsdWgeZCwTvU=;
	b=HJNNN0aBvLxyeBl54O0K2UKWa3NM6EDwK1xMu13beHm62tQ5u8GVqfMvzvdCC8eqZw/LrkhOnAGMeuvSHSaUFUBWpd2WimxAQGR2sQV328A2LXqq+L5lO8beSPhVlIBIhf9hsvhWZ8aHpkF9YFTEYNOW0XZ/DpfqC1IHy2/ctro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:03e52cd5-705f-43ca-b856-119f1aab3902,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:b7a72d94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 104b88d427ff11f19e7563141e833ce8-20260324
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1660693923; Tue, 24 Mar 2026 20:59:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:59:44 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 11:59:43 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	Shayne Chen <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: disable UNI_BSS_INFO_PROTECT_INFO for mt7996
Date: Tue, 24 Mar 2026 20:59:41 -0700
Message-ID: <a1f5ad05b164c836161e9c53e32335c15a1fa2a2.1774411028.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_205951_996082_561B86C0 
X-CRM114-Status: UNSURE (   8.19  )
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

There are known firmware issues with MT7996, so it is temporarily
disabled. MT7992 and MT7990 are working normally.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 16420375112d..bdc40e94127c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1281,6 +1281,9 @@ int mt7996_mcu_set_protection(struct mt7996_phy *phy, struct mt7996_vif_link *li
 		PROT_NONGF_STA	 = BIT(7),
 	};
 
+	if (is_mt7996(&dev->mt76))
+		return 0;
+
 	skb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &link->mt76,
 					 MT7996_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
-- 
2.45.2


