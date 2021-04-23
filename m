Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18DDC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:27:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A6A611BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55A6A611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Exk1ncBTtymevkaWNWyhlTXxjg0rGdL3Ve+6FZ6RBh4=; b=eykxM6cu3EKyLRqskx86d+nn1
	D+qHYzG37zqC9GMt6v3GAeuRuYtjKqWkASqIcYcBQ5s+M7KREPz/7VTfWWGh1EZL3XGESzUWUNm2i
	CM1txSM0K6vvuAchG9IENzdBydlhd8SnUdBcb+p7jvhGEEJ39oJeO4AdOY8B/pcasITzAcL9xe/yk
	CQIDlT5IuI5xRV18UM+kY5wQbkHzt20BHaHECBzXfGh6zMkmB4GyafwZFNbcNvtXGNFUnnlv6X67D
	YEz22A9Sifacb/xSl2dJS9/YmnTbaHermM7+7UamQle6khgs8oepwHD5qis4jDyj66RtgKoLnMMRB
	JpiTLfvbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoLx-000gFO-JM; Fri, 23 Apr 2021 05:27:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoGt-000fY2-NO; Fri, 23 Apr 2021 05:23:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id g16so7815029plq.3;
 Thu, 22 Apr 2021 22:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ETl9BH5g7aSjjPd9xSrYXQLCyVhrrpEc2i1Ck3dijOQ=;
 b=DWLaNz57Xo7Q8CmeyQcEYGngcqRDERgnjBO75qo/hNGHh82Ym0jvG+u4PkNZFf7l50
 kPJMVS9bRA/LP/Rk0qRYekytRQD7yvrTn/FLRak7+qGpNPFvyVDjxWhNpbW+K8RDxsyy
 MlFV2wy+7offo5XcQxatZDQu2or2gJtdO4RYWcdfdMAEFak+UEhPyg6tt1mBD4TdSEDs
 0mFId+SldNVJxIUc2G+WNwOc+SfG6Z+uP8c5fMc/I3iZwgvxi/DTeqsm89iVWvOJogLm
 WHnMd0J5sDETDzTKE7q9rn0swI6bFg6ZV/WmTz/3hl5zlYgDngWX0IN5nDAmV2Zmtj5m
 3uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETl9BH5g7aSjjPd9xSrYXQLCyVhrrpEc2i1Ck3dijOQ=;
 b=iTz7EgacZUk6v4NuREPmkPalT/v+h2o04PyqFXzhkVzUuZbQFtHPhDV30LCPkR4ChA
 YpSDQZf0pAf1GXxb5I3kflyK6jDSS6KixtTUHtvQYPd/vwopHj/HuKOeSb5AzzkLLeYd
 gS4mz4fNQ4cUCdw7X2UaDpyshwPUbP+dqlw3zooIb57hkaF80ZZ5U3yOgHAUTGTCZM+g
 RhywXPpBD2Sn5781mowAGHfjjwCAiMmWhyvJfnlZx9iZy8DrHj151aNSXTxVvOP1jT6u
 0RfNDAG0a0MXPi8G5PDs5jICeUrojadqtK2c0M1V7y+Sespmmw1MLERJMufH3uGi2UtV
 yfnw==
X-Gm-Message-State: AOAM533Q2omNQyeSCI6wS0s8X3o35pKj0Ih1PBIrJBL9nlJYixL7R9kA
 xBIaYN102Dm/1sDG+p7tNv0=
X-Google-Smtp-Source: ABdhPJwlNRwofxQXQT8gDYyYbpa4g9JgJwom0b/sTOP/MIaP7DBJiX8ulLbceCJ7cCxSFTKLULDmdA==
X-Received: by 2002:a17:90b:e8b:: with SMTP id
 fv11mr2499975pjb.66.1619155283170; 
 Thu, 22 Apr 2021 22:21:23 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:22 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 06/15] net: ethernet: mtk_eth_soc: remove
 unnecessary TX queue stops
Date: Thu, 22 Apr 2021 22:20:59 -0700
Message-Id: <20210423052108.423853-7-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062257_812975_A0961096 
X-CRM114-Status: GOOD (  12.73  )
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
index d992d4f1f400..e6f832dde9a6 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1131,17 +1131,6 @@ static void mtk_wake_queue(struct mtk_eth *eth)
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
@@ -1162,7 +1151,7 @@ static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	tx_num = mtk_cal_txd_req(skb);
 	if (unlikely(atomic_read(&ring->free_count) <= tx_num)) {
-		mtk_stop_queue(eth);
+		netif_stop_queue(dev);
 		netif_err(eth, tx_queued, dev,
 			  "Tx Ring full when queue awake!\n");
 		spin_unlock(&eth->page_lock);
@@ -1188,7 +1177,7 @@ static netdev_tx_t mtk_start_xmit(struct sk_buff *skb, struct net_device *dev)
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
