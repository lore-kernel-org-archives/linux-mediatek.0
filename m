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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7484C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D3F613DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D3F613DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kOzDfg8oTlz/PFq2Oc5JTdH/3se9aPFEWF5Mh3QNG+k=; b=ft810geKuHyQbUDekonpQ1U4H
	0YUrJwwWFOAUYJ1FpEx7YHeIdUovsdTumjE2rfu9K0HzX8DC8w8poR8JviMB/1pmf8c8zM0uwlBsR
	TVD1289kaZr4fxvs6TYQkI5Rz8hJCvy9kCZUFwUu+VXfO5xsWkeg8BFHD5r9V2vLUXoDdXejj78JL
	zXGfy3/Z9vyLpTBWAdeFUVx+Kzxzz6/v8pMLwnjKRKa4TJEEdjBErLzuezwIYupE2SGbzdDkHdQhP
	v/BAcSMIit47fGFlQycJUx8ICsQYYsMpKCcn3XYX6vl5lqTIqPKgBsLjTaFrsQumTqyFDmSmCnS27
	kyRHDo+ow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPv-000hoa-IX; Fri, 23 Apr 2021 05:31:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoIK-000ffC-Dj; Fri, 23 Apr 2021 05:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+QE5ZWLQU/5/upbp8ywwYoobLbbRgh+EOZbhqiCaUrA=; b=C2g8geVoPRZAxn5yJoxE37uTsO
 tf9t7xU0ruuPpbDPy9v6H5r6tSLgPit+Le7H939Wmk4aUodAFuZC1C9i9sctnsBfV+BaGHouMPpE/
 rQGAoEVUYTG9vv7boIjzD57l6xKq0MeJHjYoO0cPkgE1tfpN3N5/Bt+4U6mJFCSOmiN8ItJ/Hqa1u
 8OgyA1Wm5OeeliR53y7DKlZaKEto5Sb5UVJNsCrhpnJcntIBF1eFlyLsmR1kv+OXglMQ4DjzOk1cZ
 7EBIFpprlu9p9tqaQ/AqnCdEyMdTdW8KQW/xN4jwEHU4fTBNtEbdUjrbNqaR0mgKHzZUczqNVqPPV
 FLfqsj7g==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoI5-001RDl-Lt; Fri, 23 Apr 2021 05:23:53 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 31so2512876pgn.13;
 Thu, 22 Apr 2021 22:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+QE5ZWLQU/5/upbp8ywwYoobLbbRgh+EOZbhqiCaUrA=;
 b=emZgKFW/wnnHGbcgxGHvjMJSTTp41HMSrSfSNbAOHa0WoVcXkjQXL7pjJjWrjoGDTJ
 hId9J9+qWMR8KPl15pQDK/gvU0Kk0GRq39cfQ780+gtChTF0nt7G/WBxnSZ2EF+32EFZ
 lbnn4hpUJJaKZtnm+sx36zRpSyirj1HaDiVhjZb1tMkHCDajmwnCtEk+I6wjDWhUvh0g
 +MWMV/Nn7cGVcKJsMHN7SaYhbVswFRxbe5VOHn05kL7Iq83nG+zccmAfw6T9arFS5p+3
 Vk+AJ7V0fr+Vieurmck8FixnwUU58va+9/nQZA+blGbLKb3/2cZ7Np7Qp74HwqyCk2A3
 F09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+QE5ZWLQU/5/upbp8ywwYoobLbbRgh+EOZbhqiCaUrA=;
 b=kLjnhWOMVbAwbKH8bY39IEa0ux7c9N56O2RNeQrwlAv9JRHutxfWesJ82HXLGDqCds
 oHnHTWR7S6F9+YhIhnAnMmn7935MWk541cHqOHQS7w3xM25RE2Y7sEygDm+fhCCjyLOz
 N2oVqCWtCPbkTTyGGo1e/dbbzoIGBXP/neJhyBNXD/OKL/itAbLm1KZN425jsM6dwchC
 IC+1D6XggYBH5+02TDm9UkJbyt2Cu+nbGhBCzaJIg2rFq9mFZY9nVu+x8pDwBxh8fQXY
 t8EWc3vHQxJFow/qlFNFERaDxT0qXDCNZ24EYGg8JN8dy/tePy3I0elFFjTAFsSY4t/v
 yczw==
X-Gm-Message-State: AOAM532mVBFGO4Hw4aG9F77PkRdEuo6aiFknFWPh2Xbe/yD2p+lvIi8u
 9rWbC26H+xFZaxtvBn400Cs=
X-Google-Smtp-Source: ABdhPJynB6x3ngxSvlU0/QX4s3M24EdwHpWscDh8pUHB5agFFtw8uqjvYdoITIV4mCYf52er8fSdQg==
X-Received: by 2002:a63:d755:: with SMTP id w21mr2221158pgi.400.1619155291309; 
 Thu, 22 Apr 2021 22:21:31 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:30 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2 15/15] net: ethernet: mtk_eth_soc: use iopoll.h
 macro for DMA init
Date: Thu, 22 Apr 2021 22:21:08 -0700
Message-Id: <20210423052108.423853-16-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062347_474748_7A07B6A9 
X-CRM114-Status: GOOD (  15.15  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 29 +++++++++------------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +-
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 37e50a2e7d0e..ed4eacef17ce 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2033,25 +2033,22 @@ static int mtk_set_features(struct net_device *dev, netdev_features_t features)
 /* wait for DMA to finish whatever it is doing before we start using it again */
 static int mtk_dma_busy_wait(struct mtk_eth *eth)
 {
-	unsigned long t_start = jiffies;
+	unsigned int reg;
+	int ret;
+	u32 val;
 
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
index 6b92dd6c2cda..11331b44ba07 100644
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
