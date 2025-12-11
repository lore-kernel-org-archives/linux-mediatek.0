Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F26D41C2F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=14DMg1kOjoT2+p+GSeAQfJCaf8eSkoQFbW5DEdKFmfs=; b=YZOiJZeboGvfOSTPSdZvp3CIHB
	kctZoLnxYLnOfrfTbKMtlmSW4L1ZxGEBZ7n11p8AmlWeokfCTuLtNEk0vUsPlNyh+B0sPsYp43KAV
	cj1uxgnshqLzngQfxWmNQUJNCmhfWj7DgXJfHReFTZgnKinjOIZLuZTDQnUc7jS4DksJyXVFLlLqc
	QyY0ASS30EnmgTDPpEXrgQ4YMBK3jcb6vKR7pyBTtKI09awKC9WKANT5ZJtSoGXpRCMPrE9rsG1mV
	XjwzBsBx5mBX3/A+SDEGiDnb3stIEke5cPquwBDShGD6nUjGM7WacvGrPh0EgPySPhWKMNNIM9xPu
	mCNLcpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTg01-0000000GbJI-2avO;
	Thu, 11 Dec 2025 12:42:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTfzz-0000000GbIq-0r7R
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 12:42:24 +0000
X-UUID: d369cc9ed68e11f09f706fa2197c6ceb-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=14DMg1kOjoT2+p+GSeAQfJCaf8eSkoQFbW5DEdKFmfs=;
	b=kNoHsIH9ayGfulCP8s1EldUcm+6QqLmcAurdAWeWDT0J8HoT1hZTkNW4d8Ssp0Oam45IBUGFJ+froL78TgU72qIlQA3J6BOetjdQGhHo3DI1s9pfmztxyP63Zbjc02cCE0Be5x5nZotmj8BHzru8320aFiFGyuCgOidJ6UeS/10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:34e0bfe1-06d3-4fc9-b5d6-cac059542cbc,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:26f954c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d369cc9ed68e11f09f706fa2197c6ceb-20251211
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <leon.yen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1163422756; Thu, 11 Dec 2025 05:42:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 11 Dec 2025 20:42:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 11 Dec 2025 20:42:14 +0800
From: Leon Yen <leon.yen@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<mingyen.hsieh@mediatek.com>, <michael.lo@mediatek.com>,
	<allan.wang@mediatek.com>, <quan.zhou@mediatek.com>,
	<sarick.jiang@mediatek.com>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <leon.yen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: Fix incorrect MLO mode in firmware control
Date: Thu, 11 Dec 2025 20:38:36 +0800
Message-ID: <20251211123836.4169436-1-leon.yen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_044223_260779_80F6D3E5 
X-CRM114-Status: UNSURE (   9.41  )
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

The selection of MLO mode should depend on the capabilities of the STA
rather than those of the peer AP to avoid compatibility issues with
certain APs, such as Xiaomi BE5000 WiFi7 router.

Fixes: 69acd6d910b0c ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cf0fdea45cf7..279ace8ab883 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1330,6 +1330,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 			.roc[1].len = cpu_to_le16(sizeof(struct roc_acquire_tlv))
 	};
 
+	struct wiphy *wiphy = mvif->phy->mt76->hw->wiphy;
+
 	if (!mconf || hweight16(vif->valid_links) < 2 ||
 	    hweight16(sel_links) != 2)
 		return -EPERM;
@@ -1352,7 +1354,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 		is_AG_band |= links[i].chan->band == NL80211_BAND_2GHZ;
 	}
 
-	if (vif->cfg.eml_cap & IEEE80211_EML_CAP_EMLSR_SUPP)
+	if (!(wiphy->iftype_ext_capab[0].mld_capa_and_ops &
+		IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS))
 		type = is_AG_band ? MT7925_ROC_REQ_MLSR_AG :
 				    MT7925_ROC_REQ_MLSR_AA;
 	else
-- 
2.45.2


