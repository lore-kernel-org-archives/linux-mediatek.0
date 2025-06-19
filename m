Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF65C7115B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pDnJHSJ6ginhDEPBUkksXr1DVb0PlSf7TJRRMjRATA=; b=aWIuo3vVsfcpNq418Udkzu7R9Y
	4dgVXGetXAl5C+Ga+R3gJMe1P99w0TfHoTvEnkUC8xRKD2EJXP86S6wqBqvruc0yjDL2heq4QeKFz
	PT/dXMPe7eLEfBQViSQk4ESQReDV0kO4hfxURLN+ydccRYxKBavtut1Kl8LHtHYBr9E7UIlz7PwrY
	vVPoINrLAAU3Fy8KLUZzjbmTuaXMXDJoL7T7F6M6bqFwQkEClGQyKIRBofiXVnG4me4X6TqIFWCOr
	Et3eLPHRbBkSqownp+Klv4A0admJFq5KN30QIJgkhx+xLk3AAdUCuvajZyUxEchJ0Y8sHWRYuAIni
	HvpPexhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9zY-0000000CLGK-1lRt;
	Thu, 19 Jun 2025 07:47:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9N6-0000000CG0V-1nRq;
	Thu, 19 Jun 2025 07:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D12DA52C2D;
	Thu, 19 Jun 2025 07:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79D3C4CEEA;
	Thu, 19 Jun 2025 07:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750316859;
	bh=XzlQTlIP0+twJXa+kEklTGPKwMc8r1JBvRVvfulVsNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P48eqC4Tb9pm9kxnwJokSgR9j6hWYXokhc/5y2JDldv0JuHKmvhxxMQ9wE8dTy7lU
	 jEZ2MlLqUJ7Ggwk1V0moBD4mZhTPyMLJW+4pFcynrDsJJzrGRYShxGgBu2Cj0w473w
	 lqj1PQMmhBK7biyfcxlyEnbH2Y9nfMkhzLx43+vOVdORHBHxr+SDjxBWUDY6yRVG2q
	 Q02xQdBnV89BKIww0iADai7KgDacXsy5V8+PgZSV793A6TMF9eY8lpGAgQsXEufo58
	 E+D/neUGGeAH7GfCYfHOkxgdPPENg32E8fCO/q/mhLsSHNLazzDgQdoqgFC/6o/yIn
	 7xRxTtuod5MEg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 19 Jun 2025 09:07:25 +0200
Subject: [PATCH net v4 2/2] net: airoha: Differentiate hwfd buffer size for
 QDMA0 and QDMA1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-airoha-hw-num-desc-v4-2-49600a9b319a@kernel.org>
References: <20250619-airoha-hw-num-desc-v4-0-49600a9b319a@kernel.org>
In-Reply-To: <20250619-airoha-hw-num-desc-v4-0-49600a9b319a@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_000740_608500_0A6FC4EE 
X-CRM114-Status: GOOD (  12.59  )
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

EN7581 SoC allows configuring the size and the number of buffers in
hwfd payload queue for both QDMA0 and QDMA1.
In order to reduce the required DRAM used for hwfd buffers queues and
decrease the memory footprint, differentiate hwfd buffer size for QDMA0
and QDMA1 and reduce hwfd buffer size to 1KB for QDMA1 (WAN) while
maintaining 2KB for QDMA0 (LAN).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 1b7fd7ee0cbf3e1f7717110c70e9c5183fdd93d4..06dea3a13e77ce11f35dbd36966a34c5ef229c11 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1068,14 +1068,15 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 	int size, index, num_desc = HW_DSCP_NUM;
 	struct airoha_eth *eth = qdma->eth;
 	int id = qdma - &eth->qdma[0];
+	u32 status, buf_size;
 	dma_addr_t dma_addr;
 	const char *name;
-	u32 status;
 
 	name = devm_kasprintf(eth->dev, GFP_KERNEL, "qdma%d-buf", id);
 	if (!name)
 		return -ENOMEM;
 
+	buf_size = id ? AIROHA_MAX_PACKET_SIZE / 2 : AIROHA_MAX_PACKET_SIZE;
 	index = of_property_match_string(eth->dev->of_node,
 					 "memory-region-names", name);
 	if (index >= 0) {
@@ -1096,9 +1097,9 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 		/* Compute the number of hw descriptors according to the
 		 * reserved memory size and the payload buffer size
 		 */
-		num_desc = rmem->size / AIROHA_MAX_PACKET_SIZE;
+		num_desc = div_u64(rmem->size, buf_size);
 	} else {
-		size = AIROHA_MAX_PACKET_SIZE * num_desc;
+		size = buf_size * num_desc;
 		if (!dmam_alloc_coherent(eth->dev, size, &dma_addr,
 					 GFP_KERNEL))
 			return -ENOMEM;
@@ -1111,9 +1112,10 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 		return -ENOMEM;
 
 	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
+	/* QDMA0: 2KB. QDMA1: 1KB */
 	airoha_qdma_rmw(qdma, REG_HW_FWD_DSCP_CFG,
 			HW_FWD_DSCP_PAYLOAD_SIZE_MASK,
-			FIELD_PREP(HW_FWD_DSCP_PAYLOAD_SIZE_MASK, 0));
+			FIELD_PREP(HW_FWD_DSCP_PAYLOAD_SIZE_MASK, !!id));
 	airoha_qdma_rmw(qdma, REG_FWD_DSCP_LOW_THR, FWD_DSCP_LOW_THR_MASK,
 			FIELD_PREP(FWD_DSCP_LOW_THR_MASK, 128));
 	airoha_qdma_rmw(qdma, REG_LMGR_INIT_CFG,

-- 
2.49.0


