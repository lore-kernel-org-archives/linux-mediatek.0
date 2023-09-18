Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36CACD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRTLfHslgrn5G18o15WxVM7xM5IZ/3hB2gvrVBbwnNE=; b=XPCFrt0C3q7dAB4cMdGV3OATTw
	lWldlStyjR0BVaJVAj1EJOHi2r6Ma5uJQ7ngRGBHApb7h/AnqwlED/QaoPltpxq9/gsaM1ITrDT/O
	laDkoy6cICs6PV/mXOHid+yz3um/75GwoNZGuVvpRXJRe/4/8jDx1KZ+LiHAezUhpSsv1aHZLr6j0
	+owFxFbAWmGM/kbanmZSCmqGK+E++M1vlZ4BQjcHdKrvxacn+1MTXOi90zjGV8BnlwrViLD+D5inL
	FenBzPzT6usRGiorCHfbCqku1QbXDyiV15a5PR7z6u+WNT8xo7bcLc/FhLycsYjElWZt6KmQmswIQ
	HvW0UBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWT-00F8Db-2E;
	Mon, 18 Sep 2023 10:30:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWR-00F8At-1f
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D7033CE0B5B;
	Mon, 18 Sep 2023 10:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C239BC433C7;
	Mon, 18 Sep 2023 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033028;
	bh=4RTnOVnxkFJKdO/9EOrIbdbdUbFE1MV2mBwdfo/GVPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=so9R/AAhygNiDc/qoNsV2QKu6AAme6MpJt9N93Cqd0CTfnZNVepzDrOGuy6OoTbQ0
	 RVWiRk2atmoA4XzFdz3GZefHy77dF6qd17WJ64AHW1y+C3mNyZE+8hfZb94eGipWm8
	 4/jZ6768W2LKB8ygv31n64+HPPh//PqluZu+hoYiL8z9o1ZwjagixR4jvhUm52EKiT
	 NKaLD68G4JIArKFAWgTKl8s6+fTyWEfieAcRosSse/XOjgPNV+SEkZD6nWg+K2vkRO
	 G5zOmmgSOA/+Vc/ozc96dCOQCX+k1306tf2U2FibPw1Uv89607QokcVbBXYsLsWKKs
	 LuIuuWDxBhwJQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 09/17] net: ethernet: mtk_wed: fix EXT_INT_STATUS_RX_FBUF definitions for MT7986 SoC
Date: Mon, 18 Sep 2023 12:29:11 +0200
Message-ID: <ebde071cc3cc9c35b00366c41912ee2f25e5282d.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033031_751286_05A022C5 
X-CRM114-Status: GOOD (  11.92  )
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

Fix MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH and
MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH definitions for MT7986 (MT7986 is
the only SoC to use them).

Fixes: de84a090d99a ("net: ethernet: mtk_eth_wed: add wed support for mt7986 chipset")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
index 47ea69feb3b2..f87ab9b8a590 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
@@ -64,8 +64,8 @@ struct mtk_wdma_desc {
 #define MTK_WED_EXT_INT_STATUS_TKID_TITO_INVALID	BIT(4)
 #define MTK_WED_EXT_INT_STATUS_TX_FBUF_LO_TH		BIT(8)
 #define MTK_WED_EXT_INT_STATUS_TX_FBUF_HI_TH		BIT(9)
-#define MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH		BIT(12)
-#define MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH		BIT(13)
+#define MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH		BIT(10) /* wed v2 */
+#define MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH		BIT(11) /* wed v2 */
 #define MTK_WED_EXT_INT_STATUS_RX_DRV_R_RESP_ERR	BIT(16)
 #define MTK_WED_EXT_INT_STATUS_RX_DRV_W_RESP_ERR	BIT(17)
 #define MTK_WED_EXT_INT_STATUS_RX_DRV_COHERENT		BIT(18)
-- 
2.41.0


