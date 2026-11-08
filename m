Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307EE606A32A
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ygGOYPY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh5BpzPg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R/Uj3OgmmW6UqMpinFCutb/gtRFMEJIKzUntN0uYzOM=; b=2ygGOYPYNfaKCo
	VoV1dg7+SmHRpYU4x1mosuF6C9cRPIZgOzZ1b7ZDZ1p5/p2RzrISc+ZqozeB3u4gtgZWnbK5tnmsf
	FKv1qTiidYhod7+VmY9As3k7RxBBdYZHWz0pxiD1znXRksxj64q5r2qVgE18ozCkTpka9ps89Lyg+
	uQLL0U0opZpgsoo3AkoCgIu8bN6+yOK10qA3FQNZmj+yYSTsd9Byh3iqEKPozpa+FptA8zaQf7VfA
	JLABeXOJI3RePwZXGg3SNrSm/n3JKjP6N8+wiMKyZOT9BvkBAfPAgMKeb1YdBx6xpY94JUN7P6r3f
	ogfYJFnUz+sw4fL0Zd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qJ-0000000G8OK-39Vi;
	Sun, 08 Nov 2026 12:17:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1qH-0000000G8Ly-2NWG;
	Sun, 08 Nov 2026 12:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 524CB416B0;
	Sun,  8 Nov 2026 12:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DACD1F008A5;
	Sun,  8 Nov 2026 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140269;
	bh=R/Uj3OgmmW6UqMpinFCutb/gtRFMEJIKzUntN0uYzOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jh5BpzPg/2WVzlkpRYuRbWsr7ye55Iy1aaHLpP0AijzDc3+F+RkpBJd8XfiyOcbu3
	 o4EnXEzgcbSZd1e8pnTIHinJCfTvG+hAHdV5Jmo5sb0OcK5VSRN2bWdlbjoG3zw8oz
	 l82J4VE3Xm+naXs1vxygzkco96bSCY7BsAH0KYtaU2mG7KQwv7zcr4lbTXY+xNJOVy
	 7PThtuWhUXA1qm5Ko1CoWEj30kGoaNf6s/EJoro8ATmmBG1rnHt1XcY3QZ8GcBkWVi
	 2m7rkKGxQVbUBPwTwYtMzotXQt+i1zDGVVpuZV1l3v8MAkZ1tn/nebh1/7YS5TjoQM
	 ZLJCENfD31aEQ==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:54 +0100
Subject: [PATCH 07/11] spi: mtk-nor: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-7-3587b0183cbe@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1081;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=AXed4VswP0TgN3GA7lXd2TOUSBx89qibzjtjhBwfZfo=;
 b=Tdb9cnfLsrnvFVWfgrGuJe4+ELv9rSxH2osXu/imxHyUX6P1dPnp5MzAl5fUem1DM6brYDOlz
 VOknjNnvB77DhreZYOpZguG85u/r8OaQmETw2n1SPEYcslDml+Ay7SG
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
 drivers/spi/spi-mtk-nor.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6b6e55d68048..79e54ccf2a6a 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -932,7 +932,6 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 err_disable_clk:
 	mtk_nor_disable_clk(sp);
@@ -949,7 +948,6 @@ static void mtk_nor_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	mtk_nor_disable_clk(sp);
 }

-- 
2.56.0


