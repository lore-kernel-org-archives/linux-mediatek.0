Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162D606A323
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sH2WFyGp;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brbvRanz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ivHf0Pc3p6eAqWr0NJ+TWsKwIGrisFj3IhQMlgFUcRs=; b=sH2WFyGpo/L/Tz
	vRoX56WzF4E4zAlGklVlE+PaEP62BgAFohMWbegw9HpEIN8JIYH1j13BNGVV44H+a6CdkwTcMMOGw
	4o/RNUljW7BHtK2oMJHZ3KYUWS6gzgT+Y0Ce4+VOQ47aHiGsPpKGOhKRkT+B03pxe78FEArDZN/eQ
	FQBIUKoDFIMaikEr19AXupcHsaoXsUEhg9up1lvhAgBGqky1rIih2h9jzE60pVk4iaQj81crDg/EE
	1uWcfu6nFWnzRPxKa5MjrdE22sqRdembZC/kMqsEVNxdYZ632WnGvBDtmPnwi6aveQ75jQjn4+K+K
	n+397tXOdFSSqlxrjqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qY-0000000G8h4-3Koh;
	Sun, 08 Nov 2026 12:18:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qU-0000000G8df-3GK7;
	Sun, 08 Nov 2026 12:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87DA8436E2;
	Sun,  8 Nov 2026 12:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDC31F0089F;
	Sun,  8 Nov 2026 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140282;
	bh=ivHf0Pc3p6eAqWr0NJ+TWsKwIGrisFj3IhQMlgFUcRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=brbvRanznwpm1elRlhsunNMW2MwSaxrbh6gXspid20cmy6oaZLHcd0upqM1xd87EG
	 QAt776bNgeLXudxA209oBJDquMjbQ3fXkgWVgGCwHRIuPn2iau2lkxxDRfaOoJJMNl
	 SuBZi8I4NQMzkz4/UrGn5AkTcELYYSTcpY6DQQ34Te8ohkI1dZFr7Y6OBYV0B+z4tR
	 RKkN633ZRb/txLmMWZg75po3BstSiammcZO7m4Ttfcd/Vls8cKLFtUcmImLgLE12OH
	 Q90/dE/dlZO/YoWHZRYVgQg+7l1X+eQD791ImeAD/W5I1jq/5M/DxKBbq5lZDdn4J1
	 SxPwwOVVK+6Cg==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:56 +0100
Subject: [PATCH 09/11] spi: rockchip-sfc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-9-3587b0183cbe@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1213;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=wPeL2I+QI3Df2BxdnDa7pNerVfRXP8M/5qu6ZdMC2YA=;
 b=QfRsr7iFtOGktsDSyJiCngMR0Or7BK4oIsOoaF3SOsZrwq8Pw92AyW8OFIYMFVVKXsVfVt2RV
 jzHDfBbXkvaABN8v1G8Azj1PTHUYWB5lNOMfQjjymPpKGPbtMhZ7hzs
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
 drivers/spi/spi-rockchip-sfc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index a85a260ba95f..2d24765afd3f 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -730,7 +730,6 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 err_irq:
 	clk_disable_unprepare(sfc->clk);
 err_clk:
@@ -749,7 +748,6 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	if (sfc->use_dma) {
 		dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
 				 DMA_BIDIRECTIONAL);

-- 
2.56.0


