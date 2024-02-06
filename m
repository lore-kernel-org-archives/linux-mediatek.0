Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45CCC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aadV3qycQ2zIemzQfNQNbq63rNVJaRGiMpsq3ArPnzY=; b=oLiEploYM9aWKcmDHTVCiv2qdb
	8hxJk3bdxs/GC6XikKSI+QGJ7iCs0buSuT0rImp4nzEmxcDD2Cof2ree0+S05CNm0RoZBVxXHqTO7
	S3HMQzKnz8x23/BjGMD7EBM+CTDO5uTN7wVqhU1QpjIJ4kPpmBDiO45ww40Tm/xUKO722EoU2obvI
	ryWC+miAKt8n0PTsfY2f7p3wy/Sffwpegb42TL3Q6QwRQiEo3H0LDg6aHlhY8hVWBG2FbTMoHORge
	HQ7SAcYJkYm5bXlKB4zSDIjMQ9w5NCMnuAG/QSZ4zuePnmtmHodG887hU5XV9He+oPNqnVqZi9xeX
	6D9WMWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIUP-00000006xq7-0ptY;
	Tue, 06 Feb 2024 10:15:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHSW-00000006cfW-2CdB
	for linux-mediatek@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aadV3qycQ2zIemzQfNQNbq63rNVJaRGiMpsq3ArPnzY=; b=om8821QM198auptMTt+MMNq75q
	nvSCbPcXO4zFxoIoh+Qwu+J/rGrUWzgsEahw00GjUKJeBa9FqCWkr31Q5tFVf4nHMg2epYyKRgmAw
	G9a7miJBnzZENbM/0VXlU0t4UK1ikL/aARJnc4vCh0ghoHrfcD78RSsfl/PxdF6iebgsciU/dwP5l
	zQlc4vFhIwr9L/SkIfjoHIUxvGyzzh09WLujVMRG+LhTCOR+volUKw83dGWta8zjD5PxObSXcXbfQ
	EPgQSb6zZ5lsaROu+helQKjq10fXe8PE7PCh48nrKP9fteaKeREKFcjYqwUB2oopOlzLNsPA5d/oR
	uBTvuzCQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHSR-0000000CQCB-2w5T
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 09:09:39 +0000
X-UUID: 4c232cbec4cd11ee9a263b4415211400-20240206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aadV3qycQ2zIemzQfNQNbq63rNVJaRGiMpsq3ArPnzY=;
	b=EL6lZ8AIZbOxu9SFXiLH9mZc7XFmfGS/44MEewhrzrXQbYQGirMhbs8zpu3BzZOxk5Zg+vMTu5PICH5UZfmmVISbM/FvBgysfEiCeRX+JODOVBuQioA9LGpd2i63jXvp40qd7KFoulBZm+D+fU7l7BUpNRpUJfuCnqpz3xmdv8Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4fb70319-5206-4e9f-9cd4-fc4039a393d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:521f92fe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4c232cbec4cd11ee9a263b4415211400-20240206
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 199247197; Tue, 06 Feb 2024 01:54:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 6 Feb 2024 16:53:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 6 Feb 2024 16:53:35 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>, "Ming
 Yen Hsieh" <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix a potential association failure upon resuming
Date: Tue, 6 Feb 2024 16:53:04 +0800
Message-ID: <20240206085304.13059-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.982900-8.000000
X-TMASE-MatchedRID: JTtOfOXMBZ/hsdkaHFW0p5D6BbDN9+jO5E5u1OdPWsRiZCTkFQiKcHB4
	4IkzjfYyThbvLLI8RvN+8BOKv4EeDPG1o2o1y09iW7gz/Gbgpl5dymZBcuGGRKvM+zzl/BSTJHP
	cG8qtn93ol7bd/DKRXL4tP830vR4ABtky+F8qrL0VglQa/gMvfH0tCKdnhB589yM15V5aWpj6C0
	ePs7A07SAJgyd9wrc87TzujMRsp7oIWCvobE4tX/M6vSWGp6OTvfbxEwoNo5smCUe0i7/IXA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.982900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0D3FCD2444564D59DAA1D7B81B1BA67D7B4580E4B6B24CD06A078B5F384CC38F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_090937_068181_1C18CD2B 
X-CRM114-Status: UNSURE (   8.52  )
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

From: Leon Yen <leon.yen@mediatek.com>

In multi-channel scenarios, the granted channel must be aborted before
suspending. Otherwise, the firmware will be put into a wrong state,
resulting in an association failure after resuming.
With this patch, the granted channel will be aborted before suspending
if necessary.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c    |  2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c   |  2 ++
 4 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 0645417e0582..e56eed010b47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -325,6 +325,19 @@ static void mt7921_roc_iter(void *priv, u8 *mac,
 	mt7921_mcu_abort_roc(phy, mvif, phy->roc_token_id);
 }
 
+void mt7921_roc_abort_sync(struct mt792x_dev *dev)
+{
+	struct mt792x_phy *phy = &dev->phy;
+
+	del_timer_sync(&phy->roc_timer);
+	cancel_work_sync(&phy->roc_work);
+	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+		ieee80211_iterate_active_interfaces(mt76_hw(dev),
+						    IEEE80211_IFACE_ITER_RESUME_ALL,
+						    mt7921_roc_iter, (void *)phy);
+}
+EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
+
 void mt7921_roc_work(struct work_struct *work)
 {
 	struct mt792x_phy *phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 1cb21133992b..3016636d18c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -322,4 +322,5 @@ int mt7921_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 		       enum mt7921_roc_req type, u8 token_id);
 int mt7921_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 			 u8 token_id);
+void mt7921_roc_abort_sync(struct mt792x_dev *dev);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index fabd24726f3e..2c2602d7b910 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -406,6 +406,8 @@ static int mt7921_pci_suspend(struct device *device)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
+	mt7921_roc_abort_sync(dev);
+
 	err = mt792x_mcu_drv_pmctrl(dev);
 	if (err < 0)
 		goto restore_suspend;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 7591e54d2897..4b8d4c19a3e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -216,6 +216,8 @@ static int mt7921s_suspend(struct device *__dev)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
+	mt7921_roc_abort_sync(dev);
+
 	err = mt792x_mcu_drv_pmctrl(dev);
 	if (err < 0)
 		goto restore_suspend;
-- 
2.18.0


