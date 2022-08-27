Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD40ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Aug 2022 11:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0PRij+SL4wQUfaCEgDjRngRmtlDHBwKf08I6E/KIO8=; b=ge5HapRqCOqksTpjBUa33/VUac
	hUy31jUR808lqdR2qthS9nP/IOnjGIgb1C7DqBDl9oUuBFY8VISE98rIWvw/AQ0P+Vq3P15Ru+GZ8
	iYFeQ8GZ/YlSn8yhCHgfPYhlqHBMugFp6dJ3ywhKIab8B1O3IhjeBoInHrLNBWXDM92dpkNRBmpq/
	73pzmbgR4laVWuwICuT2QgxaQXZugHQXRF3w2Qg45A/BNTVL4KXRif1Ub7C8RztvXB3yE83qSnC+t
	ogiLAXmxRYGtvNcwFYwrbTt+aZxjcJzer/v9hgwD+SzFFkWo2cc4Wx6mF3+pIzkXXEjx1BIS/+54I
	0qdfxaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRuDV-0090UT-SI; Sat, 27 Aug 2022 11:43:09 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRuD4-008zry-9r
	for linux-mediatek@lists.infradead.org; Sat, 27 Aug 2022 11:42:43 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id RuCroZ8bM5V1hRuCsopt76; Sat, 27 Aug 2022 13:42:33 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 27 Aug 2022 13:42:33 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: broonie@kernel.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	blogic@openwrt.org
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/4] spi: mt7621: Use devm_spi_register_controller()
Date: Sat, 27 Aug 2022 13:42:29 +0200
Message-Id: <b7698e198acc998d99e7e7c895a2910f14f89443.1661599671.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_044242_555545_42FB13AE 
X-CRM114-Status: GOOD (  12.63  )
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

Now that clk_disable_unprepare(clk) is handled with a managed resource,
we can use devm_spi_register_controller() and axe the .remove function.

The order between spi_unregister_controller() and clk_disable_unprepare()
is still the same.
(see commit 46b5c4fb87ce ("spi: mt7621: Don't leak SPI master in probe
error path") to see why it matters)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I guess that the dev_set_drvdata() in the probe can be removed as-well.
But it is also harmless to leave it as-is.
---
 drivers/spi/spi-mt7621.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
index 2580b28042be..114f98dcae5e 100644
--- a/drivers/spi/spi-mt7621.c
+++ b/drivers/spi/spi-mt7621.c
@@ -373,20 +373,7 @@ static int mt7621_spi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = spi_register_controller(master);
-
-	return ret;
-}
-
-static int mt7621_spi_remove(struct platform_device *pdev)
-{
-	struct spi_controller *master;
-
-	master = dev_get_drvdata(&pdev->dev);
-
-	spi_unregister_controller(master);
-
-	return 0;
+	return devm_spi_register_controller(&pdev->dev, master);
 }
 
 MODULE_ALIAS("platform:" DRIVER_NAME);
@@ -397,7 +384,6 @@ static struct platform_driver mt7621_spi_driver = {
 		.of_match_table = mt7621_spi_match,
 	},
 	.probe = mt7621_spi_probe,
-	.remove = mt7621_spi_remove,
 };
 
 module_platform_driver(mt7621_spi_driver);
-- 
2.34.1


