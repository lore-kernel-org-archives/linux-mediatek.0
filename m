Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682E4E87846
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRY8mAbFNGM0afVcuy6wNyGauxb2U3kibDu+fFKkTfE=; b=whUmM1OzZyZgNjiFIKJCttGl9M
	b/P3gMvLU5y+/+8LXFfr+sQCnaB5eW9elR6ypq713nQUNpKc3WuAOS4J9A7V40A3TKD3QExXeaffv
	sj/vn26BCbWgrk1643mz1QNIGyG+kjLu1lTgWl2iDtjUvdtFSVBIkrKXOved5OOMgUMMyigA96DJO
	Vv1A9gRIOBrhvnx/T+UrPpidQpMQxHX2vFRBDUJEDE7Mtr/o/eefXSHH0VIuMqfVe6So8m36sZIjk
	9LFrw/4fVAFyl3Xg9pMoZJzbBenzxlSlbKpRoPrBNmnDbmhcEa/guaVu5ipRt+9JmiG1U6ij5BO26
	QixkXnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIkw-00000006sJC-3fj4;
	Tue, 03 Feb 2026 15:55:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIkt-00000006sH3-2NtF
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 15:55:56 +0000
X-UUID: cf19f45c011811f1a16f0188aa809bee-20260203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PRY8mAbFNGM0afVcuy6wNyGauxb2U3kibDu+fFKkTfE=;
	b=BWs674YdNmk5aRPX72RzDFq4mgCU26CZO5PbfVElVmYGNR7j4f22obNqPviL40+P3h3bhVhq2d+Y74Azs37yaaohQOu3AeZmAv/APpotARRky51dAPwT3aB+eLgS2yS0qqJinPrQDoAABU1ze/ot1U7GhFYJCLT+YpBDa4KAy4A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:4b113e91-528a-4fda-ba4d-3001279417c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:07478b7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cf19f45c011811f1a16f0188aa809bee-20260203
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1047683311; Tue, 03 Feb 2026 08:55:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 23:55:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 23:55:46 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 4/4] wifi: mt76: mt7996: fix queue pause after scan due to wrong channel switch reason
Date: Tue, 3 Feb 2026 23:55:32 +0800
Message-ID: <20260203155532.1098290-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260203155532.1098290-1-shayne.chen@mediatek.com>
References: <20260203155532.1098290-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_075555_639470_166D4BE1 
X-CRM114-Status: GOOD (  11.72  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Previously, we used the IEEE80211_CONF_IDLE flag to avoid setting the
parking channel with the CH_SWITCH_NORMAL reason, which could trigger TX
emission before bootup CAC.

However, we found that this flag can be set after triggering scanning on a
connected station interface, and the reason CH_SWITCH_SCAN_BYPASS_DPD will
be used when switching back to the operating channel, which makes the
firmware failed to resume paused AC queues.

Seems that we should avoid relying on this flag after switching to single
multi-radio architecture. Instead, use the existence of chanctx as the
condition.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2:
  - change to use the existence of chanctx as the condition
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 68d698033e43..9ccf9f97c984 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3924,8 +3924,7 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 
 	if (phy->mt76->hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
-	else if (phy->mt76->offchannel ||
-		 phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
+	else if (phy->mt76->offchannel || !phy->mt76->chanctx)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
 					  NL80211_IFTYPE_AP))
-- 
2.51.0


