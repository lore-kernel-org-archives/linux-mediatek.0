Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241E3C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 17:00:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BCD613F1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 17:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BCD613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VTZ9rCf78/P5MjS5BDe0iE+TjgzthoyNRkjEpOej8JE=; b=bmnOBNIwM34vXtaaqXdqq+xvB
	QAPOPjKPbK1L/AGDR2iP4tRUD6otPdNvN+4HudEQcToLO5ZHkwIpAvOQ1HCIBCH581mXbB85j4Fua
	0XlPmB034rIJcUKrYvA8xoX2w4TSufEbQ+H7D2y0VmrtU4LVy/blu81IEGNWd+Une0GcWs6FgT3mc
	OceHuXTceV+B9dOt5caHUpHdIRCL7e/C66kzHDgYJx1Bem09QCf1ytyRKd+7lvxtvjjxKDoDuARNR
	4ysLxBj5mxnPwRD0GP2ZuTyd4NatkZzprEHq4ciTB2EOhT2mbzYJzYOYyix+qpfG3zz3qLw8DyQrK
	coT2+rgcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKsg-001p69-MB; Wed, 05 May 2021 17:00:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKab-001iAg-4o; Wed, 05 May 2021 16:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MrlIAQazQlOraDcPvNZpuynr497toqfAjw+YG6x00YU=; b=Ml69e5Hmwzh6jwCEK3ivlMBkNI
 /6jrD3HdDYD+cyu+Jqe/NEDs8Z1ko8vNUZ63uzGR6XhU1jj57wEezkKcLAWiA2mne/uCT3dTLt9NI
 mVl9NwFeUlj0hK6mvYLDPAtdbdB9TuqMLQPnuKNj8ya+rEgUKVLkKHToVYlbJMVD9Lx2hka7V6aKq
 HAb8b1paipgjsEg4bSs8U4aNDgy69wngEGij21fpYDMiXQDoZa/o4AHM0yFLoB9Nkuo6vb3wSU5jE
 JTZU4bNoYtWIz4HXRp8S5kwAYrtJU+iUl8KuVOrrQg1OBaD3qCkqfuSoVR4Z0bM7CjGzqfMtqr7ST
 kkURB+bw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKaX-004yL3-K1; Wed, 05 May 2021 16:41:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E889261C27;
 Wed,  5 May 2021 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232889;
 bh=dLExIPbUsLELB2mh7d2PwNf7U5Fnt958NIluJdxmVGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lddCRx7p8uzaLaIjVyLPnMnU1o9ZgVvQ5ZrmKoKGouNZIUB64l1x4Bsai/QEfhCyb
 OcPVKABtD6PuAQuiY5kKRlhxPh0i+u6WSc83V4zcygbWLhrbaFubF3TAINEUDbu2TR
 l9i8yQVeZBdlTFFHNQ3Spju7FPmzyiVsbg18Fn2Oqn9Ubt4mAhORmS6fp84Ygy58qT
 uG5QzQQdoiJOxY8nyuDLWDdZUUYdlw6fZKpJTA/XfTAYTdFQN701sHJG+MU3+VzMA4
 w69E19Cb7gXcgXUcw4MEdI/LFqaNK79bT3qiZg86W3OGv7n0SqepZXdx5jybW71/2+
 UjYVpoWSrB4rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 25/25] net: ethernet: mtk_eth_soc: fix RX VLAN
 offload
Date: Wed,  5 May 2021 12:40:51 -0400
Message-Id: <20210505164051.3464020-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505164051.3464020-1-sashal@kernel.org>
References: <20210505164051.3464020-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_094129_715775_00D83454 
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
index a52909db67f6..dbd16dd5aa04 100644
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
index 3d3c24a28112..ef82a30b2a0d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -283,6 +283,7 @@
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
