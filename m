Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68FD606A321
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 02:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TMT7NWqb;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=LEhp1NMT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EeTJgnmVl/5NmRNmBFkRkouEOm3tCBUEV7L+v5mqIog=; b=TMT7NWqb7HeMmneOkSSMSrTR6u
	fHraXIcsscfd3Uk6EHBJdmZ5XVVlfqkWdDaOko3x6j11nu0d01Dn9qseSidsxtCPVWlvFXEOp1gu3
	HL19Y99qA5U0x7O7FHPfsP1SKIjAwuCbVoBXRa2wu65kl0ZcZxPzkItj1pHGdep8fDvaj+PEJD/o9
	vAbuTRCZem5EVVmgvlfi/a9bdDWnJQLseB/zCuovN090pkHlcKmxwFnWnTciewaVjVHDLfxzAqVM1
	ncjQJX9fknZCfbtBr8pTdyHnfxpNa9G0b7C08pPZhxiyi5r0MZKk47sBPUSfI453rK6FnihFxkm9n
	Yeu/GTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2bY-00000008EI1-237X;
	Wed, 25 Nov 2026 02:19:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2bU-00000008EHW-3LMF
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 02:19:27 +0000
X-UUID: 9f9988dce87611f1afed4741b24580c9-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EeTJgnmVl/5NmRNmBFkRkouEOm3tCBUEV7L+v5mqIog=;
	b=LEhp1NMTdzWZfHps1ai3VgFtoQDHSYgHl8RQr57I5O1hEEdl7DeCYjut38kl52oIkcUnC6yiByf0bc2pCtELhQq7YUDJOOKWxpno+sblXPpBUOa/MchiNKkMRlfKrrtHuSLUndQ3q5N6EUajn52ngNmDtE0WTGxrGdsyj9AHW1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8386ca71-e582-4059-937b-8ed59c56976f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:5d355d03-83e5-4da0-9d8b-8e0c13c2f73d,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f9988dce87611f1afed4741b24580c9-20261124
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2019071837; Tue, 24 Nov 2026 19:19:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 10:19:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 10:19:18 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <jeff.hsu@mediatek.com>, <jb.tsai@mediatek.com>,
	Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH v3] wifi: mt76: mt7925: Add coredump callback in pci_driver
Date: Wed, 25 Nov 2026 10:19:17 +0800
Message-ID: <20261125021917.1436754-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_181925_966419_B3BD481D 
X-CRM114-Status: GOOD (  10.63  )
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

From: Jeff Hsu <Jeff.Hsu@mediatek.com>

Register coredump callback(mt7925_coredump) in pci_driver,
it can let platform can trigger core dump to collect the
log and recover back after coredump complete without debugfs

Some platform not have debugfs

Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
---
v2: Fix build error
v3: Just rebased for resubmit the patch
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5514a5284af4..f463229f6ce8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1261,6 +1261,7 @@ int mt7925_mcu_chip_config(struct mt792x_dev *dev, const char *cmd)
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(CHIP_CONFIG),
 				 &req, sizeof(req), false);
 }
+EXPORT_SYMBOL_GPL(mt7925_mcu_chip_config);
 
 int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index a7877c408736..e0349fa9b033 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -973,6 +973,17 @@ static int mt7925_pci_restore(struct device *device)
 	return _mt7925_pci_resume(device, true);
 }
 
+static void mt7925_coredump(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mt76_dev *mdev = pci_get_drvdata(pdev);
+	struct mt792x_dev *dev_792x = container_of(mdev, struct mt792x_dev, mt76);
+
+	mt792x_mutex_acquire(dev_792x);
+	mt7925_mcu_chip_config(dev_792x, "assert");
+	mt792x_mutex_release(dev_792x);
+}
+
 static const struct dev_pm_ops mt7925_pm_ops = {
 	.suspend = pm_sleep_ptr(mt7925_pci_suspend),
 	.resume  = pm_sleep_ptr(mt7925_pci_resume),
@@ -989,6 +1000,7 @@ static struct pci_driver mt7925_pci_driver = {
 	.remove		= mt7925_pci_remove,
 	.shutdown       = mt7925_pci_shutdown,
 	.driver.pm	= pm_sleep_ptr(&mt7925_pm_ops),
+	.driver.coredump = mt7925_coredump,
 };
 
 module_pci_driver(mt7925_pci_driver);
-- 
2.45.2


