Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EC7C32796
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAZIRY5AGxEnOQppN8jQUMbg7mSLVLi2n6oyk0nmHQc=; b=upy3HZPc4SPz4hu/xXzFATQRQs
	FyyvTJsxzqypa6kWCe/Wlg1UWlvZr+3ILOQiz4V6WTN92xdHfW1Iil1/pO3RbgO6QU0ih+DtM48Lq
	/J/kqYa77s0bUHbgEyvLgzEc+DzxafmVN60XWX2iOlZif4y6pkEPEVSbznp3Qjv7r2y3ph/g2mDGA
	Y/dzpgTilaHlhvcf5dLG+eCr5ocGsWEYzPklw7y+3x/g9NiioPKCYc+iM1/wKO1Sa3ZaXa3dV7d/l
	d26AYnztPaxD2DWfxugjpJflQKlp80SgtKKVvt2a+o6BaSm6KQbErxH6Py5QFv1hySq03iNDQJ+n8
	i7ylOBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXEc-00D3eF-3b; Sat, 20 Aug 2022 22:46:30 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXET-00D3Ub-JT
	for linux-mediatek@lists.infradead.org; Sat, 20 Aug 2022 22:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dAZIRY5AGxEnOQppN8jQUMbg7mSLVLi2n6oyk0nmHQc=; b=HKS+WKBa2OPxVQmxIefBthHbZi
	xhs40fnMMNPcdvxnnR2B+ofNMO8gWecn6A6tStW6DF8CqRzb+SgLtXhLLnwRJK9q3ZFOfYwbfAnai
	FuoVSAMYU3sXlpiI6lCnjRZcMKwGlHEv/rv29vlBlnGptMZLvD1+URGaZi5q4YKXUUJwvOMJJ6mq0
	SdEV1mTVi6k9z5H+gPZ9GjasrIG2sz6z+j0bRbKJzMsPhrQ9v6fblWpdZRR5rA9GF3IRlcRK4692X
	yBnfdQEjV0bK8OhcKouTr55MDnmtNXmCLp1ajImbkcz9qjFgZOzr7CTI2+T5eFmsMXPUtj57q86aG
	2bb7suYg==;
Received: from [2a02:2454:9869:1a:9eb6:54ff:0:fa5] (helo=cerator.lan)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oPXE5-00G2sh-8A; Sat, 20 Aug 2022 22:45:57 +0000
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
Subject: [PATCH 1/4] net: mediatek: sgmii: fix powering up the SGMII phy
Date: Sun, 21 Aug 2022 00:45:35 +0200
Message-Id: <20220820224538.59489-2-lynxis@fe80.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220820224538.59489-1-lynxis@fe80.eu>
References: <20220820224538.59489-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_154622_193315_A521BFDE 
X-CRM114-Status: UNSURE (   9.66  )
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

There are cases when the SGMII_PHYA_PWD register contains 0x9 which
prevents SGMII from working. The SGMII still shows link but no traffic
can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
taken from a good working state of the SGMII interface.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 736839c84130..a01bb20ea957 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -36,9 +36,7 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 	val |= SGMII_AN_RESTART;
 	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 
-	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
-	val &= ~SGMII_PHYA_PWD;
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
 
@@ -70,9 +68,7 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 
 	/* Release PHYA power down state */
-	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
-	val &= ~SGMII_PHYA_PWD;
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
 }
-- 
2.35.1


