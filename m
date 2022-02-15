Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BC2C43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1714PwAxaicX8LRXDTeJuPeqB4jgZ++I2hfmcdP9cI=; b=R9f03ZHwoUfyD9
	MK/bYrxn9tBTBC96KpZa/xyFno49DC5BVgv8phPDkat6scFcfIgMj6rH1050kr0mF6/BIdXZMPfdq
	Jzd4aJ+Yi69Yp38BkEvPi24A/F5MVWnIaKbkuUnH9XX3NBZM/EraHllx7c59DIMlsgMQT5XFR5qRb
	vHbUGmfsg7DCFDOyoyyGXBrJLoE5tce8rJ8zAgRKl6+5TNl2CGpLBQHyVBm01OSj80qMNDqM1yZ6Z
	yb4u5sFv48wL4MmBy/fFhLlRFk8sqOJSg7gjUzDRyucF9DdsObnlRC5B8EI1/AJ6/AvXQ8QkC0Fbc
	Zb5sxyu/POTSbdL5Aqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJzm4-003HJg-Az; Tue, 15 Feb 2022 15:29:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzjT-003FyZ-Pq; Tue, 15 Feb 2022 15:27:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35D6C615D9;
 Tue, 15 Feb 2022 15:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920E7C340F2;
 Tue, 15 Feb 2022 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938830;
 bh=v4dDXwJubReDk2vJzh2yaDD2XZ0dk6Hd1kxbXVwlOPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fxXsPb3tL1l0T84EC7ngSuh9K2dpEhsVdcHXtp2rxtdRFzPrM26H0k4CUYR1p1322
 ta/+B477wogTpxVnuDInvG3Ov+Kw1jzhzPKQDSn/3D6N+IpqUPdZ3ETy72QZbO8ZXO
 kDEGImo/a3qi+eIVs8VlP0FQmk80REbu8F3ybj4OJ6CmJI1NIf+TheYHoocag1sQaT
 aSUCRrQ/t+SNFqUKf+iQCnKo1yxz88w3Gu+FuJ11TcpXvp2TwetdxFCiK3n8Mivb0H
 3ysBQgsYBZG3WZpokm5D/khFM2PJzCZmqt2i1dJiDjuO0uQ9F4/FWCZed5zltK2cub
 BTxx+hLV6oQLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wan Jiabing <wanjiabing@vivo.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Sasha Levin <sashal@kernel.org>, kishon@ti.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 05/34] phy: phy-mtk-tphy: Fix duplicated argument
 in phy-mtk-tphy
Date: Tue, 15 Feb 2022 10:26:28 -0500
Message-Id: <20220215152657.580200-5-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152657.580200-1-sashal@kernel.org>
References: <20220215152657.580200-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072711_954386_6B3E6D92 
X-CRM114-Status: GOOD (  11.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Wan Jiabing <wanjiabing@vivo.com>

[ Upstream commit 46e994717807f4b935c44d81dde9dd8bcd9a4f5d ]

Fix following coccicheck warning:
./drivers/phy/mediatek/phy-mtk-tphy.c:994:6-29: duplicated argument
to && or ||

The efuse_rx_imp is duplicate. Here should be efuse_tx_imp.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/20220107025050.787720-1-wanjiabing@vivo.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 98a942c607a67..db39b0c4649a2 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1125,7 +1125,7 @@ static int phy_efuse_get(struct mtk_tphy *tphy, struct mtk_phy_instance *instanc
 		/* no efuse, ignore it */
 		if (!instance->efuse_intr &&
 		    !instance->efuse_rx_imp &&
-		    !instance->efuse_rx_imp) {
+		    !instance->efuse_tx_imp) {
 			dev_warn(dev, "no u3 intr efuse, but dts enable it\n");
 			instance->efuse_sw_en = 0;
 			break;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
