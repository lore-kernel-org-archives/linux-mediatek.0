Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA19C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbpozvf77MAQT73PYy27Cm37f+KNXPXUqwYovn7jkiM=; b=YYjvothnx7RqKv
	jPCsrFXNV+i5qgWKeibEC1wvJfdyLqZG9k5aWAfTGj5OUye7XsXEapl0XI5JwTCfVqz7OuTTEZ6I7
	Nkyu4Ie4KIzhI4u6cmpM21KaItUzWdzchxvhM9iQuPOrq2e/GFUdCuaExiYbDYJfc/oiv0VJFBT0Q
	a8ZIgf388EbmnO825GLDS1GMdIhyEiBqXy8Tr2mZgEdBEeok3sHwK9v+Zbet9WE/WdNedRMrgsjQg
	yR9BrhMj3r9BhrYZNijGS+hPA9PCtspryRh37YsIIfvTxGFF1paWSG6rrkBE7GfRYjYCNC7gX1lsx
	QxRCDSJAE/EaJ+ZpIn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6lP-006Y8f-UE; Wed, 06 Apr 2022 14:36:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6kb-006Xjr-3k; Wed, 06 Apr 2022 14:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4lhcZU1UliNq09YYX/sPSI7uRvQe7Xolf5tmFxI5yGQ=; b=lyuERrSwwLXMMotNdfbfP154yg
 EcXdzfCtzc1xiePoX1FuqwOxU4h6KSKdoWL1OkOg3gVfoTzcYpxsPNmAmohz1w+CYC6MAjVv64ygV
 VUR8GrpUSYZllGQqPNRR5Bh99ki8qpFSJM1BDey2V8SRc023kOZpNIpOZHm0quBkBP57xZk1TwjA6
 1F6Ektr9q1pGuF8ZQbg6fujooOh3D3mZePT6b+oPvUPJt68vc/5cUQlKtH0XWVbGBZLELPJRLpCd0
 vK4ZcNR0lqPKrz/QBrKP0y6eOedG8RPwdW0wJN+viBUJ1C0asiWqWQQxnE4c/fdgnrR2798g/4Z/6
 IuUbZKRg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60664 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6kT-0002u9-JT; Wed, 06 Apr 2022 15:35:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6kS-004ijd-N4; Wed, 06 Apr 2022 15:35:04 +0100
In-Reply-To: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
References: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 02/12] net: mtk_eth_soc: remove unused sgmii flags
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6kS-004ijd-N4@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073513_298304_F32AE9D8 
X-CRM114-Status: GOOD (  10.49  )
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
index 2b690f8a5391..8a10761adda0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -859,23 +859,15 @@ struct mtk_soc_data {
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
