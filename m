Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9293EC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aai0KioWPQgAO4CRqx1wiH29NdbcR4aLCiBs7Tbqrqs=; b=XG2OEC4FwH9Vp++DC+lMYq5Vj1
	BxMI28qYoHPjxVH4f9mSm/8zhisesIfo90P5nyniT5rqjupgqnFM/gP4ZPCExL7DtwHYyQJC5V+Rt
	9egO6YPVITyt0zpqt4sVJ/HgaKFmBoh45LDAfx1KuX8Gll4fyn413v1fRik+WnQOBFutdozRKpJrS
	sk5cGbOz7q8loztxHH2Ajz+xjcAbUIlYTRRcYvBWc+CGBLHJZFOV6wqurp9iQEtAK0USJA9CmEyoY
	VvN0Hdw+7ybL6bFsAnvPmXdCbHd6o5w4dCtRxvgOci9hXfjG0Otunw396DTkOv7MFrWqXp5u9jtOg
	PkTsWNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oziR3-003L7Y-Rx; Mon, 28 Nov 2022 18:00:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozi7m-003ABm-Q4; Mon, 28 Nov 2022 17:41:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6C599B80E9C;
	Mon, 28 Nov 2022 17:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E24C433C1;
	Mon, 28 Nov 2022 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669657256;
	bh=XYArURAkXAvAkbmm+Cm1Z/1xfusRTaI91j3+d8JHuUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RRPEq0NnShENUTt/gp+19LWwVT3rkY1PX+GqFzGDG1XVWi+QJZ3s+VhDPHXEoWA6H
	 fjDb8r/FScSsxN0XtkuMTgsWEVQk2qWbzdG6SnPincLYj20s6cPj/iocTR7D9PQYjT
	 h/CcIwPnVElsI/Nt6ftstOBt0rOeWD4OxmaU9y6w/TmVx+2ewFwS63QPuyF5CAvdlE
	 2DyKQ5E7ieB2jOAinxLJtZ8YguIO401qtWkaK8otnhYuD8oRFivuay3IKpAgv+t0J+
	 Uu5Ysy8GDgQKRXzhg3V1SK8fSBo45yGSnsZbM7Hbda1uoCbu0p5okhr+9quoycomRA
	 JqCfML/Kti1Kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhichao Liu <zhichao.liu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 11/24] spi: mediatek: Fix DEVAPC Violation at KO Remove
Date: Mon, 28 Nov 2022 12:40:11 -0500
Message-Id: <20221128174027.1441921-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128174027.1441921-1-sashal@kernel.org>
References: <20221128174027.1441921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_094059_084939_A185210F 
X-CRM114-Status: GOOD (  14.50  )
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

From: Zhichao Liu <zhichao.liu@mediatek.com>

[ Upstream commit 0d10e90cee9eb57882b0f7e19fd699033722e226 ]

A DEVAPC violation occurs when removing the module
due to accessing HW registers without base clock.
To fix this bug, the correct method is:
1. Call the runtime resume function to enable the
   clock;
2. Operate the registers to reset the HW;
3. Turn off the clocks and disable the device
   RPM mechanism.

Signed-off-by: Zhichao Liu <zhichao.liu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20221110072839.30961-1-zhichao.liu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-mt65xx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 2ca19b01948a..49acba1dea1e 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -912,14 +912,20 @@ static int mtk_spi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
+	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		return ret;
 
 	mtk_spi_reset(mdata);
 
 	if (mdata->dev_comp->no_need_unprepare)
 		clk_unprepare(mdata->spi_clk);
 
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
-- 
2.35.1


