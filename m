Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EEA606A323
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ed8ZstrY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2doajhm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SckiUnu1S01rYyVBaocWKaUFwyjWG4UsjJW3tv/+z/0=; b=Ed8ZstrYspr6Aa
	tiv51fo8Dc+eWZu+7y98TB00MhoyRg8Kqx+/pTTXstidruPp0eHgB9JguMOZ6vRu1EiAQwybchx/F
	JJwKUGjc2+K2wu9n/uCU+XB12zO5+MxNyouVZL+0YkjfgViMJuPB7nhiog3uQ65VjjOwNah/BiVZ1
	BJeH8X8zioVDEunQPIz8lNIXD+a1bsw4whEO10f0KV3YjH6QbubtA6TlLTDaFimDwbJy079shxUYg
	lTzMipjSRk8XniPtVwQ3XljkbmhP+KNueg60LMLPGCoTCntm2nufTwyX9qno7RCfvIbIhmnnBNqBY
	TszgLTvW/k70gVcoi7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qj-0000000G8w6-26EV;
	Sun, 08 Nov 2026 12:18:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qi-0000000G8tN-1g1R;
	Sun, 08 Nov 2026 12:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCA9E60D27;
	Sun,  8 Nov 2026 12:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E961F008A2;
	Sun,  8 Nov 2026 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140295;
	bh=SckiUnu1S01rYyVBaocWKaUFwyjWG4UsjJW3tv/+z/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K2doajhm7XDLnukMsitOSySzn74EXWrVk4AXgpXZxA6pD34xRObyuefxmA16/VM/i
	 BHrQR9ZTvyOoTEEjxx9/9vGjgWcOwUnU9l+EzLE0/wejLqSP+qABrqkDwWjdbFwqDc
	 QisspIbLRPc/TvxHUugJnZhl4UyDwynLIVr5j6A890uG8v3X+ria/xKcd/AQ5FExL3
	 gRIsYuZbutKaiV3MF7ytEZHgbfhQ4idm6CC4uDNNIFdmyXd4BuYGw1OfgWNwjZulOs
	 dTQaU0VsOa147go8rEZ9wHGiCns6N58J4bw6tvCeuq0XEElAkom0AnHx7bQ3cSvR2N
	 +1Jy5qukSzC2g==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:58 +0100
Subject: [PATCH 11/11] spi: tegra210-quad: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-11-3587b0183cbe@kernel.org>
References: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
In-Reply-To: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1182;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=8JBQ4IcPEGwBD1QITLActHWZFpnabtrNZR/DykpAoss=;
 b=DwG+Igz5rwcKr2H2vQkzimZS8cgXmgDiMkHh4/f5yqxsMm/phmaTniGQH06bGPP7QMM/kq/WT
 BJKXCJ8NUw7DH0kns8hsHuGZwDqFvU0GN7mU+1NSSDUJ/14/p33mCf1
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/spi/spi-tegra210-quad.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
index d8cca3aa276b..5178cf7eca68 100644
--- a/drivers/spi/spi-tegra210-quad.c
+++ b/drivers/spi/spi-tegra210-quad.c
@@ -2185,7 +2185,6 @@ static int tegra_qspi_probe(struct platform_device *pdev)
 exit_destroy_wq:
 	destroy_workqueue(tqspi->wq);
 exit_pm_disable:
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 	tegra_qspi_deinit_dma(tqspi);
 	return ret;
@@ -2205,7 +2204,6 @@ static void tegra_qspi_remove(struct platform_device *pdev)
 	spi_unregister_controller(host);
 	free_irq(tqspi->irq, tqspi);
 	destroy_workqueue(tqspi->wq);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 	tegra_qspi_deinit_dma(tqspi);
 }

-- 
2.56.0


