Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E689C43460
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:54:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F636188B
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6F636188B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LNuFs2dAgPUys52kab+RjvPFZgzxEanSQV2JpvthBeE=; b=GCWaoaO60AO5iYwxE9mRG7aRc
	PCG6Mjmt8lBc8dmOmDQ2tKepGVEcqCq/bgqRcOlLU5YJxLe8Ld2JLwsOZnVhRU46QQOKQk966Sg9f
	Zmsykv00LlZia4IemHHzmbYI9kNaiNqHplFgrGGzWXclSUJqfoHlDu0//lkekzIGhvM5+oOtbN2jS
	mgrAGLNtz9Grpe2zLiM6VUOSObVmDSe5xWpQ9vAAHEZ+MseHpEcYwKF+BwiAHRMndllO5jlJCMNqr
	2hbFW4Ufo2ZvdL5EZ03+wfUzT+s6gyvIyHQXp3gPFRmLreLUZECwHgUry7ZTbeAvEjpAm2CHHKCGi
	bit1Eaoww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKnH-001n4G-NF; Wed, 05 May 2021 16:54:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKXr-001h2J-KJ; Wed, 05 May 2021 16:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6e+dK4ivWlUVjEbdFS0cvkGnXyp00JBbfmxhTYH+Ewc=; b=4acRT9WxCfiMp1BVtyAkfvbz9L
 2cU95CmZgbgJfBbfddsEkXVyhULL80x8aB3DncacJdwt6O4NS74ipexsE3cPrrQF6Nr3URbQq+czU
 +gkn+6Y8nLNPaNKEz0B634TjBgk5PeSxrufmVPQRnMopVBUtwlMbJjhK6kumaFhS2tuY7O8RZ4+4c
 riTfCRliZjI7Wp6xjgoIgKzh01Bpelvh+45tOiiOum4nogyiqFC5pq3K+SrN5ej396FQdW9UPps75
 tgTyzX8qg7+a31S+mxBv/WDmO1y3CeldHgCZE3wctwOT4nfro/Vx1BRewJvd8/GVH8fSoDjmgjLes
 SVBK84QA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKXp-004xn6-0b; Wed, 05 May 2021 16:38:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71CDE61991;
 Wed,  5 May 2021 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232720;
 bh=zIWO+613aa93ZZ/vIAzAca28AJUUZ1Qux+x+xGm+ZvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vJzK3pC5HZdC8Q9Zsmc2OJpMtR+twLcrHtBLh5BImQf8ZVMT/J38rQsAw3AabpSy9
 ARZtThtp/4ojCwx9nyqQMBgva8QqC0ih9RrzHrRETY3O424N6LXrBoQre6sQyo7CqB
 bH/5KNbmugbh6WR89pJJ8bVPsbpuDPWtBYtz52RBSv/OLptZm84vPRrZ9kZudXD8Jk
 9TP8VHXpdF6m+/l6emkNoi/kKbTjmyQghLSc82pC+bi/TlAjlrWg0pWwVYCzmS+cgW
 slFkEji7XLxxgtfkJNEr8gwcMf8jY9i8Vw5ctacPAIkwOe8gkEvazKEBgT7mmlbYjd
 ggWVCF/lo2Z2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 76/85] net: ethernet: mtk_eth_soc: fix RX VLAN
 offload
Date: Wed,  5 May 2021 12:36:39 -0400
Message-Id: <20210505163648.3462507-76-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093841_090979_F15DDB89 
X-CRM114-Status: GOOD (  11.44  )
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

[ Upstream commit 3f57d8c40fea9b20543cab4da12f4680d2ef182c ]

The VLAN ID in the rx descriptor is only valid if the RX_DMA_VTAG bit is
set. Fixes frames wrongly marked with VLAN tags.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
[Ilya: fix commit message]
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6d2d60675ffd..d930fcda9c3b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1319,7 +1319,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->protocol = eth_type_trans(skb, netdev);
 
 		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX &&
-		    RX_DMA_VID(trxd.rxd3))
+		    (trxd.rxd2 & RX_DMA_VTAG))
 			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
 					       RX_DMA_VID(trxd.rxd3));
 		skb_record_rx_queue(skb, 0);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 454cfcd465fd..73ce1f0f307a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -295,6 +295,7 @@
 #define RX_DMA_LSO		BIT(30)
 #define RX_DMA_PLEN0(_x)	(((_x) & 0x3fff) << 16)
 #define RX_DMA_GET_PLEN0(_x)	(((_x) >> 16) & 0x3fff)
+#define RX_DMA_VTAG		BIT(15)
 
 /* QDMA descriptor rxd3 */
 #define RX_DMA_VID(_x)		((_x) & 0xfff)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
