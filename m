Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA252C369B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDughPP61Ex50t+n5Kc6DXtFrchUu1kwIJMuSu3OimE=; b=bmyma5R2rVP0AHeYNvilMGdcCT
	h8IxP2936OI9IqCAGZDLZOHmPCOKDrMC8pVDQYyvdQ4koPzNjOaSGemrdcbKfnZvdZEHC0925ET8F
	mAM6vNgbCmGmiC5LIQV5ASzRlZ6M2PEvKDmKBGR0AWyrrsXbG+I/CsXlqxUL/Z0PpRO1vlyIbUxeE
	0XqgsrbuTC6qcfHrV0Pf1a77TXuKQjg8brbI2YgVwM25AGi6sGBLYkbuG8eC4zktkPZSV5QroQ7Tc
	9CAIodxTW6oy/cc35XqQxa7AeKGZEPXNjda3DUzXyNX1xI/UECO/oMbR+CAAeKSpxsh+j/wsKsvGE
	1u93Iu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OQn-000000035B4-3HYY;
	Mon, 14 Apr 2025 18:21:17 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OIp-000000033g8-0BW4;
	Mon, 14 Apr 2025 18:13:04 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u4OIi-000000003za-20KK;
	Mon, 14 Apr 2025 18:12:56 +0000
Date: Mon, 14 Apr 2025 19:12:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Bo-Cun Chen <bc-bocun.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 5/5] net: ethernet: mtk_eth_soc: convert cap_bit in
 mtk_eth_muxc struct to u64
Message-ID: <dde46bff10fc0ac5e7c6facd1bab018b147356d9.1744654076.git.daniel@makrotopia.org>
References: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_111303_081473_4BF37F7C 
X-CRM114-Status: GOOD (  10.83  )
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

Wihtout this patch, the mtk_eth_mux_setup() function may not correctly
search the Mux.

Fixes: 51a4df60db5c2 ("net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64")
Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
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

