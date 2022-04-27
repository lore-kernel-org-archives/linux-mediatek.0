Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHWp2Y/oTQSAyj1IYFWalE7SVSCb86LXA9BCQ7NUEVE=; b=qYpIlsNlGaPW1W
	9414+ldVICSVcPo9/8SSqINxE2WIZ2NTuwGwwNNJdPoyJkK3RfmayBhsllfNIMkofJ72jt/oaa6qG
	bQZgbZPAw6fmPIkwebWXa1GFK/TgH9Hd+mJU/MDBfBu7/HlOvWowkFNEmpz7yk366PDIOUMNQrVGT
	sJbJ35T9ccB7rJnmBqRsjJ4Ms+BG6gA/rv1tMbEb9i9FXiM1KuK03GCUBDKg6aZKE4yzvxc9q0PAp
	elFjJGjuQPRpdupr2CUcXZNd1eYBJdMh5j/Di4/p465/lj4A3Zwaed9nlfIKZWfYJ/Ssci/MuwT+J
	LidN3FEWNhstJHVILaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njjnt-0022vY-B5; Wed, 27 Apr 2022 15:42:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njjnD-0022VS-HA; Wed, 27 Apr 2022 15:41:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E78CBB82874;
 Wed, 27 Apr 2022 15:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443A8C385B0;
 Wed, 27 Apr 2022 15:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651074084;
 bh=UQ7T/ivpJnhp+Ti+c/WaKjLjgaMTqUGoKyi4mXYztSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UsXrG1LE5E2RLtUlEospNCQSJAz+ihkIyJbeRakZD8CAipd9sUm9oe4AbidOAuVZG
 ezLMIoYTsUdjLO+6fERs2D+QXE0DrCgjaXj2fu8dELW/CKGOTX/2QaTbaNZVOjaA+m
 QihQFcX+8vr0XoAdOnG7zQQ0BLvHOqCvWgJB4qf5jRb7mGX7G9y+o6ZUb8B0Tltbwc
 B5ZLKAWErQ/SfIHnAh+kHwxsTeH7nZTIOQe6NWZfRrHP5CyQnhDEngUMgh39VJ0Ga2
 fxnYTI0e+v7bgqkNa5MLqbsMB4XRoKiKj8HU3gPJ9E2RDoPif/gs8IrtoE0lMe+7Rb
 GWgEhyJd6E5VA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 05/14] eth: mtk_eth_soc: remove a copy of the
 NAPI_POLL_WEIGHT define
Date: Wed, 27 Apr 2022 08:41:02 -0700
Message-Id: <20220427154111.529975-6-kuba@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427154111.529975-1-kuba@kernel.org>
References: <20220427154111.529975-1-kuba@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_084127_762535_29B383A7 
X-CRM114-Status: GOOD (  13.30  )
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

Defining local versions of NAPI_POLL_WEIGHT with the same
values in the drivers just makes refactoring harder.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: nbd@nbd.name
CC: john@phrozen.org
CC: sean.wang@mediatek.com
CC: Mark-MC.Lee@mediatek.com
CC: matthias.bgg@gmail.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 18eebcaa6a76..31c5da5d6b72 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3298,9 +3298,9 @@ static int mtk_probe(struct platform_device *pdev)
 	 */
 	init_dummy_netdev(&eth->dummy_dev);
 	netif_napi_add(&eth->dummy_dev, &eth->tx_napi, mtk_napi_tx,
-		       MTK_NAPI_WEIGHT);
+		       NAPI_POLL_WEIGHT);
 	netif_napi_add(&eth->dummy_dev, &eth->rx_napi, mtk_napi_rx,
-		       MTK_NAPI_WEIGHT);
+		       NAPI_POLL_WEIGHT);
 
 	platform_set_drvdata(pdev, eth);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index c98c7ee42c6f..b04977fa84f6 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -24,7 +24,6 @@
 #define MTK_MAX_RX_LENGTH_2K	2048
 #define MTK_TX_DMA_BUF_LEN	0x3fff
 #define MTK_DMA_SIZE		512
-#define MTK_NAPI_WEIGHT		64
 #define MTK_MAC_COUNT		2
 #define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
 #define MTK_RX_HLEN		(NET_SKB_PAD + MTK_RX_ETH_HLEN + NET_IP_ALIGN)
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
