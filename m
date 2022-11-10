Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3421C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKOsIjWD9UiWHhSPTpYvwZctofSL/DoRkI6SCzJGFi8=; b=OsiQ6WqMyJe8NX8BfxVDSnYcA3
	DiRYVigNHaOcBRo4JxC2cPDha8CvUCOxntZGo2KOGstZpHTgamvXWJM3D1wL7mgLyYJRfn+O5cXev
	HSP6IKHdVzsr3oli8swetubeUlUFIsiratIF/KhxPbMQ1djtNM3IblYkgdCIl9fPBaYkKlsBE4Jg2
	tlOf3EAcNR/KsZr1irEzdQfa6qg33Of0b2j7ENt6XmPSCG4N2xoIIew6NTDqfNJqBSzAaJrDRWD9/
	OadvVDhIEUQiNwc735W5o9Uz1o0rCg4UoStme7/xzfnbLM/UFMuBJN617Ml4fXOhS4pU+N/sSuyza
	d0XGk/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otF0R-00ARYc-5s; Thu, 10 Nov 2022 21:22:39 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otF0F-00ARUT-Dl; Thu, 10 Nov 2022 21:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XKOsIjWD9UiWHhSPTpYvwZctofSL/DoRkI6SCzJGFi8=; b=s1z7yzMESfXzDhx7aJHfunCO5+
	u1WwU4WteCJetVzMY4zgbJndQmKkGHnp15bUZPLAabaMhQkzi5yxvWm72msGHOhhjREaQAW9NyXs1
	VWkoC9lnFfMukB7Nyn/UB6RNlKqZ1qJtZjNQj4PSVb0HpxnFazol4H5alBY+S9tbh1lA=;
Received: from p200300daa72ee10c199752172ce6dd7a.dip0.t-ipconnect.de ([2003:da:a72e:e10c:1997:5217:2ce6:dd7a] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1otF04-0011Om-G7; Thu, 10 Nov 2022 22:22:16 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/4] net: ethernet: mtk_eth_soc: pass correct VLAN protocol ID to the network stack
Date: Thu, 10 Nov 2022 22:22:09 +0100
Message-Id: <20221110212212.96825-3-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110212212.96825-1-nbd@nbd.name>
References: <20221110212212.96825-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_132227_477718_FF46D0E1 
X-CRM114-Status: GOOD (  11.26  )
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

Use the id from the DMA descriptor instead of hardcoding 802.1q

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 1cf76fd7afbc..891dd6937f89 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1936,7 +1936,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 						htons(RX_DMA_VPID(trxd.rxd4)),
 						RX_DMA_VID(trxd.rxd4));
 			} else if (trxd.rxd2 & RX_DMA_VTAG) {
-				__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
+				__vlan_hwaccel_put_tag(skb, htons(RX_DMA_VPID(trxd.rxd3)),
 						       RX_DMA_VID(trxd.rxd3));
 			}
 
-- 
2.38.1


