Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DCCC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:58:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74E9613F1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74E9613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h4qyifF6qJ4Eqdo9jOtd+v0hhYEsUktdfW5Y7+c1oIw=; b=lWkXyOBmYIB0sXlzxXjQQZVVr
	RXAQoLIiUFyU/LmbOpLhP0oVlQCS1fMgfJqU4yObYAaLacHQAz0ASWc2aDrjE8f0asG5ZATG4Dnzd
	ILC+vLcPMWqf7Vc6ssrbtYF6E817dSB/lBX92fTWEEjfM/0tRT7n+yGlF5rGMBcBYlxxUPXeb3O9Y
	MJUIfrp6XRseFf4Pov4ZGQ8/aWzgwjKTw2mjr2C09jAvORbMMEuBxBZTNvsoDHb6zlwgdGFMlZalx
	Mq/JTX9ALpFpHSJ9C5ev4WKao6ytyBmtrpBy3gM5u4cJchR9QuaN6DoyEwaIvZN43wVo0+NCcLOAY
	8QCeyghpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKr7-001oUx-CD; Wed, 05 May 2021 16:58:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKZw-001hts-SN; Wed, 05 May 2021 16:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3CW2I9LHO5IWX6PRlSN8thzxNdzFbKUAtq160vECOCI=; b=R2zxcWv0S5S+bRtQ0IkAbcH4Gy
 CBxDn0+cv4q8yMd8VkHrTLiox2JFMjpuDTPB6QlRw6n6ZjnVUqmhM3rOywiMBIiJWY59etxj3QHNF
 hgEuTWxI2xx13Z8prAQZUdINTbxnQIpn7IGu/W/zkusECx/zh2/P/ru+TX/fRZFFNxVRcNRAQj2VQ
 oDQTo3JA0zbc6NLfjYyP4awgJU0aYc32HxLjci2n9lCcGUJ5SE4+MotLMmGK/9Jch5fWpK9GSoyad
 ygS1j0lFX2gnTVd6tfS+vMWQJHfkPdmKtEwgLdwUZ8Oqp3JsiWuAieqdW4/i3ZcbvulAUj0w6AEFl
 cg8mkCiA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKZt-004yES-Vg; Wed, 05 May 2021 16:40:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 788F461A33;
 Wed,  5 May 2021 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232849;
 bh=2OMhfOSE2hc5YlXeGMX+M4+Zqe3M8J8R/W0DHF6u5ok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sUqRWnRz+bAOXrWpVhUfiZwowItzIFW5gKFpN2HTAU3XyyhHA4956zb8PCBDa3z8q
 DRUp3LfYB7lr5i9TmdbUq8DUDhaVcGfYzvM9cH8rRNii55zHvDIT0VjIZZCHWn4/Rk
 s/Se8NMMyI+d9YNd8jCRAg9Sgn9iYmuTVeR6JEtpuGMjSkdzlZE9LzxNa6IYYtvtF5
 oqmO742FW8aKcE7j1u9G0g/5Qrc3nVMxy16iy660bl9rR8rAherh7DHFh3Gm2P6ZUn
 lesA+R8hCs9XT3aCujDNx91fhkhyVUIC8tgJwngEP9QHEWpaWtRQCV8zhz0vJ0V6qM
 p7FnjdKoW74RQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 31/32] net: ethernet: mtk_eth_soc: fix RX VLAN
 offload
Date: Wed,  5 May 2021 12:40:03 -0400
Message-Id: <20210505164004.3463707-31-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505164004.3463707-1-sashal@kernel.org>
References: <20210505164004.3463707-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_094050_059726_13BF5FBA 
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
index b72a4fad7bc8..59f3dce3ab1d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1041,7 +1041,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->protocol = eth_type_trans(skb, netdev);
 
 		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX &&
-		    RX_DMA_VID(trxd.rxd3))
+		    (trxd.rxd2 & RX_DMA_VTAG))
 			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
 					       RX_DMA_VID(trxd.rxd3));
 		skb_record_rx_queue(skb, 0);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 46819297fc3e..cb6b27861afa 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -285,6 +285,7 @@
 #define RX_DMA_DONE		BIT(31)
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
