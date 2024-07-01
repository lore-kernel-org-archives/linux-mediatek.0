Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0946AC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 19:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cf0Vb6MZM08TNq/yHs0gXjxczxlVuicMRLJoRZkec7o=; b=bMfU8DvI0IiqiQVrgUi08m6pEU
	c6nu9CPDZfGkRQeOx/zUc6xBe4O5GAee8wg5fu3LPyeLrAhVeniTtY9B4n1ndElYXV33Hf63vyR+X
	nS0hYCFLprteqqMsuyHc26z52AACcA9kd4cmIoFrMY8fK1MfA7wwAe2DA5x688LETGjoxrmbFYivc
	tNSOYiM1jl/zBGPE5DIjbrenMpSzU4kz263nycGrG7ZHzlrX25bPH9n5rQ83wpEOzolnooexGxogq
	4Adopssu5z3UksylTMqyOQdTATmz0ZOMsm4ZsxBAOK5/LvWhsopnhBab/b1faAu1hkqJ7zByK3Svp
	SMgTg8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMhn-00000004dlu-2Tqk;
	Mon, 01 Jul 2024 19:28:51 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMhW-00000004df8-3HuO;
	Mon, 01 Jul 2024 19:28:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sOMhJ-000000000Vo-1Tfb;
	Mon, 01 Jul 2024 19:28:21 +0000
Date: Mon, 1 Jul 2024 20:28:14 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Elad Yifee <eladwf@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: ethernet: mediatek: Allow gaps in MAC
 allocation
Message-ID: <379ae584cea112db60f4ada79c7e5ba4f3364a64.1719862038.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_122834_841858_0ED7DC0C 
X-CRM114-Status: GOOD (  13.48  )
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

Some devices with MediaTek SoCs don't use the first but only the second
MAC in the chip. Especially with MT7981 which got a built-in 1GE PHY
connected to the second MAC this is quite common.
Make sure to reset and enable PSE also in those cases by skipping gaps
using 'continue' instead of aborting the loop using 'break'.

Fixes: dee4dd10c79a ("net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs")
Suggested-by: Elad Yifee <eladwf@gmail.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Note that this should go to 'net-next' because the commit being fixed
isn't yet part of the 'net' tree.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 13d78d9b3197..2529b5b607c8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3396,7 +3396,7 @@ static int mtk_open(struct net_device *dev)
 
 		for (i = 0; i < MTK_MAX_DEVS; i++) {
 			if (!eth->netdev[i])
-				break;
+				continue;
 
 			target_mac = netdev_priv(eth->netdev[i]);
 			if (!soc->offload_version) {
-- 
2.45.2

