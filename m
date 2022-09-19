Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBAAC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBCl0pfQcWqm7TdLuZxzEDBy56PZexf/QrFrNulelxc=; b=W7J8/sCZbJTEBsXaJ//lv4J5yi
	CME+IrY/j9zF7P1Yi98PmrQjslC3xemPH0iFq0QQO1BJzXAO+4deZNV5QF7nI3yUxUJp0L8IMx3xg
	H4hhwQzl7K3CmZ0eB/bRecJOPtMMukWqfQbtGybySDZ7+GEmnDOA7LVdNGiSA6+TBAw+54cYEKgcw
	GHFQJKpppzU7IEKzk5kPlVhwshOP1uRz2M6L9efrpLVkhTvhkLSqk8Ev5qLsHbnUpCM2rmjk3IuLQ
	Zjj0f6iYIbe1Y3OMvDNvr3JI/p22S2VmciUl09UqgWzBFwyd5nh2oJiND7Xu+3RJ28pvBUOJG5xtw
	uLxJYPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCT1-00ALXu-Oi; Mon, 19 Sep 2022 08:49:27 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCSP-00AL0X-Kp; Mon, 19 Sep 2022 08:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QBCl0pfQcWqm7TdLuZxzEDBy56PZexf/QrFrNulelxc=; b=ZMB80DSusgcxYXocGFwCxmOfCY
	2NtV1oKiF537zlxG0wWTs+860QIo5U0pA0AkmbVXaJZWYBY38CcGJPJVlB5mrPeNUMp/BQT+ttGPk
	2hSSxpv+VMBLyhb9lpQqGWdPSSUAbV+PCw5Ggc06csB+7wcFbjdEN4ujHupPVTpQ15bcQsUuJ58N0
	uprm4A4USMNqb/LlSIUWrXeIQgAz8e5sYcoDGIL6VdjIuMpI/fNa0Kry4NHeudfIgfCN25bHFuIhM
	TZcOYbqPWldjgursAaeEzDb7L+FXwWjvFTbc+FVg9GGgSqYfLet4t9J/jI8Lqtq0AsN8BtnHwMc9c
	K6tELyYw==;
Received: from dynamic-089-204-138-189.89.204.138.pool.telefonica.de ([89.204.138.189] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaCHM-0015f0-VR; Mon, 19 Sep 2022 08:37:25 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 4/5] net: mediatek: sgmii: set the speed according to the phy interface in AN
Date: Mon, 19 Sep 2022 10:37:11 +0200
Message-Id: <20220919083713.730512-5-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919083713.730512-1-lynxis@fe80.eu>
References: <20220919083713.730512-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014850_134932_A135C2A2 
X-CRM114-Status: GOOD (  12.80  )
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

The non auto-negotioting code path is setting the correct speed for the
interface. Ensure auto-negotiation code path is doing it as well.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 6f4c1ca5a36f..4c8e8c7b1d32 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -21,13 +21,20 @@ static struct mtk_pcs *pcs_to_mtk_pcs(struct phylink_pcs *pcs)
 }
 
 /* For SGMII interface mode */
-static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
+static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs, phy_interface_t interface)
 {
 	unsigned int val;
 
 	/* PHYA power down */
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
 
+	/* Set SGMII phy speed */
+	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
+	val &= ~RG_PHY_SPEED_MASK;
+	if (interface == PHY_INTERFACE_MODE_2500BASEX)
+		val |= RG_PHY_SPEED_3_125G;
+	regmap_write(mpcs->regmap, mpcs->ana_rgc3, val);
+
 	/* Setup the link timer and QPHY power up inside SGMIISYS */
 	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
 		     SGMII_LINK_TIMER_DEFAULT);
@@ -112,7 +119,7 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	if (interface != PHY_INTERFACE_MODE_SGMII)
 		err = mtk_pcs_setup_mode_force(mpcs, interface);
 	else if (phylink_autoneg_inband(mode))
-		err = mtk_pcs_setup_mode_an(mpcs);
+		err = mtk_pcs_setup_mode_an(mpcs, interface);
 
 	return err;
 }
-- 
2.37.3


