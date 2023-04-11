Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4877C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 14:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rLsrKW5wCH2YEpDqMuv1nC+9omYEpVCw+1/fNbWN4iA=; b=nJqbdR1GrgKjKZvXg/bpwONi29
	0WN4Hf3jRRz3WlWRVn8kwf8qTa5YjXzWiFXWZmVx0yz16CN+ziFe/IjUrOyczNo/bE4OqFE3bEWiN
	VhCzdiih1vCYisD5B860bHWTX8o11HeVsy/T2rQTctUMeeY2ByYABQIxp4Rlj8bCGUFU3AF0yysfR
	q0fqZpfmTz5z4dWWFThv5MI++Xo4xel1zKUC8veqd/p/Vn16CdALhjaZFJ/bFTgCP/poFe72+V5wf
	c9YUhHwP6iPXV5D6v83KKiroKPz7W8vrJu8ikQGDZkWuhvtVVak/MaY8fJ5dWOftsVuejxjZe5tpP
	rT2n1bfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEqk-000Egi-0z;
	Tue, 11 Apr 2023 14:19:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEqd-000Edh-3C;
	Tue, 11 Apr 2023 14:19:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B96B626AF;
	Tue, 11 Apr 2023 14:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45F5C433EF;
	Tue, 11 Apr 2023 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681222791;
	bh=z2Cy60V7wbYqOiOEMOTuYFMk4UORXhk+VBaCqRUDpNo=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=icnqM5NjCCQkHHxddZOKAEithhKV0gYID7yqsLWRnutPu719lWEKTUI+lc4AE4oSz
	 B89xAJRYRYsYz6dVTKwLS22B85ZwB09gCzuyKQibQhVcVH08iyOgj5FlRMa+MA8bw6
	 1ABeR0j0UVSG0fZ3a2NtIL1meI3S7lLk4HHO/r78=
Subject: Patch "irqdomain: Look for existing mapping only once" has been added to the 5.4-stable tree
To: gregkh@linuxfoundation.org,hsinyi@chromium.org,johan+linaro@kernel.org,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,mark-pk.tsai@mediatek.com,matthias.bgg@gmail.com,maz@kernel.org,tglx@linutronix.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 11 Apr 2023 16:19:38 +0200
In-Reply-To: <20230322124550.29812-1-mark-pk.tsai@mediatek.com>
Message-ID: <2023041137-strobe-decimeter-a2fe@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_071952_105811_F2B24337 
X-CRM114-Status: GOOD (  21.70  )
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

    irqdomain: Look for existing mapping only once

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     irqdomain-look-for-existing-mapping-only-once.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable-owner@vger.kernel.org Wed Mar 22 13:46:06 2023
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Date: Wed, 22 Mar 2023 20:45:48 +0800
Subject: irqdomain: Look for existing mapping only once
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Message-ID: <20230322124550.29812-1-mark-pk.tsai@mediatek.com>

From: Johan Hovold <johan+linaro@kernel.org>

commit 6e6f75c9c98d2d246d90411ff2b6f0cd271f4cba upstream.

Avoid looking for an existing mapping twice when creating a new mapping
using irq_create_fwspec_mapping() by factoring out the actual allocation
which is shared with irq_create_mapping_affinity().

The new helper function will also be used to fix a shared-interrupt
mapping race, hence the Fixes tag.

Fixes: b62b2cf5759b ("irqdomain: Fix handling of type settings for existing mappings")
Cc: stable@vger.kernel.org      # 4.8
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20230213104302.17307-5-johan+linaro@kernel.org
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/irq/irqdomain.c |   62 ++++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 28 deletions(-)

--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -672,6 +672,34 @@ unsigned int irq_create_direct_mapping(s
 }
 EXPORT_SYMBOL_GPL(irq_create_direct_mapping);
 
+static unsigned int __irq_create_mapping_affinity(struct irq_domain *domain,
+						  irq_hw_number_t hwirq,
+						  const struct irq_affinity_desc *affinity)
+{
+	struct device_node *of_node = irq_domain_get_of_node(domain);
+	int virq;
+
+	pr_debug("irq_create_mapping(0x%p, 0x%lx)\n", domain, hwirq);
+
+	/* Allocate a virtual interrupt number */
+	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node),
+				      affinity);
+	if (virq <= 0) {
+		pr_debug("-> virq allocation failed\n");
+		return 0;
+	}
+
+	if (irq_domain_associate(domain, virq, hwirq)) {
+		irq_free_desc(virq);
+		return 0;
+	}
+
+	pr_debug("irq %lu on domain %s mapped to virtual irq %u\n",
+		hwirq, of_node_full_name(of_node), virq);
+
+	return virq;
+}
+
 /**
  * irq_create_mapping_affinity() - Map a hardware interrupt into linux irq space
  * @domain: domain owning this hardware interrupt or NULL for default domain
@@ -684,49 +712,27 @@ EXPORT_SYMBOL_GPL(irq_create_direct_mapp
  * on the number returned from that call.
  */
 unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
-				       irq_hw_number_t hwirq,
-				       const struct irq_affinity_desc *affinity)
+					 irq_hw_number_t hwirq,
+					 const struct irq_affinity_desc *affinity)
 {
-	struct device_node *of_node;
 	int virq;
 
-	pr_debug("irq_create_mapping(0x%p, 0x%lx)\n", domain, hwirq);
-
-	/* Look for default domain if nececssary */
+	/* Look for default domain if necessary */
 	if (domain == NULL)
 		domain = irq_default_domain;
 	if (domain == NULL) {
 		WARN(1, "%s(, %lx) called with NULL domain\n", __func__, hwirq);
 		return 0;
 	}
-	pr_debug("-> using domain @%p\n", domain);
-
-	of_node = irq_domain_get_of_node(domain);
 
 	/* Check if mapping already exists */
 	virq = irq_find_mapping(domain, hwirq);
 	if (virq) {
-		pr_debug("-> existing mapping on virq %d\n", virq);
+		pr_debug("existing mapping on virq %d\n", virq);
 		return virq;
 	}
 
-	/* Allocate a virtual interrupt number */
-	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node),
-				      affinity);
-	if (virq <= 0) {
-		pr_debug("-> virq allocation failed\n");
-		return 0;
-	}
-
-	if (irq_domain_associate(domain, virq, hwirq)) {
-		irq_free_desc(virq);
-		return 0;
-	}
-
-	pr_debug("irq %lu on domain %s mapped to virtual irq %u\n",
-		hwirq, of_node_full_name(of_node), virq);
-
-	return virq;
+	return __irq_create_mapping_affinity(domain, hwirq, affinity);
 }
 EXPORT_SYMBOL_GPL(irq_create_mapping_affinity);
 
@@ -866,7 +872,7 @@ unsigned int irq_create_fwspec_mapping(s
 			return 0;
 	} else {
 		/* Create mapping */
-		virq = irq_create_mapping(domain, hwirq);
+		virq = __irq_create_mapping_affinity(domain, hwirq, NULL);
 		if (!virq)
 			return virq;
 	}


Patches currently in stable-queue which might be from stable-owner@vger.kernel.org are

queue-5.4/irqdomain-fix-mapping-creation-race.patch
queue-5.4/irqdomain-refactor-__irq_domain_alloc_irqs.patch
queue-5.4/irqdomain-look-for-existing-mapping-only-once.patch

