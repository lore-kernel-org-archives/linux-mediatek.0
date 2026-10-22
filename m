Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608C2606A322
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ggP7h0Sx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU6Mx4VM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=; b=ggP7h0Sx9vmrsiLZobjw0tJxW7
	M+UEXVNbyVhc4C1OwghUmBqoP+cWEIa0HzFKMZMVm6no4TZTyFkEOnU8Nb6H70vc5K9plxbKusTqu
	tanUN27OARKQapSgmgB2R7Rcsvm/q+jAtnrG+R0NTX+MwBfkWMFPrTs4DQR4VPS5Ifn781cDq6OeS
	L6bHIxr9U0VkI9nWOALqwkRzP6RFYMkPY9J7tQcgvf4a85ATcNX3Y/vBsZk6iATQV7QNyne/NRWrR
	RdT01aLiSneYeOF9DG8xEWvf9XTUjOJYBSysjzFUyR1Dx+2U2s0vYVvnQ4vWzs538+2O18dgTfZm7
	BLCu+57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyet-0000000Eqjb-03RR;
	Thu, 22 Oct 2026 19:41:03 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyep-0000000Eqiu-4Ai5
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 19:41:01 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6dd059478dcso120035eaf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698059; x=1793302859; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=gU6Mx4VMKhfqBd3kwa/3dftGMUZT/UyMrX3jpMoIqi6+3iwXToxc4v4G1d7JHXS4L5
         8vtLNE6LtKVQyPdZaMgt6JpFvjt1VlH3EIAKOf3CeXCikpuOaJDsfGOocbZWrcMx3Yyu
         AQmjg5t20NZ9JfIP0FindMqA9XQ4415s4XIiyL5NvC5vDZAKJdNcfKqZHErOI57lc2CY
         YwpGEC1VXTF9XOi0A5Xj33uUPqAiRXOHvgqHoLUn13VtXuRk6cntE1tQDOAXTUDDDmdr
         G8Q+m6Dq9R2Z7lY71MgxdrSkF6b1DarQ+LJTnoGK3Ipfr1Fp83axz92BKp+7r0/OsPVQ
         Gx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698059; x=1793302859;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=HyRw0dN7JtZKGYHQjs0kL8XW8O3gVupCDzot4wXBNos4M0vspU1VJ/A9xkosx9uqlw
         cy45ukt9F01FNruorRbRrqFplp0cdJt4FfG+hIxxwpczcvumDP4ewzgAKXsdXLf5nLtt
         OsPgCTXqMOTvEf5QKk6SNAPUzgYieZQPlK1nWH97OOl5JHEqHlcOENYpOCUydpdBfgtE
         uXBL2lW/JGMqw8gkSQuWi5raYrojf8IWxAhAisw4kL9UJROPp1n232JWjO2LOxbLkKKW
         dR3bJ2V6GAVUB5DF7dbCGQ5ie+H3wq+KGCzwqzSMX/9jWIy62LuGHLvLmH2BrXIjwfhx
         n1xA==
X-Forwarded-Encrypted: i=1; AKwUvBwDG4b9g5EfrUhUibUxe8IuGILJpDLPAu/2cpQ0nUekMqXuC/MUrkLHRAShL1JHTUT18M8Z+uzqyI+Jfw6Nyg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIbxoSbbpGfutM8/hME8VEiaQ1503rFIx2NcMT20WwZmUfLNjZb
	iuZ3KjmI6x1wzBy+FQ02E7Qe3xRzORlCA07fdZRJPyfuf8vVvv18QtaM
