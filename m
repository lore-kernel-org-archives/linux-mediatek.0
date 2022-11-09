Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70A0C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlWx8xsTCdfxtgLYoUzFnVCZjXRJlA1hg0PQEq10fwE=; b=KNmFeR+G0QFBkBSZGJ63XK0Uti
	r3UEEW3OhCEOEzFLXjz9nXisfdmt7qjJ9ZjxxY2LbS6z4TbAyAaCEt8Juql8JcXoF/oW1m2affMvF
	rOf9VDfp7/qhpFKprId9e86ACSeJIyEqCPL+Ry5HBvEimCPqSiehQDdKDKy9uBJcS78yHxi4ywlGp
	PPM3jNVsKpJn5EYiknkTgZS9a66jfcl8IZ7O78PMzsGkQkNLs9IuwkLWi89tdUqe982VHqoxcUPoj
	R+VmMcednOb1QcuzVswAK+b9UlXwWXIIZGJ/GbKsQ9P0JvqPGK0SqUBa3IsAMIabJEes7S+TUWXx4
	v/NSK2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso3W-00F43w-MM; Wed, 09 Nov 2022 16:36:02 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2L-00F3L9-93; Wed, 09 Nov 2022 16:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wlWx8xsTCdfxtgLYoUzFnVCZjXRJlA1hg0PQEq10fwE=; b=OIAM7q5NYu41hcHMIPQK990l5Y
	vpQYZhPl7o5Ns6foy1wqgtGrtFwt9W2Iyi1WTmsGi+V/AD5VoLFVaeZHSvW0x7Cat3jNXsOkuKgR4
	iE61HSTdnYDCj31f5D2+zoNBsXOZgl0ahtxiKGT9XWl4Dk7u2G9joUbEy24ox9mBWFkA=;
Received: from p200300daa72ee100054f3c61b16ef6e7.dip0.t-ipconnect.de ([2003:da:a72e:e100:54f:3c61:b16e:f6e7] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oso28-000l4N-3V; Wed, 09 Nov 2022 17:34:36 +0100
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
Subject: [PATCH net-next v2 07/12] net: ethernet: mtk_eth_soc: compile out netsys v2 code on mt7621
Date: Wed,  9 Nov 2022 17:34:21 +0100
Message-Id: <20221109163426.76164-8-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109163426.76164-1-nbd@nbd.name>
References: <20221109163426.76164-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_083449_357451_F323B551 
X-CRM114-Status: UNSURE (   9.63  )
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

Avoid some branches in the hot path on low-end devices with limited CPU power,
and reduce code size

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index c6a39a249fb5..146437ca044b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -905,7 +905,13 @@ enum mkt_eth_capabilities {
 #define MTK_MUX_GMAC12_TO_GEPHY_SGMII   \
 	(MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII | MTK_MUX)
 
-#define MTK_HAS_CAPS(caps, _x)		(((caps) & (_x)) == (_x))
+#ifdef CONFIG_SOC_MT7621
+#define MTK_CAP_MASK MTK_NETSYS_V2
+#else
+#define MTK_CAP_MASK 0
+#endif
+
+#define MTK_HAS_CAPS(caps, _x)		(((caps) & (_x) & ~(MTK_CAP_MASK)) == (_x))
 
 #define MT7621_CAPS  (MTK_GMAC1_RGMII | MTK_GMAC1_TRGMII | \
 		      MTK_GMAC2_RGMII | MTK_SHARED_INT | \
-- 
2.38.1


