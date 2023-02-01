Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35E8C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFp/X5eUiRxs39WBP/bBKYq6n8rAaordpE22XIcRs3o=; b=p1Xqs14fYLEOvUctp0OqV0xZ5L
	w4cTxpcH8+28v4zw8STPm3MVulv/kgDSsVVF705OxqezL8+L4pMIh9TTkd0yJ3fBS8sH4NuKNSpxe
	WxfxyNbZimRdORT31WPZ8G83gnr5sLZF5voEaXiGW8hgcUNW3bT/pbVIaBcj6yAou7T9YXGpzVBRb
	fr1ldYPXKZjInvoVqcZBbh7UH8zEln9WlE37OXFk4sYb2p7lc8sp1RsJ3HiPOINhMxTTr6aRSdk8c
	l3XXT/MTORJ0wdIBUuOCI0DdLZcrcjlUwcYTkTlcEu8atoyW0B8PbQhIsJTMcnJ0hIGJZ6jQ2ycrc
	fNK1YVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHoY-00DCJt-He; Wed, 01 Feb 2023 18:26:34 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHo5-00DC30-9P; Wed, 01 Feb 2023 18:26:08 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 311INgIH648786
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 18:23:44 GMT
Received: from canardo.dyn.mork.no (ip6-localhost [IPv6:0:0:0:0:0:0:0:1])
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPS id 311INbnI943492
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 19:23:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1675275817; bh=GFp/X5eUiRxs39WBP/bBKYq6n8rAaordpE22XIcRs3o=;
	h=From:To:Cc:Subject:Date:Message-Id:References:From;
	b=hWBN14/2wzWOK+nFje/kXjMYvsUSle8vOEHyiepQkgr21Jm8Eut/PqaJg8/UqG8yy
	 3u3/HKHiX3/pL9k0ut1bvwidn0bBcqglycX1udqOiIi0MmvRFyv+t7JvaFZgDFDYeW
	 6q+4KSL052su2g5UUYOrMtZFMu3YDDx3c6xOW8Qs=
Received: (from bjorn@localhost)
	by canardo.dyn.mork.no (8.15.2/8.15.2/Submit) id 311INbIQ943491;
	Wed, 1 Feb 2023 19:23:37 +0100
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Golle <daniel@makrotopia.org>,
        Alexander Couzens <lynxis@fe80.eu>,
        Simon Horman <simon.horman@corigine.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v5 net 2/3] net: mediatek: sgmii: fix duplex configuration
Date: Wed,  1 Feb 2023 19:23:30 +0100
Message-Id: <20230201182331.943411-3-bjorn@mork.no>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201182331.943411-1-bjorn@mork.no>
References: <20230201182331.943411-1-bjorn@mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_102605_697734_8E9282D5 
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

The logic of the duplex bit is inverted.  Setting it means half
duplex, not full duplex.

Fix and rename macro to avoid confusion.

Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 01a38f5145b1..2d9186d32bc0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -519,7 +519,7 @@
 #define SGMII_SPEED_10			FIELD_PREP(SGMII_SPEED_MASK, 0)
 #define SGMII_SPEED_100			FIELD_PREP(SGMII_SPEED_MASK, 1)
 #define SGMII_SPEED_1000		FIELD_PREP(SGMII_SPEED_MASK, 2)
-#define SGMII_DUPLEX_FULL		BIT(4)
+#define SGMII_DUPLEX_HALF		BIT(4)
 #define SGMII_IF_MODE_BIT5		BIT(5)
 #define SGMII_REMOTE_FAULT_DIS		BIT(8)
 #define SGMII_CODE_SYNC_SET_VAL		BIT(9)
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 0a06995099cf..c4261069b521 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -154,11 +154,11 @@ static void mtk_pcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 		else
 			sgm_mode = SGMII_SPEED_1000;
 
-		if (duplex == DUPLEX_FULL)
-			sgm_mode |= SGMII_DUPLEX_FULL;
+		if (duplex != DUPLEX_FULL)
+			sgm_mode |= SGMII_DUPLEX_HALF;
 
 		regmap_update_bits(mpcs->regmap, SGMSYS_SGMII_MODE,
-				   SGMII_DUPLEX_FULL | SGMII_SPEED_MASK,
+				   SGMII_DUPLEX_HALF | SGMII_SPEED_MASK,
 				   sgm_mode);
 	}
 }
-- 
2.30.2


