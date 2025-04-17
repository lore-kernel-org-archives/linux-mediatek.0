Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE08C369CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tkue/4+hu0S9ZaDD6fCJs7PwlF+zNqiChA9SYC0EsVc=; b=VU17rd59LISjrBFuapCkCm+e0N
	iWp+yh+05PvfhGT09onBG7xxzUkUc8/tYfN+0XgRrgf1DzuR3p53MvZsQHwNBEkfO504G7fGFi1Sj
	dehBlcyGHRjd53GfLyNkpZhfqbFMhnntPqNVGIcW9eCV28rWPCgLGvjNoQfrZUd8oBJ6DRCYLSo64
	vwtWkwsIFqWL9bIEtj3PS3nV971rV9kBu2XAkSL85u7jqi4BIZZpz/jLlnIqxYdAJbeH3WfSrp5Tj
	GKZf2RhtQR+F/vMDT5bnLsYJ8YzDvSDwlVQJ7sxcA3F3nqAhgjkJpIo3E2gmMs2CC5iK50F7NP5QY
	8vizT0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SSY-0000000Dj9y-0F8D;
	Thu, 17 Apr 2025 16:51:30 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SJk-0000000DhiN-1Id5;
	Thu, 17 Apr 2025 16:42:25 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u5SH7-000000002ZV-1ibD;
	Thu, 17 Apr 2025 16:42:19 +0000
Date: Thu, 17 Apr 2025 17:42:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3] net: ethernet: mtk_eth_soc: convert cap_bit in
  mtk_eth_muxc struct to u64
Message-ID: <d6d3f9421baa85cdb7ff56cd06a9fc97ba0a77f9.1744907886.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_094224_357445_562188E4 
X-CRM114-Status: GOOD (  12.52  )
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

From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>

The capabilities bitfield was converted to a 64-bit value, but a cap_bit
in struct mtk_eth_muxc which is used to store a full bitfield (rather
than the bit number, as the name would suggest) still holds only a
32-bit value.

Change the type of cap_bit to u64 in order to avoid truncating the
bitfield which results in path selection to not work with capabilities
above the 32-bit limit.

The values currently stored in the cap_bit field are
MTK_ETH_MUX_GDM1_TO_GMAC1_ESW:
 BIT_ULL(18) | BIT_ULL(5)

MTK_ETH_MUX_GMAC2_GMAC0_TO_GEPHY:
 BIT_ULL(19) | BIT_ULL(5) | BIT_ULL(6)

MTK_ETH_MUX_U3_GMAC2_TO_QPHY:
 BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(6)

MTK_ETH_MUX_GMAC1_GMAC2_TO_SGMII_RGMII:
 BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(7)

MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII:
 BIT_ULL(21) | BIT_ULL(5)

While all those values are currently still within 32-bit boundaries,
the addition of new capabilities of MT7988 as well as future SoC's
like MT7987 will exceed them. Also, the use of a 32-bit 'int' type to
store the result of a BIT_ULL(...) is misleading.

Fixes: 51a4df60db5c2 ("net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64")
Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: improve commit message, target net-next instead of net tree

 drivers/net/ethernet/mediatek/mtk_eth_path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_path.c b/drivers/net/ethernet/mediatek/mtk_eth_path.c
index 7c27a19c4d8f4..6fbfb16438a51 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_path.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_path.c
@@ -14,7 +14,7 @@
 
 struct mtk_eth_muxc {
 	const char	*name;
-	int		cap_bit;
+	u64		cap_bit;
 	int		(*set_path)(struct mtk_eth *eth, u64 path);
 };
 
-- 
2.49.0

