Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58080C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2vArfU947PR7vgPtlSV6EYV4IGOM6e8hXqwiSSlecJw=; b=ugo2Qypf1BH8qI/7CfzSZaGXFv
	inja5bjIwg+fGkmQ7188+Nhh1YFHCMymlKW4GM0ldJaE5VIt7MbpZ9LNfaMcL05ioSrhbWA5uMNIJ
	rmMc6useaiIge4G/N0uKLmi8ie2DODvwzPmXrRup+F8CBqX0GCSEfDM1Q5s+wAJCCrf77S+lu5NxY
	vCb7LLUpWsmArL+tnYZNqGcA/zp9mB0C3PGLa+UlZcu7pjs9yG1GhvY1j3dpyNcPWvcRVoQqqnFD9
	mp0fhZC9OyFy3Fy9LsBXOBih290cwf0tJEtsOxfG+UqowAvjtn9a2s/Cc4IVNiXERQT9vfwAPEkuK
	bpWVHviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCXQ-00BShZ-Ee; Tue, 27 Sep 2022 15:30:24 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCXM-00BScJ-Tm
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 15:30:23 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1odCXB-0007o6-0O;
	Tue, 27 Sep 2022 17:30:09 +0200
Date: Tue, 27 Sep 2022 16:30:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sujuan Chen <sujuan.chen@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix mask of
 RX_DMA_GET_SPORT{,_V2}
Message-ID: <YzMW+mg9UsaCdKRQ@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_083020_988085_2D21B256 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The bitmasks applied in RX_DMA_GET_SPORT and RX_DMA_GET_SPORT_V2 macros
were swapped. Fix that.

Reported-by: Chen Minqiang <ptpt52@gmail.com>
Fixes: 160d3a9b192985 ("net: ethernet: mtk_eth_soc: introduce MTK_NETSYS_V2 support")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 1efaba5d433775..b52f3b0177efb9 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -315,8 +315,8 @@
 #define MTK_RXD5_PPE_CPU_REASON	GENMASK(22, 18)
 #define MTK_RXD5_SRC_PORT	GENMASK(29, 26)
 
-#define RX_DMA_GET_SPORT(x)	(((x) >> 19) & 0xf)
-#define RX_DMA_GET_SPORT_V2(x)	(((x) >> 26) & 0x7)
+#define RX_DMA_GET_SPORT(x)	(((x) >> 19) & 0x7)
+#define RX_DMA_GET_SPORT_V2(x)	(((x) >> 26) & 0xf)
 
 /* PDMA V2 descriptor rxd3 */
 #define RX_DMA_VTAG_V2		BIT(0)
-- 
2.37.3


