Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421F2CD37B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 07:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fXhtRM5RjLRQdXVr5ShuzzkhGZfrC2llytA16/b+um8=; b=pLOT18MAZhv41knbZea8uB3jfK
	xzfo1je0++azeRtgPT8HAfvvFa1rR2Mjfo2W9ehucoX9ONR5s23/XlYUD4jKPIn0TdWY4DvzYNYzi
	5zP8LNrlrR4+iQMjcS2MbJCjnnJdgIdKKlzEOP+GJYoRuWHuCilYHSCPlfZHPXr36m/83ZUapTFC7
	SkVP9Tgcj4e5/uSHhdWDuFOZgEV8/riPMFYQBdeUQNwl9FrqQef/CGVjfDKw3tYKPBdEhI0GUWLEI
	9OXu5RS9MaQ5h0EqFdvJS73bdQy2APsiROOZAbkGfDBs9UImGt8u7TQ2dy8GJPyVExkyUVY/oIF35
	UpiKvWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3x1-00000001Yp1-0bVH;
	Wed, 13 May 2026 07:24:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3wy-00000001Yo5-2yHb
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 07:24:13 +0000
X-UUID: b80a56544e9c11f1afed4741b24580c9-20260513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fXhtRM5RjLRQdXVr5ShuzzkhGZfrC2llytA16/b+um8=;
	b=ZGoMH7G9YR0E/aNSHER/eeLONP846ZTHg2ltYLXBsDXx/FIfP+1d0WACgGnQy3w0TRjRMSw5YhWzXedGjgvGtaMkmNnIYQgHaEHfBLImkrqX/WQDmIbknKf26NILI4ZqR/FMCfO34dTo+eND2EGo8mQpiqOUH21hMOlc8GfRi6o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:d2af2981-a5ac-4700-81ec-65880b8cd9d9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:9091e75,CLOUDID:296dc543-11c5-46fd-96b8-8ddde212c99a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b80a56544e9c11f1afed4741b24580c9-20260513
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 876553349; Wed, 13 May 2026 00:24:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 13 May 2026 15:24:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 13 May 2026 15:24:01 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jeff.hsu@mediatek.com>, <jb.tsai@mediatek.com>,
	Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7925: Add coredump callback in pci_driver
Date: Wed, 13 May 2026 15:23:59 +0800
Message-ID: <20260513072359.3943517-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002412_765403_BAD51963 
X-CRM114-Status: UNSURE (   7.06  )
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
index c4161754c01d..57006cd75b1c 100644=0D
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c=0D
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c=0D
@@ -610,6 +610,17 @@ static int mt7925_pci_restore(struct device *device)=0D
 	return _mt7925_pci_resume(device, true);=0D
 }=0D
 =0D
+static void mt7925_coredump(struct device *dev)=0D
+{=0D
+	struct pci_dev *pdev =3D to_pci_dev(dev);=0D
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

