Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8174AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 08:24:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A3BC64EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 08:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A3BC64EED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hf782C5aHwUE8A0xhnlG6NMXNPY/3GjLxtaKegoqeQQ=; b=nJFXdWMEfCVoX8oyTLxfuXptWs
	Hp1W8kLUMPr7XqgOeDicGTMxqAL2xPZ4JlySeoP+YYIs2pOW+563YgHOIMhqVp79ih//NK0om4Bn0
	fB7alotODm/2pVwxkwCq+InxzDZiiVvxGRucyksuoW1t+MGqo6xJQN9AkYiqNb0KvPa5OTf5ogt7b
	6zXyTdyVskM+TiGxkevDQiaPYkoG3nwFY0cCletE2Vrt01P3OegvI/xXq0uQoWo0HAULOcbtfG5Iw
	vKOiSvNz4JIGAqczjV95ePajcf/fHla8D1qcLrL29s+LUwKVxsuK+kXxsIzit2xnYeX46mh137NYw
	/mAyR4CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFYPw-0005iM-O5; Fri, 26 Feb 2021 08:24:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFYPm-0005cc-Mu
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 08:24:02 +0000
X-UUID: c52abe20abe1453aa124abb21c8bb8fc-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0MXBxsQUQ6D3UTdh2s47uFVWAmMpZ8tsmDn/rJhU6bA=; 
 b=GIe6svZLKsigXm0pRLaq0fLtlTEaz+mHCqIqcLiO97usZhmje27JoeKI3BV9cnc/a7oNlyTAjT8zsyg79aRlJHRK92qkzGQFpHQ/eqGeYnI8ycYbXoaPppMlv3BYlDppa3k+LKdf2ebaC65R5+bN9uQFrzIs2LAqqrvNri8zRG0=;
X-UUID: c52abe20abe1453aa124abb21c8bb8fc-20210226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 541695632; Fri, 26 Feb 2021 00:23:50 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 00:23:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 16:23:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Feb 2021 16:23:29 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7921: fix the base of PCIe interrupt
Date: Fri, 26 Feb 2021 16:23:26 +0800
Message-ID: <4ff45223ff7ecff8e20a722ffd2db77fe51fea00.1614327185.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_032359_589209_C6E3C0DF 
X-CRM114-Status: GOOD (  10.68  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, posh.sun@mediatek.com,
 YN.Chen@mediatek.com, linux-mediatek@lists.infradead.org,
 Soul.Huang@mediatek.com, Stella.Chang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Should use 0x10000 as the base to operate PCIe interrupt according
to the vendor reference driver.

Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/regs.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 3e430c04c97e..def8b7816609 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -137,7 +137,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
 
-	mt7921_l1_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
+	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
 	ret = devm_request_irq(mdev->dev, pdev->irq, mt7921_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, dev);
@@ -248,7 +248,7 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 		return 0;
 
 	/* enable interrupt */
-	mt7921_l1_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
+	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 	mt7921_irq_enable(dev, MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
 			  MT_INT_MCU_CMD);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
index 419add751980..c4bd31cc81cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
@@ -391,7 +391,7 @@
 #define MT_HW_CHIPID			0x70010200
 #define MT_HW_REV			0x70010204
 
-#define MT_PCIE_MAC_BASE		0x74030000
+#define MT_PCIE_MAC_BASE		0x10000
 #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
 #define MT_PCIE_MAC_INT_ENABLE		MT_PCIE_MAC(0x188)
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
