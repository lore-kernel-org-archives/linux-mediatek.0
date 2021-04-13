Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EB5C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 05:36:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0C3613AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 05:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0C3613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j0XRU/z4XfpETpqVFYF0oyePIVGO+J/vV2CDziL4WEQ=; b=Rhj41PFzQZmNb6oM5s/pJ6kPBL
	yfdsSc/YHv/wskSXH08u2Lz5VzQLDJ8M1j9MtMH6WJMXgnVVMO7tNbwjmwWXX23fA1dDWIaInxEuv
	K0//h64DaEje5UX+erld5H02dLcIVduQOEVrKl9/U/vUQY/PtZg9uUUG7Xr+iBprmmq6TJ1d1Ih5Y
	/x5rAsyZJcD/Pim6v1yeZbzP21/968UTUPjHJRsA80Judv32jhAYME61mu2Yni6RO6s0RJyn2uL2C
	ACXKPv5H1v8c00xZOZBqu8UKapcRyuqw9p+BVDBjvoL6JwLiHazIVkuHQWNdpb2OKiDMD9Hom96CG
	V3JjMK+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWBiJ-008JHo-BD; Tue, 13 Apr 2021 05:35:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWBhf-008JEy-OB
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 05:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IT6aOmiwbYxXPymSA4HzKt0aO2GcQpihtnEeIk+n1WU=; b=Ah6fhtHBnlgbmht10Fmc3/0DFd
 eved6SUn0EmkrdfHxyH7II6DskNG3ohKKKGnDWh9snUZhi05lcyU6L9kMv2lOTqLgiM9QEzOpGkau
 OrI6B0FHKetEup3voUr0UL9LeCtA535oJx4jnRFq72kuVaYm8P+UoGj3A2TeErU86yZFuZ81MgDq+
 g6T7Cc23N0WeS0PTALIjpGGAauK5K4zPVURDccdfvoNMW0D7q9986f6JAjW6gT6jOR+4tkCJn6bTa
 2vBPYOAICCvDrnRU4nwmchU9YvClioMl4DpETHmX7yjiaLfkJki47LS8ZInp2gwFlLZ/MF2xkdVc9
 5QMvp3PQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWBhc-006kJV-Pu
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 05:35:10 +0000
X-UUID: dfdc5e55eb20447daadd721a7b498e92-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IT6aOmiwbYxXPymSA4HzKt0aO2GcQpihtnEeIk+n1WU=; 
 b=Oip4Slaa4BRXmTjQDT90K6OkXS1Y/lLX8+y1yYPjLntcYO8SPdCCG8vlJovtxbgtJx1RZYZU6/oP95KgQ7FeT85xctHiUHCwBIKliejO9DFgaLML1i4lQLYrvE1LPCG9Ez8A2ggFIxthj+lMTmr3CAJJ/cLPu/86LUbBTiTjQqQ=;
X-UUID: dfdc5e55eb20447daadd721a7b498e92-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2124243406; Mon, 12 Apr 2021 22:35:02 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:35:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Apr 2021 13:34:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Apr 2021 13:34:57 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7615: fix memleak when mt7615_unregister_device()
Date: Tue, 13 Apr 2021 13:34:56 +0800
Message-ID: <519a81d0c36ab64750a39b1eac3cb86a09cb2f1d.1618290080.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: E5DB2D9EF93713D4D4B0D1043C6360E7C430CD89F08320BD661F2A4391AA6A952000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_223508_863849_AFEE6BDA 
X-CRM114-Status: UNSURE (   8.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7615_tx_token_put() should get call before mt76_free_pending_txwi().

Fixes: a6275e934605 ("mt76: mt7615: reset token when mac_reset happens")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index a629d9cb3806..a03484e34bb4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -164,10 +164,9 @@ void mt7615_unregister_device(struct mt7615_dev *dev)
 	mt76_unregister_device(&dev->mt76);
 	if (mcu_running)
 		mt7615_mcu_exit(dev);
-	mt7615_dma_cleanup(dev);
 
 	mt7615_tx_token_put(dev);
-
+	mt7615_dma_cleanup(dev);
 	tasklet_disable(&dev->irq_tasklet);
 
 	mt76_free_device(&dev->mt76);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
