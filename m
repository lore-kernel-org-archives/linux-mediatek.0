Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9D4C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6uGEkYiiDNJdirEp88wlQrzHeOKWYnyUx0/Iz4Kx7zs=; b=0EfHT5NyMtYRZPs/puznCmN3Xl
	GUlKfy7MPP6af+f6tLzyT/U8PXm/2cBg/RFrNbGwNdN9KRHWrZkqYxLVkZRjd3nUW9LPUVI2vA3Mj
	XFrOR2gwObrDc3AnrRFFOoZW++riC/grfWNijvMpWZ9PrzRNF2ONsboQy19ZvR7VF2825SSvKw3Z1
	TPdKN3jAmLt3gcSXy8syMTtp9ul9r9WPhvSia/XvDMbEpsIYIuqQX9sltbEEUPPqxUc4O4tJV+Bdf
	UeniP9b0Qngc0i+HshSqiJ9puQjtK+Icy83l1eDb0nEVFq+ILygzfUQhzN8Zkw+CElOz4/Q/wl/fD
	ZEidNrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmX3-00G9lo-AR; Wed, 23 Nov 2022 09:59:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmWE-00G9Mu-6k; Wed, 23 Nov 2022 09:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6uGEkYiiDNJdirEp88wlQrzHeOKWYnyUx0/Iz4Kx7zs=; b=aH9ewe1zvFWVb4tslzb7s84Um4
	d7ns8MepdyUaAsbWXaxhzralIQRPE2yKshe1mJQHAUbBYjwf4pRPXOg7AjSc4eMYWtUf8PP9+k5ux
	q4rkshNyg0LcPJ5s4z7P16utRWFLRIeidovjf4NK//Mu2Vn93gMxy5WUnqSFmRkmlDI4=;
Received: from p200300daa7225c0894d890dd9e4669b3.dip0.t-ipconnect.de ([2003:da:a722:5c08:94d8:90dd:9e46:69b3] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oxmVv-003vzk-My; Wed, 23 Nov 2022 10:57:55 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] net: ethernet: mtk_eth_soc: account for vlan in rx header length
Date: Wed, 23 Nov 2022 10:57:50 +0100
Message-Id: <20221123095754.36821-1-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_015814_308877_F216F101 
X-CRM114-Status: GOOD (  10.12  )
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

The network stack assumes that devices can handle an extra VLAN tag without
increasing the MTU

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 7ca806b4de10..a553265c10de 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -34,7 +34,7 @@
 #define MTK_QDMA_RING_SIZE	2048
 #define MTK_DMA_SIZE		512
 #define MTK_MAC_COUNT		2
-#define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
+#define MTK_RX_ETH_HLEN		(VLAN_ETH_HLEN + ETH_FCS_LEN)
 #define MTK_RX_HLEN		(NET_SKB_PAD + MTK_RX_ETH_HLEN + NET_IP_ALIGN)
 #define MTK_DMA_DUMMY_DESC	0xffffffff
 #define MTK_DEFAULT_MSG_ENABLE	(NETIF_MSG_DRV | \
-- 
2.38.1