X-Gm-Gg: AYBFou3Put9sQSY2EHzOBZTMYnfBrNBsb/ki7AecMa+cNfifj2aBViplKWrEYStR9bn
	1Ac2gTjIBBHcreFKu1MSqge8KeLzEmNqPCYdBWZ/jGM/7O1H1q6RdkkgkcpTT9NYLGIqGul3SpC
	aZ4FO9e1S+Xb4WY7sjtbWvXi4pYFeiV7962OSYPcUWYIsiAy/mq65GXXzpH1fZEAZ6jiRjZxh14
	U3AS7xQw5iaajTUAFmiyeMPTTLituXtTqAND9IufCjCW8IviUPHjZyjdljmlMpvs/dAtgpAif2u
	3rHtg6s9qKfTKK9YMn2aF4pqtLN1SurBAVCDe2lQng8I9wJhrd7Hw2utK3fQlZ56QTf5Sw6Qtve
	WWl+MMHyDGx2kUM60KXutRUoUlIOCW+TCrncKvYL3SPt2NpHbVOBBjmhZ+tniW1238u+xpeSw5Y
	Yp9RAmCpVgmTnf7Kz+gNtXrQumke6zp4wOZyutwph65SUYLk0P6Z2YhJBQFO3Njp3ZOaqxvDdiu
	EC59kWCiKqYueoO7eOKrEo1bb/rens5kg3QWibvmt1Oae/BFwrOPkOOsiBS/KrN6MaEdlEzeUW3
	mVOtl9M6LVkO1ANj4xAi4UjJvwkj5qDPxwhtISRoGbr2/QbRJn48g/U5v3LrwB2aAWEHaP5xNI3
	98amfnT19mJ8rH0evIP5npSkhibjGckaJcKq48kNPmdFUsiCvIzk7ITvPWouoM3/NpL1uNr52rh
	qvdZXM7qZ5mHNVBJcpNXi+01l9
X-Received: by 2002:a05:6820:6784:b0:709:8fcf:6d9a with SMTP id 006d021491bc7-70b88aefe41mr234594eaf.78.1792698058797;
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b8b2c4561sm42639eaf.9.2026.10.22.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:40:54 -0600
Subject: [PATCH v2] dmaengine: mediatek: uart: synchronize completion
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBCFr2K6dpTyI8SV9zAsShlg1LamLUQk3
 N0WTuDyTd775luYQ0vo2PWwMIsTOTI6hPR4YHIQukegNmSWJumFJykHNzaKPCj/hFFYD60S4GY
 tB2s0fREmDryoZJUlWVOUOQugt8WOPtuTe73nQHmg9JEcG41wCI0VARNPgYm6J43nfRcaAzlv7
 Lx5TjyS/lKKVpB3Zckr2WGX81uvBL1O0ihWr+v6A72DrsYIAQAA
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.li@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_124100_126397_AC948897 
X-CRM114-Status: GOOD (  11.43  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Add vchan_dma_synchronize() with the DMAengine callback signature and
use it for UART APDMA. The shared helper wraps vchan_synchronize() so
drivers can assign it directly to device_synchronize. Document that the
termination path must have stopped the channel and prevented new
callbacks before using it.

This lets clients finish asynchronous cancellation before reusing
callback state or freeing DMA buffers. Keep the callback wait out of
device_terminate_all so it can be performed without locks acquired by
the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
---
 drivers/dma/mediatek/mtk-uart-apdma.c |  1 +
 drivers/dma/virt-dma.h                | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index 59d9eabc8b67..f1fc3bf48275 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -234,4 +234,19 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	vchan_dma_desc_free_list(vc, &head);
 }
 
+/**
+ * vchan_dma_synchronize - DMAengine callback to synchronize a virtual channel
+ * @chan: DMA channel to synchronize
+ *
+ * Use as device_synchronize when device_terminate_all has stopped the channel
+ * and prevented new callbacks from being scheduled. This waits for callbacks
+ * and frees terminated descriptors through vchan_synchronize().
+ *
+ * Context: non-atomic context, with no locks held that callbacks need.
+ */
+static inline void vchan_dma_synchronize(struct dma_chan *chan)
+{
+	vchan_synchronize(to_virt_chan(chan));
+}
+
 #endif

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


