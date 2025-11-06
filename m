Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B8CCCFA1C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 06:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjG618AC5RuUUMH1xw5WhNLNjUuoak05tG78zrHzJtY=; b=1nzQMQdmKCwTcls4aRSI7Ps9oU
	fso3uvBb38s0srStDx8htzzA9E1cVLwVp3MyPEd83y71UJWhpp6i69DjcfbOarSd6WY6zfRBwtmyf
	y9zchbEk4AauwVjy4Q1i5Pn09ZdTRfdDNkdXXA+5H5Qe9GcYY4KvxrScrj1V6beRR6Kv8XxfD2DIu
	8PMVJeXU1AwotHVue/P/dyD2DT2JRu6kD3K537XFvXgVbfgxI77ToS4uY9Ir7Zx6sa6kjQQpxTvLF
	9+2oHEb13meT1mfPwKLAv0ly/gKa2xyZh6d0Y4P/2SqlcOlzWmHuznNPbNgi5pIIGomGEr4HvecPp
	DSMp7J/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtiE-0000000ExZE-004c;
	Thu, 06 Nov 2025 06:43:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGti9-0000000ExU2-3XM8
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 06:43:12 +0000
X-UUID: d7daa9a2badb11f09f706fa2197c6ceb-20251105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IjG618AC5RuUUMH1xw5WhNLNjUuoak05tG78zrHzJtY=;
	b=p6Kc9Sj9DjBSpk610dww0NhwolAYkqRYuSPVaT2p80Sb47k8vi0BtrK0CTHReqHwhwhlzlDsyLU8l5ExCGdDEI6Ic0G6RwI1lDUgRDellFxJwxNGWQ5yru7LzkTOlRLfxuRDebU6yzQ/1l3Y9AJwJZx6ykHKx2E5Htdiqy9AIL8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ba269623-6c84-474c-928a-3feaf5b26ff5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:94fdfa18-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7daa9a2badb11f09f706fa2197c6ceb-20251105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 93392597; Wed, 05 Nov 2025 23:43:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 14:43:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 14:43:00 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 07/12] wifi: mt76: mt7996: set link_valid field when initializing wcid
Date: Thu, 6 Nov 2025 14:41:58 +0800
Message-ID: <20251106064203.1000505-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106064203.1000505-1-shayne.chen@mediatek.com>
References: <20251106064203.1000505-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_224309_881350_867E506F 
X-CRM114-Status: UNSURE (   7.89  )
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

This ensures the upper layer uses the correct link ID during packet
processing.

Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 685be98b9f27..c26f8f49ce44 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -343,6 +343,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	INIT_LIST_HEAD(&msta_link->rc_list);
 	msta_link->wcid.idx = idx;
 	msta_link->wcid.link_id = link_conf->link_id;
+	msta_link->wcid.link_valid = ieee80211_vif_is_mld(vif);
 	msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&msta_link->wcid, band_idx);
 
@@ -984,6 +985,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 	msta_link->wcid.sta = 1;
 	msta_link->wcid.idx = idx;
 	msta_link->wcid.link_id = link_id;
+	msta_link->wcid.link_valid = !!sta->valid_links;
 	msta_link->wcid.def_wcid = &msta->deflink.wcid;
 
 	ewma_avg_signal_init(&msta_link->avg_ack_signal);
-- 
2.51.0


