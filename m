Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD29C433E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAB2239D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AAB2239D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UwewiZoHwkuoa8v78IEVrOQm/yeWZzdUg25GfVqVoCc=; b=ZDFW+rJK7dakPAyGL0+r4LGr6
	qgrB9yS9Wo9NrCrX0/CQ23yY1pOsnwuUYBCt1/hIb3vE1r1HkzwZ/2Q0xFUFewFETCgMll0aFp16p
	Lb0PSE8R80gKdizUJPcFJrMMriXZWbQFYdyCg6uCVBvZSDgjo0stwv93RuetII0gNwicNl58Pbfxv
	h/FDAUEfF86MTdOj0RA9O8VPz2A/XpE2pffF3t2yPaVMJKD/Sg84JYEFN0mXx/+XxFvxXRTSSxCtV
	p2VDsf5tUQ3N8AeYdJMHyI+eILcjIgZiDkXQs7ddRxI98sa6bvXopA5kXSmovfuFpg7Y/ctVyRqln
	yyqDySicw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3EXy-0005Wl-NV; Sat, 23 Jan 2021 08:45:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3EXv-0005UR-Jl
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 08:45:28 +0000
X-UUID: 7ceeb7de6c964d3aa187b765dcb18285-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=agRIYfdjILbuLeOUbM6laaLDBS/tPixcAEpvKfzkye4=; 
 b=b0QiAt9FS+yRvh0kSS8mjt/oEuVCsj10PcLV9LGDm5AhQ4Qr19X7/Jpo1+g3Ah+teFrknT5GMqhslXFsJuT6jYD/AQidiTnJGh2eTalg/vyU8UAq82RuDHaRIrTXzMurh1vRA5aRAhzpJFYky4nv8IPsmP9gFeQKwbBYgHmgFZk=;
X-UUID: 7ceeb7de6c964d3aa187b765dcb18285-20210123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 814785944; Sat, 23 Jan 2021 00:45:18 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 00:35:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 16:35:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Jan 2021 16:35:17 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v7 19/22] mt76: mt7921: enable MSI interrupts
Date: Sat, 23 Jan 2021 16:35:10 +0800
Message-ID: <3e271a967e43155834d2f8b971c7a33a235a0c7e.1611389300.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 30DC151482555034CD3E016CA01011692AB46E7CF16F7C6DBD2096F0D6A3E0542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_034527_792535_2F25CB72 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

Enable MSI interrupts for mt7921 driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 5f28e00bba45..5570b4a50531 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -110,7 +110,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
-	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_LEGACY);
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
