Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nuEcyipkZetAc1WzyDjcwtIrzoTuCtpHz/V8HWhKS8=; b=ecM3lM9al80QSJ
	RLQezsV6Z877OtPSYoIofqmMc7cvUzcuNqlOLIZae196A4deINs+b6Oxx+jLGJKp9oWbIIqR8gYgw
	BwWf4Pn34RORmJ9SHQmy8x99jMoDRxSWkVyl6bY9DgSq4fA7NaU1qQ15YyDFU9ebOmF27ViLN8kOK
	YQdoXS84+ayDWfbKcp1wOekUZIKxthtYKBHlC1FopZHEHVRmPv1e5swwggTzPeCHFfEaynk+R7Qom
	1tE/2mvu6XhNVM6PfCHWNaD+K6U08AZAOkXUHbatbSNdgKgTNWW7m7NXFtzb+Vskc2lXH5GA9AOnc
	yuwWml0/+lIWKaGYoDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxqgW-005jUP-Bg; Thu, 16 Dec 2021 13:20:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqKd-005a46-Pt; Thu, 16 Dec 2021 12:58:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D5671F46293
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639659477; bh=qfoQcy7bme0iWoD7AnboVLnbPUV/tacQ4cwZj/2c6ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dJLM37MAz8R8wTTzqRqjIYiMZLm9Kj7RQ6z3RLvvmRtjiSLSkYRElDB2DDMsszx8B
 RcoM36c3+fBbwL5IqDnBULd1667a3qFg9GinOAc2dig4uF3RwCypto3NJ1ivgHleZp
 W5quq4e+c65LQTD6TYW7qSAiw/sz6sXLKXmrknJUWexKha60hg3LknQs/pctMhQHkV
 YicihUKEjK8Geu6rpztYANTgzg1Q7tawpJNSWOQceD+uaPkMasTqEvB5bm1PGyfYo1
 eIjwZz4v4nD/wx8OgBWUDSPKAp2vhCJtvJiOaSzZ1WISl58r1jtitV3+kC27JsZmrJ
 XrwD3R2/t3ISw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org, matthias.bgg@gmail.com, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/5] mmc: mtk-sd: Fix usage of devm_clk_get_optional()
Date: Thu, 16 Dec 2021 13:57:47 +0100
Message-Id: <20211216125748.179602-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216125748.179602-1-angelogioacchino.delregno@collabora.com>
References: <20211216125748.179602-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_045800_023269_798CCCEC 
X-CRM114-Status: GOOD (  12.46  )
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

If we get an error during probe of an optional clock with function
devm_clk_get_optional(), this means that the clock was provided, but
an error occurred: this has to be escalated to the probe function
for the driver probe to fail accordingly, or unexpected hardware
behavior may happen.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index f08695e52601..59d7decc3051 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2528,7 +2528,7 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
 	/*source clock control gate is optional clock*/
 	host->src_clk_cg = devm_clk_get_optional(&pdev->dev, "source_cg");
 	if (IS_ERR(host->src_clk_cg))
-		host->src_clk_cg = NULL;
+		return PTR_ERR(host->src_clk_cg);
 
 	host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
 	if (IS_ERR(host->sys_clk_cg))
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
