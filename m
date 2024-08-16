Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FABC531DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAqw9ka0nn0S859j6xPD1mbCrC9FnM9RnqTZHXq9OMA=; b=O2qGXSCokl+snl6mLFaWX3qXia
	yGnm432aYG6olYFOeZY0hNXyNeNNuURMa3Yj/1nRgoLAO8cuRkblHjxltKBG2P+kh3hLD3JaqIkxt
	Oc/mP2y1kNLv/36RcEyZ2Bd6Vkr0moW2JAUbxxRni3gkwNi9mfRHxQlbUN/OGgsRTY5K+F3hApnIp
	/iJNoURjeoz6DLlz0tVhezIx8Hg8792lZnr0rRKNZhE+kQVr770NhcUy+eMeHzihbYjFPNkT2b6QP
	tr4qYK/la9778O8b7FCrDQAXzkQiLHjVCoW0+GATP/4KFt+hGkZ8tbZBEr6KArD7ElA5nBQr+VrjD
	Lp6fKrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setdu-0000000CV5u-3sec;
	Fri, 16 Aug 2024 09:53:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setbG-0000000CUNY-3pUb
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 09:50:28 +0000
X-UUID: f58cf0365bb411efba0aef63c0775dbf-20240816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lAqw9ka0nn0S859j6xPD1mbCrC9FnM9RnqTZHXq9OMA=;
	b=alaWVQsPBGOQSHI4mERnIwSRiLV7pmj77t0PBIv8ME7Imkj+AkdzUc7FXXrZiUXHDoQR2bdqv8+tlPGZBVR4GYg1eYUucqYR20lGanPP8DaBF5NjetNrDMzH/CbQRpQZpq2woiTg9RXDYS15O98IV1EbluY7YpILFCenEGtXqok=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:328c7dbe-077a-489d-b908-d12b0969607b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:c260b1fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f58cf0365bb411efba0aef63c0775dbf-20240816
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1512834150; Fri, 16 Aug 2024 02:50:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Aug 2024 17:49:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Aug 2024 17:49:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 02/12] wifi: mt76: mt7996: fix traffic delay when switching back to working channel
Date: Fri, 16 Aug 2024 17:46:26 +0800
Message-ID: <20240816094635.2391-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240816094635.2391-1-shayne.chen@mediatek.com>
References: <20240816094635.2391-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-3.692600-8.000000
X-TMASE-MatchedRID: eim6YYjnci0VAKRaMHqjDkf49ONH0RaSzSnbR3NwN1x+YFLISofIH9x+
	57h9IgNOg9nZBGeTizrSB/GPHxZWljEV1fJb8/5dbc297PAGtWYO2nfS7LtDc+WADIjXHIobKT3
	PsaLyojRvW4oU3XnAkBruuR1H7YPj9tiEgCVL0jh05zsoB1UKTn0tCKdnhB589yM15V5aWpj6C0
	ePs7A07QDtYjZXhssCCwQwd9u+WCA1aQxNd787cwJtzLNqef0oGXx8LLVfIc2urR6T5OLxsw5uA
	YA3tXk4AzCuQBzc7hvBPtF8G90o2ywJhKn2m7AVSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvr
	HlT8euIiT2wjObmjrMC+ksT6a9fy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-3.692600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 395AA2904F97960DC682A8E0FAB40F3B8E5CC53415AF45723FE01D3B5E872BE42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025027_318212_F5B9B6B6 
X-CRM114-Status: UNSURE (   9.00  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

During scanning, UNI_CHANNEL_RX_PATH tag is necessary for the firmware to
properly stop and resume MAC TX queue. Without this tag, HW needs more time
to resume traffic when switching back to working channel.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index bce082038219..f3f78e11a65f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -307,6 +307,10 @@ int mt7996_set_channel(struct mt7996_phy *phy)
 	if (ret)
 		goto out;
 
+	ret = mt7996_mcu_set_chan_info(phy, UNI_CHANNEL_RX_PATH);
+	if (ret)
+		goto out;
+
 	ret = mt7996_dfs_init_radar_detector(phy);
 	mt7996_mac_cca_stats_reset(phy);
 
-- 
2.39.2


