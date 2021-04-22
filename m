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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2DAC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8154361002
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8154361002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bD/3i+6eZs4kc/G7/xtxnMlhld/hDab0n1YAHHEzkcY=; b=WsnzGmaKErK4mdm/9Sukxl+yY
	qRDhFm/FmwBQaclLI7zmrO0QBNots2hTeLG64DNv/zimjVJjoqy52hhwWCD1Gvlws/m3s8U1Fi/0M
	3fvKDPZZGA5G5XIBjBwWZYxM9XCHEOOeq9p+5xhZKKqUQLUxvXHbieFRTHCi5x8rSBZVNQ3nZ9NV+
	eIUzRy+clct7YjrsXEko0QQ6gFdGoc6UxwiYeEeIEhhayhSVnfcWdwdZbfcpgjnyXtAePfAzC6Rvb
	NeGtLOVf2pGONOLlWBuFG8QY0sbBO3x+1EqpNZxMNZw3d5lOPYJorwKRW99Vj6QVrFdZVUwnGfvas
	dBKFlZlRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQh0-00Flwl-Sp; Thu, 22 Apr 2021 04:11:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQeu-00FlQJ-4V; Thu, 22 Apr 2021 04:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VddRnX0bE97CmvaALzam+ApYpCJ5QzcFqH5F34H/Njg=; b=mhtbNINZnGIUkRTVfYuYctGqYF
 Mc5dLURg1yclJ1Z8bJuUVTZsnzm7Mj79XYXkVJsRnj2r/Razu3HNVFv98cmOu6xK4B8mnhgC/KlJm
 YoAgbyF9gjwacjZWc5369PRDh+TRHZdl8jEvda+e4mGXOes0iE14KHxzXt56yt6hbYP5/xStCycQN
 caceAZZkcspEbmo7zf8hBEBGu3p2p8HwfJMHaYaBVJK370hDQY088uKBEN1j9Hjtz7+MlPKCzDX3Y
 P5FHd8rvIqKRI2A+HzG+drNouFMTiFIvAMqUBmtxRmX7vkIFGK48N2wR4U2TyjrvUGh3c+4ljp9JQ
 T1g43dvA==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQer-00DLdS-Jd; Thu, 22 Apr 2021 04:09:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so246865pjh.1; 
 Wed, 21 Apr 2021 21:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VddRnX0bE97CmvaALzam+ApYpCJ5QzcFqH5F34H/Njg=;
 b=OC1c6YzvFa23FAL/pDrjpfiIHhd4LbVftEgeZu10htyxa3D2HLXIcV/IK2zjfuGkQ0
 p7qs0zFMFgEH4GD0lO21HSL3aNG716uIKTiBehI4t0T3kRMzZ9FTC8ARTTtdjmdkLEly
 kcTsgYbQR/nl7odAWxFVm0X2+KgrzZST/HsxFxJMIVJwXyAU9EKP/Dso8FlpCPodUPiF
 xNJ0cbpnoq+XPExtBEocFtJ5bWaAMIQRiJY7bT1nV4v1ujzii/B/O0sRUbFQtugvbALs
 uzdr5n0sU2oDeSfGjqAPH1PTrldw7/7zaVuiSftGPnjUZLFl11E8LmgM+mO9kOj0LmTm
 1S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VddRnX0bE97CmvaALzam+ApYpCJ5QzcFqH5F34H/Njg=;
 b=G5u7bOb/7YNSmi38KEPXadpbfeNw2Bp/6WpJrxaTSxhzRFuketnzNnoMonhJ3QJ6KK
 P+bATq2X2tZ10av1oYaw+pijQ0szAqCXa5QtAq8IbWo9JaLgq5PVPAVQR4il4yLmNUFv
 wRpPtYRorxGs32oo0xL/VpNJAUomZEdqr+V6WvUqe4d/+YzBRlU5XWLWIe7rDlLGsWCO
 shs2+s00qgmRGbpoVMui1hnvb8n4VkQEM3StmowrpdE2pplQDABU3O1+cOOONyeYEfXw
 1J7nsJojEl6V4nkfa5lixiT6VBm35pF67A0P4Y3Dwp6fY0qvxPfuHYcA/mhO2EXFQehm
 8zOQ==
X-Gm-Message-State: AOAM532zyDdaOSElpI1+RokOiDEsHPslxAbUzbTV/PEv/vyEs0zmZ6W7
 Rd87e+lW7aSZ3UE2UchM6rI=
X-Google-Smtp-Source: ABdhPJxd4KNi/Xrd2gMVsnisMzoprD9mj//cMmuHvr1XiE3yzrkkSh+87wCc4+casFD6zSp4KEAxUQ==
X-Received: by 2002:a17:902:9886:b029:e6:2bc6:b74 with SMTP id
 s6-20020a1709029886b02900e62bc60b74mr1404270plp.13.1619064580913; 
 Wed, 21 Apr 2021 21:09:40 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:40 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 04/14] net: ethernet: mtk_eth_soc: use
 napi_consume_skb
Date: Wed, 21 Apr 2021 21:09:04 -0700
Message-Id: <20210422040914.47788-5-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210941_665160_ABD5E996 
X-CRM114-Status: GOOD (  13.45  )
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

Should improve performance, since it can use bulk free

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 07daa5de8bec..5cf64de3ddf8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -858,7 +858,8 @@ static int txd_to_idx(struct mtk_tx_ring *ring, struct mtk_tx_dma *dma)
 	return ((void *)dma - (void *)ring->dma) / sizeof(*dma);
 }
 
-static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf)
+static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
+			 bool napi)
 {
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		if (tx_buf->flags & MTK_TX_FLAGS_SINGLE0) {
@@ -890,8 +891,12 @@ static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf)
 
 	tx_buf->flags = 0;
 	if (tx_buf->skb &&
-	    (tx_buf->skb != (struct sk_buff *)MTK_DMA_DUMMY_DESC))
-		dev_kfree_skb_any(tx_buf->skb);
+	    (tx_buf->skb != (struct sk_buff *)MTK_DMA_DUMMY_DESC)) {
+		if (napi)
+			napi_consume_skb(tx_buf->skb, napi);
+		else
+			dev_kfree_skb_any(tx_buf->skb);
+	}
 	tx_buf->skb = NULL;
 }
 
@@ -1069,7 +1074,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 		tx_buf = mtk_desc_to_tx_buf(ring, itxd);
 
 		/* unmap dma */
-		mtk_tx_unmap(eth, tx_buf);
+		mtk_tx_unmap(eth, tx_buf, false);
 
 		itxd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
 		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
@@ -1388,7 +1393,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 			done[mac]++;
 			budget--;
 		}
-		mtk_tx_unmap(eth, tx_buf);
+		mtk_tx_unmap(eth, tx_buf, true);
 
 		ring->last_free = desc;
 		atomic_inc(&ring->free_count);
@@ -1425,7 +1430,7 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 			budget--;
 		}
 
-		mtk_tx_unmap(eth, tx_buf);
+		mtk_tx_unmap(eth, tx_buf, true);
 
 		desc = &ring->dma[cpu];
 		ring->last_free = desc;
@@ -1627,7 +1632,7 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 
 	if (ring->buf) {
 		for (i = 0; i < MTK_DMA_SIZE; i++)
-			mtk_tx_unmap(eth, &ring->buf[i]);
+			mtk_tx_unmap(eth, &ring->buf[i], false);
 		kfree(ring->buf);
 		ring->buf = NULL;
 	}
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
