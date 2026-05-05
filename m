Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DBACD13DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 05:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZE4VB3odtA5SwhFGu6lkLTutzyz/UJ2uSkUrtsWrnts=; b=03lCcCWJe8K/1m4kqTvJSJCfR+
	nXkh6KL33TFW4jI8C1l8KKC6mJgTspUG0Z73ad+bnEOM+WY8xxDUsxzIBx2iHCM6HmnJgR7skQZEu
	M3ZFZ7YZ8abEv8IMmtP7ORXWgq2J7+ZCuSYLGCJylWX92FYVtWTxHgpQ9CGFW6ZQj7GUVmRb+WrI/
	IFOd0PfW+zLxo7nuK4SAoNUUY7JyGyGlV62A5ZQ8zqGLpcov8wFrUImmOK8LQrrf1yQWY97fVmRy5
	t2NO4oauLnf/7XrSIZnbPkgZHCZpv/xJbFDuEaMlUBaTZ2pMprdFE7rhnu/onh4F5f5k6vw7SbOX9
	TlJEIVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8iQ-0000000FEIO-3YPp;
	Tue, 05 May 2026 05:53:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8iO-0000000FEI1-2YfK
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 05:53:05 +0000
X-UUID: a9f569b6484611f19f231fa534c5cac8-20260504
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZE4VB3odtA5SwhFGu6lkLTutzyz/UJ2uSkUrtsWrnts=;
	b=Al1ZZamuzh8e/h49EYAKmTLNZcqhhXiSkhkNTvvUtnKSxWcoBiGTgqU30NxXGZTnQfGDEKFlEGVbTjros+eZOn2FSWtuKg177hiEini5Fm1+SCzusm0C5xnboOgaPjf0ThNcGNmQ9azMmIU/DHtpYdFVlfKn4NuMT7T/8jhdCBM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0eba47ef-fb8d-4b7e-9735-24c9d4f3dcc6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:213ef370-3b7f-4b26-b2f9-40f0deecb36d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a9f569b6484611f19f231fa534c5cac8-20260504
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 136267338; Mon, 04 May 2026 22:52:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 5 May 2026 13:52:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 5 May 2026 13:52:53 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jeff.hsu@mediatek.com>, <jb.tsai@mediatek.com>,
	Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: Add coredump callback in pci_driver
Date: Tue, 5 May 2026 13:52:52 +0800
Message-ID: <20260505055252.2558613-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_225304_655613_27B4C245 
X-CRM114-Status: UNSURE (   6.68  )
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

From: Jeff Hsu <Jeff.Hsu@mediatek.com>=0D

Register coredump callback(mt7925_coredump) in pci_driver,=0D
it can let platform can trigger core dump to collect the=0D
log and recover back after coredump complete without debugfs=0D
=0D
Some platform not have debugfs=0D
=0D
Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>=0D
---=0D
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c |  1 +=0D
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 12 ++++++++++++=0D
 2 files changed, 13 insertions(+)=0D
=0D
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/=
wireless/mediatek/mt76/mt7925/mcu.c=0D
index 37cdf3e8a067..cd502166a7f9 100644=0D
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c=0D
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c=0D
@@ -1014,6 +1014,7 @@ int mt7925_mcu_chip_config(struct mt792x_dev *dev, co=
nst char *cmd)=0D
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(CHIP_CONFIG),=0D
 				 &req, sizeof(req), false);=0D
 }=0D
+EXPORT_SYMBOL_GPL(mt7925_mcu_chip_config);=0D
 =0D
 int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable)=0D
 {=0D
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/=
wireless/mediatek/mt76/mt7925/pci.c=0D
index c4161754c01d..5b3e62e5f157 100644=0D
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c=0D
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c=0D
@@ -610,6 +610,17 @@ static int mt7925_pci_restore(struct device *device)=0D
 	return _mt7925_pci_resume(device, true);=0D
 }=0D
 =0D
+static void mt7925_coredump(struct device *dev)=0D
+{=0D
+	struct pci_dev *pdev =3D to_pci_dev(device);=0D
+	struct mt76_dev *mdev =3D pci_get_drvdata(pdev);=0D
+	struct mt792x_dev *dev_792x =3D container_of(mdev, struct mt792x_dev, mt7=
6);=0D
+=0D
+	mt792x_mutex_acquire(dev_792x);=0D
+	mt7925_mcu_chip_config(dev_792x, "assert");=0D
+	mt792x_mutex_release(dev_792x);=0D
+}=0D
+=0D
 static const struct dev_pm_ops mt7925_pm_ops =3D {=0D
 	.suspend =3D pm_sleep_ptr(mt7925_pci_suspend),=0D
 	.resume  =3D pm_sleep_ptr(mt7925_pci_resume),=0D
@@ -626,6 +637,7 @@ static struct pci_driver mt7925_pci_driver =3D {=0D
 	.remove		=3D mt7925_pci_remove,=0D
 	.shutdown       =3D mt7925_pci_shutdown,=0D
 	.driver.pm	=3D pm_sleep_ptr(&mt7925_pm_ops),=0D
+	.driver.coredump =3D mt7925_coredump,=0D
 };=0D
 =0D
 module_pci_driver(mt7925_pci_driver);=0D
-- =0D
2.45.2=0D
=0D

