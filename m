Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8D2C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:15:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DBC61445
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4DBC61445
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D3SCokLvcR3mQgTZLP5g1BQI6rAUoYzyvGv14/3Jw/4=; b=oPZtKZhgOfm51yGCUYIk7sePt
	sBuepmQGkfl8W1mCt3YulwpcG2y/mAN90ctmfPKnjL0LAYRn3QmZsO2QYBxyFHtvwxHSzYY91vJLQ
	vpdazL4xI2D9ze+rEJWFP7BGn8SLVjEPCuElSHWls77LIo0S2KdIoxSdvY6HnoRVWA6PR0o2jVE8f
	ucbVvkWcc0mb+Rv2avFeM9dUHMMpoLpnpPzvY+XLPEW9QiNSnb2/rAhv8yIYogxB++gLJjGfIKLQP
	dCgLPslqC3SOe6FrPLhFCmvkWVC4EMJ2rtmRypyvhvIi8uScrFiv8bIMhUEpVwpdCFXGOll1UsC4N
	9OgPXZzfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQkM-00FnNw-FV; Thu, 22 Apr 2021 04:15:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQf2-00FlTX-Ll; Thu, 22 Apr 2021 04:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gTam4Dh4Exrox41UjgsTUAzDdF7hSjfRPYT1wQxzNIA=; b=vU++w2bAYIQuctNe8vemyOORFm
 hCTdZff7mpsj6rJAQhJ4TX2xnVRUA/aw68qhDgX6G3BVMoH52RWqjWjRiN//i0zvHnGXNjCF3UA5S
 IEjHl9kSo0qH0bACQypm3DjFZcXSdwXCIOCP/0SOCEeglGzldNGhnfgP4LUT+VZNAfbuOlNObZdEU
 f32v18ueX8msenbvmDfRtqjCdtv102vDJlMNAVH+oWdBM6n/re0j5O2K6jAYk6mde3xS9hHjR/tW7
 Xq0SwdsMpG3CwbAuB/ME8CMKYY84fBN+Frz3YMSozMi69FDqEQVgxDm1m/ScSczD9p8QQY/V/2sBL
 2LMoG4xg==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQf0-00DLgj-3s; Thu, 22 Apr 2021 04:09:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso246618pjb.4; 
 Wed, 21 Apr 2021 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gTam4Dh4Exrox41UjgsTUAzDdF7hSjfRPYT1wQxzNIA=;
 b=h4Ws/FzzrLMIqrmOr0IySyYw5sQpcKQebJ4fr52tIz8OeJS0J18r+Kk3Yby02VwCZb
 lB0VnuYreH0/WBg432DwfJyANbzRXjq+RyqMjMV91avjh7P6AVWyD36N3taxcUivyk81
 gRifTzGqz56xEmn2k6jtorxqr5N1vLDH+pPNDe+b83J928uzB0K9oz/QkVW18/V0NOEm
 PmNXRP4p7ocJ3OqSd75VYOZ622O3F6Tb2dKbCXDirHHasEkzg3neP8XRcwVvl6xSnCcV
 p6+FpUvxCPmYMV8eIuZjKOIvK1JtK9l7z/eVW37FaQEAOnPMN480/2GGvYDW3XruZYWi
 OurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTam4Dh4Exrox41UjgsTUAzDdF7hSjfRPYT1wQxzNIA=;
 b=TDu5CjDIg9MNsO3sR767BvuYmU2KxSq+mAgUBwYjRQ/JSzvEq67A0JAUd2EBlPm3S3
 CPQB6rO8C7JhOKGCvQ8oHN3buYZjjUdjIgz7CnrK+i3rO6fD7qUJDK2J8AuBGDSDKG9k
 v+IrmlSaexhkMzlYvh4FIzE/frOe/LJmF7dJSODEyPwMzHYs30X19Ok1vb+kj6MI6Mrb
 6Ns9xFI4fzwQUeRJh3Ax1rxWtcgnRfbpuZL6w11oOP4TId2CxhCFQc+wISb8bO0WA2u8
 zb+w1Fil9mNp914lLheUyxKVP+pUFRUY9EknxAytINtKj/0R5xF+QQ+aDfUSvSt/36jR
 rakQ==
X-Gm-Message-State: AOAM530xHJi/xiADnTEqN2hCbh/wRntxfZUhXYKdZzDE6iktiAGwX95W
 EndiBEW4Z5iNNNRo/QuP1N0=
X-Google-Smtp-Source: ABdhPJzmrEjvXUJJGC9Se3LcQu04Mdkl0aXOfVWFnghAJi2orXke+l4GVOKEPwHkQQLbn8xZTwi3fw==
X-Received: by 2002:a17:902:778f:b029:ec:d04d:4556 with SMTP id
 o15-20020a170902778fb02900ecd04d4556mr1407386pll.43.1619064589415; 
 Wed, 21 Apr 2021 21:09:49 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:49 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 14/14] net: ethernet: mtk_eth_soc: use iopoll.h macro
 for DMA init
Date: Wed, 21 Apr 2021 21:09:14 -0700
Message-Id: <20210422040914.47788-15-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210950_175331_0F3CD017 
X-CRM114-Status: GOOD (  16.10  )
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

Replace a tight busy-wait loop without a pause with a standard
readx_poll_timeout_atomic routine with a 5 us poll period.

Tested by booting a MT7621 device to ensure the driver initializes
properly.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 29 +++++++++------------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +-
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8c863322587e..720d73d0c007 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2037,25 +2037,22 @@ static int mtk_set_features(struct net_device *dev, netdev_features_t features)
 /* wait for DMA to finish whatever it is doing before we start using it again */
 static int mtk_dma_busy_wait(struct mtk_eth *eth)
 {
-	unsigned long t_start = jiffies;
+	u32 val;
+	int ret;
+	unsigned int reg;
 
-	while (1) {
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
-			if (!(mtk_r32(eth, MTK_QDMA_GLO_CFG) &
-			      (MTK_RX_DMA_BUSY | MTK_TX_DMA_BUSY)))
-				return 0;
-		} else {
-			if (!(mtk_r32(eth, MTK_PDMA_GLO_CFG) &
-			      (MTK_RX_DMA_BUSY | MTK_TX_DMA_BUSY)))
-				return 0;
-		}
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
+		reg = MTK_QDMA_GLO_CFG;
+	else
+		reg = MTK_PDMA_GLO_CFG;
 
-		if (time_after(jiffies, t_start + MTK_DMA_BUSY_TIMEOUT))
-			break;
-	}
+	ret = readx_poll_timeout_atomic(__raw_readl, eth->base + reg, val,
+					!(val & (MTK_RX_DMA_BUSY | MTK_TX_DMA_BUSY)),
+					5, MTK_DMA_BUSY_TIMEOUT_US);
+	if (ret)
+		dev_err(eth->dev, "DMA init timeout\n");
 
-	dev_err(eth->dev, "DMA init timeout\n");
-	return -1;
+	return ret;
 }
 
 static int mtk_dma_init(struct mtk_eth *eth)
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 214da569e869..2e4356ccf778 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -214,7 +214,7 @@
 #define MTK_TX_DMA_BUSY		BIT(1)
 #define MTK_RX_DMA_EN		BIT(2)
 #define MTK_TX_DMA_EN		BIT(0)
-#define MTK_DMA_BUSY_TIMEOUT	HZ
+#define MTK_DMA_BUSY_TIMEOUT_US	1000000
 
 /* QDMA Reset Index Register */
 #define MTK_QDMA_RST_IDX	0x1A08
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
