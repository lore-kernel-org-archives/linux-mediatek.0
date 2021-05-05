Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884DBC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 17:01:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB5A61059
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 17:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB5A61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bsRbykE8vdWBCJCduUg0AgHyActD7O2vTc9yk56KIB0=; b=CItGyfpJs27GOJRFkQe4prut8
	i5DvL+k36bmgivjO3uzUP9FnvPYikDWPKBE1t1VAATwNa4l3Zr7iXqQg+Z9k/4IteOvWPB13VvwFR
	NlOvNkb4JoIIhUIUJcujq4UguY03F0IQlisPqARFMOcvcmP8Fnld7c0zUd2xDaQb99PBY53m0UUyf
	NPMuUamU+d+ery266/X1BdL3wcFf5oguRHOUn6WmumRvc+qtvjChj/I4nvLHGxCM1VX5J6ltKCqZK
	12tROiFbUmq/XlOg5lEocWuRMjMDSOOZdIS90y9si67b1LPU0jFFIyXFs2agHIkzIIiwKPD5xdvNg
	/ErEn577Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKtk-001pVH-KW; Wed, 05 May 2021 17:01:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKb7-001iPb-8D; Wed, 05 May 2021 16:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vJEfoM93HqjkiB3a65ovI7z4CRnI4Ajp5+aqAYds+FE=; b=GVxmNH7zvbqoFrQ9dccvGZsR/X
 CTWTL0djdps8aOSnoBiO4YBYJAUP6trxl26t78IVodTVfx1QnGceNfyMVn8sIFEOHU8HPprGEDuCA
 gpiH+MXaf+/q0tzaGPayk/BbSz/KsB4BgnOBpwffGCdvpUlVwtoBPd4cj4fGO/aJfK48khfLYdBpr
 yCNqT/KlkE+sa9AUQGA0EnNjrL4/ENGFTkbxtevLdn2iw5+IgEE6yXPGmNxHfi4qfTSPQ9lgNGSSz
 jgRVtawcUT+6B/zgxPGtn47KCO1vIb8AiZMm8SBmK4GPuh5CqEP/wYUf7D8bKKenLbm5t6YwCenwF
 eGjUoeMg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKb4-004yQa-IS; Wed, 05 May 2021 16:42:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3612061C17;
 Wed,  5 May 2021 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232922;
 bh=sfDLtjKtJDIrtdiiba2YhMmGFCjvSbLT2V1gqLl01Yc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Py6PBlCgJGZnMQKquJvKcT+5b/kg+UVp5QqhvXBhzzHVbKTCJSOwgOdAL4+EpEAcQ
 vYYaBa7A+axE5r3HxZyQWx9pVRJLkZwZRmEn8LFH4QkfUf9R29b9BaFt0d5jF0Pvsa
 i9lom8dnu6hYnB/T7Capgt8F63Sw4hYWWH0nXs4YjAZ9uUgw6wzu4SDdS5crTb73P0
 imhn7qSjkSIxikifwizR89Kdrls4aIXF9+z3n17TWVwu0i//KfUcPbNE4zUsKoovJK
 FxGhrzveZW+VzZMwggu7IZzTwf9MtcZv1BXtEDmOHN1l1v5+zEnbgNg2D9etbh3WeI
 OSABq+1f+4t5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.9 22/22] net: ethernet: mtk_eth_soc: fix RX VLAN
 offload
Date: Wed,  5 May 2021 12:41:29 -0400
Message-Id: <20210505164129.3464277-22-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505164129.3464277-1-sashal@kernel.org>
References: <20210505164129.3464277-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_094202_649708_D81437A6 
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
index d10c8a8156bc..5b072bf80783 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -964,7 +964,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->protocol = eth_type_trans(skb, netdev);
 
 		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX &&
-		    RX_DMA_VID(trxd.rxd3))
+		    (trxd.rxd2 & RX_DMA_VTAG))
 			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
 					       RX_DMA_VID(trxd.rxd3));
 		napi_gro_receive(napi, skb);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 99b1c8e9f16f..2e7ccd8261c3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -272,6 +272,7 @@
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
