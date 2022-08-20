Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DBFC32789
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 22:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jImID30Vp/vYAutmCPaQyC4TRyXEdkw0IIMRl2iUHw=; b=q8lEm0MLVZcJGXkWnfzzRihul4
	ltRYDugJcRSqV7RLKDlX8jNMXZkfIcJ8bRK1kaZBfJyfmp7xHljWd6NfyZB+nqzBNc3ZY9mSTB3S8
	OWFsOw4yqXFqgCkiVYMfXc/4gZjKAANJwKpc76uXLbRub8qTr9mnZJtx+1T+JCVxxp7oPctcZEVUm
	42NXigHDMjLUyKWVlh7tsrpib1N2bouLLGfxsvZ110OQB9sf9uRltZV9n2ihBPsUOfL/fe0fSqBVb
	TOJpY9UYuDHd+z7uhsjTwoqGw6jFWYMlG+eRQNQMIwjhCD2mJdYnPWff9KPw5dO03fVVxGN33zO4l
	aTpi1Jqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXEY-00D3bC-L4; Sat, 20 Aug 2022 22:46:26 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXET-00D3Ts-JU
	for linux-mediatek@lists.infradead.org; Sat, 20 Aug 2022 22:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0jImID30Vp/vYAutmCPaQyC4TRyXEdkw0IIMRl2iUHw=; b=D1AsLfGkGFO8vKorMpoTaWZNsl
	NANJ1QhSUExJ4IgqmDEx4TmgJNkg4zENBdhHel9qsdWmJMXdqszgq0lGTz7kg1wQuymdB9Z18kSYM
	UBqzqtQudV27B3yxvlqGCpxOoKMlm0Rg00P5QWYW1KG+h2a9XR1hL63pBL3F5Mrq0eXilQ4lOO9gy
	TC7WcZV0w+6g6lZ7jBejGiVBxQl3bKKmfp516Ru/PuKQ/cf5Ls+fuCb//YPSbAfp1Fbx8UT4G/ePz
	TDkncPoux6+6HeH0O/UnhFCucYveIQJ7qSfB/oK+oUuMgM7/0Cv+2FZ+WgHGCyG49qh8r0/hBQN0n
	28+6kYcw==;
Received: from [2a02:2454:9869:1a:9eb6:54ff:0:fa5] (helo=cerator.lan)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oPXE6-00G2sh-4c; Sat, 20 Aug 2022 22:45:58 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 3/4] net: mediatek: sgmii: mtk_pcs_setup_mode_an: don't rely on register defaults
Date: Sun, 21 Aug 2022 00:45:37 +0200
Message-Id: <20220820224538.59489-4-lynxis@fe80.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220820224538.59489-1-lynxis@fe80.eu>
References: <20220820224538.59489-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_154622_196602_8B2B2A0F 
X-CRM114-Status: UNSURE (   8.34  )
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

Ensure autonegotiation is enabled.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 782812434367..aa69baf1a42f 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -32,12 +32,13 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
 		     SGMII_LINK_TIMER_DEFAULT);
 
+	/* disable remote fault & enable auto neg */
 	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
-	val |= SGMII_REMOTE_FAULT_DIS;
+	val |= SGMII_REMOTE_FAULT_DIS | SGMII_SPEED_DUPLEX_AN;
 	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 
 	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
-	val |= SGMII_AN_RESTART;
+	val |= SGMII_AN_RESTART | SGMII_AN_ENABLE;
 	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 
 	/* Release PHYA power down state
-- 
2.35.1


