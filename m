Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E61C77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZKyfnOyao/Dfi1FYl5aFgiRQ71YeVRZeUnZIVzkIOo0=; b=NysmSOzTw+P6a7pX9KA73yux/+
	5YNj6XVYr8EAH/WCA0aCEXbTv4wn861mOGkcRPcpHPM3KmOqcaxfpqo4sc8GFfUKkode5fWlX4GE1
	Byk6y7cQXdU2E2kywSqD/bvtOk8MFbBaDPP6Owt9bR060H/5XJhSVrmm74sPeKJnfD2H9SSlkeXW9
	+UVdVj+YDB1xmTB/Ib26KQxyFCzT/7tqeKm8mr78OZ3ZKeQqS3w6cVudtLhQP7s1nwUJ19k96gtDB
	ce0TxkcgdHIPb/zew0wjdr4PHIFuWNd1QzemgauvrF5+5o9LrO3qA+7jNIO2dSfoJk98uOltkLs8E
	4TvoEnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEqf-000Eec-1s;
	Tue, 11 Apr 2023 14:19:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEqb-000Ecl-1G;
	Tue, 11 Apr 2023 14:19:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0267062778;
	Tue, 11 Apr 2023 14:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12069C433EF;
	Tue, 11 Apr 2023 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681222788;
	bh=EMwlfqdVBkb2S3Vcphht0dMO+NdM0lhvTgEQzUXgLP0=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Rkp2yKbsNZuu7uz+e7pG+jJ6ka2YcgHB9k55kA+R+4+C5MexcQC1jfFSK5ZLbMvir
	 fwySoUMERa7T+9arCRzkE8k7OTgU7/SbfIKhJB2wHbQzTfV6WwckkODSXuBuWJKSPT
	 LvlBOHX8dftd7wx61G5klQOc+0FbIcCAVp5h5J0s=
Subject: Patch "irqdomain: Refactor __irq_domain_alloc_irqs()" has been added to the 5.4-stable tree
To: gregkh@linuxfoundation.org,hsinyi@chromium.org,johan+linaro@kernel.org,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,mark-pk.tsai@mediatek.com,matthias.bgg@gmail.com,maz@kernel.org,sashal@kernel.org,tglx@linutronix.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 11 Apr 2023 16:19:38 +0200
In-Reply-To: <20230322124550.29812-2-mark-pk.tsai@mediatek.com>
Message-ID: <2023041138-mothball-kindred-7c9e@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_071949_506771_017CE4B5 
X-CRM114-Status: GOOD (  20.20  )
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


This is a note to let you know that I've just added the patch titled

    irqdomain: Refactor __irq_domain_alloc_irqs()

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     irqdomain-refactor-__irq_domain_alloc_irqs.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable-owner@vger.kernel.org Wed Mar 22 13:46:08 2023
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Date: Wed, 22 Mar 2023 20:45:49 +0800
Subject: irqdomain: Refactor __irq_domain_alloc_irqs()
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Message-ID: <20230322124550.29812-2-mark-pk.tsai@mediatek.com>

From: Johan Hovold <johan+linaro@kernel.org>

[ Upstream commit d55f7f4c58c07beb5050a834bf57ae2ede599c7e ]

Refactor __irq_domain_alloc_irqs() so that it can be called internally
while holding the irq_domain_mutex.

This will be used to fix a shared-interrupt mapping race, hence the
Fixes tag.

Fixes: b62b2cf5759b ("irqdomain: Fix handling of type settings for existing mappings")
Cc: stable@vger.kernel.org      # 4.8
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20230213104302.17307-6-johan+linaro@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/irq/irqdomain.c |   74 +++++++++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 32 deletions(-)

--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1350,6 +1350,45 @@ int irq_domain_alloc_irqs_hierarchy(stru
 	return domain->ops->alloc(domain, irq_base, nr_irqs, arg);
 }
 
+static int irq_domain_alloc_irqs_locked(struct irq_domain *domain, int irq_base,
+					unsigned int nr_irqs, int node, void *arg,
+					bool realloc, const struct irq_affinity_desc *affinity)
+{
+	int i, ret, virq;
+
+	if (realloc && irq_base >= 0) {
+		virq = irq_base;
+	} else {
+		virq = irq_domain_alloc_descs(irq_base, nr_irqs, 0, node,
+					      affinity);
+		if (virq < 0) {
+			pr_debug("cannot allocate IRQ(base %d, count %d)\n",
+				 irq_base, nr_irqs);
+			return virq;
+		}
+	}
+
+	if (irq_domain_alloc_irq_data(domain, virq, nr_irqs)) {
+		pr_debug("cannot allocate memory for IRQ%d\n", virq);
+		ret = -ENOMEM;
+		goto out_free_desc;
+	}
+
+	ret = irq_domain_alloc_irqs_hierarchy(domain, virq, nr_irqs, arg);
+	if (ret < 0)
+		goto out_free_irq_data;
+	for (i = 0; i < nr_irqs; i++)
+		irq_domain_insert_irq(virq + i);
+
+	return virq;
+
+out_free_irq_data:
+	irq_domain_free_irq_data(virq, nr_irqs);
+out_free_desc:
+	irq_free_descs(virq, nr_irqs);
+	return ret;
+}
+
 /**
  * __irq_domain_alloc_irqs - Allocate IRQs from domain
  * @domain:	domain to allocate from
@@ -1376,7 +1415,7 @@ int __irq_domain_alloc_irqs(struct irq_d
 			    unsigned int nr_irqs, int node, void *arg,
 			    bool realloc, const struct irq_affinity_desc *affinity)
 {
-	int i, ret, virq;
+	int ret;
 
 	if (domain == NULL) {
 		domain = irq_default_domain;
@@ -1384,40 +1423,11 @@ int __irq_domain_alloc_irqs(struct irq_d
 			return -EINVAL;
 	}
 
-	if (realloc && irq_base >= 0) {
-		virq = irq_base;
-	} else {
-		virq = irq_domain_alloc_descs(irq_base, nr_irqs, 0, node,
-					      affinity);
-		if (virq < 0) {
-			pr_debug("cannot allocate IRQ(base %d, count %d)\n",
-				 irq_base, nr_irqs);
-			return virq;
-		}
-	}
-
-	if (irq_domain_alloc_irq_data(domain, virq, nr_irqs)) {
-		pr_debug("cannot allocate memory for IRQ%d\n", virq);
-		ret = -ENOMEM;
-		goto out_free_desc;
-	}
-
 	mutex_lock(&irq_domain_mutex);
-	ret = irq_domain_alloc_irqs_hierarchy(domain, virq, nr_irqs, arg);
-	if (ret < 0) {
-		mutex_unlock(&irq_domain_mutex);
-		goto out_free_irq_data;
-	}
-	for (i = 0; i < nr_irqs; i++)
-		irq_domain_insert_irq(virq + i);
+	ret = irq_domain_alloc_irqs_locked(domain, irq_base, nr_irqs, node, arg,
+					   realloc, affinity);
 	mutex_unlock(&irq_domain_mutex);
 
-	return virq;
-
-out_free_irq_data:
-	irq_domain_free_irq_data(virq, nr_irqs);
-out_free_desc:
-	irq_free_descs(virq, nr_irqs);
 	return ret;
 }
 


Patches currently in stable-queue which might be from stable-owner@vger.kernel.org are

queue-5.4/irqdomain-fix-mapping-creation-race.patch
queue-5.4/irqdomain-refactor-__irq_domain_alloc_irqs.patch
queue-5.4/irqdomain-look-for-existing-mapping-only-once.patch

