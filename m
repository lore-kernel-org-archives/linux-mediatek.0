Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5YiqA7bzBAMOEmRvkm0aZNRsIR1ejsWIKVu2RckROo=; b=sAhF1LUgMusQ9A
	pw6iiNghhxp6bQyxAp0R2xIbMp3ae19jb5Hp7qZ9Hzm5x662sEoyCE9GpJCAy7FK2OOQwlG1Z58w+
	8IGkmTq85KeSiK0hnpMm5k6b2wNMWhT3Jj4LLMu7Cr+WYpysXX1ivXq5rBZ+gnZF0lO0KPXKsQp6N
	DsyFuOEakjKaRU4EdtYsVrz4IywdTkyBUqj+6eLtNyYXiwPsyDUoxCOOEsLCnVY61Ebe/f93nQiol
	aSkiYZCMOR+dXfXRgoQsSXNTchTyKhYNSnxcaNnPJR2SfBXq8Uf4tGzblQ2dHwSc7JGW4Qx4onm3C
	eewCzOdpFxhSuGXuiPkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL5F-002d66-Qj; Wed, 18 May 2022 14:55:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL4R-002cgk-Sy; Wed, 18 May 2022 14:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U0AWR1es8FovlYV4SercWvYHQrgmccGvnJT/6/FXtFo=; b=JFnVtQWBMAgFHCh0tel4wmDAXa
 jJmtSJw29JBTgAPboXUK1zAqTCuSHh0MVlaiIKk222vk54qdx86uISw1TeoqHCgzo4mmc4RS3AKJi
 +j3pjIN8eTvr7O5Z2wTJBQSrBqZ9vVxcx3/LSFpWKkykKD/0pnCdaG+QLgabDs3PCF9/OVO7Ga9wA
 r3oy3BBYO5UtNFRtFJvnAJJFS09BaVV9OCnhgL4c8/Q4Ufd8F6H78j/D0oEMMC9ofG7bVVdF8cptW
 dojGFbpavYr8XkFVavV574Wz/43PQumJAylAT+h0puBV5AZP//79gnsCNQy8KZhc0sWn2GQnGiM32
 CaICFFbA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38610 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL4P-0002Dr-2P; Wed, 18 May 2022 15:54:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL4O-00AM4k-Uv; Wed, 18 May 2022 15:54:37 +0100
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 02/12] net: mtk_eth_soc: remove unused sgmii flags
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL4O-00AM4k-Uv@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:54:36 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075439_970435_356C2B1F 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The "flags" member of struct mtk_sgmii appears to be unused, as are
the MTK_SGMII_PHYSPEED_* and MTK_HAS_FLAGS() macros. Remove them.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index b292ee2d6575..085f53d23f25 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -867,23 +867,15 @@ struct mtk_soc_data {
 /* currently no SoC has more than 2 macs */
 #define MTK_MAX_DEVS			2
 
-#define MTK_SGMII_PHYSPEED_AN          BIT(31)
-#define MTK_SGMII_PHYSPEED_MASK        GENMASK(2, 0)
-#define MTK_SGMII_PHYSPEED_1000        BIT(0)
-#define MTK_SGMII_PHYSPEED_2500        BIT(1)
-#define MTK_HAS_FLAGS(flags, _x)       (((flags) & (_x)) == (_x))
-
 /* struct mtk_sgmii -  This is the structure holding sgmii regmap and its
  *                     characteristics
  * @regmap:            The register map pointing at the range used to setup
  *                     SGMII modes
- * @flags:             The enum refers to which mode the sgmii wants to run on
  * @ana_rgc3:          The offset refers to register ANA_RGC3 related to regmap
  */
 
 struct mtk_sgmii {
 	struct regmap   *regmap[MTK_MAX_DEVS];
-	u32             flags[MTK_MAX_DEVS];
 	u32             ana_rgc3;
 };
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
