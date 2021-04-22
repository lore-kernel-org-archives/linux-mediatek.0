Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AEDC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8FF0613FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8FF0613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rb0rOJ7kr1Aq3OO9YQ7wDJZRjzFtSbKr1T8wB5/3R+k=; b=d5pV+NjIDOYo9SjMYfdIJtxDI
	asOt6KUcVwewU6tm7wGxp3EZv0u/iMeYPhOSbpAIw3yzDHnJxAsmyi1wae1VIUYVI+uIfPgf8YFBO
	ndlTOw/0CgaRfa0ood15lENWnkGvjY8SvIE7zgHtO2KmmECyG2V2wYDAFMfifzPA7n501Ji9l+5Tj
	yhlGF6lj1Pl0Pt3EmIcme1KqYdgOG1BiqtLRjYKyJlx9uGt41OhvfozFZ4CyAyPso4Bf5jDlC04Nr
	xpe3nuhRSsr4pZvXI7D5K4q2LWfA75cz6C6kvxuiq3yLlEvx2vhXyrXgGsOqNyTxUxfwveYsBbMIS
	gMhJH4Q1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQhC-00Fm2r-RJ; Thu, 22 Apr 2021 04:12:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQev-00FlQZ-EW; Thu, 22 Apr 2021 04:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mpHFvhVstRat21oM0gV+xZuTGkFLULz7ukrF5iEyIK0=; b=rM55ZG0Ts9sYgo2vz3khlrgytc
 DWCJmrmMQeAU8F/lnjn+vGjJl2uxl+AhooDPJBcluq3YRw9RYfw/yc8J+SJLz4uLTi032FKbaalnB
 OA31YMrx6u5lBg8iXWZcf+YlJy5q0TqVIrwbqp9UA/tb525Rren898+4n/2MFsFyV+kb6JLm/aSgA
 ZCNVdkzM7To1anZNylSLPx9act0v0uwmZHpHWk69ljNaeI/KX6cHdNZ1LLZiz0PSV9SHu/+NS3rMm
 0R2/ayeZ1TsiJIwV3BzcJiRE5iaVQFd/QZ4vopePSzuvzm0gTPa4KrW5+QhoYNNkoblPU1A/SSht4
 /WL3Vvww==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQet-00DLe4-0z; Thu, 22 Apr 2021 04:09:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id y1so7191492plg.11;
 Wed, 21 Apr 2021 21:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mpHFvhVstRat21oM0gV+xZuTGkFLULz7ukrF5iEyIK0=;
 b=PnrB1ws8mNHmD5BVxLJuU6qLG9r7t5ta+3Ni6Wf3OeJnmyznhMtLE3gvDqHKIyHkVz
 KdG5FCaNorsqk+1Lk26cuTsNMI2MEhAdWhk07+ul4DTUwNQIjuPXiNJ5lmqRz3wiRZ6P
 SJziggGOJFWqmfJNEqZA0C57yQo5uqc7ZfWoIQ0yufqd9CRGlCH7kAVioi9Nc3PIscMF
 LLqL8egeN2TpZymJgpf99bfY/UytmdTb0Zi8ai/AJEprzxMyxcvEC/ny3HqJQzO0PBIY
 ZfU9gTgUcfaamT1VNm4MbmmgoviZP4BSiYh4WS2J6YQyD9YuIhdV2ps0Kl5Scnb75Gin
 92bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mpHFvhVstRat21oM0gV+xZuTGkFLULz7ukrF5iEyIK0=;
 b=Dtjd3I/qOGgK+tRdjhWj7iVgQRNk6uMEtPMmQSYTHR5JDQ3kN4ntcjiEfAHZN8TZw9
 KqXVT2YkCTWuuSeXT/hFfy3gUu3okEhl15oyEpoENKhTsZ1mTkwQawyX/7nyqsWVIp6M
 HZO8BEcyCP4nilkkZEnYzkqQtDqN0hjwPNN5t6vpBVoDF6BKrQyERsmjioIY8mIZaVhi
 ZT1Jt/KB9OVnlNP7RjDVoFbI86+g2FZih+iv3YS3tCu3w38nftdzoWWYC83VxOvuPzGJ
 ffbCA3bILTx8B7dvTK8beQUpqui2GZ8cFc0SXSzsCjQIdhtYypcGCyBnudBLhq8uMxqE
 5MHg==
X-Gm-Message-State: AOAM533xoa1vm5gPeCs/If3j2ppv9muB6hdIN1wClSzh5ZZOc+HzchYs
 AziKm+w6Toy4EfEcCC6uTE4=
X-Google-Smtp-Source: ABdhPJzk8BBXtqx6sgT1iSsBur7XCwAiWjZh+FiVyRUmlXzRCA+5kxsrggTByS1Hev/9WK83MS/HCQ==
X-Received: by 2002:a17:902:b18f:b029:ec:7ac0:fd1a with SMTP id
 s15-20020a170902b18fb02900ec7ac0fd1amr1414045plr.84.1619064582317; 
 Wed, 21 Apr 2021 21:09:42 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:42 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 06/14] net: ethernet: mtk_eth_soc: remove unnecessary
 TX queue stops
Date: Wed, 21 Apr 2021 21:09:06 -0700
Message-Id: <20210422040914.47788-7-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210943_090640_C3500D11 
X-CRM114-Status: GOOD (  13.18  )
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

When running short on descriptors, only stop the queue for the netdev that
tx was attempted for. By the time something tries to send on the other
netdev, the ring might have some more room already.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index a3958e99a29f..223131645a37 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1129,17 +1129,6 @@ static void mtk_wake_queue(struct mtk_eth *eth)
 	}
 }
 
-static void mtk_stop_queue(struct mtk_eth *eth)
-{
-	int i;
-
-	for (i = 0; i < MTK_MAC_COUNT; i++) {
-		if (!eth->netdev[i])
-			continue;
-		netif_stop_queue(eth->netdev[i]);
-	}
-}
-
 static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
@@ -1160,7 +1149,7 @@ static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	tx_num = mtk_cal_txd_req(skb);
 	if (unlikely(atomic_read(&ring->free_count) <= tx_num)) {
-		mtk_stop_queue(eth);
+		netif_stop_queue(dev);
 		netif_err(eth, tx_queued, dev,
 			  "Tx Ring full when queue awake!\n");
 		spin_unlock(&eth->page_lock);
@@ -1186,7 +1175,7 @@ static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto drop;
 
 	if (unlikely(atomic_read(&ring->free_count) <= ring->thresh))
-		mtk_stop_queue(eth);
+		netif_stop_queue(dev);
 
 	spin_unlock(&eth->page_lock);
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
