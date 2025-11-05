Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFCDCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIpLSysPm7kVFkPKaLEgh58So/Wz0cCH+wJpZ7kNnmg=; b=fpai6XgorrA9ccFVVECLQGgYDd
	o9H95hakgogKkVPtNlUlBD5CTUWRtuqs+eZ7/+HCpRtXc7Cc+1HePDNBveMLtWZK3vOWVN3tZXvIk
	WxFKLniU545rDMGSLVEfb9dKaAiX7KHJIDdzhZRRJRNT4Bd04oHNcrJXbSMSs0UyQIWGeC9TMb6w9
	5Ft3G5+iXV/HSXKEYDTOVZyvvPDGzby3arJqY2Yy7aK7KHdofImJKr5QPY/a6jRUWdRMAVzRRTSZP
	ZyYzAEcQHj1a9L78HqE9gAFHGuY/a/w6vnMBgQjddP/ZmXX8k6OhyVsEWJK1kWB8XM30UYDTS3jX+
	4dN8YmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZrh-0000000DO05-1FLD;
	Wed, 05 Nov 2025 09:31:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZre-0000000DNwD-1Mts
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 09:31:39 +0000
X-UUID: 3735e112ba2a11f09f706fa2197c6ceb-20251105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nIpLSysPm7kVFkPKaLEgh58So/Wz0cCH+wJpZ7kNnmg=;
	b=Z8KFrIy8Toj7lq24Vilkc0dDuNKHHpVDMP6yZNocK9vWpTve3g7os0wIrGJhn5HfS+OWSzonhoC0S9GITA0zSMQnk7lhCpmnW261t9mQJaVQH4Qu2/GFmTcWGgjWp28HPsLOqFlSZeCNZJ1M8Mn4+1HgLLlXdHv8IguwtBVoTLE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d63c8736-4881-4577-be28-d0e077e9dae6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c3baef7c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3735e112ba2a11f09f706fa2197c6ceb-20251105
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 336095466; Wed, 05 Nov 2025 02:31:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 5 Nov 2025 17:31:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 5 Nov 2025 17:31:29 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 06/12] wifi: mt76: mt7996: fix teardown command for an MLD peer
Date: Wed, 5 Nov 2025 17:30:54 +0800
Message-ID: <20251105093100.541408-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251105093100.541408-1-shayne.chen@mediatek.com>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_013138_365417_AF5F89AA 
X-CRM114-Status: GOOD (  10.64  )
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

For an MLD peer, we only need to call the teardown command when removing
the last link, and there's no need to call mt7996_mcu_add_sta() for the
earlier links.

Fixes: c1d6dd5d03eb ("wifi: mt76: mt7996: Add mt7996_mcu_teardown_mld_sta rouine")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 5e0b57657e7e..685be98b9f27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1206,13 +1206,13 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 				mt7996_mac_twt_teardown_flow(dev, link,
 							     msta_link, i);
 
-			if (sta->mlo && links == BIT(link_id)) /* last link */
-				mt7996_mcu_teardown_mld_sta(dev, link,
-							    msta_link);
-			else
+			if (!sta->mlo)
 				mt7996_mcu_add_sta(dev, link_conf, link_sta,
 						   link, msta_link,
 						   CONN_STATE_DISCONNECT, false);
+			else if (sta->mlo && links == BIT(link_id)) /* last link */
+				mt7996_mcu_teardown_mld_sta(dev, link,
+							    msta_link);
 			msta_link->wcid.sta_disabled = 1;
 			msta_link->wcid.sta = 0;
 			links = links & ~BIT(link_id);
-- 
2.51.0


