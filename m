Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F0CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plkA/JKJFuAPIrB7z5ttwNcp+1KayECIZK79Pd1nF8Q=; b=V0RBGivroRSuKZ
	LX/jYL1W/ypTcOcJue9g6R7R/I8I/qzaxHo46Rzv4ilxjAi9J/L9GtMdFeCdpcFZYKsPF3X3ZBfHw
	tVqYm01xjSVwxh0ffdY6ZUhsJMAy7ANEe+wzgT+hl/NzphIdwJdBiZJNDXqWa1b6GsBYRVd/zd0R9
	L2GqgOOBTkw1hZ0lq0SvjsoveoUpU5z/m/fgBVG5K/E0jiTMGYfASpT8D3QHTfRv2k1AqnsBRaXX+
	vv1FsXyI0cOrh9gudOKCbU7uklrXmnmR92i5YRGQd8DLid4XIx+7D1hMXZZqSQnxAlFshNj6ib2+r
	iENCBzNkJxCQ5wMHBDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2to-005NFe-O0; Wed, 06 Apr 2022 10:28:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WQ-005DrR-VS; Wed, 06 Apr 2022 10:04:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 81D921F43907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239457;
 bh=XUxXaare05hfWrZ9x/t+yRjVsjX8d4GEmSTC5zA1iFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L2muotn5s9Yp9A9I2KoCPXK9oM1ZQs4U/ilbTjYmHFiPb08VTpMMYuBGP/z8HtSii
 VZ52j4N8BKPRa5pTyeFokGbo5QYKuS7tluGgM1kSR7eLuK5ujIIbcMHNIcLB+K6pIY
 mqC2ro5QSywgX7c0J/lL7vDb2Omb99NvKhkoGYtjezN5l85n8VmMc7/tTm8dQKERSt
 UFQuGo7hYSEP5TMJ5dZj7OucuyJFcHjrBBDJDCJ8dXJDeQYFVJ13XnNQUtrW08rZ43
 5UIeeCNUSoKEZoj6CUbyf19DBBTge2poGfmS4SmCDRli+rcQDZYVdcAnv1Dwiu6Beo
 6FffnJMr+4cHg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/7] spi: mt65xx: Move pm_runtime_enable() call to remove all
 gotos
Date: Wed,  6 Apr 2022 12:04:06 +0200
Message-Id: <20220406100409.93113-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
References: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030419_201543_15A2BA0C 
X-CRM114-Status: GOOD (  10.90  )
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
index 7f381d84a005..b8ec04795141 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -906,22 +906,18 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	else
 		clk_disable_unprepare(mdata->spi_clk);
 
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
 
@@ -934,18 +930,16 @@ static int mtk_spi_probe(struct platform_device *pdev)
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
