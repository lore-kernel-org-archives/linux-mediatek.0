Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD0C606D81E
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TwTXhxVn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0BeoZCx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Upd1f9Y7GeQlOyeiEE4CvPE/32oJWXBWoj8XnXZdDyU=; b=TwTXhxVn1PznQF
	VUnttlKUVxtKXbIXJ85YggLz3uSJhKgN3MHi2v8z5w2i1ZAbmZZq9ozq2/nhVi0LpJ5x+xjiIyxzd
	cd2AhSaKtT+KEPJWuEuGBBodfmriMwDZZs6kuGL2Stjv3AqblOR+FtATb/qYjZLYmNseJIc1uUa8M
	a13ONAWZxImJphUveSenJILo+80mSyzx0InyMxcjhVAxDpX28UXEcPiXLGjSTVF4Dh09Z+cy5RI+d
	P6WEUKJq4VSu4g9sMyvpX44+U8GlHWHZlWPMPKnVE+EBnmDSh/KkD7w1Y5x7wi92su6Pppb5pyrTh
	SHVIT+cxlpC0+OVlumLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1py-0000000G7x7-3gYa;
	Sun, 08 Nov 2026 12:17:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1px-0000000G7vi-4AUC;
	Sun, 08 Nov 2026 12:17:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E58160D05;
	Sun,  8 Nov 2026 12:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9861F008A1;
	Sun,  8 Nov 2026 12:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140249;
	bh=Upd1f9Y7GeQlOyeiEE4CvPE/32oJWXBWoj8XnXZdDyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L0BeoZCxlBN8EvWflf/Sn5VnIEBAyAwEoV3E25bqxAPBcVeIy6mFmsZJL2Ml9kLLT
	 l5ltrFQSLD70IQHPrPMw9QyeykL8nGsZbk5cjhddtBTAqUL0mwznXj1eMeXo3RaGBs
	 iVIVfAs8SCV3+yi+h9u71zMvq26XXs/LgGgbFAY9OKs3o9pnDfEbsyYmlQrXORlZ/2
	 Gl1rSf7yPNEisKboRVCgeT/2ChVLAZDzRZ8W/FaB5jORTL2ZO0+KAFNJzf0xtbEzU/
	 z/2UQv9VzalrWKRrFM1RDMPHE90WIofQTaqVWVXzCo5Xos56RjRXnr8+hYop+8pOEK
	 MHSxxwVeiYrjw==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:51 +0100
Subject: [PATCH 04/11] spi: stm32: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-4-3587b0183cbe@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1155;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=QvLywcRSSDKS5yUXJE6xHg7ZzXNpEk1qFSP2ldha5FY=;
 b=UTTkB8s0pLkl95WznVm4FajsxQmheX0X6774NiBDe/285YHOsX6ccbFnyzqX/95QBNjJhbtB/
 3/KkR7kUVHrBwqxUAEKCumgTN8RaYronv25TuXkKoqiSHoEuNJ8aUbV
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
 drivers/spi/spi-stm32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 4c3ae546afc0..95994278cdaa 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2544,7 +2544,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	if (spi->mdma_rx)
 		dma_release_channel(spi->mdma_rx);
@@ -2574,7 +2573,6 @@ static void stm32_spi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	if (ctrl->dma_tx)
 		dma_release_channel(ctrl->dma_tx);

-- 
2.56.0


