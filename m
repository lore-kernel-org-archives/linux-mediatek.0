Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFF3C44502
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 02:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OQJi2yYr5F1UUcKiQuDU1gdz3ijCZmWXgkUNEcU9N1k=; b=CzNzD0X8M8zdjW7rb2aXVhsMIa
	nKO6/OrhaReGPLxq41OIigNVFCuj+wU8gT968fFERXAVc8EqRE6bjOIevv/L0r/KfbMysKS3eX775
	JBCq+vxE8FrEpCaDU2YVcobPuiwMxHokX4Lbwl7gCHR8v+aZEm+RQNlSxiwpQQ9o7bmYYVFk36C1T
	u0H52dbsDdK5OYRN0bS/eTIMs+XDVM/mC7nBC0I7LedPuUM4ieruALkY1pig5KBuU16y2bKLeMGpY
	AHOWnzmHTCt9dTzjL82t6eLzPh7Q4FFlZKTWa/ZGe11fb04kBaGK11dJeOZ3zAw7pvoECvXS9AJc/
	Wqeb9tBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZJ3-0000000BPpn-3ey0;
	Mon, 06 Jul 2026 02:43:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIz-0000000BPnM-3U4h
	for linux-mediatek@bombadil.infradead.org;
	Mon, 06 Jul 2026 02:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OQJi2yYr5F1UUcKiQuDU1gdz3ijCZmWXgkUNEcU9N1k=; b=YpJAQKVoeTHmpxk/MIvlGZVPRo
	L4ZJ1Rf5BbAtcnK89OO+Hna7z+4uooq2V5PzoBpVCAu15c7RyV2W4nGf4uiF4LLFeQTgGsX70Y0QW
	Xks8QAEFt2YcxQLXqWO4YMavtMMfgHqGYKgYkBBn6S5od3DC8qxuaw5CH2wRqBmszcGLGiPTyws1/
	kCIq3W5jDs3lLC3MqfuiPNXqbz8kvPhHg6KRJjo5Gzqk5BO74TGYaER4CR7BvDD1xvDzsLTejoHz/
	ERzLfESnIeCk3TAdaZoETvYeT+ViTAVeqzl3AeKne42VIc0LG7eSbwxafqy90rhJGf8ZmWbrtU0Pc
	0wi2dKgA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgZIu-000000068AS-2VNt
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 02:43:32 +0000
X-UUID: 6cd31afa78e411f1afed4741b24580c9-20260705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OQJi2yYr5F1UUcKiQuDU1gdz3ijCZmWXgkUNEcU9N1k=;
	b=bVeSfQgxOrNUR50hoshwN9Yxxo6tXjvZDySEBxR40bWJkHXZOtSFAgS9V4clsMdQR2ILMsY/0yVPyNwcRcEHFy8jKaqVpssRRN6P39KI3Y8zxpPwubmVx2nYOGjbk+f+Nt1MEhJ8EGQUqN8fwyh7fBiXz7xYOvlI9BRn409vgOU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:81401649-8b04-4d71-a311-f3e51ec3fa76,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:adaae0d6-4504-45e1-b7e4-0b9331be048a,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6cd31afa78e411f1afed4741b24580c9-20260705
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1657322316; Sun, 05 Jul 2026 19:43:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 6 Jul 2026 10:43:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 6 Jul 2026 10:43:07 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Leon.Yen@mediatek.com>, <litien.chang@mediatek.com>,
	<jeff.hsu@mediatek.com>, <jb.tsai@mediatek.com>, Jeff Hsu
	<Jeff.Hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: Add flag to control if need DMA re-init
Date: Mon, 6 Jul 2026 10:43:06 +0800
Message-ID: <20260706024306.47806-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_034330_538115_25D5A5FF 
X-CRM114-Status: GOOD (  11.22  )
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

Add flag(skip_wpdma_reinit) to control if need do DMA re-init

Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt792x.h     | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c8537a5cdf67..154e4372664e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -650,6 +650,10 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (!mt7925_disable_aspm && mt76_pci_aspm_supported(pdev))
 		dev->aspm_supported = true;
 
+	/* MT7935 does not need wpdma reinit */
+	if (is_mt7928(&dev->mt76))
+		dev->skip_wpdma_reinit = true;
+
 	ret = __mt792x_mcu_fw_pmctrl(dev);
 	if (ret)
 		goto err_free_dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8c7ecd3ce126..18d6e2c35606 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -271,6 +271,7 @@ struct mt792x_dev {
 	bool hif_idle:1;
 	bool hif_resumed:1;
 	bool regd_change:1;
+	bool skip_wpdma_reinit:1;
 	wait_queue_head_t wait;
 
 	struct work_struct init_work;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 8ad94fa58340..8308935491d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -418,6 +418,11 @@ int mt792x_wpdma_reinit_cond(struct mt792x_dev *dev)
 	struct mt76_connac_pm *pm = &dev->pm;
 	int err;
 
+	/* Skip wpdma reinit if chip doesn't need it */
+	if (dev->skip_wpdma_reinit) {
+		return 0;
+	}
+
 	/* check if the wpdma must be reinitialized */
 	if (mt792x_dma_need_reinit(dev)) {
 		/* disable interrutpts */
-- 
2.45.2


