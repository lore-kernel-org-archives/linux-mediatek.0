Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489E2C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1fzgT/hvdf1Qv1HcXNuSMlZM/1hnG6hd0UtQoC6aEs=; b=iCZImGfoZlx7eEzrC7sf+fGRPg
	NUUm5uullmW538moijnkTrVh2RukFd+aqnVbSiRubpc2o8aFMUv7DV2VgK0jYSzs2OrNWkSMiy/Nv
	dbCl+xuGQ8qiv+SstyhLF2ddstjhMTAmuYFo4X4lfCF/PCnIF+Sd6hSZXx80bijnC60ipgsQ+s7OS
	lQPBFqhCp90xzYAO9+pxaTSjpGfkzL4Yu6yO8hyGWo1uRgGO4YR2vq3/TKvuNM2hrpD4VqS2fxQQb
	C7VFnLHeC5zy99cu3tLm2cfyVZnBoCG1Ay+vQDKnAMyg0/kAg5H0d6eb+KjPfGtKFLpatwzKSykWU
	rm64k5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvn0-002rbI-VH; Mon, 09 Jan 2023 17:18:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvmv-002rZb-5g
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 17:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M1fzgT/hvdf1Qv1HcXNuSMlZM/1hnG6hd0UtQoC6aEs=; b=mdvYNIK+oHOwbBvOE4CgElG+IB
	W8YleJzWCMipbnpPAA8kFRWkv91x8PkVqYT3QMqOn0SvhM5NcCEsiK1c+dM1thqBQRfOUNHvt/5Wa
	Ef4WcIU5MiWCXf2ZCQoxy5wNSaPsAjAmbMaXFwlFP9/W5zM984NyhnrKNg5Rp3ie70m+nMGkrr9pW
	/C4rxaxW3DQjLui8Lg+ZdPy95EbxaSz8lCpmI7+3amkEppv+jDEUWwSMSPxGVWYqQFVPMhkMrs/kr
	+3tBu8zNQ+Rkkd7S3xZFuXIXleiPu4CVYwEW2peQl6xmbMgyKFyUgMPBbKZw4I09JhccymhQF/QRr
	eGW0v75w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvmh-002nAd-2K
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 17:18:11 +0000
X-UUID: f7354ca4a24b44638cf97674454611f6-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=M1fzgT/hvdf1Qv1HcXNuSMlZM/1hnG6hd0UtQoC6aEs=;
	b=qyDdl0BrLiI0aGbg+WAborIL0vDBTBEDhZ15dyZynP2FCAXl4pvKus4qzThAzPwWTZpgjorU2yWgA7wL81/pI0KJnS9KECJKMgqVE+QuMRr8yC1kvoeFic+VDdsvpLhYBjVoGSg4np2HgpQKqpwgfWRd7RW6l6XmQswVarfKIV0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f78c67a2-2e41-4738-a908-9ac95bb2ed11,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:db1a4bf5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: f7354ca4a24b44638cf97674454611f6-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1276271637; Mon, 09 Jan 2023 10:18:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:04 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 02/13] wifi: mt76: connac: add CMD_CBW_320MHZ
Date: Tue, 10 Jan 2023 00:57:20 +0800
Message-ID: <20230109165731.682-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_171808_451136_874CB2BB 
X-CRM114-Status: UNSURE (   9.59  )
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

Add CMD_CBW_320MHZ for setting bandwidth 320 MHz to firmware.
This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 8ba883b03e50..c3dabad5d40d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -42,6 +42,7 @@ enum {
 	CMD_CBW_10MHZ,
 	CMD_CBW_5MHZ,
 	CMD_CBW_8080MHZ,
+	CMD_CBW_320MHZ,
 
 	CMD_HE_MCS_BW80 = 0,
 	CMD_HE_MCS_BW160,
@@ -239,6 +240,7 @@ static inline u8 mt76_connac_chan_bw(struct cfg80211_chan_def *chandef)
 		[NL80211_CHAN_WIDTH_10] = CMD_CBW_10MHZ,
 		[NL80211_CHAN_WIDTH_20] = CMD_CBW_20MHZ,
 		[NL80211_CHAN_WIDTH_20_NOHT] = CMD_CBW_20MHZ,
+		[NL80211_CHAN_WIDTH_320] = CMD_CBW_320MHZ,
 	};
 
 	if (chandef->width >= ARRAY_SIZE(width_to_bw))
-- 
2.25.1


