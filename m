Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C60EC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPa41hPr5/fhJv7254qcfTXwpYGgRmk/sL294po1Vt0=; b=n3wd5UoFdDEXbBlIxcYNzLZB28
	UjWrKMBcWqp0GxfwvsjAfrbzEKVuTsGwTPv9107UdGQaoImLC/gnDiEg63EpYqzkE5owFKvHJof6g
	C+ij3CYXMzO/RfW6CYS57mCJXS4X9JOaXE3cwgZDzdmgzj4Lg78733JWqkzFXrzHq+qbgLQ5zDxC6
	Ig7UpM6PwMekdQmFVRa1WSDCCYji/9kx7o9nnx9+uV6P0IP8nRrvKUwA64+/F2OKnOo8gUCcMk8/T
	5xMhATKox6ot71ApbqbkKT9uawnAFpnCq53S6x8hTMHx/muwEoGj2mCxUGPisNOY6uXxbD80as1Em
	j7kyI8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmLv-00Bv3S-Ph; Wed, 22 Feb 2023 10:27:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleS-00BYgi-DG; Wed, 22 Feb 2023 09:43:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B047766021C8;
	Wed, 22 Feb 2023 09:43:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058983;
	bh=spGpqKbSxXn7OPXf28QXu2nWmpVE56wv353pvm/OWK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KiQGObEP5jZxRUVhDOL6ay7oS1WI1Kiipid2I0XbAIUpfOi/IggijilljCw/MzTpN
	 xeML0gjTJUeebPP5T7/jMXmWJutlyVE+AKql56wtHX1INL8H/ytEqE4R6tF3i8ZGCz
	 VgMSxhf241mWeIiIqKXHX5C3zkNqPCu62e//DtTFWdmSquxQuLuJgHLkXVIisjKb+0
	 XLJkQQuKFtpXUiFIYIS3x1XKVmynltqQ4SYUOZYXmpoqT690P0EqL2+W6RbWY9/g1x
	 JKEhzqUyxhrqGPljZWEfXomO9Pwn7rXF4O1wj9ju2c/A/TptJ6FsMcb92bLYOVASJE
	 1TIBKLMm1vlEA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 5/9] soc: mediatek: mtk-mutex: Compress of_device_id array entries
Date: Wed, 22 Feb 2023 10:42:49 +0100
Message-Id: <20230222094253.23678-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014304_608617_BCD7887C 
X-CRM114-Status: GOOD (  10.25  )
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

Compress entries of the of_match_mtk_mmsys array to reduce the amount
of lines and increase readability; this brings us to a maximum of 95
columns.

While at it, also add a sentinel comment to the last entry for the
sole purpose of consistency.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 41 +++++++++++---------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 7751527fc30d..a59fde2bdcba 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -1040,33 +1040,20 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mutex_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt2701-disp-mutex",
-	  .data = &mt2701_mutex_driver_data},
-	{ .compatible = "mediatek,mt2712-disp-mutex",
-	  .data = &mt2712_mutex_driver_data},
-	{ .compatible = "mediatek,mt6795-disp-mutex",
-	  .data = &mt6795_mutex_driver_data},
-	{ .compatible = "mediatek,mt8167-disp-mutex",
-	  .data = &mt8167_mutex_driver_data},
-	{ .compatible = "mediatek,mt8173-disp-mutex",
-	  .data = &mt8173_mutex_driver_data},
-	{ .compatible = "mediatek,mt8183-disp-mutex",
-	  .data = &mt8183_mutex_driver_data},
-	{ .compatible = "mediatek,mt8186-disp-mutex",
-	  .data = &mt8186_mutex_driver_data},
-	{ .compatible = "mediatek,mt8186-mdp3-mutex",
-	  .data = &mt8186_mdp_mutex_driver_data},
-	{ .compatible = "mediatek,mt8188-disp-mutex",
-	  .data = &mt8188_mutex_driver_data},
-	{ .compatible = "mediatek,mt8192-disp-mutex",
-	  .data = &mt8192_mutex_driver_data},
-	{ .compatible = "mediatek,mt8195-disp-mutex",
-	  .data = &mt8195_mutex_driver_data},
-	{ .compatible = "mediatek,mt8195-vpp-mutex",
-	  .data = &mt8195_vpp_mutex_driver_data},
-	{ .compatible = "mediatek,mt8365-disp-mutex",
-	  .data = &mt8365_mutex_driver_data},
-	{},
+	{ .compatible = "mediatek,mt2701-disp-mutex", .data = &mt2701_mutex_driver_data },
+	{ .compatible = "mediatek,mt2712-disp-mutex", .data = &mt2712_mutex_driver_data },
+	{ .compatible = "mediatek,mt6795-disp-mutex", .data = &mt6795_mutex_driver_data },
+	{ .compatible = "mediatek,mt8167-disp-mutex", .data = &mt8167_mutex_driver_data },
+	{ .compatible = "mediatek,mt8173-disp-mutex", .data = &mt8173_mutex_driver_data },
+	{ .compatible = "mediatek,mt8183-disp-mutex", .data = &mt8183_mutex_driver_data },
+	{ .compatible = "mediatek,mt8186-disp-mutex", .data = &mt8186_mutex_driver_data },
+	{ .compatible = "mediatek,mt8186-mdp3-mutex", .data = &mt8186_mdp_mutex_driver_data },
+	{ .compatible = "mediatek,mt8188-disp-mutex", .data = &mt8188_mutex_driver_data },
+	{ .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
+	{ .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
+	{ .compatible = "mediatek,mt8195-vpp-mutex",  .data = &mt8195_vpp_mutex_driver_data },
+	{ .compatible = "mediatek,mt8365-disp-mutex", .data = &mt8365_mutex_driver_data },
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
 
-- 
2.39.2


