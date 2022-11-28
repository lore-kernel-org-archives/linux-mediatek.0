Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A970C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPubocx/7KbKy0zsEL0NpGEqYLQzxHT26ABVcvyosVI=; b=2YWfdsQ2xZzdZS1j6UxPrPV+9I
	KgneFt4FStkvCVSd/FDNSYMZc6GJNB0Re6KR+I7FI9v22FfglnTqa/XZtraEkMZgqc8U91l3ryl4d
	dl3WZDXFn0dCncWC9kBTl3+JwY584rQWwzt+xYNeNWhBtKAAKAeqz0RndaD1BVSHkXOyLvYMI/l4C
	vNE26ro14TXlvfdYITpgxoEWWjnC6yMqqDWKjb52sNqp4jqy6wxNo1DxhBNjA04rH50cr1vMeXeRX
	ogghKfheABmH2NJD34OeArIFUVLCgsiDaSgwahGs2Ay3ZkW3sZhYZLcCtLtaXVKglH+7iKIfxDLKa
	YkLCN8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oziG2-003EhA-Qv; Mon, 28 Nov 2022 17:49:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozi5T-0038gP-4B; Mon, 28 Nov 2022 17:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A379612F5;
	Mon, 28 Nov 2022 17:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FA7C433D6;
	Mon, 28 Nov 2022 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669657114;
	bh=SVNlqFMeW1EbUZbel3/ygwlBs6fe3l3AOdsXJS7vuUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FpPyqvubExdv+joUlANHLtO8pg2kdGC7nrqhJIQNWQot9MSY7ux6YyHXYbP+oUkBc
	 BhlXW4lf35ws4tDp4kRBg0vfx9r12LqS2Ua3x4mUxaHmN9U5dYCPZ0w/F7ULQzmeld
	 SsP7a3/SlaoCAyaFUWeyULL1UfO26U7iFtNYMebqP0+Xt9cvAN9uwZ08vuJKeuc0U2
	 fqFEgHga2EraE+RO/4ateXZMcONBQRoFPK2nnPhhA/a5NmdHplgQ8PObGq6x7DhfH7
	 6v2mOkW+UiV7tPwp2WSXrFGxYZX7omzVveJbOEz0ODKrq1MEPyRY3BgoFBqD0uKGzK
	 +hC163cbtZw3A==
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
Subject: [PATCH AUTOSEL 6.0 17/39] spi: mediatek: Fix DEVAPC Violation at KO Remove
Date: Mon, 28 Nov 2022 12:35:57 -0500
Message-Id: <20221128173642.1441232-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128173642.1441232-1-sashal@kernel.org>
References: <20221128173642.1441232-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_093835_269130_B408C056 
X-CRM114-Status: GOOD (  14.34  )
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
index cd9dc358d396..a7cc96aeb590 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1268,8 +1268,11 @@ static int mtk_spi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
+	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		return ret;
 
 	mtk_spi_reset(mdata);
 
@@ -1278,6 +1281,9 @@ static int mtk_spi_remove(struct platform_device *pdev)
 		clk_unprepare(mdata->spi_hclk);
 	}
 
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
-- 
2.35.1


