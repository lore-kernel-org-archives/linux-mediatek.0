Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE37CCA462
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 06:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xFMag8xVDPiZFWvybg4JyD4iFYZjQt69JfgVeLcuZPo=; b=WQg/yPDwuJN6rdDzWds1lKPmLL
	uBQKNcXg3Ef7m7FyHIuJ0RyPWt2neFYb1Gpn98MQrLjgkzPpEgfX746SsWZUoPyOoKqoM5ifZwpf7
	NXBPEJRuH1OTqMYsOWujnkqbCbK/6lAhEshH344nkuqvWVU4sMwehQ7+2qsWJ7R/gvgVHvy+HPUru
	fQNogtOX149VvgJqgci/f0N+7GRxBHwDQAsipODNKEqR5hCk8DIbNFl8UGnWieI7ru4UIJ9Db8OSc
	x/9X/aZ9IYst3GbfQqJAxjSfLZbm5AgImniNEaBYtrs2cciGehwTzuy/WjXnDtlbonwsjuElTlSt+
	5BCRm8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbKd-00000002790-3COR;
	Fri, 16 Oct 2026 06:22:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbKZ-0000000278J-34m1
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Oct 2026 06:22:18 +0000
X-UUID: ea4d1a86c92911f1afed4741b24580c9-20261015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xFMag8xVDPiZFWvybg4JyD4iFYZjQt69JfgVeLcuZPo=;
	b=ohGd6icljzZ7b7KEX/sRbBaXG7JS6iu2ECYF1B5m1QMNYyGwWsSWgQfXuzp8TxJLTYiJga+lklEOtXA6nbD21GhO8ZVe+gYyvlVOmZjDjDY9mfy7ljIEZa4JUDgDBqYK8S6lYhv6sO3r4p9LntdQAxvhbun41JaQ0KKdRLDaIqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:9a78ba15-7e1d-4e07-8273-44d212b09c86,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:64426a95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ea4d1a86c92911f1afed4741b24580c9-20261015
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1396293567; Thu, 15 Oct 2026 23:22:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Oct 2026 14:22:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Oct 2026 14:22:06 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Yung-lun.Chien@mediatek.com>,
	<jb.tsai@mediatek.com>, allen.chien <yung-lun.chien@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: skip WoW START when unassociated
Date: Fri, 16 Oct 2026 14:22:03 +0800
Message-ID: <20261016062203.2452822-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_232215_787815_AF1B20F1 
X-CRM114-Status: UNSURE (   9.81  )
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

From: "allen.chien" <yung-lun.chien@mediatek.com>

Modify the suspend condition when not connected, to resolve the issue
of Wi-Fi failing to enter low power mode.

Signed-off-by: allen.chien <yung-lun.chien@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 26cdb3f0a98a..924b650fcb2b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -305,6 +305,15 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 	for (i = 0; i < wowlan->n_patterns; i++)
 		mt7925_mcu_set_wow_pattern(phy->dev, vif, i, suspend,
 					   &wowlan->patterns[i]);
+	/*
+	 * An unassociated STA has no link to sleep from or wake to, so
+	 * skip the WoW ctrl for it on both suspend and resume, unless a
+	 * Net Detect schedule is configured (ND needs WoW to keep
+	 * scanning while disconnected).
+	 */
+	if (vif->type == NL80211_IFTYPE_STATION &&
+	    !vif->cfg.assoc && !wowlan->nd_config)
+		return;
 	mt7925_connac_mcu_set_wow_ctrl(phy, vif, suspend, wowlan);
 }
 
-- 
2.45.2


