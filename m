Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59BAC55174
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AB188XGB4sbY3JcvO+RtPjAq1fA2l4207oGcIEuttd0=; b=Oqls2t+Ftt1LVyNmUnp++KDjMY
	NyP76kQlO/cAmN2w7D3lTotfzSa3u9v1ZtWYWmpybs/z/GaiJ9ux2ato8M+JXyAB79XhqfdLT6+p5
	bFNv7eC+ILjGlOc6XzvyPm6la239XoQ4calEl6qIjWk7q9Z6YCDGMKNRcqoJH9dLBhK/8SIBM1qVT
	5VWXTbYJDh9jBWTwamRlQ0dYcfADGElyvyLnOT8IZa3fLBIvKKbatj4tVnMgsHUeUTnLIlUk6P1BX
	bPQ3w7ZoXV3x7zQHWXQRjUA2EfKusd7CA+32YLIKEWzZ26MCsWQkKN7uLiPJ3DbPZmG3x5zwyCZFQ
	apZVhdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVl7-00000003NMX-2xk2;
	Wed, 05 Aug 2026 07:09:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVl4-00000003NLX-2HEI
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 07:09:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49557167508so5398575e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913784; x=1786518584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AB188XGB4sbY3JcvO+RtPjAq1fA2l4207oGcIEuttd0=;
        b=Zmd250JP9XjGtUOnPFTnNZdltGx++3X0ytGmoupNQ3H/GHglw86oyBKL2s6fVFjyBI
         Sa7BIxKv6hZfoY6VHM80rfFp29jku7gJiIoy8WFqpp1aKLfnCGdwYYXU5NfD301y0GBb
         kR6GKqmelJItOl+jdpZd6jryZ+ou5QAZsW+fpYX1X/eqWsakPcHkxflpeKsUssNj8dGD
         +v25rZw8Cz9NKRzu6TcVUGJBkfzNCu46TTCYSTY3g6CQSHs+9PARWHwI8GmZgkpB100i
         L5jE2mtpQnBsB+jh5YhRJbaPXQ4qhCRiI5f9QaX+O0RU9Vnm4oRF7q8swJUB6W54Jr+p
         p3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913784; x=1786518584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AB188XGB4sbY3JcvO+RtPjAq1fA2l4207oGcIEuttd0=;
        b=nl8AXVhAat/3br/Xx/W025zf47bqzxpGdSvYqIYSAHJoaN+3QsuuYEToLkG4JBat9O
         wiMX4pHjzbo+Imnc5qCjWXPf1ZdjeZsEXKdkM9Y/xOETBIctXb3hIl2xijr6BwHyUP2m
         9jL0tpYqoiztr9BhPrEA7MHmy3z8k/Q5DsKjisl5L/Oi7GgrEKQXsWP7c1aFcRIbSXM4
         pit8yrqctAKqyzCgPGemBikArvIilkaRh87JF3hjq9JwlIUpqzaCrn4orrQJfjm1AKnv
         B/cJLSJkkIYuSVh5alBTl3AKGlSM6Kz3yoB98mFSzJyZrR75UyD5gRXkstqNnuSvxee6
         FhBg==
X-Forwarded-Encrypted: i=1; AHgh+RqeRupQ6CW8cTxQDYqKph2GIpRhpSa1frOSXa+ebd9epIu2A+L0E+48r7bPoz0Qm4zyfz1OczrlucJC0lO16w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDTdvIVaPh6P03Yf9LSrg7MO9PeGlocGH9UHW6jy4TYOl9KtJg
	1nIjIzQjygJgKdpbIrIK32UaWchnMHCRnJN2IX6oCjaNvKX8IL3mFkGb
X-Gm-Gg: AR+sD106RoK/k4VkPPtjy4Q8Rqx+MPurJPQDrD3tHZsLpERU1UidmocrZ/6vBk1te+7
	J8OAtE5dXqf0QR/E+gMMOmyeIpshi2i43MjyRKwaxKi1549MgK8Ygr8YzBmJkKWJRweaidTp5XA
	uTNintIr+RZNGgQsLTq4O4WPdrUdWTtkfaqvgwYG8BruGTBFNYbspTyIUNGUbJx3Ye1qPjxsEw6
	0L0FFY5nIqazYbBJsTlXKZRyeLz5LhGe7XJk5ftXoqgRH1S5CuJJ28UmcXQVUO43GIY3gyP1jGf
	831o1FOX6b12YFpzOSnvcu8O4fqV92PgjAyQaMedj/Wp0dbA2X9lKXwExA+sa576L0vKxrlbzZm
	WqgfEGaEUe2yrdMxAKNhhT8Q1dNuSiFDaRMS0A0lTjkf2p+X//iZKCiE+hrtH2xgA5SLdGS/2ro
	D0KiHUzV2Pu+Hzi10L3ciMiGLWF9NrPSCVPFDE6qMu17nBDpGVAMKGdueomXBEpLeSew==
X-Received: by 2002:a05:600c:138a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4994e714d8fmr46447075e9.6.1785913783962;
        Wed, 05 Aug 2026 00:09:43 -0700 (PDT)
Received: from fedora ([46.205.219.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4c32e0sm35567225e9.0.2026.08.05.00.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:09:43 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH] net: airoha: npu: use coherent DMA for mailbox messages
Date: Wed,  5 Aug 2026 09:08:51 +0200
Message-ID: <20260805070851.2885888-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_000946_599852_FC91D0B6 
X-CRM114-Status: GOOD (  11.28  )
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

Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
non-coherent CPUs invalidate caches before reading NPU GET responses.

On EN7581 + MT7996 that change regresses probe: the mailbox completes
successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
mt76 never binds NPU offload. Healthy boards report 0.1111.

Mailbox messages are tiny and already copied by the caller. Bounce
through dma_alloc_coherent() so the CPU observes the NPU-written
response without relying on streaming DMA direction.

Verified on Quantum Fiber W1700K (EN7581 + MT7996).

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..d2f6c9c084b8 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -166,12 +166,21 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
 	dma_addr_t dma_addr;
+	void *dma_buf;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	/*
+	 * Mailbox payloads are small and bidirectional (CPU sets the
+	 * request, NPU writes the response). Streaming DMA_BIDIRECTIONAL
+	 * mapping regresses EN7581+MT7996: MBOX reports success but
+	 * WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0. Use a
+	 * coherent bounce buffer so the CPU always sees the NPU response.
+	 */
+	dma_buf = dma_alloc_coherent(npu->dev, size, &dma_addr, GFP_ATOMIC);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	memcpy(dma_buf, p, size);
 
 	spin_lock_bh(&npu->cores[core].lock);
 
@@ -191,7 +200,9 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 
 	spin_unlock_bh(&npu->cores[core].lock);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	if (!ret)
+		memcpy(p, dma_buf, size);
+	dma_free_coherent(npu->dev, size, dma_buf, dma_addr);
 
 	return ret;
 }
-- 
2.55.0


