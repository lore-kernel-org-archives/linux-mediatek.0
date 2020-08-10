Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5B4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 19:10:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D221120885
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 19:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GANPXD2b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0mC8l0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D221120885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vk3DBc19ufex1oajdz9/vnY2sB2thiTFEjPQ5mCiJEI=; b=GANPXD2bOFJz2kQp2xdX0ymEo
	axk9w35iymZvTc8bpztn1zS/oW9MsSyUHgGaHvKJaKyaCRmhW9N2m7hXBE1xwfQhanRRgZgCJX/IN
	8plk04lvxm0HWxmwLwGrgF7ELcBPoQvLsKMbmQybMoUFXW3UB2kIqxVyV91Supl8qNuY1WcYetL1t
	d0CfoTTpKU7F7GUjkpaw97BDqVoQVY2+OO0r+qFEYWTtcPCXzhp+nwUUbgt6hJOW/sUt7HdmwiVJt
	1VNgbdrmWhfZ8ZSyQtuXiScWzliqpNwn6qJoPIJQ4KRCfh64X0eFUZvPy6HAZyrmU9twrQehThCTo
	MhIUvmdDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5DBO-00059D-Dk; Mon, 10 Aug 2020 19:10:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5DB1-0004wg-P5; Mon, 10 Aug 2020 19:09:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C1552224D;
 Mon, 10 Aug 2020 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086583;
 bh=7wBE4qxQd8JzuuczTOr2/54TrG7cCXcr/aXR5tTrfzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T0mC8l0nWoHigtZ5H06CwZYl0m30TLykAI/kYOH5aZBGq4nOoqaN12dc1ayhTZQIQ
 8fRzCXr0Hj/N2pOwwAUftTAIhIt3GeT+0CTvqKAl+XXdoYMn1FR25ie8LvuzZ9AyJd
 pXg8zniRFekpSF3JlUQpY/oo92eiaSLgx80sZTWw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 32/64] irqchip/irq-mtk-sysirq: Replace spinlock
 with raw_spinlock
Date: Mon, 10 Aug 2020 15:08:27 -0400
Message-Id: <20200810190859.3793319-32-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810190859.3793319-1-sashal@kernel.org>
References: <20200810190859.3793319-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_150944_020531_32DA7840 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

[ Upstream commit 6eeb997ab5075e770a002c51351fa4ec2c6b5c39 ]

This driver may take a regular spinlock when a raw spinlock
(irq_desc->lock) is already taken which results in the following
lockdep splat:

=============================
[ BUG: Invalid wait context ]
5.7.0-rc7 #1 Not tainted
-----------------------------
swapper/0/0 is trying to lock:
ffffff800303b798 (&chip_data->lock){....}-{3:3}, at: mtk_sysirq_set_type+0x48/0xc0
other info that might help us debug this:
context-{5:5}
2 locks held by swapper/0/0:
 #0: ffffff800302ee68 (&desc->request_mutex){....}-{4:4}, at: __setup_irq+0xc4/0x8a0
 #1: ffffff800302ecf0 (&irq_desc_lock_class){....}-{2:2}, at: __setup_irq+0xe4/0x8a0
stack backtrace:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7 #1
Hardware name: Pumpkin MT8516 (DT)
Call trace:
 dump_backtrace+0x0/0x180
 show_stack+0x14/0x20
 dump_stack+0xd0/0x118
 __lock_acquire+0x8c8/0x2270
 lock_acquire+0xf8/0x470
 _raw_spin_lock_irqsave+0x50/0x78
 mtk_sysirq_set_type+0x48/0xc0
 __irq_set_trigger+0x58/0x170
 __setup_irq+0x420/0x8a0
 request_threaded_irq+0xd8/0x190
 timer_of_init+0x1e8/0x2c4
 mtk_gpt_init+0x5c/0x1dc
 timer_probe+0x74/0xf4
 time_init+0x14/0x44
 start_kernel+0x394/0x4f0

Replace the spinlock_t with raw_spinlock_t to avoid this warning.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20200615074445.3579-1-brgl@bgdev.pl
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-mtk-sysirq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 73eae5966a403..6ff98b87e5c04 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -15,7 +15,7 @@
 #include <linux/spinlock.h>
 
 struct mtk_sysirq_chip_data {
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	u32 nr_intpol_bases;
 	void __iomem **intpol_bases;
 	u32 *intpol_words;
@@ -37,7 +37,7 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 	reg_index = chip_data->which_word[hwirq];
 	offset = hwirq & 0x1f;
 
-	spin_lock_irqsave(&chip_data->lock, flags);
+	raw_spin_lock_irqsave(&chip_data->lock, flags);
 	value = readl_relaxed(base + reg_index * 4);
 	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING) {
 		if (type == IRQ_TYPE_LEVEL_LOW)
@@ -53,7 +53,7 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 
 	data = data->parent_data;
 	ret = data->chip->irq_set_type(data, type);
-	spin_unlock_irqrestore(&chip_data->lock, flags);
+	raw_spin_unlock_irqrestore(&chip_data->lock, flags);
 	return ret;
 }
 
@@ -212,7 +212,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 		ret = -ENOMEM;
 		goto out_free_which_word;
 	}
-	spin_lock_init(&chip_data->lock);
+	raw_spin_lock_init(&chip_data->lock);
 
 	return 0;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
