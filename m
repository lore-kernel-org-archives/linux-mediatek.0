Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E3FC53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=; b=OnaC8r8iwwYvBGbVMDVjLtdo/G
	k4QEbrI3vGMu+IDjWlW9e/eZwAAq+IXauVRRQGMtxjUZQesAnDViOSzPElG2Q6LfcsQMZoQkIBJ0o
	SWMT+3nptf36+QkS2DfTDJVzISUBFXfZxiC/t5VUQ/lG5EjMvtqy+aLlOhy/hSz7OcLfleYL8yfWr
	8OVU5iqdIUr5vsGlnouJ2woTcbyQPXWlHeFZ2HIX8FLYh24it9d2uOJnL0gKQVyJmBRe1fTCRjdbT
	19T1fOSvoBpcKuiDRKaBh/hvOTVA2yUondSkKUJGl+/JE9PwNEWlzVrSA7RzSw6zE5YuUvC2TMwO/
	kw7guX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7l-00000003riA-07Ag;
	Mon, 27 Jul 2026 20:40:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7h-00000003rfP-3djK
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:31 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84a2c90e383so262093b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184829; x=1785789629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=;
        b=g7ZLMZCEwXvu7iBBGPGZMVa1uhzfePCUx9XeMPlUBp0gkzfII2+QzZiS6qKyAlKRp5
         cJMYVInUP/gLz7NLuEMaLgQgmCzZk5c8WnmlB/P+AX7sUKjsl9El85cSAhNsraUAvyFJ
         Ab6J0A5G6OOV0x4axLJ5wHWt1ExGghCdrky2aezMVgMu6m1DxEGRfvca48QpyUCrvkrY
         xa4pnp0rITFodv82lBWwJuttz7mPVJnjXvuQp4hPj4GGhycqkVjNaRMgrF/qQC6pazod
         xjHFrr56PruwiXLZ9jN6Q0dt6XZ7j9Mk2zXxg7HyJGqvYAnLDXIyFJxihEtLLTUxThvH
         7+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184829; x=1785789629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=;
        b=QNmf7vxW3A9FPBlLe2BeRw8JSkPYB3KO+fwq5FDHk1AV+XN94SxNAUueihFagkfQ6K
         2V3NBV41OypCQcljHsny/Ty66RLmFKntMSkWxtXAfpcvyPH1p1jf1qmaENVGXBOPygT0
         sBtWhwS+KNoAkppXH9VwA/XHrDskQfoVLyyiA2arY0pMwviF6Wv2wCjjXe7qKNGOUwp+
         /tsIyVuH9NMixfmu37975CoOCwyj4UF8XCBRDQl9Ymke/sQejpMiKs9a9/fcNef/o6yI
         1A0gMzgWYMBR+01hDnLFWb+3cIfAk6z8TjoJn2JTP/5sk6738yXOfHfh9biGQ0aqsYag
         iEEA==
X-Forwarded-Encrypted: i=1; AHgh+RoS174Z4pUaVPxWwJle/S6fU71jGcadEmNHC46Hc4BuuzPi0Q6zbwzkojTyQrbG6MM9mdAAb68Wzj/vbe5/0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRaaAQRWoJ787pRyz6u6B6rai2uG2ssMd0yqFR8pgvMjIG1v31
	vUSJYBNyEHUvkQCijXKF+ZdCenH1/vv43964hMTn2ULjtSGlf19QPI0P
X-Gm-Gg: AR+sD13AHUu6PSqLHIN26M4dOVaD7YFnfaMOf1G5I+4BwZ3Sh6f8T6O0yBVBQI/z4Xn
	P+wPTfawZqf0xLWeYlnE3Aljx46RwIAKJPjOXvj/0JB1vlwHrqMVOl/UXdZj2BEs45qMFHxqKCr
	IBDGxWsAl1RXRVe0AG1RIALwZZGAERsD4RENt7cnXM9SBpv+ctadppPrgPgdwCG5popcl4urAfy
	HSU8KhPQQ5WwFKvMmPGCy0QyP8NV6Ht5IJiy8dG+ViGxG0fFauQ3s9SSi+VrCURjc7DeYVx51bf
	uG1o6aqcLVqkqmVzMMamveCbjPt7G3LynolH/6X4Dr8GzJXwQ4iFkaFpus/hoTdp4dB9+YXb6ai
	Bb41Le+6LeelwmLqQuKD4cgsfZyfRwe4aJJyXERAdAjLQLlGpGRg0PjJaNgErWoayisgWujLkcY
	FL7JPX
X-Received: by 2002:a05:6a00:22ca:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84e8fc09bafmr184669b3a.9.1785184829248;
        Mon, 27 Jul 2026 13:40:29 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:28 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 45/64] dmaengine: mtk-uart-apdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:07 -0700
Message-ID: <dd94300feb7feaa826b8fb75e1f22c82a6f54bf4.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134030_614521_05B42F0A 
X-CRM114-Status: GOOD (  10.83  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c269d84d7bd2..4d89927922f5 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -312,7 +312,7 @@ static void mtk_uart_apdma_free_chan_resources(struct dma_chan *chan)
 
 	free_irq(c->irq, chan);
 
-	tasklet_kill(&c->vc.task);
+	dma_chan_kill_bh(&c->vc.chan);
 
 	vchan_free_chan_resources(&c->vc);
 
@@ -463,7 +463,7 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdmadev *mtkd)
 			struct mtk_chan, vc.chan.device_node);
 
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 }
 
-- 
2.43.0


