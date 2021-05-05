Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3ADCC43600
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:57:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6A0613FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6A0613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fvz02K8UP+WI5Ggf6SlqzHvB6VmS/b9TUwf+ZuVF6TM=; b=RiXDrIe8oA4zajGMrArv5ghCn
	JIQ0ImJGKXbZQuJPfAm+aS4mPQTRFrpK7667HlBUbQ9vATEQ5GuZngadhlSlBQ4bVDqgzYhfR9/Sv
	hL/Tg2AqXni/zYak/xzKr+Ud+tumcbrKilOUZUacAlLwwCAfhlnUv0rvS1qMMYjNxAuDoOOb6WV9e
	HNy9JNCPc4DO+wEUu4gXJQ+AuK6E0SqkuOM+bbxvmATi3zD56YalBjTMpB258bwOw5K5+45KLKpsw
	T73i/8ut07KLEaKfwUGACIQsG6lRqd0TtDTN7conlvQEHWRN869Lo6aCJl6Rk8aryC3+UxE/u3qhl
	49a0DFp3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKpY-001nuV-HE; Wed, 05 May 2021 16:57:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKZ9-001hbD-Rb; Wed, 05 May 2021 16:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4AYASpm5V49RZXv9cmuRa0MytIx53STDRUx9RIzZvXc=; b=stdHOEC0R+DEAWakVbqqifwr6h
 TxBeP69g7T5OnOLe0rKcAKFBzyUUd/5obQpXB/NJVl5tl1RLeiyOXdt52otZT+OMUrawZb36iFarH
 h9cRTp/2kn2JOzIX3F3FwIzWhsqjxRey4E6Pa1LmL3Ds/uGI1lExu080l/2w3xayf/6/s0ya+a80Y
 PVVcTvoCHCS91QExaLHX2a6K/tx6xfu76nuuSGezxzL5rTy/Pinod3SEfVEdjLtFtqhettaGIQGGK
 h0J4ZZOrEE6bSwWudvCcddk8AQr2K1UENkr3Y4WW2XwwL+JR9KBG4WLZgpfpxdoJEaFh5E+Ilw6E7
 O6WhP0Sw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKZ7-004y5S-Bf; Wed, 05 May 2021 16:40:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1BDA61997;
 Wed,  5 May 2021 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232801;
 bh=uhJonWH3UFMxyXpuKpf7hxkAMmIAbWNq6vh6ZFFOgA8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fyBVi+Cki16QxDFO40k9D0aUEfIAwyeoyF+SkOL/gh69+6kJoyW/RLH9dKNUOY98r
 BhnSRPl9XIWHhQWwod9JzWR21HpzzWwntvyOHIYqyFMB/jjMTDXPRp8CtlKUwOzkuS
 wyCILNR0JYLg4ULT0S5XC9UNg7GZiB4bIh53N77pXQzL5C9s8JLOfu394IbDx0WE80
 YPnBJ9KMmZPAFIbfCYHV06a0FYR7Fqbfy3ANwy/6f9rVJxXn02YdEdCpZ532jwWYyI
 x6wT0KQBlpHoBPm+/4+xPl9R4s/os5XeMqIqbHV+LepKR/G0d3y2mZFArVEgdXq4pX
 LOMqUGWzVy2ZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 44/46] net: ethernet: mtk_eth_soc: fix RX VLAN
 offload
Date: Wed,  5 May 2021 12:38:54 -0400
Message-Id: <20210505163856.3463279-44-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163856.3463279-1-sashal@kernel.org>
References: <20210505163856.3463279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_094001_443606_F3AC56AA 
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
index d01b3a1b40f4..7e3806fd70b2 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1315,7 +1315,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->protocol = eth_type_trans(skb, netdev);
 
 		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX &&
-		    RX_DMA_VID(trxd.rxd3))
+		    (trxd.rxd2 & RX_DMA_VTAG))
 			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
 					       RX_DMA_VID(trxd.rxd3));
 		skb_record_rx_queue(skb, 0);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 1e787f3577aa..1e9202b34d35 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -293,6 +293,7 @@
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
