Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86097C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5g9v4ASA5f/JHYVWYZxTH/xNnLlWpbBqKg3fw2p+EE=; b=IJZY38yJ+MANnthnzuHbRTfcxI
	N7b0ZE3dilHgtM3RMoSNEg2JPofpvpwUmJKstE72yQXK72ZoyUa6HP+HI6Bq4LTksZStCbD96aXsW
	1yqb24CwJCyvR6StuSS/b+1OgakDbH6B2tW1wk+W4YZpOFbRuanqZCij+oSR9fUgnW8MQYbj5/nXW
	jwb5lnWJ6Ao2nBpH1P96eQa97uUfFAoZxgP3krU/A9GN40dqB30s4dr3BOWMO/9PUJcrjTgZ1HJqb
	Fc5lbCf02WrsaqlM7XtOdqrH9NMu9SX1vjWBLkzTZnDODqU8mCm2ctFgS47JmcKy8oaXVN2XLQiKG
	9beVjmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyHc-003IDh-HL; Fri, 18 Nov 2022 10:07:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyGs-003Htq-6r; Fri, 18 Nov 2022 10:06:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C7A2E6602AAC;
	Fri, 18 Nov 2022 10:06:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668766011;
	bh=QOSVYgDuSw/AruRHLOIb5Uuh3Eeoa+7i4jEcJJGvLBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f4wbd56N6eNhgpRE/cIv/WyvGs2aus9tBoIJQJqYjXuYM4oh0pMn51GNrgIAKwbYJ
	 7sLM+S6q5JVe/1Dlx1627E5OUH8Akl0YgrSkm8Ky0MzIfDU41puH3iKP+FrDKtqb7k
	 bdk5Szb/jdtgReOvr0mYGORtx0WONiUMt3vQVu1KXGXcTzOYbAhKjTu5zI9OBTVIHI
	 H4khL6BEqfKADgALCBlpUcQ80sBtxKa1oFc2LUofjlgL0ZCW1InkRc4oGw9Z4ZW1Gt
	 fAvfzRJ1xHqapMi0BhsDZx9no9PLKaD8DgZlRbptNPEBEBRaGNBNvkoV7wesd9KTuR
	 KRdC2EAWUDfFA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	youlin.pei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 4/4] irqchip: irq-mtk-cirq: Add support for System CIRQ on MT8192
Date: Fri, 18 Nov 2022 11:06:39 +0100
Message-Id: <20221118100639.33704-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
References: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_020654_434109_C2638FC0 
X-CRM114-Status: GOOD (  16.20  )
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

On some SoCs the System CIRQ register layout is slightly different,
as there are more registers per function and in some cases other
differences later in the layout: this is seen on at least MT8192,
but it's also valid for some other "contemporary" SoCs both for
Chromebooks and for smartphones.

Add the new "v2" register layout and use it if the compatible
"mediatek,mt8192-cirq" is found; to retain compatibility with
older devicetrees and/or with SoCs that don't need any register
layout variation, if no "special" compatible is found, we use
the "v1" register layout by default.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/irqchip/irq-mtk-cirq.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index affbc0f48550..8d6b3d9c40cf 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -40,6 +40,18 @@ static const u32 mtk_cirq_regs_v1[] = {
 	[CIRQ_CONTROL]	= 0x300,
 };
 
+static const u32 mtk_cirq_regs_v2[] = {
+	[CIRQ_STA]	= 0x0,
+	[CIRQ_ACK]	= 0x80,
+	[CIRQ_MASK_SET]	= 0x180,
+	[CIRQ_MASK_CLR]	= 0x200,
+	[CIRQ_SENS_SET]	= 0x300,
+	[CIRQ_SENS_CLR]	= 0x380,
+	[CIRQ_POL_SET]	= 0x480,
+	[CIRQ_POL_CLR]	= 0x500,
+	[CIRQ_CONTROL]	= 0x600,
+};
+
 #define CIRQ_EN	0x1
 #define CIRQ_EDGE	0x2
 #define CIRQ_FLUSH	0x4
@@ -262,12 +274,15 @@ static inline void mtk_cirq_syscore_init(void) {}
 #endif
 
 static const struct of_device_id mtk_cirq_of_match[] = {
-	{ .compatible = "mediatek,
+	{ .compatible = "mediatek,mt8192-cirq", .data = &mtk_cirq_regs_v2 },
+	{ /* sentinel */ }
+};
 
 static int __init mtk_cirq_of_init(struct device_node *node,
 				   struct device_node *parent)
 {
 	struct irq_domain *domain, *domain_parent;
+	const struct of_device_id *match;
 	unsigned int irq_num;
 	int ret;
 
@@ -298,7 +313,11 @@ static int __init mtk_cirq_of_init(struct device_node *node,
 	if (ret)
 		goto out_unmap;
 
-	cirq_data->regs = mtk_cirq_regs_v1;
+	match = of_match_node(mtk_cirq_of_match, node);
+	if (match)
+		cirq_data->regs = match->data;
+	else
+		cirq_data->regs = mtk_cirq_regs_v1;
 
 	irq_num = cirq_data->ext_irq_end - cirq_data->ext_irq_start + 1;
 	domain = irq_domain_add_hierarchy(domain_parent, 0,
-- 
2.38.1


