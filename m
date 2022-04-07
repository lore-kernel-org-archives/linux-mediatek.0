Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBdevROJdyoiQoZQroFUtbAESuYNPYpkamN2pzK/f3M=; b=KBbT8vSJ7Q6wYy
	ySF2I0XgW0s9YOTbRANdgnAvnIbAY9zchV6D3c/mYtxbTgdN6R5nF/mAtXhEkTyyK7a/yvwnTagrX
	ZCFCCZRVvwhhXy55IsXj9BPG8V2L8g5iAhRnT6BzPluh7GYyphJy5YGXa9YwhaOq4QP849E8UPDVF
	rVvzHTtRJi4TZX/bwPnUdD26MdNqqwXPcnBhCXnOIpwURxyYrbMHd/AE3mWmcOcWoRBOZTB2fOQFM
	xFsz9aZxPFfUDlDIZHg4YQXZPkBAO9HenBo+NBcd8sXhItyehlv/Cs8iZo1rZSRBVTugUOQe4qNej
	16HhsV/yIk80WLrssr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQZx-00BbfY-T2; Thu, 07 Apr 2022 11:45:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQZB-00BbE2-8p; Thu, 07 Apr 2022 11:44:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 408571F4613B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649331882;
 bh=elCTgW/bDeAM8ZYb0VUA+4o6cBPZmbatIqqr/TpgbmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K7XrNpG+TTDQByXjulDuy2gsiT8SkeY/hLf7kZu1skwHOTG29XRlaejUwLJYuJskC
 U7Ijk6pz9szAkcMT9sw5dppq+A8gdHffs3nqNfwvXhaqcFSYEjSjBzA0fe556fKje4
 Kww61B23oTMwRaDNUzu2/kTxmPvqylXmGyipKOxK9Wu6BW4V010QFDJebWK+f1mCMS
 r30mTK/aF2OCfgQ8Ce8+mbFv95dMIgeupAbkmM5GeMGQ/Msy+pMSlBU2m6lOJE/02b
 jZN8cYJcqlS0sXMRAZvK/o/moW4hxL/yLUE1Z2Akm/dJzvSPm07oQinewS8+zVYSdh
 8e+o5a/BA9qjg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/8] spi: mt65xx: Switch to device_get_match_data()
Date: Thu,  7 Apr 2022 13:44:22 +0200
Message-Id: <20220407114428.167091-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
References: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_044445_494372_2059B8B5 
X-CRM114-Status: GOOD (  10.04  )
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
index 4c84b67ac85c..4e0b520f9abe 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1084,7 +1084,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
 {
 	struct spi_master *master;
 	struct mtk_spi *mdata;
-	const struct of_device_id *of_id;
 	int i, irq, ret, addr_bits;
 
 	master = devm_spi_alloc_master(&pdev->dev, sizeof(*mdata));
@@ -1105,14 +1104,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
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
