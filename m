Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C695C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eABFuziAFv9CG/pcpOvBVb6ZPtsG1pSS3xVSecQ/ysM=; b=B5Np5whW8A9bKgLEfl8Yn49p+M
	ZnCCxDIt21/YQUrggwtOU5OjW7ovAlR6Vni3BYbQ6KAnfjONCaQ15AcsHN7MkMdf4rjlK9rWiT5Bi
	xDgSz45WA9giKn8DvE8h90QlUJ/aK30gpDx1LmztWImkXFEVEToNEiBCRQrI1XdP4TMmOniiSL+eu
	n7oHMlonl/s9/tbwjWibZq1klrnhzCjKRRFsTMQP1iZqscViDIbr2lmwzR9J3LnrV6PfQScicI2sA
	pCxd/1OnBKQyhPCcP+mMf5egedmmajAnNlRZtXAd8P/AvKCHDY6AIVWYaGNwBfhus10Ra5VJJE2SC
	hm9T1Ifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmWZ-00G9Us-Tg; Wed, 23 Nov 2022 09:58:35 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmWE-00G9Mo-5r; Wed, 23 Nov 2022 09:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eABFuziAFv9CG/pcpOvBVb6ZPtsG1pSS3xVSecQ/ysM=; b=G13HwW9x5H9EKBDevun+fC6NPW
	dOFjv8fDbIWC+GV474I88KzDR/890Pu7pC3h5Cq7aLDtvq4jYtukPmEFn/EvXJCmNnnaWG7FSdNhv
	zywT5Egt4BCBSdb6nEvKM1pxb9JVNhILhv5CMJpi+QELMUMccBJ43XnooHnjS50KRe3s=;
Received: from p200300daa7225c0894d890dd9e4669b3.dip0.t-ipconnect.de ([2003:da:a722:5c08:94d8:90dd:9e46:69b3] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oxmVw-003vzk-9a; Wed, 23 Nov 2022 10:57:56 +0100
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
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] net: ethernet: mtk_eth_soc: compile out netsys v2 code on mt7621
Date: Wed, 23 Nov 2022 10:57:51 +0100
Message-Id: <20221123095754.36821-2-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123095754.36821-1-nbd@nbd.name>
References: <20221123095754.36821-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_015814_310393_58965CCC 
X-CRM114-Status: UNSURE (   9.21  )
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
index a553265c10de..628ed72911bd 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -907,7 +907,13 @@ enum mkt_eth_capabilities {
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


