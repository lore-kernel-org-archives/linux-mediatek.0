Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DB1C46CCD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcIFo+aNsT1Q+vI57pGRLbrLSQ3ZffHYOwRJxMZ6moI=; b=ZoRP0OuNTAPlTBXtnX2UO3/GEn
	O0OmPDY9KklBMd8Swyg10BRh9dBn5wf3spYlUkkJ+THmgxz3EZo0UVwVnVP76EJBI4/gSBkcv7IY0
	gTwThq1fQGf9FXE9H14HweH6PRAP2VJLMcYhS7xeOZ6WqdEwHGeYHe8SN3JbHjv/80DWiHaCUdEb9
	pb9D7wTc7Ml56eI7xZ4zEVC0ojRlGSA38MBZQJUOyI2w0ly/zQToun/rDKKrzreX7n3pPswzEIb/G
	qi48l+dXKkONZSoZXyF+HBFA/4VYrAS5b7kp7nPYPeyxw36ANMFkrRMbtqPWfw43xnNVgv6CGScyk
	ddR9XjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsm3-00GiyS-0j;
	Wed, 20 Dec 2023 09:21:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsm0-00Giwh-0x
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 09:21:54 +0000
X-UUID: 3278300e9f1911ee9b09ad09c76753c8-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FcIFo+aNsT1Q+vI57pGRLbrLSQ3ZffHYOwRJxMZ6moI=;
	b=qLceEiSGv93L/AoEjNcgWjpcGQZ0CguyvBMiQUvavI6XlpSkUxXhf6OHT5/pb4TKEfVsx3rCkJaRAi8icw2GZajOh6l0qufXoU30d9IUm/QDjNLiHwVt+8W1T/Sab5BdLT8zABSpYpayQVGRofRMNgulI2XclVX4Ih3+vX12svI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:9f1b078e-12a1-4b9c-b3b0-aad92a3eadaa,IP:0,U
	RL:0,TC:0,Content:100,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:70
X-CID-META: VersionHash:5d391d7,CLOUDID:71514b2e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:2,IP:ni
	l,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3278300e9f1911ee9b09ad09c76753c8-20231220
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1020975090; Wed, 20 Dec 2023 02:21:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 17:21:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 17:21:44 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH 2/4] wifi: mt76: mt7921: fix potential command timeout issues when suspend
Date: Wed, 20 Dec 2023 17:21:36 +0800
Message-ID: <20231220092138.12830-3-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220092138.12830-1-mingyen.hsieh@mediatek.com>
References: <20231220092138.12830-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_012152_336377_8AD079B8 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

An ongoing command may be interrupted if suspended, leading to a
command timeout. Add a lock to the suspend function in order to
protect the ongoing command from being interrupted.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 57903c6e4f11..e1c53f18abdc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -409,7 +409,9 @@ static int mt7921_pci_suspend(struct device *device)
 	if (err < 0)
 		goto restore_suspend;
 
+	mt792x_mutex_acquire(dev);
 	err = mt76_connac_mcu_set_hif_suspend(mdev, true);
+	mt792x_mutex_release(dev);
 	if (err)
 		goto restore_suspend;
 
-- 
2.18.0


