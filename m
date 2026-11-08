Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BA606D83B
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QHLyoQpj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGg0mmjA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6rdelwBDg+dMqAh9YJf04osZ8RwF/tmm4URL76mwa3w=; b=QHLyoQpjwCbZhu
	zZzVzWP2KHnFAYEi3qvhRJCYcCrC4eqEVztnmHACGlWs4k1tN79rDHvWvYxQ6al0rGWISRwX2gaEy
	D7zcdMssxTKBpe9fgGe9hDDsw0lSt9cWgYdpZOhA3A/B5KZoo28JGBcCvnhtPXECIlQLXinV4mWmc
	So26ceO0tiNBt/Hs/6H0Jv32iVNrUplI3vowUWW0CNVKpQbjEDtUrt9W7cPhwtaTYt37Pnpjvr+n3
	sJ/yRvlFKl+zj4vhbLUJMULn/ZdIn1aA5hy/lXwezxUHIfNk2zNuE7hGuIOwWGQxP71kvl/GxLhAA
	Pp7Ifp4e3FV1HybBSlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1q6-0000000G86R-1RYR;
	Sun, 08 Nov 2026 12:17:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1q4-0000000G83o-3h4a;
	Sun, 08 Nov 2026 12:17:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A4C460D16;
	Sun,  8 Nov 2026 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB8B1F0089F;
	Sun,  8 Nov 2026 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140255;
	bh=6rdelwBDg+dMqAh9YJf04osZ8RwF/tmm4URL76mwa3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KGg0mmjAW4zSkZLAZrGgXi0iGZl3a+Dqk4jQjudYVLXDOaRCDsbjcKi0rRl9W3K4K
	 c0ESBltD+wYxPNOiKfDgaTNaVmcKFHgLM7bJUZAtri4sQ+xg+Ro5hBP/MOYAGRBWd2
	 YoGY//fu/okSHJpfYCxv6mUVatZLlI2WjP1Kl5bUgvuzR1CmalCicXrUf7PI+gOF9l
	 jYrdIfbiidEr3bMz5qKEkSZgFb3F+WwUcVPzJ74+cb1gJbAfPETPT1vvfIu8XtDY2y
	 977A+uR13VqBDVrz9bk/hDr/HPu9Mn4naufvivZDOLcKLz+2UeFy76Crk8u3mg2+98
	 NM6P7UQu7IoDQ==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:52 +0100
Subject: [PATCH 05/11] spi: stm32-qspi: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-5-3587b0183cbe@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1153;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=toqgrbHHm8bx0slhbz7guv4WcXlfLyxE8Ef7rFNNPDE=;
 b=Dl10lIimEbjxQcPFQglkgDiwyI8vueTbAfpV+yEqs25+R9eTBKhZeYyRRcLi4OONxS3Q+Pfk7
 4xkQAC/5NHJCRal7U5RkFXTaM6H6mkBdWgpVcGhbiLGlFRAMz/53bpN
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
 drivers/spi/spi-stm32-qspi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index b77daba6db83..4ca21a327a26 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -882,7 +882,6 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(qspi->dev);
 	pm_runtime_disable(qspi->dev);
 	pm_runtime_set_suspended(qspi->dev);
-	pm_runtime_dont_use_autosuspend(qspi->dev);
 err_dma_free:
 	stm32_qspi_dma_free(qspi);
 err_clk_disable:
@@ -904,7 +903,6 @@ static void stm32_qspi_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(qspi->dev);
 	pm_runtime_disable(qspi->dev);
 	pm_runtime_set_suspended(qspi->dev);
-	pm_runtime_dont_use_autosuspend(qspi->dev);
 	clk_disable_unprepare(qspi->clk);
 }
 

-- 
2.56.0


