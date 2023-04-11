Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4F6C77B70
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LIBqE8FZsoaESs+GAtEI/nn8CE8DRnEXLdt5ZWBj1jQ=; b=H8U30LzdNrv9SDKK7u+gZ1Qsnf
	WdRIqfFhmPjSaBVvwzCUrym1d0Qoglf5J8BbSylMiRGxTziu5cEiX9uwrNbVBP0O41u5C/A0vV6yF
	+Kg8cNPYHRianzZ0NUdd0vuDBmP9z9+FOHCj21lz66YZSp+PDMFHUDQ+p8TmqCmHZkmMkiR96oaav
	kGyPyFI658saxG/iW6ka0yA06C8reHSl8PMFOiWHYNb6qKHQ1GwLuB0cGMiEVZwz0x2R5u3U5pz6D
	0BVtNiWN/gqZMOXi3zt9hry2N+0XZXDOfliLq7ik5o58HCPa23Oab2ANK3Wj+qyJP9oA6xi52Xpvv
	zkjy8w+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEqX-000Ebq-2r;
	Tue, 11 Apr 2023 14:19:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEqT-000EaF-15;
	Tue, 11 Apr 2023 14:19:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E08DA62762;
	Tue, 11 Apr 2023 14:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1348C433EF;
	Tue, 11 Apr 2023 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681222780;
	bh=N+Y91iEgJC37hlMY8dkXPDU/vbHOpnpX2RSWZPcUV6M=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=tX/E9Szls/Oq1rN3t5wczkXtBRujKUs+mP8zRdQysNvt4maEJQrFBOFTmyaKtm8JY
	 4rPfKNLBzWXmn6/osZvdxCBqWQBxoUdscJhqqCPYUv8CWYGWtzjK8x3tHEg4RhcVJp
	 r9pDItOXEqndOR0kIS0PrvVmW7+04O7l6B4yMBDk=
Subject: Patch "irqdomain: Fix mapping-creation race" has been added to the 5.4-stable tree
To: dtor@chromium.org,gregkh@linuxfoundation.org,hsinyi@chromium.org,johan+linaro@kernel.org,jonathanh@nvidia.com,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,mark-pk.tsai@mediatek.com,matthias.bgg@gmail.com,maz@kernel.org,sashal@kernel.org,tglx@linutronix.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 11 Apr 2023 16:19:37 +0200
In-Reply-To: <20230322124550.29812-3-mark-pk.tsai@mediatek.com>
Message-ID: <2023041137-carmaker-tactics-f7a5@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_071941_443948_F47C71F2 
X-CRM114-Status: GOOD (  25.03  )
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

    irqdomain: Fix mapping-creation race

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     irqdomain-fix-mapping-creation-race.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable-owner@vger.kernel.org Wed Mar 22 13:46:07 2023
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Date: Wed, 22 Mar 2023 20:45:50 +0800
Subject: irqdomain: Fix mapping-creation race
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, <stable@vger.kernel.org>, Dmitry Torokhov <dtor@chromium.org>, Jon Hunter <jonathanh@nvidia.com>, Sasha Levin <sashal@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Message-ID: <20230322124550.29812-3-mark-pk.tsai@mediatek.com>

From: Johan Hovold <johan+linaro@kernel.org>

[ Upstream commit 601363cc08da25747feb87c55573dd54de91d66a ]

Parallel probing of devices that share interrupts (e.g. when a driver
uses asynchronous probing) can currently result in two mappings for the
same hardware interrupt to be created due to missing serialisation.

Make sure to hold the irq_domain_mutex when creating mappings so that
looking for an existing mapping before creating a new one is done
atomically.

Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
Fixes: b62b2cf5759b ("irqdomain: Fix handling of type settings for existing mappings")
Link: https://lore.kernel.org/r/YuJXMHoT4ijUxnRb@hovoldconsulting.com
Cc: stable@vger.kernel.org      # 4.8
Cc: Dmitry Torokhov <dtor@chromium.org>
Cc: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20230213104302.17307-7-johan+linaro@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/irq/irqdomain.c |   64 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 18 deletions(-)

--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -25,6 +25,9 @@ static DEFINE_MUTEX(irq_domain_mutex);
 
 static struct irq_domain *irq_default_domain;
 
