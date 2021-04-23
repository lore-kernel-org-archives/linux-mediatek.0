Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46398C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1C2613FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF1C2613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P2STQyBA/xocE0tcQaVY9TO+0qcoPSjmvDOgH/smJyc=; b=XOd/Yd64S4OlyGFYNHxWzMHC0
	MTKV6mf2EE21ZPA4GxOptXhbMsizHEmy7MDsN3B7u/bfbRJHYcsnob+ZuQSfGj6zKIiY0kHWrrzD0
	OEt4tm1OHN8uK9YtG/e4A3VfdjzBvhA442VO1szGjBpkqX6EgyqifuIeeJMrZbu/SlRywFN32ILCu
	5SVk4Wcz71r3J5JXhGRsaqu0gdzJRBVe7Czl68dI79Yf0HwxUlMzIWypCMPNPovXRA+l1QrNgjgXP
	KdxT/Ang1n2a8Xi7LH8X3Pz1j/cBmaeEJ7rGEHvKAGThg7tQIiDuOUVyfpkBqMt02dOAMegd4WT5q
	C/pfG8Kwg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoQI-000hzz-W4; Fri, 23 Apr 2021 05:32:15 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHo-000fba-Cc; Fri, 23 Apr 2021 05:25:48 +0000
Received: by mail-pj1-x1034.google.com with SMTP id lr7so6368239pjb.2;
 Thu, 22 Apr 2021 22:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjE5MA7+4ZwCbbfRd+W09i2u6oXOwprynyvP1BlKeH0=;
 b=rvrdXEYt3aYj+BQSLJgMTnmz3tc0r1wUQy6VEvCfqjFf7givy59PpsJmNcNr0zDT69
 Zv+4YNmRpL0ykgP/b256UnnKlEAQDaTIfyDFYJRIHn6wj/wooGmQyh7hXrA21H9lRECh
 fIwPLNvfyBEUcZvLofKnUNGNVwrr4TkigBMx9kB2Z65/uE1cph+JPJR8lXB0CG8ZS1Vu
 X0dJwoux8RrqrLUqQPTTXUOCV+BQ/MAssjz3u/XTAp9sRTXqDHbMNOmOGid1a5ehh8PJ
 afEC1GSVr9sN94utHBWywVaTOLwFi8hhnzB/nwUj4vj1NjC0X6s3RIVaJWd86or/6/du
 KnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjE5MA7+4ZwCbbfRd+W09i2u6oXOwprynyvP1BlKeH0=;
 b=D0v1hoI+ll+LnOkTZd+u5G+0ER7FrwI6MrOXCFf+kSFCuF8C1nOif6bJpDSaOsPSbe
 phF+Zgb2E8dlF/1tJMlVAHb2szwymzgiqmdMQW92Z0D9f7wYhDRY1MxDjNmdZN2GPNpF
 PzWSrPWz7y/LnITkNyPpNpReGn2kvYPxaUW//s8GjQ6//F5J53tsciBTLwMOKxhJu+Yi
 J+Vob8sDVaGgpkVbgdxbddIWMXrc9a099C1+A8t8RJBIQOd1MNi/bXoAFslNSa8plk3R
 mFDRlV0hpuu7G7761A0wdbE0GsOQUcacqi1M3ruSdRhN3ZK/rnEbPG0liYFupBYcjSWq
 ualw==
X-Gm-Message-State: AOAM532+d4q2vS6UPjiOz6e0+sprChK6XYQ/hPWmE1Op27h3zs13nDQx
 ygIX+kSRo8uA8vh/VHiWxwA=
X-Google-Smtp-Source: ABdhPJyCaNlZckAPemEXQ82FX6NwJGUY7Fgm5nHIx1qKilOw/gQY1vokrG4/l7E6695NagFitzHsTw==
X-Received: by 2002:a17:90b:2482:: with SMTP id
 nt2mr3805572pjb.13.1619155287083; 
 Thu, 22 Apr 2021 22:21:27 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:26 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 10/15] net: ethernet: mtk_eth_soc: cache HW
 pointer of last freed TX descriptor
Date: Thu, 22 Apr 2021 22:21:03 -0700
Message-Id: <20210423052108.423853-11-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062342_295606_58F1DD5A 
X-CRM114-Status: GOOD (  14.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

The value is only updated by the CPU, so it is cheaper to access from the
ring data structure than from a hardware register.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 ++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 762e985fa294..6d23118b7a6c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1364,7 +1364,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 	struct mtk_tx_buf *tx_buf;
 	u32 cpu, dma;
 
-	cpu = mtk_r32(eth, MTK_QTX_CRX_PTR);
+	cpu = ring->last_free_ptr;
 	dma = mtk_r32(eth, MTK_QTX_DRX_PTR);
 
 	desc = mtk_qdma_phys_to_virt(ring, cpu);
@@ -1398,6 +1398,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 		cpu = next_cpu;
 	}
 
+	ring->last_free_ptr = cpu;
 	mtk_w32(eth, cpu, MTK_QTX_CRX_PTR);
 
 	return budget;
@@ -1598,6 +1599,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	atomic_set(&ring->free_count, MTK_DMA_SIZE - 2);
 	ring->next_free = &ring->dma[0];
 	ring->last_free = &ring->dma[MTK_DMA_SIZE - 1];
+	ring->last_free_ptr = (u32)(ring->phys + ((MTK_DMA_SIZE - 1) * sz));
 	ring->thresh = MAX_SKB_FRAGS;
 
 	/* make sure that all changes to the dma ring are flushed before we
@@ -1611,9 +1613,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 		mtk_w32(eth,
 			ring->phys + ((MTK_DMA_SIZE - 1) * sz),
 			MTK_QTX_CRX_PTR);
-		mtk_w32(eth,
-			ring->phys + ((MTK_DMA_SIZE - 1) * sz),
-			MTK_QTX_DRX_PTR);
+		mtk_w32(eth, ring->last_free_ptr, MTK_QTX_DRX_PTR);
 		mtk_w32(eth, (QDMA_RES_THRES << 8) | QDMA_RES_THRES,
 			MTK_QTX_CFG(0));
 	} else {
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index ceb5a4a661e6..6b92dd6c2cda 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -642,6 +642,7 @@ struct mtk_tx_buf {
  * @phys:		The physical addr of tx_buf
  * @next_free:		Pointer to the next free descriptor
  * @last_free:		Pointer to the last free descriptor
+ * @last_free_ptr:	Hardware pointer value of the last free descriptor
  * @thresh:		The threshold of minimum amount of free descriptors
  * @free_count:		QDMA uses a linked list. Track how many free descriptors
  *			are present
@@ -652,6 +653,7 @@ struct mtk_tx_ring {
 	dma_addr_t phys;
 	struct mtk_tx_dma *next_free;
 	struct mtk_tx_dma *last_free;
+	u32 last_free_ptr;
 	u16 thresh;
 	atomic_t free_count;
 	int dma_size;
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
