Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8464FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKZmhonbi2Ktgsme4iXkfld526TIIJ8Vy6riEiNAC50=; b=PGo/xT6kGJALRV
	2uh89pxuHPstsEnlnI83NrpywhAQ03iDhwY8GLf1ImsDFMjaZhaXtHRaglx4H67pnur9ZXpz5TTwo
	BKre2Y4oVXLojEcliv9LZIKMOjieECia64kVkxf+iAkmPvpejKpfIRhvC8WPO+lLeZ0WNaka6JhXT
	zYiBEJYo+cTOuFa4DYimRt12rYZZGDqGLoQQiyxvUoIRUvFsaVq7B0hbVyiEp55r5vYXcX+O8bKik
	3RmY9Ocsuf3edix7m1WokkjunMsYxc07FA2Uxhfr/O8PfCkZsvo99HPAfG5eea1790XFObMBLadsB
	jRQubrpqIOcU2tSKlA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQaE-00Bbph-S8; Thu, 07 Apr 2022 11:45:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQZB-00BbEl-Ey; Thu, 07 Apr 2022 11:44:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AA0181F4160F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649331884;
 bh=0ioxGeIAs1JjL3nFVCxi/VYYJ3Ie6yltSPaOrmtPeQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QpGj8zYjD+zYxwNn8B8ypUt69daeQcIiMNXXBlvkPV1oBuVjcY68PppDu2ytuSAqy
 OrXKcMhMcOZQlMR0I3np7jbIQQfJqXbgOdGRIvpYr7+8n560l+2aQpt4uNK4yr6Cc1
 WpRXc3lT6d9b3pH5O2jEpLMe+8bsfaZLVDgTWqPaW4FIDw/mybkTyDDxumQdb3J8jV
 UPnW+7FtVFhfkWi18ecVQJQnyKnNA1hpsv/b4SX8trkAaDOzSCQAvTzgsFtzuc4ICy
 U8EiIQxei8UHRtwTjDylngbX6ntsmgVJbxN+8Z6zcUA3mSAefA1zEUiihvBLx/awsM
 NvPYGUnhE4hoA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 4/8] spi: mt65xx: Move clock parent setting to remove clock
 disable gotos
Date: Thu,  7 Apr 2022 13:44:24 +0200
Message-Id: <20220407114428.167091-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
References: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_044445_699473_5E54AE93 
X-CRM114-Status: GOOD (  11.85  )
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

Reparenting sel_clk to parent_clk can be done before enabling any of
spi_clk and spi_hclk. Move the call to clk_set_parent() for sel_clk
earlier, and call disable_unprepare() upon spi_clk prepare_enable()
failure to remove all clock disablement related gotos.
This commit is in preparation of a later cleanup.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 250a508427ee..a2daba3bba91 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1195,6 +1195,12 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to clk_set_parent (%d)\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(mdata->spi_hclk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable hclk (%d)\n", ret);
@@ -1204,13 +1210,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(mdata->spi_clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
-		goto err_disable_spi_hclk;
-	}
-
-	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to clk_set_parent (%d)\n", ret);
-		goto err_disable_spi_clk;
+		clk_disable_unprepare(mdata->spi_hclk);
+		return ret;
 	}
 
 	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
@@ -1261,10 +1262,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 err_disable_runtime_pm:
 	pm_runtime_disable(dev);
-err_disable_spi_clk:
-	clk_disable_unprepare(mdata->spi_clk);
-err_disable_spi_hclk:
-	clk_disable_unprepare(mdata->spi_hclk);
 
 	return ret;
 }
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
