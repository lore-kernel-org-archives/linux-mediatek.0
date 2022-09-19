Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26BFECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dT1y+29LfGYYXr/kgVW5snS+ww+Guphm3qcxKvTGRM4=; b=eMLEu1hK42jtfTJq744DvD5h56
	RN9Cq2uabho1Fdkc2Q4ktCK7lZoSI2mOQSCDL8LLI4CjfbVPKiaBvsXMBik32b4bWDjo7yeVoKUZd
	2odBJM87D2dFNv0AyUcOyL8wECAFmGDo1l8I5v/mZTAYx55MsiCuhLfA6GkmqM7PsktspFSZY8xBV
	fuw7y7I5jXqeHw7NxVlORL/oQ2XNJqBIcAM39z4Nel0XWTZ5V5EGbRU4Xtspi1m4Mxpi65OClkA+U
	AE9ImB9ENijnCTQ8cl9xjDodnXte0ZwxPE4TmvYnuZ8G0Rtvr/mCjkoASUV/um9pZFGHhn5wzPunV
	tXY/GeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCQp-00AJaT-AY; Mon, 19 Sep 2022 08:47:11 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCQK-00AIyQ-JA; Mon, 19 Sep 2022 08:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dT1y+29LfGYYXr/kgVW5snS+ww+Guphm3qcxKvTGRM4=; b=WghFA2VplecHWY3tR2poQdmoj7
	l1v/yX0/m76QpmmFOXecuePay3hY6lrWOuB8J3u8hIX4Al0nUZPRFvxUi0k8qI48OeZNEVUZE4HDg
	tm11LZGt5teydPJmAIJ25pakjd1K4p5xjpyMaAgjjUCTXn1dEIV63TctkqOvp2Ny9j0sqbCjVYeac
	88/9jqkeNxewWNU7f9P+T0s9+vsiYbJVz3zIGBz542guXLaSXkJAxwRFkbcZFCh6O8obMJ1TSt2Mp
	MkUG4BN+m1Q0VuL0FxDIFC6o01+VAN/NAZGfsucw20DhDdhNxmp957paXgIvngVBHrguhj9OkUrqa
	hFJ3ddpA==;
Received: from dynamic-089-204-138-189.89.204.138.pool.telefonica.de ([89.204.138.189] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaCHL-0015f0-Pe; Mon, 19 Sep 2022 08:37:23 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 3/5] net: mediatek: sgmii: mtk_pcs_setup_mode_an: don't rely on register defaults
Date: Mon, 19 Sep 2022 10:37:10 +0200
Message-Id: <20220919083713.730512-4-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919083713.730512-1-lynxis@fe80.eu>
References: <20220919083713.730512-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014641_493996_7E24162F 
X-CRM114-Status: UNSURE (   9.54  )
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
index 18de85709e87..6f4c1ca5a36f 100644
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
2.37.3


