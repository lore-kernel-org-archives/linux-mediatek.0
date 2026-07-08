Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9939C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Brmbfs6RPXs03BhYiS0ot6De5Oja1VZ3H8esF8uHn1Q=; b=top9gxjkd07RlXwTzfCS8906MV
	J29ADXXFiPYpOAoAgcn3j0J9DorFGnFeEho727EA94fi13c/rMVeDyjgp8T2byyiVNJ9s2fHmY1XJ
	oaKIH8B4G5qaWAKKrwyjW7dGaP/dv4CWsYVHVE0uKnEtvsjMXK3gLu3XMwgPLRyDbGIE3fJubiAnd
	AAv6b4s+yEaXJ0QoSIrPmPWTsVjk4LNIJz4Q6VIVHuJpG/nQoyNeyEzpbDT2N12cGPxCzLRTVbHZ4
	CMy+uOWaiNA6UuIzsHx6XfXTDIT3cp+5/12WaQMxufXwMcnJJojv/h2p/VxJag2CaH0Isxm2huv1n
	19ArwaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQZL-0000000H1jF-1Qfj;
	Wed, 08 Jul 2026 11:35:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQZJ-0000000H1i9-37h4
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:35:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caea3f742bso9945715ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510557; x=1784115357; darn=lists.infradead.org;
        h=mime-version:content-type:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Brmbfs6RPXs03BhYiS0ot6De5Oja1VZ3H8esF8uHn1Q=;
        b=W9stuC1K4Xy2OLko6guHAglKWQVkT3z70HPwxVStgB2yhxyZxPgGYIwajb12PoLbqR
         E7kaLLQzeOQysbOSnI40jV/1wgeapytOdCFJmPIke75NSDpvuQZKw+vjSWVasTnFoUTx
         a9SIkcz1+pZvAlVbEKVlyl4GHShAxLZxLnl21dTFyllKpMdaZwoQdiYD27NbaXUc9+q/
         jRp58qYreAiOelVHGjOFF4t9KAs7sne8lcjTDeg8anL6SUMr3oIq1D4S0LOWtVRLjuQv
         IWgxsYj505923CZeh0M0ve2oTJmMd6+1mTDL36sMF1WWds4s55swzGj+KVU7kmxdaPw9
         KkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510557; x=1784115357;
        h=mime-version:content-type:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Brmbfs6RPXs03BhYiS0ot6De5Oja1VZ3H8esF8uHn1Q=;
        b=SpXw/EasJoYJOr2csDhqovLykyPaDoVIZ06v4IIlElxeTK4XSGSZruQXgKsPNactlD
         pP1bzmECcRTA+9OmmqQFjSG5kKq4foes1NeAcSCwpJg4pcs7Fvepyq1DEile4j5VmoQU
         8h8IfsFIj6M02DnLrAxesXdZ4mClAsdXF/h7C3mboAF+7x09rCYkiazCUYLTqMuNm37u
         tjrhM5DB9cteXLkGI5QX3YIPgOKFeQjGwNCw9OVlrgdcPa7BSTg875sdMo1/VRU3THcT
         7xZ7xD/IlnXG5aRXUEml3AERgUV6s/q9ycP9GQlDckivnWjW6GyGqR4M0pJGCLpj5OGr
         o/tA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4BnD1rYkECUlRT1BwZeLE2p/KcgrTv4DY70fY8eU+6fL7JDWpmcYpUtJ2ULTXAGIEsR2DZJ0ze++884C2dw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpr0WYuEJ6KHIJSkARBRjIzc+1jupErNGkiFlfhYhxpC09S10M
	p66dViDVb2HULcR1cDM8S/jfamund13NHaGv+uxBSkm/R8KNHg5n8gKC
X-Gm-Gg: AfdE7clsOmdEg0apXnwyPcMS4zGbJuMZ5vCLmE/2VWeijkfuQDlzBs8nJ3RR4L5XyKT
	qhK+2HSDgzLvfq7L5/Yq2sH6Xxa2RPEM9aQ2hGvc7DcSNIMi+oPnkDx+4XKMcOcfFJ4dAAQ2/Ws
	K1L8IYT/coa2OsSuNAK2tLNwCMMYfaRUUE6pfsiJL9jKiko1NJAwZgfdnR8eDdSA1XlFvUrK3Uc
	Lhjk0eIJT0vA5FV8lPuvjN6W29VHu+g8I5fRvQiRN8sR2FfALnqPcahH7NyZ+DQCvDTaVsPDTcr
	BfvJcloa7JxtjOQTF2CLiwfZdWO7na0LUa2DsAeZ+acwJxkRZHPVVRQRx/WdhgNHkewnbRCOMS4
	QSrAnlHn5bt1OZKtHAg/70ghy/p390tCNvBoF+BzeQCleYg0mLY4v7peYrWgKQ1WTfhmdY2eGLh
	/uFQAynQ==
X-Received: by 2002:a17:903:2411:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2ccea394d5dmr21404765ad.12.1783510556811;
        Wed, 08 Jul 2026 04:35:56 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm26989615ad.76.2026.07.08.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:35:56 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: airoha: Fix DMA direction for NPU mailbox buffer
Date: Wed, 8 Jul 2026 19:35:29 +0800
Message-ID: <178351055214.98729.11403147818632027428@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043557_784528_D9A5F820 
X-CRM114-Status: GOOD (  13.33  )
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

airoha_npu_send_msg() always maps the mailbox buffer with DMA_TO_DEVICE,
but some callers expect the NPU to write response data back into the
same buffer:

- airoha_npu_wlan_msg_get() (NPU_OP_GET): NPU writes response into
  the buffer, then the caller reads it via memcpy()
- airoha_npu_ppe_stats_setup() (NPU_OP_SET): NPU writes back
  npu_stats_addr field in the response

On non-cache-coherent architectures like EN7581 (Cortex-A53 without
hardware cache coherency for NPU DMA), DMA_TO_DEVICE unmap is a no-op
— it does not invalidate the CPU cache. If the NPU-written cache line
is still present in the CPU cache when the caller reads the buffer,
the CPU observes stale data instead of the NPU response.

This is a timing-sensitive bug: small mailbox buffers (~24 bytes)
typically fit in a single cache line and may survive in the cache
until the caller reads them, producing silent data corruption rather
than a crash. The bug is more likely to trigger when the caller reads
the response immediately after dma_unmap_single() without intervening
cache-evicting operations.

Fix by using DMA_BIDIRECTIONAL for both map and unmap, which ensures
dma_unmap_single() invalidates the CPU cache on non-coherent systems.
The mailbox buffers are small so there is no performance concern.

Fixes: c52918744ee1e49cea86622a2633b9782446428f ("net: airoha: npu: Move memory allocation in airoha_npu_send_msg() caller")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 870d61fdd9c6..b679bed952de 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -168,7 +168,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	dma_addr_t dma_addr;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_TO_DEVICE);
+	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
 		return ret;
@@ -191,7 +191,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 
 	spin_unlock_bh(&npu->cores[core].lock);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_TO_DEVICE);
+	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
 
 	return ret;
 }
-- 
2.51.0



