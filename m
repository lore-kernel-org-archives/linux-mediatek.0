Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDE9C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 08:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=degEPpez7R0PK8gPSumCmltIgpOy/w9YTRhbX2/Q2qU=; b=FFVVMSSP1okgZED5bXLDmQI9dS
	8BNtsyU6EFF/kVVTnZohW1lIdWjzWJ/Lc4mPHj35L1K81dmj+SASo+/I9Bz3y9V4rO9nj/YtDvr0Z
	oBGFUZZaT6v+KRV51e7pR5KvytCFubDXnN0X8WApvkS9Mw2URjPJUn0fnaKbDm92hGWAsMzbhNr8Z
	mRC6Qtf841A2aE7eYlNcz1lzEpuMPKD28G1HCypkXZBjiYpLchTzM3Oab84gNYKmPT7ZhxxGhnYMc
	j1P2d6yshdRuXzDzcmAkGJQJdiUCD5Nsq8RqNWo8zDpMf+VPKsWuaXqYiZSTCs4Nkp370TqSB9i+U
	FZ/hpqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozDRU-00AaAl-DT; Sun, 27 Nov 2022 08:55:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozDRR-00Aa9V-LI
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 08:55:15 +0000
X-UUID: 004fd29f62ad43ad9703477da30fac7d-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=degEPpez7R0PK8gPSumCmltIgpOy/w9YTRhbX2/Q2qU=;
	b=kdSOkbyNAhtELS80VWWThKcV8xhLJg9xyLUKMIv7amiMVkmLhwblRFWDrOF1jg5n1xzAEjWdH8Hff8q4voAGDl0InE4PjCDSEnQAyjj6Ob81C30/p+AbDZsNWFAjnbkwg89ST8WqrcIo2pcvVVfIvMKwMaUn0E4aciLPvD540Y4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:c00c9d16-23ec-4c94-9375-23c829471a78,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:6eb056dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 004fd29f62ad43ad9703477da30fac7d-20221127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1187184312; Sun, 27 Nov 2022 01:55:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sun, 27 Nov 2022 16:45:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 27 Nov 2022 16:45:02 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: fix endianness of mt7915_mcu_set_obss_spr_pd()
Date: Sun, 27 Nov 2022 16:45:00 +0800
Message-ID: <ff2080860ee5b28f7dcde70bada720ba55b0bac5.1669538240.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_005513_747387_A3A2AC8D 
X-CRM114-Status: UNSURE (   8.98  )
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

Fix sparse: sparse: incorrect type in assignment (different base types).

Fixes: a6335031eb96 ("wifi: mt76: mt7915: add support to configure spatial reuse parameter set")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 7a6cb25fdaed..9e479d41eab5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3438,8 +3438,8 @@ mt7915_mcu_set_obss_spr_pd(struct mt7915_phy *phy,
 	if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_SRG_INFORMATION_PRESENT)
 		req.param.pd_th_srg = max_th - he_obss_pd->max_offset;
 
-	req.param.obss_pd_min = 82;
-	req.param.obss_pd_min_srg = 82;
+	req.param.obss_pd_min = cpu_to_le16(82);
+	req.param.obss_pd_min_srg = cpu_to_le16(82);
 	req.param.txpwr_restrict_mode = 2;
 	req.param.txpwr_ref = 21;
 
-- 
2.36.1


