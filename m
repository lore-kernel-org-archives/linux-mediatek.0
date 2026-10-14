Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B0DCC6B1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 02:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsWq3B7X6MwHQZxXhBaU76isq8mGeDvZAcrXA73QRjg=; b=stJsM5XYPbNRzEozWDpTaRKy90
	G/yaYk50o4g9J3Vq1j5MMcV7dqlGbCnEUwdecdpC9uqO3IfJ6uZpfyPxNAb71cqtkF//QAb/PcxDV
	rL2DTTqT3WB2on2cY123iXKXyLUJVYSvL3HSYjRAnMgHiv7ds7u5on4WkNrfRQVN6URrvivqkCZrH
	JsNt+iGOHhG93FbU01QRF/l1IxWqCBCCzreDWwKRpDzYF2kM511F6fyag12vNNoMYYEuH5TlPl/QI
	OL8rkX73th2AtP7Ct81WQ9JhCd8yg+Bv51RHRQsWVcBzzEA4JENWBlGJXSCM0icUD0qrFMyG0cl1d
	hxpvLU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoJW-0000000ELVE-2DNu;
	Wed, 14 Oct 2026 02:01:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoJR-0000000ELUn-1lFi
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 02:01:53 +0000
X-UUID: 2ed24590c77311f1acbe4559397dec65-20261013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xsWq3B7X6MwHQZxXhBaU76isq8mGeDvZAcrXA73QRjg=;
	b=F4TqMNepmy7tE8EGYNcvLm+G7n2PbDPX25+LCsfPXMwUj4t19pVgZ4jMW1dZIEiyFAC0jxCVeqViACrzQmp9vtvbEH/Kqz4rKtX1ECsE0H5N/BbK3iJb0ghvulJCAc61l0UNvSiDkb/isOJaN7K86sbcKjxdgajbIN8Is8LqKS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:bc7cc02d-98eb-42a1-9837-f1a15bf89f0d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:29a14eef-fea3-4d35-93bd-64582bb655a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2ed24590c77311f1acbe4559397dec65-20261013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 803921978; Tue, 13 Oct 2026 19:01:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Oct 2026 10:01:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 14 Oct 2026 10:01:32 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <jeff.hsu@mediatek.com>,
	<eason.lai@mediatek.com>, Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7925: race condition in mt7925e_mac_reset allows compromised WiFi firmware to trigger host sk_buff use-after-free
Date: Wed, 14 Oct 2026 10:01:26 +0800
Message-ID: <20261014020126.1479508-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261012032657.58631-1-eason.lai@mediatek.com>
References: <20261012032657.58631-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_190149_473430_6F26388C 
X-CRM114-Status: GOOD (  11.23  )
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
v2: Rebase the code, due to code conflict with previous change in d12a54be2604
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 18f125bf3df4..bc8f741e9426 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -71,12 +71,15 @@ void mt7925_tx_token_put(struct mt792x_dev *dev)
 int mt7925e_mac_reset(struct mt792x_dev *dev)
 {
 	const struct mt792x_irq_map *irq_map = dev->irq_map;
+	struct mt76_phy *mphy = &dev->mt76.phy;
 	int i, err;
 
-	err = mt792xe_mcu_drv_pmctrl(dev);
+	err = __mt792xe_mcu_drv_pmctrl(dev);
 	if (err)
 		return err;
 
+	clear_bit(MT76_STATE_PM, &mphy->state);
+
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
 	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
-- 
2.45.2


