Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15135C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ikaKrwmw8xN9OWLD05oD7ZpRGvbapfbACgas4hgn6uk=; b=bRe3sT3I5EaAcn6DUocEONJ/zF
	owoUTByy8dZBiE+qUwsCl5v6cLrJneBuoiXRHsqTzw/5vkXcJkFBQEOHv5IcFtNneY9iknKqWKqDH
	5RU8NzahtqN7qBGn7RidPgp2Y9eeMkzVGSQueuXRJO604EC3f3ZADOYHVliFFNoJDqtYgH3Zo+Vkp
	zi8O4jAFBQCOBVv6xJE5guSUWehBmKIPYl84YGEYH+lA/11EsmTunMGMFp3/V9AIDf/udOmZhKqOp
	MxaDGRNogVmXOUo5wc++lEU7MD9sJKEbXXSumRbD7rripUIV9zvf/ghjivRXOc218xjZYS8gZnwVK
	TwYNtRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GAi-00Dxmt-2a; Mon, 19 Dec 2022 13:27:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GAN-00DxWj-9Z; Mon, 19 Dec 2022 13:26:53 +0000
X-UUID: 802dd4f57d254aaca8b6e12c6dce01e5-20221219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ikaKrwmw8xN9OWLD05oD7ZpRGvbapfbACgas4hgn6uk=;
	b=m3zFGt+qnRHCYSF0awoNvEzriihmkrStrHLTg72Ty0bIPgwAqLfgsv+FTirMu5hz/5H8LOrHUxvEob0hq2LLTTd5ysw7oECfAKinqSnx+LErR8ebZ1ymYCkJDqoF4M4fSegrYtHccO+0dZImUhbbiPGPixKz2ZH2if2jFjesV9w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:950e39b3-ec9a-485b-8170-98a913898a67,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:0db857f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 802dd4f57d254aaca8b6e12c6dce01e5-20221219
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1365587820; Mon, 19 Dec 2022 06:26:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Dec 2022 21:06:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 19 Dec 2022 21:06:36 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <yj.chiang@mediatek.com>, <phil.chang@mediatek.com>, Mark-PK Tsai
	<mark-pk.tsai@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] irqdomain: Fix irqdomain->revmap race
Date: Mon, 19 Dec 2022 21:06:15 +0800
Message-ID: <20221219130620.21092-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_052651_806692_8C3E40D8 
X-CRM114-Status: GOOD (  16.84  )
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

The irqdomain->revmap(_tree) of a shared irq can be race updated
as following, which result in an unexpected irq mapping:

---------------------------------------------------------------
(2 threads parse the same hwirq fwspec in the same time.)

Thread A 			Thread B
irq_create_fwspec_mapping
irq_find_mapping						Thread A: virq = 0, alloc a new irq_desc
				irq_create_fwspec_mapping
				irq_find_mapping		Thread B: virq = 0, alloc a new irq_desc
irq_domain_alloc_irqs
irq_domain_insert_irq						domain->revmap[hwirq] = irq_data(virq x)
				irq_domain_alloc_irqs
				irq_domain_insert_irq		domain->revmap[hwirq] = irq_data(virq x + 1)

virq = x			virq = x + 1
---------------------------------------------------------------

The virq x can't work because the revmap[hwirq] was
overridden by thread B.

It seems both hierarchy and non-hierarchy irq domain have the same
problem because the code from irq_find_mapping to revmap update are
not protected by a same lock.

Do you have any suggestion about how to fix it properly?

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 kernel/irq/irqdomain.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 8fe1da9614ee..21d317b26220 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -22,6 +22,7 @@
 
 static LIST_HEAD(irq_domain_list);
 static DEFINE_MUTEX(irq_domain_mutex);
+static DEFINE_MUTEX(irq_revmaps_mutex);
 
 static struct irq_domain *irq_default_domain;
 
@@ -793,6 +794,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	 * If we've already configured this interrupt,
 	 * don't do it again, or hell will break loose.
 	 */
+	mutex_lock(&irq_revmaps_mutex);
 	virq = irq_find_mapping(domain, hwirq);
 	if (virq) {
 		/*
@@ -801,7 +803,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		 * interrupt number.
 		 */
 		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
-			return virq;
+			goto unlock;
 
 		/*
 		 * If the trigger type has not been set yet, then set
@@ -809,27 +811,32 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		 */
 		if (irq_get_trigger_type(virq) == IRQ_TYPE_NONE) {
 			irq_data = irq_get_irq_data(virq);
-			if (!irq_data)
-				return 0;
+			if (!irq_data) {
+				virq = 0;
+				goto unlock;
+			}
 
 			irqd_set_trigger_type(irq_data, type);
-			return virq;
+			goto unlock;
 		}
 
 		pr_warn("type mismatch, failed to map hwirq-%lu for %s!\n",
 			hwirq, of_node_full_name(to_of_node(fwspec->fwnode)));
-		return 0;
+		virq = 0;
+		goto unlock;
 	}
 
 	if (irq_domain_is_hierarchy(domain)) {
 		virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, fwspec);
-		if (virq <= 0)
-			return 0;
+		if (virq <= 0) {
+			virq = 0;
+			goto unlock;
+		}
 	} else {
 		/* Create mapping */
 		virq = irq_create_mapping(domain, hwirq);
 		if (!virq)
-			return virq;
+			goto unlock;
 	}
 
 	irq_data = irq_get_irq_data(virq);
@@ -838,12 +845,15 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 			irq_domain_free_irqs(virq, 1);
 		else
 			irq_dispose_mapping(virq);
-		return 0;
+		virq = 0;
+		goto unlock;
 	}
 
 	/* Store trigger type */
 	irqd_set_trigger_type(irq_data, type);
 
+unlock:
+	mutex_unlock(&irq_revmaps_mutex);
 	return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping);
-- 
2.18.0


