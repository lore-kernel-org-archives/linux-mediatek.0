Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB3BC87FCE
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Jul 2025 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyrlpHjBUe4v6pw/fZz2N7EP6KRf9hyOLmrgnXKo8QQ=; b=1H797OqDFTgEcklR8/ixiIpG/i
	UI/VyQBA5P90uS3+Nn7/27zttweN+VT09XKvTc9H5vYmzK3ui8TMIqZs4aevTdh2jyEQcFDzi0aKp
	4lbEabnetFeTebrWil/kWWTzq3OxIyJXuWV2t9c94bA87C86Wno8urMVVoBtbl/OHNdtHx0BhnR5r
	SzpvIt4ecwugtw8bX87K47rvTEkS47+MZfPHz+8N1Q3mzgI9oHIWPF+TEKA9gx4DWwyLWaKSc+aH6
	PE2iIOblcjbKZ0k7Um7ePD33+rdtmREyP/1rb46xeN0eMlTy331v9cA2w3VADV0jVwQ9f515kLQPC
	9XDkp0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug2nr-0000000CoB2-11YL;
	Sun, 27 Jul 2025 14:56:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug2Z3-0000000CmpB-1tU6;
	Sun, 27 Jul 2025 14:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB381437CE;
	Sun, 27 Jul 2025 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E5AC4CEEB;
	Sun, 27 Jul 2025 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753627284;
	bh=cX/HRgKUv5mN0HkYY9Vsqmoc/0+HmSRb2AgJ74dpsRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c8LdgEe6PrGD3zD8oEVzrvqu/6vEHI/Vc4puGSxarJrL7Xtyveo/fr+pgsvv1CqQT
	 WWnYK4u7px+RmRFGkve5QIK4S5S2fJm0H9WU/JHOieC5FlNI+JaG5O76w8fTvvYe7M
	 QndE/wNTRylWD6GLiRIf3zgW0Qv+U06+MT3jrbtmtydnwT9WuPSijGp6IrOJuonoZ4
	 786sNEs7WjHMqbw4u4qoyXkzLyT7qVKgqxgDMkOJ//K5f6dPn3WIZrj0N98Es2W8ow
	 ElJAHhE9nmsyRWdK4Nr3a7IyKiZgsN7o04Z0DAQns01HgSG7kKlzaI6WOjV8ikLQPP
	 ZTLk/I6o9cjGw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 27 Jul 2025 16:40:50 +0200
Subject: [PATCH net-next v6 5/7] net: airoha: npu: Read NPU wlan interrupt
 lines from the DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-airoha-en7581-wlan-offlaod-v6-5-6afad96ac176@kernel.org>
References: <20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org>
In-Reply-To: <20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_074125_516372_920632D3 
X-CRM114-Status: GOOD (  14.00  )
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

Read all NPU wlan IRQ lines from the NPU device-tree node.
NPU module fires wlan irq lines when the traffic to/from the WiFi NIC is
not hw accelerated (these interrupts will be consumed by the MT76 driver
in subsequent patches).
This is a preliminary patch to enable wlan flowtable offload for EN7581
SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 9 +++++++++
 drivers/net/ethernet/airoha/airoha_npu.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 95de323cb0801fb789bbbafacabb48d21d93f63b..6ad8715f3b71ef217a6097f135fe2d6995be7f8c 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -685,6 +685,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
 		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
 	}
 
+	/* wlan IRQ lines */
+	for (i = 0; i < ARRAY_SIZE(npu->irqs); i++) {
+		irq = platform_get_irq(pdev, i + ARRAY_SIZE(npu->cores) + 1);
+		if (irq < 0)
+			return irq;
+
+		npu->irqs[i] = irq;
+	}
+
 	err = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 	if (err)
 		return err;
diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
index e913e45a0679be9634c289afef71fb88f728427b..8dd317bc3549c09dea7bd828587bcf701f74ac27 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ b/drivers/net/ethernet/airoha/airoha_npu.h
@@ -5,6 +5,7 @@
  */
 
 #define NPU_NUM_CORES		8
+#define NPU_NUM_IRQ		6
 
 enum airoha_npu_wlan_set_cmd {
 	WLAN_FUNC_SET_WAIT_PCIE_ADDR,
@@ -68,6 +69,8 @@ struct airoha_npu {
 		struct work_struct wdt_work;
 	} cores[NPU_NUM_CORES];
 
+	int irqs[NPU_NUM_IRQ];
+
 	struct airoha_foe_stats __iomem *stats;
 
 	struct {

-- 
2.50.1


