Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E0CA9EC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2026 03:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j+X2bbuAWMu4UtRzKtDwm0weo+RhlVdQme8SbcEpY1s=; b=kXitXoMUDOgk1WsPE0J2dCxZm9
	qFmiq29m1jDYnUnWlX9sE+wODJ51LsoIiRzTzYIxx7o6Cmv0HQFvYshI87eLPVp1OfgsYNbLa9/pO
	qWRunYZpjRPpmK2v4sWsPuURhWwF6u3Ej31vvixWGVNRIArSOBlo894PUPvfZBsllcoF/QXt4dytc
	AnBHUqo1M/uk+s1qtCIwMGfLg3CH1B0DG0rmLVhzWU7LMnzC8kxEt6kvopxmTgJzmQB1kvHRrDbIj
	c3wqaJbl55aNrnSYDggR5C9C4hkhoNFqexNDtk1+YmUoeCyK/Tsq8ZYfu9Dxh+uRn40I379CeRg+1
	WUAr8Ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG6gv-00000009bxZ-1iLE;
	Mon, 12 Oct 2026 03:27:09 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG6gt-00000009bx0-1UfV
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Oct 2026 03:27:08 +0000
X-UUID: c9bc0902c5ec11f1afed4741b24580c9-20261011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=j+X2bbuAWMu4UtRzKtDwm0weo+RhlVdQme8SbcEpY1s=;
	b=GHN1hE4eUr829EsJXKTJwDQ6oDJHlfhZyJ0Yh+4lqxvY0/S1taNo4FSGd5AonMYj1mNMCEGCfDrp6Hw/t/k/t9fjCuL3uZ2iv1I67PqM5uq7eRQLqfbtTZw7BfywhfYCQSkRwbjVekfEIwX0daZNrch6JFcMCGah0E8dlt6AGRo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:ab05792f-43b4-4e8c-96f4-39b81b4f3bc7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:fee51a63-31b9-4e78-8da7-ad53bd779c56,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9bc0902c5ec11f1afed4741b24580c9-20261011
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 790853191; Sun, 11 Oct 2026 20:27:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Oct 2026 11:26:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 12 Oct 2026 11:26:58 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <jeff.hsu@mediatek.com>,
	<eason.lai@mediatek.com>, Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH] SER: mt7925: race condition in mt7925e_mac_reset allows compromised WiFi firmware to trigger host sk_buff use-after-free
Date: Mon, 12 Oct 2026 11:26:57 +0800
Message-ID: <20261012032657.58631-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_202707_409253_B03A6C47 
X-CRM114-Status: UNSURE (   7.69  )
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

From: Jeff Hsu <Jeff.Hsu@mediatek.com>

Fix racing condition in reset handler result sk_buff use-after-free

Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index c3db814b2788..555eeb74d023 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -73,9 +73,11 @@ void mt7925_tx_token_put(struct mt792x_dev *dev)
 int mt7925e_mac_reset(struct mt792x_dev *dev)
 {
 	const struct mt792x_irq_map *irq_map = dev->irq_map;
+	struct mt76_phy *mphy = &dev->mt76.phy;
 	int i, err;
 
-	mt792xe_mcu_drv_pmctrl(dev);
+	__mt792xe_mcu_drv_pmctrl(dev);
+	clear_bit(MT76_STATE_PM, &mphy->state);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
-- 
2.45.2


