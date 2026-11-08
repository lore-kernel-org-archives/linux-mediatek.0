Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2334606A330
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZB1w4c/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIcoRQSE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qxsTqo+JQMtCd9rmTo6lEo3pQJzhEtQmwRC4ed7agqc=; b=dZB1w4c/YRUGxq
	kqNY1edds67HMmlZjXsi42djOMjbhYZ38yQHX+fpdqhwsq/8U3VkjEmziVbLlylboMHRoayT0Ne+4
	ZCdUPyT2JRxD86jkyAxJ2eOxbERNWx7Xb7My77agO5yrqKLjiWMtJZ5xU/up0VjEUfqx+/CetdasH
	v2MW6WLvCWde/+UEmbvbUXDsJTJhSU9zBdYDbbatNwAibbPu2PmyF52yASioD28xamw1AKrEeYL9a
	+RvTtiFKiHGT8OwEjaJOmE4/RXeXzxaa3t8wcl+1k4C4StH6cX0nmUfDNZVcjybuDZohBqq6MiIOV
	whaR/sddBZczhHNdxJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pe-0000000G7cv-2xfg;
	Sun, 08 Nov 2026 12:17:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pd-0000000G7bg-1DS1;
	Sun, 08 Nov 2026 12:17:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1036F436B6;
	Sun,  8 Nov 2026 12:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F09B1F008A1;
	Sun,  8 Nov 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140228;
	bh=qxsTqo+JQMtCd9rmTo6lEo3pQJzhEtQmwRC4ed7agqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iIcoRQSEW4XrwKV+nN9Nb4Qa5qsQEH19jT0amut0xQctRCFfAEqzNq+Bs5Z9F9IWk
	 sQoYtXE7HJlRwkWJ8I1w2Ku2LPxakUauNIgRNx1YVQlh6cny3kvR1CI0VvkkAbF8Ql
	 pCq+bY+iwgS/27EMr6tjjreoaBXpQePYSnIo8khNK7G2tbxRiYiactQbQp0UgQRtP1
	 1k3E3ofNCdMdai1BrvqnHtKT3GbP1d8d+PEaaxqjOsYDKb6F2+VEbXQ5CpODx/kV33
	 bEyPyBdPxdBjpcwM584RGrzjQ76Y2g5zOkkJ4zxCDYseE8qT4exVR9Y+iMByK0h1zE
	 SM4pZo4C+0ydw==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:48 +0100
Subject: [PATCH 01/11] spi: axiado: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-1-3587b0183cbe@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1169;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=NRoyppHKukC1q/jS9eBWJZZhaKnTa7BWmakPxRHlU6c=;
 b=D2kmfHd3JpxqRP8yObPxfrCGD9MxMVhHhVSsWUhJruHhGwmb1aC8ca9RPWngeIISejU2cS6Z0
 pz4IH4C/CilCuSJTP0Hynq4XrRD4ZO2GveTD1qC25VNd7UjfK+5rtoO
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
 drivers/spi/spi-axiado.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index 4a781b53f372..983fa657f00a 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -858,7 +858,6 @@ static int ax_spi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	clk_disable_unprepare(xspi->ref_clk);
 err_disable_apb:
@@ -887,7 +886,6 @@ static void ax_spi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	clk_disable_unprepare(xspi->ref_clk);
 	clk_disable_unprepare(xspi->pclk);

-- 
2.56.0


