Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwpgyP/hCn9tKMk7joPOpJZGMQJ2NUeFMGrhyb30tTk=; b=yjdYFJVzQprma7
	WK59FTuiKPstkESHKuKLKfZGSOmEjsTFD/yhTj+aOJ9CFu5B4GtSKKJBP8s3NhlpA9Xq5MSqfnELQ
	tfDyhOsZOHaR4Nt2WYWIBgLv0HdEp+jOYoepUiNH5ccXGSLYnBhEtIDaUZgI+Zaubkadnv3UGH4T5
	QLynvRI3/d+xkD1HeUAhoU6OBv1lZWmNSi6YwZdjzdPqrg2YcWG7+nMBrQfQ+TE8e72ZRuHtgRYPB
	pfvRUJIBtRPtGCNe6lzF4n5uUraURGkHRh5NAvN5svGXK/rnoN0JctjSmZ1LfJ//Uzu8W2TJlh1fc
	Z3nhkuyHOQEwMBi7sZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2tk-005NDg-FW; Wed, 06 Apr 2022 10:28:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WQ-005Dqj-UZ; Wed, 06 Apr 2022 10:04:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 33D671F4390A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239455;
 bh=gM01YsWssret3DlcqnhTF/BtXnVC04+x5ElT1IRlgI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n0Q2tgsEVRMehpz2ney99idFvFBsLsJ4hn/p10FpAd94AjaDo+5PgPuPM75nJB7yS
 rv9agYGWf73Gmh0/CL01QY5iisR2T8n/oT5dDSiU6FUYVo4MkFfNEXzPI15jlin6yy
 wg+vwxbesA4ZNzDB7rFfnyeI3umSWY48GBJC7V0DBaFg8YfzB4+54+CrOh9sAWzRhI
 nLhhfN8mVgTN40Ktfb3flGpMRn/mJ+tvt4iN9oCu7SadI6NodLUK7qf0+ZRuOZ5JnQ
 /c4SocUpWZuwq+zAFrN+Am0DfoPvf4VHFSpHs/AQtD16u1Ct1dbXXW/5tlaOZgBzLW
 lrX3oVREHgekw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/7] spi: mt65xx: Switch to device_get_match_data()
Date: Wed,  6 Apr 2022 12:04:04 +0200
Message-Id: <20220406100409.93113-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
References: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030419_169872_C6E59539 
X-CRM114-Status: UNSURE (   9.97  )
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

Instead of performing yet another match check in the probe function,
simply switch to device_get_match_data().
This is a cleanup and brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 4f53c3446bc0..e3f3b77960ae 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -791,7 +791,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
 {
 	struct spi_master *master;
 	struct mtk_spi *mdata;
-	const struct of_device_id *of_id;
 	int i, irq, ret, addr_bits;
 
 	master = devm_spi_alloc_master(&pdev->dev, sizeof(*mdata));
@@ -812,14 +811,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	master->set_cs_timing = mtk_spi_set_hw_cs_timing;
 	master->use_gpio_descriptors = true;
 
-	of_id = of_match_node(mtk_spi_of_match, pdev->dev.of_node);
-	if (!of_id) {
-		dev_err(&pdev->dev, "failed to probe of_node\n");
-		return -EINVAL;
-	}
-
 	mdata = spi_master_get_devdata(master);
-	mdata->dev_comp = of_id->data;
+	mdata->dev_comp = device_get_match_data(&pdev->dev);
 
 	if (mdata->dev_comp->enhance_timing)
 		master->mode_bits |= SPI_CS_HIGH;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
