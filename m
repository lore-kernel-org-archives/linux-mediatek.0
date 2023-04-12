Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E68C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SaoIHjQPTaBlztW3XPxW1aaHMDuvqPG5Cg12mQ2L0M=; b=nA5qlMmRco+G+BynM4w5eCZYda
	GXTGt0cg46x29E/nscAYVz4AptrmgHFcwt2CgsgcKEIEwluQqNZ8aqCsEhEujMqmYSnHixb3PEURv
	dxc+YkyPedcbI8swyyLpV2adblIugywjjxTQclx17kJ1lthXzNxSltzru+L3Eo/b+RKI5+w3i5tH4
	Gp10jMFrIzEElVCphCvJDc1iVRwGqW4TdG8eJAv/YL2T+X+06djoMCCB0kdNLh5bIerku/LfEernh
	qTqsk1bGAK/VTFWY0CELdmjZBnPsxA2D8JrVUctK9AQXreF6uZyreBhAIZ7B/29EKpITQyKnY3IJe
	KQcZUB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhkb-004MRA-02;
	Wed, 12 Apr 2023 21:11:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhkY-004MQG-1t
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 21:11:31 +0000
X-UUID: 92be5cccd97611ed8687db9d93187ff1-20230412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2SaoIHjQPTaBlztW3XPxW1aaHMDuvqPG5Cg12mQ2L0M=;
	b=OSAwdosub5ZxMRvZMsitYK51E6bVwVdUvU/sd5EQnl/EvAITIIyOr2QE4EV1MOv0ni1oW9xpqvtmIGsXLq0OtK+Ta6b37iugQQLMo1+p1DC/oIYCLpqZ9d1vgvGGlMHakGkQsDJwsdl+/Z9Uho9KYTjg6WpJDYY7WeqxpL5xt08=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:da5eeec6-4e43-41bc-ae4c-efc4bc0057cc,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:120426c,CLOUDID:fd99db83-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 92be5cccd97611ed8687db9d93187ff1-20230412
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 495127861; Wed, 12 Apr 2023 14:11:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 05:11:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 05:11:18 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<arowa@google.org>, <frankgor@google.com>, <kuabhs@google.com>,
	<druth@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Quan
 Zhou <quan.zhou@mediatek.com>, Deren Wu <deren.wu@mediatek.com>, Wang Zhao
	<wang.zhao@mediatek.com>
Subject: [PATCH v2 2/2] wifi: mt76: mt7921e: stop chip reset worker in unregister hook
Date: Thu, 13 Apr 2023 05:11:14 +0800
Message-ID: <ba421df2ada4ebad13ac7a712c1d9c3e977b59c8.1681333416.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <bd53c5cf67a5a1cac3e94713704a5dc4e17431c9.1681333416.git.objelf@gmail.com>
References: <bd53c5cf67a5a1cac3e94713704a5dc4e17431c9.1681333416.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_141130_654667_E8142D04 
X-CRM114-Status: GOOD (  14.08  )
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

From: Quan Zhou <quan.zhou@mediatek.com>

If the chip reset worker is triggered during the remove process, the chip
DMA may not be properly pushed back to the idle state. This can lead to
corruption of the DMA flow due to the chip reset. Therefore, it is
necessary to stop the chip reset before the DMA is finalized.

To avoid resetting the chip after the reset worker is cancelled, use
__mt7921_mcu_drv_pmctrl() instead of mt7921_mcu_drv_pmctrl(). It is safe to
ignore the pm mutex because the pm worker and wake worker have already been
cancelled.

Fixes: 033ae79b3830 ("mt76: mt7921: refactor init.c to be bus independent")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Co-developed-by: Wang Zhao <wang.zhao@mediatek.com>
Signed-off-by: Wang Zhao <wang.zhao@mediatek.com>
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
---
v2: update the commit message to ensure that it is consistent between the
    patch content and the documentation. This will help to accurately
    reflect the changes made and make it easier for other developers to
    understand the purpose of the update.
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 1a8a54a46dcc..c592903157d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -115,9 +115,10 @@ static void mt7921e_unregister_device(struct mt7921_dev *dev)
 		napi_disable(&dev->mt76.napi[i]);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
+	cancel_work_sync(&dev->reset_work);
 
 	mt7921_tx_token_put(dev);
-	mt7921_mcu_drv_pmctrl(dev);
+	__mt7921_mcu_drv_pmctrl(dev);
 	mt7921_dma_cleanup(dev);
 	mt7921_wfsys_reset(dev);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
-- 
2.25.1