+static int irq_domain_alloc_irqs_locked(struct irq_domain *domain, int irq_base,
+					unsigned int nr_irqs, int node, void *arg,
+					bool realloc, const struct irq_affinity_desc *affinity);
 static void irq_domain_check_hierarchy(struct irq_domain *domain);
 
 struct irqchip_fwid {
@@ -672,9 +675,9 @@ unsigned int irq_create_direct_mapping(s
 }
 EXPORT_SYMBOL_GPL(irq_create_direct_mapping);
 
-static unsigned int __irq_create_mapping_affinity(struct irq_domain *domain,
-						  irq_hw_number_t hwirq,
-						  const struct irq_affinity_desc *affinity)
+static unsigned int irq_create_mapping_affinity_locked(struct irq_domain *domain,
+						       irq_hw_number_t hwirq,
+						       const struct irq_affinity_desc *affinity)
 {
 	struct device_node *of_node = irq_domain_get_of_node(domain);
 	int virq;
@@ -689,7 +692,7 @@ static unsigned int __irq_create_mapping
 		return 0;
 	}
 
-	if (irq_domain_associate(domain, virq, hwirq)) {
+	if (irq_domain_associate_locked(domain, virq, hwirq)) {
 		irq_free_desc(virq);
 		return 0;
 	}
@@ -725,14 +728,20 @@ unsigned int irq_create_mapping_affinity
 		return 0;
 	}
 
+	mutex_lock(&irq_domain_mutex);
+
 	/* Check if mapping already exists */
 	virq = irq_find_mapping(domain, hwirq);
 	if (virq) {
 		pr_debug("existing mapping on virq %d\n", virq);
-		return virq;
+		goto out;
 	}
 
-	return __irq_create_mapping_affinity(domain, hwirq, affinity);
+	virq = irq_create_mapping_affinity_locked(domain, hwirq, affinity);
+out:
+	mutex_unlock(&irq_domain_mutex);
+
+	return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_mapping_affinity);
 
@@ -834,6 +843,8 @@ unsigned int irq_create_fwspec_mapping(s
 	if (WARN_ON(type & ~IRQ_TYPE_SENSE_MASK))
 		type &= IRQ_TYPE_SENSE_MASK;
 
+	mutex_lock(&irq_domain_mutex);
+
 	/*
 	 * If we've already configured this interrupt,
 	 * don't do it again, or hell will break loose.
@@ -846,7 +857,7 @@ unsigned int irq_create_fwspec_mapping(s
 		 * interrupt number.
 		 */
 		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
-			return virq;
+			goto out;
 
 		/*
 		 * If the trigger type has not been set yet, then set
@@ -854,35 +865,45 @@ unsigned int irq_create_fwspec_mapping(s
 		 */
 		if (irq_get_trigger_type(virq) == IRQ_TYPE_NONE) {
 			irq_data = irq_get_irq_data(virq);
-			if (!irq_data)
-				return 0;
+			if (!irq_data) {
+				virq = 0;
+				goto out;
+			}
 
 			irqd_set_trigger_type(irq_data, type);
-			return virq;
+			goto out;
 		}
 
 		pr_warn("type mismatch, failed to map hwirq-%lu for %s!\n",
 			hwirq, of_node_full_name(to_of_node(fwspec->fwnode)));
-		return 0;
+		virq = 0;
+		goto out;
 	}
 
 	if (irq_domain_is_hierarchy(domain)) {
-		virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, fwspec);
-		if (virq <= 0)
-			return 0;
+		virq = irq_domain_alloc_irqs_locked(domain, -1, 1, NUMA_NO_NODE,
+						    fwspec, false, NULL);
+		if (virq <= 0) {
+			virq = 0;
+			goto out;
+		}
 	} else {
 		/* Create mapping */
-		virq = __irq_create_mapping_affinity(domain, hwirq, NULL);
+		virq = irq_create_mapping_affinity_locked(domain, hwirq, NULL);
 		if (!virq)
-			return virq;
+			goto out;
 	}
 
 	irq_data = irq_get_irq_data(virq);
-	if (WARN_ON(!irq_data))
-		return 0;
+	if (WARN_ON(!irq_data)) {
+		virq = 0;
+		goto out;
+	}
 
 	/* Store trigger type */
 	irqd_set_trigger_type(irq_data, type);
+out:
+	mutex_unlock(&irq_domain_mutex);
 
 	return virq;
 }
@@ -1788,6 +1809,13 @@ void irq_domain_set_info(struct irq_doma
 	irq_set_handler_data(virq, handler_data);
 }
 
+static int irq_domain_alloc_irqs_locked(struct irq_domain *domain, int irq_base,
+					unsigned int nr_irqs, int node, void *arg,
+					bool realloc, const struct irq_affinity_desc *affinity)
+{
+	return -EINVAL;
+}
+
 static void irq_domain_check_hierarchy(struct irq_domain *domain)
 {
 }


Patches currently in stable-queue which might be from stable-owner@vger.kernel.org are

queue-5.4/irqdomain-fix-mapping-creation-race.patch
queue-5.4/irqdomain-refactor-__irq_domain_alloc_irqs.patch
queue-5.4/irqdomain-look-for-existing-mapping-only-once.patch

