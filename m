Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177BFC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D011723B06
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x10jPH0z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="of984BLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D011723B06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0fRUKRV9q9ID5fzmfJXL+gLT0rIV/Flzp0xUl6BcCHs=; b=x10jPH0zxW0ij0DjJ6xn4sF6H
	U2Y14AFJv6J2iIaypR9Vx3knI6urckt+HsT0th5tB/i4v4qQQ77Oq7mnyNyRJ/L8lMuQNPhMF3QeA
	WUyxXapWIrr9a7PO8meswqNoIf4p2iZhdYfSlB6r36UabnbQpwPMZ0Vu55emrbco+OmQTnarD36Lt
	ombgL8q46lBINeukL8Ln5lJPYa1aX1raW411UPBIJtYP/cHfvMVMGwXoqY2TgU7QnBObbzlqlD/h7
	f/iJYgb3h8zAg16kz6L8BmpUK1NQV5U2yP3jF4V/JHeMkmH/ZSZI98ZTLiPl5fVf8NakoWgKUkczg
	vP2BBQgLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsXV-0000P9-Sh; Mon, 29 Jun 2020 12:05:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWR-000870-Lq
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id o2so15873183wmh.2
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pEL+pOqyLTkwaRij99JSBZiVqVmOtzJ61ge9c76alE=;
 b=of984BLPzSM5P+WwmyOWqcZJYwV98nXnukmPddORm7s4hFfzesBN6/ddh4U2m/PDU6
 U7zyrLEGeItTXvJtQUt1dUuvsThE3lZ38dqMBT9cWCEKwkxHUamDCpBpGaedCu0yU3JA
 OMEKDESF6Z+Dg/P4fdW8bjKYdSptxx+16ZaDAHFgGzM2CCXueszbTt7/jsNP4k3G4wfW
 vhCj/O7zg5dmmRIAaJf3wX6GBBN246Lt1CVVgmSh81ZDHsWzVOmLRAYU13dZqTFhE5mJ
 cUBwbbK/x0XCTDLHW+rUB89GdvYigHL50OJ07XC/TkMc5hT7UvPM8MrNf0tkQ8gdtoxp
 nQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pEL+pOqyLTkwaRij99JSBZiVqVmOtzJ61ge9c76alE=;
 b=H4I51PnM3cwvYq1lpggkAOznXg/tPGaLokAGGKloblFrtU4sH9ODEnvyj7UBhvmI7n
 SwytAIt2Or8IsB+R4iCA6GJAfSNc44oJQ8MeXQBSIYLo6kL+wTa/Ukgrfm/tGviz8V6K
 51U+0xNJMgaA5ciMuyIGJFzd+2Xp0YYtOWkQtyk7Xda88qTeBeUpDoheVw1NWO6VLx6N
 R7sTr2UsPrDzEPT81A1iOoGgyBNBcdE/BCTW1Ur1v6+gd5JTcRscNDVLh+3HQeNbuWiI
 VuZ4EwaAH148DriTjfWc3Y7AKw1/Db6YFJdPe9AWPCoJtaR07qBH59ESXZfVPQo5pmzr
 sX6A==
X-Gm-Message-State: AOAM530eUXvjg5v7znOaBnSD33GhCvxQKAUVG/wGLmP6w7dzZGcynDis
 wtKd0HMXrfBuyMZXND1f0h5Fqw==
X-Google-Smtp-Source: ABdhPJyd6qa9V9UAIGrinBuxZn8Q8saD0KJTED9NchL3vgnTrBQeXGhAZm//V44PtKtSgMKYvFb6Dg==
X-Received: by 2002:a1c:a70d:: with SMTP id q13mr13901671wme.55.1593432266701; 
 Mon, 29 Jun 2020 05:04:26 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 10/10] net: ethernet: mtk-star-emac: use
 devm_of_mdiobus_register()
Date: Mon, 29 Jun 2020 14:03:46 +0200
Message-Id: <20200629120346.4382-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629120346.4382-1-brgl@bgdev.pl>
References: <20200629120346.4382-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Shrink the code by using the managed variant of of_mdiobus_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 3e765bdcf9e1..13250553263b 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1389,7 +1389,7 @@ static int mtk_star_mdio_init(struct net_device *ndev)
 	priv->mii->write = mtk_star_mdio_write;
 	priv->mii->priv = priv;
 
-	ret = of_mdiobus_register(priv->mii, mdio_node);
+	ret = devm_of_mdiobus_register(dev, priv->mii, mdio_node);
 
 out_put_node:
 	of_node_put(mdio_node);
@@ -1441,13 +1441,6 @@ static void mtk_star_clk_disable_unprepare(void *data)
 	clk_bulk_disable_unprepare(MTK_STAR_NCLKS, priv->clks);
 }
 
-static void mtk_star_mdiobus_unregister(void *data)
-{
-	struct mtk_star_priv *priv = data;
-
-	mdiobus_unregister(priv->mii);
-}
-
 static int mtk_star_probe(struct platform_device *pdev)
 {
 	struct device_node *of_node;
@@ -1549,10 +1542,6 @@ static int mtk_star_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, mtk_star_mdiobus_unregister, priv);
-	if (ret)
-		return ret;
-
 	ret = eth_platform_get_mac_address(dev, ndev->dev_addr);
 	if (ret || !is_valid_ether_addr(ndev->dev_addr))
 		eth_hw_addr_random(ndev);
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
