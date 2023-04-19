Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3DBC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 19:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F45UzTj4xsAwlT7Xf12zmKoApQ324lriJEm4bTv4O2s=; b=smnuQ1csVfGw0FAAdDz45og0gc
	f2Lr/3xM6uzWbckm4Eiptg3zY8riolUswoklBpiCCS5WYC92quhKn5ZFNlO4Qou73uYIAZ1hfM7ik
	IXBlzrm9yXtX44QeNEwfKmyARmYbM31sstigducguu7W3zWjs0n5+YOOnAEQ/3Qs6E9Ncvi4lAIrc
	21Z3nTuaM5yKZr+lDBkGJAZ3fPuJfxKKG23wJWApPrZvvdrz/3VtqraeHbsBP8hkZILCO67IBeKhJ
	eXlaavLzgOI1J/TxHb4mVUaEDDtCaQsMVdKCF2Gt9x5vHwKMltBFzjCX1S1VLcgc4VnhXhUc2wYxb
	/Tx7v5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppD7Q-006DMi-0S;
	Wed, 19 Apr 2023 19:05:28 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppD7M-006DL7-2b;
	Wed, 19 Apr 2023 19:05:26 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppD7K-0003n3-2L;
	Wed, 19 Apr 2023 21:05:22 +0200
Date: Wed, 19 Apr 2023 20:05:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next 2/2] net: ethernet: mtk_eth_soc: use WO firmware for
 MT7981
Message-ID: <2651cfd1427175ac1ad08d5b7be146c55d94b674.1681930898.git.daniel@makrotopia.org>
References: <cover.1681930898.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681930898.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_120524_841205_1E5656E2 
X-CRM114-Status: GOOD (  11.62  )
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

In order to support wireless offloading on MT7981 we need to load the
appropriate firmware. Recognize MT7981 and load mt7981_wo.bin.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 7 ++++++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.h  | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 6bad0d262f286..071ed3dea860d 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -326,7 +326,11 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 		wo->hw->index + 1);
 
 	/* load firmware */
-	fw_name = wo->hw->index ? MT7986_FIRMWARE_WO1 : MT7986_FIRMWARE_WO0;
+	if (of_device_is_compatible(wo->hw->node, "mediatek,mt7981-wed"))
+		fw_name = MT7981_FIRMWARE_WO;
+	else
+		fw_name = wo->hw->index ? MT7986_FIRMWARE_WO1 : MT7986_FIRMWARE_WO0;
+
 	ret = request_firmware(&fw, fw_name, wo->hw->dev);
 	if (ret)
 		return ret;
@@ -386,5 +390,6 @@ int mtk_wed_mcu_init(struct mtk_wed_wo *wo)
 				  100, MTK_FW_DL_TIMEOUT);
 }
 
+MODULE_FIRMWARE(MT7981_FIRMWARE_WO);
 MODULE_FIRMWARE(MT7986_FIRMWARE_WO0);
 MODULE_FIRMWARE(MT7986_FIRMWARE_WO1);
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.h b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
index dbcf42ce9173c..7a1a2a28f1acb 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
@@ -88,6 +88,7 @@ enum mtk_wed_dummy_cr_idx {
 	MTK_WED_DUMMY_CR_WO_STATUS,
 };
 
+#define MT7981_FIRMWARE_WO	"mediatek/mt7981_wo.bin"
 #define MT7986_FIRMWARE_WO0	"mediatek/mt7986_wo_0.bin"
 #define MT7986_FIRMWARE_WO1	"mediatek/mt7986_wo_1.bin"
 
-- 
2.40.0


