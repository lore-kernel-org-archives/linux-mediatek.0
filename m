Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D38606A32D
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qvGj3O4p;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rjdavGw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cAaY/L0jicDyYPc/8PaLpndAdaujM+s27PpGmxriTQs=; b=qvGj3O4pB2P1mkqk+oyxOpwsgn
	lg2MSsp4km4MhptDlL70YxcKWHaEjN076Y00A5APmxEWqne33ORYmEreIHgajjvYhdPT61dOi9OPF
	5iYll0x9GEdmyp7EFP52oIe9DQKo7lAjJ1+fQrCMDF9H880rr9ahGTb1gilbT5sMr83AKkr3XG1jc
	mYvuC7pS1k6uWFszDvTVr80Q71WhwAkk66dF2bRLFUBLLQLdBZlxUDGoJG41nVjzb1mrPJsmzWVHV
	m8nBQbJLBaVkqZ6/DuzzLiDPpt7jmSBcOpgNCIC0v0L7uzY2jG3IDtYXYYaScqNWLr0jbVoXZcpYr
	Mq9BJeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUlY-0000000CNUT-2k4a;
	Thu, 26 Nov 2026 08:23:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUlT-0000000CNRk-29Mf
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 08:23:38 +0000
X-UUID: a9c77984e97211f1a170bf5142e12a73-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cAaY/L0jicDyYPc/8PaLpndAdaujM+s27PpGmxriTQs=;
	b=rjdavGw73GSoSUXqvghmlOgJF9mhsvPiMuSotGqdn5yJJx+82BvFlV3+fTrRIgDpL4bvoF5xXruxCakJYGbgQxfmSIyWMrsZnTVDxVjk3dJHIo15YRj5fnFocDyghNkc+tdrsFhht/UiUkWmrKAxrrw6KdOq9oyQgLbwmh3T1Fg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:0743731a-a997-49a1-9512-f322d180a719,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:9186161a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a9c77984e97211f1a170bf5142e12a73-20261126
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1634257627; Thu, 26 Nov 2026 01:23:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 16:23:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 16:23:28 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.lai@mediatek.com>, Anthony Liu <anthony.liu@mediatek.com>
Subject: [PATCH v1] wifi: mt76: fix possible NULL access in mt76_tx
Date: Thu, 26 Nov 2026 16:22:28 +0800
Message-ID: <20261126082228.3226934-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002335_568823_4CEFEF3F 
X-CRM114-Status: GOOD (  10.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add WARN_ON(!wcid) early return and drop redundant wcid NULL check

Co-developed-by: Anthony Liu <anthony.liu@mediatek.com>
Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index d8036466f495..2be43d05c9af 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -377,7 +377,7 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
 	struct mt76_dev *dev = phy->dev;
 	struct sk_buff_head *head;
 
-	if (mt76_testmode_enabled(phy)) {
+	if (WARN_ON(!wcid) || mt76_testmode_enabled(phy)) {
 		ieee80211_free_txskb(phy->hw, skb);
 		return;
 	}
@@ -385,7 +385,7 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
 	if (WARN_ON(skb_get_queue_mapping(skb) >= MT_TXQ_PSD))
 		skb_set_queue_mapping(skb, MT_TXQ_BE);
 
-	if (wcid && !(wcid->tx_info & MT_WCID_TX_INFO_SET))
+	if (!(wcid->tx_info & MT_WCID_TX_INFO_SET))
 		ieee80211_get_tx_rates(info->control.vif, sta, skb,
 				       info->control.rates, 1);
 
-- 
2.45.2


