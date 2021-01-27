Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2B8C433E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:10:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D149C20705
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 04:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D149C20705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSdaTGiptAk0UmjBlzNsbjpPQndpnLSWJnzZ4hTrZw4=; b=p3d0Cyweb8rkyg18bkyvWN/6vf
	0cHsVnDsneDbfDnj/alHy3L1pTPiMAtpDI1dYZTc/uencFx42KpzJCkaDLyg2MDdDUfAikcslk9OL
	AmWgz+08ClzjNZGnVfC0llNwD02KJZweMVRSMhxy1TL/gw68YhPMYA4xdeWb3Tn9+5YsJD4Uq4ncB
	kqoZR+2UbPZSLsFN/MaxEoJf276RW6AdoOlJXnwH3uJg+bsUVdLd6no7xJUk6O8MMnsL3n66uODz0
	HPkdGyko3vAVoguU+5VwCuNuJAtQoJu74R8MXpEXy43civSpz+LWEWB1QzQ7f+TI2V1r0yqGpNSRw
	Zb5s2BBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4cA5-0000Zo-J6; Wed, 27 Jan 2021 04:10:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4cA1-0000Yl-WC
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 04:10:31 +0000
X-UUID: fd52230af87d4a8885afa71452092304-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=durxo4nMNWhuWBd9OaxIRgY+15krwHaRnDDRecysrMI=; 
 b=d7aQrTfP00uzuztN1onhribZKrue79TXQG5qQ50vonShrY0LjCgsVtWv7acr2zdhMRf/ZR+u3cLgEEmVN2CrweRQEIyEnQulgCHhpYg0RNB57afK+ZX3FEf3ud+Ng9HxSsQXlyiIkpBi2kiS7t9SfCi0QY21E43iK3Ipk/68hjw=;
X-UUID: fd52230af87d4a8885afa71452092304-20210126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 987650495; Tue, 26 Jan 2021 20:10:24 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 20:10:22 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 12:10:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Jan 2021 12:10:19 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: only set PCIE_RECOGNITION_ID when using the
 second hif
Date: Wed, 27 Jan 2021 12:10:18 +0800
Message-ID: <121208af32ad8850fe04feb6707f3fe2304d8353.1611720332.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_231030_804344_F146D4F2 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: linux-mediatek@lists.infradead.org,
 Zhiqiang Yang <zhiqiang.yang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To avoid connection issue on mt7622.

Signed-off-by: Zhiqiang Yang <zhiqiang.yang@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 64ffffdc93c9..2cb7a6ff0ffd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -183,6 +183,8 @@ static void mt7915_pci_init_hif2(struct mt7915_dev *dev)
 		return;
 
 	dev->hif2 = hif;
+	dev->hif_idx = ++hif_idx;
+	mt76_wr(dev, MT_PCIE_RECOG_ID, dev->hif_idx | MT_PCIE_RECOG_ID_SEM);
 
 	if (devm_request_irq(dev->mt76.dev, hif->irq, mt7915_irq_handler,
 			     IRQF_SHARED, KBUILD_MODNAME "-hif", dev)) {
@@ -280,9 +282,6 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto error;
 
-	dev->hif_idx = ++hif_idx;
-	mt76_wr(dev, MT_PCIE_RECOG_ID, dev->hif_idx | MT_PCIE_RECOG_ID_SEM);
-
 	mt7915_pci_init_hif2(dev);
 
 	ret = mt7915_register_device(dev);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
