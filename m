Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C306C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJIQuFuQYAWzhZC6ClFDFJCVGPkxm4JIXMxmDlejkJo=; b=pFAEmDhmXMEHhM
	ab5UHrLCZdUEPo80uf+09QukPaoZXFFwoTY1z1ckfuxPmgYDKw7NxuEUPOGpMhg5XIbDDXiRjNoAo
	fLdCVLoO30M6XEJyJLfTRj2YZBFpexEPqnUW+NoknCNHOgpg/GsACjYaQBdFP6fnKgg9oVs6JdAvz
	0oGRwfWV8aSvrUlnHw/gv7CDaWQ2+Kffh4PatSvX4iqjnb2Ilfl3Fu6gAhrP2JjpDFqmiWI+kT9Hr
	3tgo/HV18gpU9xLIMXoYlPQUHD97hd0/YvmXDiuTYgtuJiSc5aq+EIuEzdjVE59mJsCaHoyig7NH+
	fgaVZKL8UiF2v4Bv60Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQal-00BcAW-DS; Thu, 07 Apr 2022 11:46:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQZC-00BbFH-2X; Thu, 07 Apr 2022 11:44:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5C32B1F43211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649331884;
 bh=U0uqcJjpcnjh+B/OVJZDKx9YUcql4HHA5STN6Sy2OXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tn9FJwpOlEZlS3+SoBO2JOC4RAQ5NVFShxwhWCck32lO42i5RG6VDe+9YYlhvVd2y
 /dh8tTHFQr/Q0qYF00GsxltQjUL9Y8fbtB7hZS/Hs9CyIjPvHdAYzMfjbYEF7iUpzd
 I5yNME5VHUkMAscfktZeCnVgCxtpt8ziPdaT3FosesF+/KqU0qYYp1gEHjL3FkpbRO
 CvbWBusM0OzLwPEC6hgO75rsbjfNFJ5nM2+3na8UwwqinleqKza6NuDpgS8xPEdwnb
 Z9ek2Pslm6qGhuJZZxhAxempNO3Yrd0qkZKpt+FuaPajVuemr81TCoPPlvUPevs25C
 4A9ucu72st5YQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 5/8] spi: mt65xx: Move pm_runtime_enable() call to remove
 all gotos
Date: Thu,  7 Apr 2022 13:44:25 +0200
Message-Id: <20220407114428.167091-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
References: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_044446_348901_11A2096C 
X-CRM114-Status: GOOD (  10.93  )
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

The last goto in the probe function can be removed by calling
pm_runtime_enable() right before devm_spi_register_master(), as
only some init checks were being performed after enabling pm.
This is a cleanup and brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index a2daba3bba91..3f307b25433d 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1224,22 +1224,18 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		clk_disable_unprepare(mdata->spi_hclk);
 	}
 
-	pm_runtime_enable(dev);
-
 	if (mdata->dev_comp->need_pad_sel) {
 		if (mdata->pad_num != master->num_chipselect) {
 			dev_err(dev,
 				"pad_num does not match num_chipselect(%d != %d)\n",
 				mdata->pad_num, master->num_chipselect);
-			ret = -EINVAL;
-			goto err_disable_runtime_pm;
+			return -EINVAL;
 		}
 
 		if (!master->cs_gpiods && master->num_chipselect > 1) {
 			dev_err(dev,
 				"cs_gpios not specified and num_chipselect > 1\n");
-			ret = -EINVAL;
-			goto err_disable_runtime_pm;
+			return -EINVAL;
 		}
 	}
 
@@ -1252,18 +1248,16 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		dev_notice(dev, "SPI dma_set_mask(%d) failed, ret:%d\n",
 			   addr_bits, ret);
 
+	pm_runtime_enable(dev);
+
 	ret = devm_spi_register_master(dev, master);
 	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "failed to register master (%d)\n", ret);
-		goto err_disable_runtime_pm;
+		return ret;
 	}
 
 	return 0;
-
-err_disable_runtime_pm:
-	pm_runtime_disable(dev);
-
-	return ret;
 }
 
 static int mtk_spi_remove(struct platform_device *pdev)
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
