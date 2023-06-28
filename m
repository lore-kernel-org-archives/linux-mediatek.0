Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE9EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpJc5mprWGDVPDiVZ4pV46Kn+5Ei5LBjkcCQC2uFjSE=; b=RHEK6m6O/dtgDx5wJHUEn3msr1
	mAycjmvsTzjq3J9xeQA4wotnHzKIw5Ljd5OmYQYe6+VboIhEktkqJJpdYPsa7uw+kd7duLvoE3AmC
	MtE7wuFcwfxn+2mV1RszugaHXAXetxpN7pLdOaHo1/gtA7MrvJMjvnkt2ZjNtcQYbuN7/LXMuhJj/
	eDYSZYkH8benm64ES3zHIyIpv1omgm5ssoqpW7KOxpSiFPFkmXa347F65hB3y+d3IKi6gyRhpGdc3
	RRXos1NJU9rec5Lcw0zOzbLfeJRPFnLiw2YiA07z+5mdtkp3Lskcu57PP6GPWvh3Uc+UM0zHQ18ZV
	pH7kXT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPar-00F437-27;
	Wed, 28 Jun 2023 07:28:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPap-00F42a-0Z
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:28:00 +0000
X-UUID: 4a39df58158511ee83ed1395ce914268-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gpJc5mprWGDVPDiVZ4pV46Kn+5Ei5LBjkcCQC2uFjSE=;
	b=nhGyZgTKdeh2ATeW0fmMZlhRolPiRUG7qhr+TXeZOqu99lf0Gcj4hmuqsRYkdi07pGq2sKwclBC9uqfIPaGd1YdD+XdfhC2MV1kPXHcdJIuAWM2wrIGS5EbUKMUoQMtyvqjU0/aNtsV10CeCF8lCNSaFfdzzGYBVbRF2sS4U8xI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:da6ab486-f274-43ff-8301-40f615405e55,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:01c9525,CLOUDID:41ef4f0d-26a8-467f-b838-f99719a9c083,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4a39df58158511ee83ed1395ce914268-20230628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1954850011; Wed, 28 Jun 2023 00:27:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:07:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:07:14 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 07/16] wifi: mt76: mt7921: rename mt7921_hif_ops in mt792x_hif_ops
Date: Wed, 28 Jun 2023 15:05:53 +0800
Message-ID: <b404ccd5a7ab399d747cafebfdfce6227648e7cd.1687919628.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1687919628.git.deren.wu@mediatek.com>
References: <cover.1687919628.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_002759_219806_55CBD6F6 
X-CRM114-Status: GOOD (  13.77  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

This is a preliminary patch to introduce WiFi7 chipset support

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 617aecd42544..e84c6a56d40e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -249,7 +249,7 @@ enum mt7921_eeprom_field {
 #define mt7921_mcu_init(dev)		((dev)->hif_ops->mcu_init(dev))
 #define __mt7921_mcu_drv_pmctrl(dev)	((dev)->hif_ops->drv_own(dev))
 #define	__mt7921_mcu_fw_pmctrl(dev)	((dev)->hif_ops->fw_own(dev))
-struct mt7921_hif_ops {
+struct mt792x_hif_ops {
 	int (*init_reset)(struct mt792x_dev *dev);
 	int (*reset)(struct mt792x_dev *dev);
 	int (*mcu_init)(struct mt792x_dev *dev);
@@ -278,7 +278,7 @@ struct mt792x_dev {
 
 	struct mt76_connac_pm pm;
 	struct mt76_connac_coredump coredump;
-	const struct mt7921_hif_ops *hif_ops;
+	const struct mt792x_hif_ops *hif_ops;
 
 	struct work_struct ipv6_ns_work;
 	/* IPv6 addresses for WoWLAN */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 517e4d541bdc..4227b5028a6f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -247,7 +247,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 		.sta_remove = mt7921_mac_sta_remove,
 		.update_survey = mt7921_update_channel,
 	};
-	static const struct mt7921_hif_ops mt7921_pcie_ops = {
+	static const struct mt792x_hif_ops mt7921_pcie_ops = {
 		.init_reset = mt7921e_init_reset,
 		.reset = mt7921e_mac_reset,
 		.mcu_init = mt7921e_mcu_init,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 86da0cbbdf3b..b438947c2bd8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -114,7 +114,7 @@ static int mt7921s_probe(struct sdio_func *func,
 		.rd_rp = mt76s_rd_rp,
 		.type = MT76_BUS_SDIO,
 	};
-	static const struct mt7921_hif_ops mt7921_sdio_ops = {
+	static const struct mt792x_hif_ops mt7921_sdio_ops = {
 		.init_reset = mt7921s_init_reset,
 		.reset = mt7921s_mac_reset,
 		.mcu_init = mt7921s_mcu_init,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 898cb1de9400..b02a6d03c645 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -191,7 +191,7 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 		.sta_remove = mt7921_mac_sta_remove,
 		.update_survey = mt7921_update_channel,
 	};
-	static const struct mt7921_hif_ops hif_ops = {
+	static const struct mt792x_hif_ops hif_ops = {
 		.mcu_init = mt7921u_mcu_init,
 		.init_reset = mt7921u_init_reset,
 		.reset = mt7921u_mac_reset,
-- 
2.18.0


