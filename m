Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EF5C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 06:52:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F73214DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 06:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qEtjhAoD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EAkO2lmv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F73214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpqhhGPuN4sIc2IkzzrzE/hTtshL07jQsaEb8JLZ+AY=; b=qEtjhAoDCszp6w
	cMkSi9j8BkvbuZemn752JlVDfh1nhUNAsL94Hs8+EweM/mUyOA53G56zs/uYjLO6pJCNw18d8Kv0S
	ZCCTZzl/ZGcEkUd6OE0ynvaxgh9/thrLjfLDcXj+jQKanMFcRRoYC+wEcrNkf+bRzUNodZktQdZtJ
	dbq8UL1JsuuC8xtkU687yGJlqG+EPyBFFDwyCh3FIqPmoZaO3cYQV41gpLN0/aTHdBjwx6GUffEG9
	9w86tsdlZ7Cr2QlxF64Z7PIKw/VcPJR9kdvfbU/XYx1FccxmNII9sEvLf1p/koiD9eu/JhNSn2VT4
	LCWiBDcN+FcDP1CzkAZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU3YQ-0000No-Pv; Mon, 11 Nov 2019 06:52:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU3Y4-0008Ou-2g; Mon, 11 Nov 2019 06:51:41 +0000
X-UUID: 776e0fa4192345fca1fe59d0a616980a-20191110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YVTLncncE/8QbF39XxCJ9mXM/sirh7PaGKSXHI0dujI=; 
 b=EAkO2lmvZFLEOt+ABIsIjWilYLUsZiqviLHGBwT+dmgEIYd5hs6g1QY2WDuB84MibTE+XHJ5cSeUPeZOHDZwltSbzEEbGc+/B6vQ0Sm2YDJzxZCPzOK5R6Cj8XQrTA7Wl7f1I3JwY4SFipnl8ier/IRLtQajO7IJ223P+FYLsmo=;
X-UUID: 776e0fa4192345fca1fe59d0a616980a-20191110
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 368863460; Sun, 10 Nov 2019 22:51:40 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 10 Nov 2019 22:51:30 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 11 Nov 2019 14:51:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 11 Nov 2019 14:51:28 +0800
From: MarkLee <Mark-MC.Lee@mediatek.com>
To: "David S. Miller" <davem@davemloft.net>, Sean Wang
 <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net,
 v2 3/3] net: ethernet: mediatek: Enable GDM GDMA_DROP_ALL mode
Date: Mon, 11 Nov 2019 14:51:29 +0800
Message-ID: <20191111065129.30078-4-Mark-MC.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191111065129.30078-1-Mark-MC.Lee@mediatek.com>
References: <20191111065129.30078-1-Mark-MC.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_225140_125545_26D8078D 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jakub
 Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rene van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 MarkLee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable GDM GDMA_DROP_ALL mode to drop all packet during the 
stop operation. This is recommended by the mt762x HW design 
to drop all packet from GMAC before stopping PDMA.

Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
--
v1->v2:
* no change

---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b147ab0e44ce..5fe1ab0c16cc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2279,6 +2279,8 @@ static int mtk_stop(struct net_device *dev)
 	if (!refcount_dec_and_test(&eth->dma_refcnt))
 		return 0;
 
+	mtk_gdm_config(eth, MTK_GDMA_DROP_ALL);
+
 	mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_disable(eth, MTK_RX_DONE_INT);
 	napi_disable(&eth->tx_napi);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index b16d8d9b196a..85830fe14a1b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -85,6 +85,7 @@
 #define MTK_GDMA_TCS_EN		BIT(21)
 #define MTK_GDMA_UCS_EN		BIT(20)
 #define MTK_GDMA_TO_PDMA	0x0
+#define MTK_GDMA_DROP_ALL       0x7777
 
 /* Unicast Filter MAC Address Register - Low */
 #define MTK_GDMA_MAC_ADRL(x)	(0x508 + (x * 0x1000))
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
