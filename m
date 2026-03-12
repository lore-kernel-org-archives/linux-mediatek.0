Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051FEFED2FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 10:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gWtsLnA6e7HTZJHIKf23ltT0p1tN93Y4nlsAfY2MRE=; b=I+QNFKtKnTMpWGYw2HVeB1hk7G
	hmHbiJZPU/UVlPnOw3fRkUn0kXKM+r3dNdSs4u8jqB4wG1RnvXLFGAEjGZD7sxDXoCP/cpfcqhidD
	DFFKLMd58izZ5EeKgVAj2lkv+tO7A/WDvPWfLfMo60w1JrKqwcvSZGgmMXBjIO4KZVLhrY3pUSEOI
	I+6q0uv1uglg4g9sbDwkchVNPAolkQFjfZnbo2vcFP35niBnYm4tbG1+scGwZmIU6xiZHhR5qrrHL
	pzW56Kvg/0s9u8pL++8cxJEneqHMpgXpsIA7Wf2HQfP9olyGvAOVG/J/bHgNUja9GM1xnds4evW7A
	y+B3bzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d3G-0000000DqsX-3Zso;
	Thu, 12 Mar 2026 10:13:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d3E-0000000Dqrp-0Jdm
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 10:13:57 +0000
X-UUID: 0a7f93d21dfa11f1a6de359d7043e138-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4gWtsLnA6e7HTZJHIKf23ltT0p1tN93Y4nlsAfY2MRE=;
	b=HR4PpS+DtSgN5vwyXhEcEbhppCut81W3MdsJYJBP6PgrRBbIET0ll21hK1IicuBcSnodaTTj7LCYrOuzsln1mckcJVhvRwgZST2jdnMfa3UyWw1ShWWVXergoC9bSrT69duT1E7j+POXBlHiIQ8xz4ZSvuN2vU2czBfWN70djQA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b8e72030-9676-49b2-a079-e0313cd520af,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:699784eb-3b42-43ec-801b-62c7b12ba70e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:5,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a7f93d21dfa11f1a6de359d7043e138-20260312
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1165137680; Thu, 12 Mar 2026 02:58:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 17:58:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 17:58:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 2/6] wifi: mt76: mt7996: support critical packet mode for MT7990 chipsets
Date: Thu, 12 Mar 2026 17:57:20 +0800
Message-ID: <20260312095724.2117448-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260312095724.2117448-1-shayne.chen@mediatek.com>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_031356_126031_04494832 
X-CRM114-Status: GOOD (  10.67  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

For MT7990 chipsets, critical packet mode must be enabled. Without this,
some higher priority packets may be placed in the wrong AC queue.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e1e51c9a0767..d286dedddd9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -56,7 +56,7 @@ static int mt7996_start(struct ieee80211_hw *hw)
 
 	mutex_lock(&dev->mt76.mutex);
 	ret = mt7996_mcu_set_hdr_trans(dev, true);
-	if (!ret && is_mt7992(&dev->mt76)) {
+	if (!ret && !is_mt7996(&dev->mt76)) {
 		u8 queue = mt76_connac_lmac_mapping(IEEE80211_AC_VI);
 
 		ret = mt7996_mcu_cp_support(dev, queue);
-- 
2.51.0


