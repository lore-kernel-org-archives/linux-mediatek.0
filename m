Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0399DC2BA2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 16:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83C2206F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 16:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IxlUmFu0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYoKC44O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83C2206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAcQgie9BqXM5eGX6XbifBPk9zy3NYLFzQGKfae3ckw=; b=IxlUmFu0GETPcY
	w7lcw2NvE+rOFUh5jTTvggiOnpHd9ExJ2f2pWE9ivLrWOAYpV8ewfXwZFkeynxdSTczSTeNFrSFOs
	M9s/m3qeG3mcUI9ggwzYstsXsjcQZEzSF+thvGijOHliUbeQAauSReAks9emv+UoROeDHf9mUmHbu
	M9DZNyZwUI9/Kt1X0arsVJzS+vktSNPr/nr1qpmNfz+Ng+Kq85vkgsEVVueNorIUBsvB5I/l3qBP8
	PU0arMqXZ8mFQtEzvQ69VJBLAf8WmjVdgZw34pL1zVF9iJdhVB+PmAkXBZudVwfGGV9bLgp1xf8Lb
	eqxOMdURIDpqYPuZ4gaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMaB9-0003q0-1l; Thu, 09 Apr 2020 16:37:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMaB6-0003pa-CW
 for linux-mediatek@lists.infradead.org; Thu, 09 Apr 2020 16:37:21 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B784206F7;
 Thu,  9 Apr 2020 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586450239;
 bh=VXWkQVuflDvEk6Y7a9MpocTR5irjGN/oKT+CYNqLsws=;
 h=From:To:Cc:Subject:Date:From;
 b=bYoKC44OziP3pJgPY+bgI2Pdg1tXXWnBN9KCIAMxlKoBSLaaxO8Jkcdk1ILq3fT+4
 JBbLln73+BBx6gULzvu8erGnndfqvqFS9et/d09FWo7BVebOFw1xIdUPLZDcTJWTKr
 lEKZi3zI1tEjbVZM0ShmyQT/O/8vHO33qpTWvLnY=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: enable MSI by default
Date: Thu,  9 Apr 2020 18:37:04 +0200
Message-Id: <bde07fa0d259b124e1dcf6032ced1b693e4ddc24.1586450155.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_093720_444564_A3B90805 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 soul.huang@mediatek.com, lorenzo.bianconi@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable MSI/MSI-X PCI interrupts by default. This patch has been tested
using Banana Pi r64 board

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
index a12833957d98..53e69dd6ba81 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
@@ -33,6 +33,10 @@ static int mt7615_pci_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return ret;
+
 	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
@@ -48,6 +52,7 @@ static void mt7615_pci_remove(struct pci_dev *pdev)
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
 
 	mt7615_unregister_device(dev);
+	pci_free_irq_vectors(pdev);
 }
 
 static int __maybe_unused mt7615_pci_suspend(struct pci_dev *pdev,
-- 
2.25.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
