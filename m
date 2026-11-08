Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C6606A320
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CTZT4uZy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xfry27Ef
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pjfgr+3mC8cRFNZ057iwMxj7yEQh8CXyv0+tSF6NOcI=; b=CTZT4uZyxqrxsb
	YDKQ8XJB3Obmoc/rlHLnYNnFKnShSbbD1dyqRIstNZ06p2l2U3L2/eikymrkHtidKi3cDj96bAZj6
	hnVepgLWBcdndLV9U/FsOlOaDi5qPOkcOQ1kbTuZR14Ljfkyb2P/43iymD1BSVSxDqotYuoZryMn8
	d9x7rq+UBmGZWPqPUfv+kPSOJ6m8yNdj8j+oqDjibLYX4qwYrbX+yqdD47/gkuhub6xT7KvATaBjm
	iLJszuQkToa+vWDMWP1Vfgp0wBvzLLD+Mv0lZWWw3JOrTd4y84lLM32VsLDy8f704V75CCxNjX8DB
	3Dajqr9foEF4FaDfRtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pu-0000000G7rQ-1VC1;
	Sun, 08 Nov 2026 12:17:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pr-0000000G7oy-1OnR;
	Sun, 08 Nov 2026 12:17:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C17EC60CB9;
	Sun,  8 Nov 2026 12:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1380E1F0089F;
	Sun,  8 Nov 2026 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140242;
	bh=Pjfgr+3mC8cRFNZ057iwMxj7yEQh8CXyv0+tSF6NOcI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xfry27Ef/Ysol8bufUj6suzU5LrliMsuK88iHHmWrOdvrwTGNt4xppiDtr78HjCUi
	 Y9348v86EpxcywsR531vKiFiAkXaU20rA8slHrZV1/ndmf83HqqJvRBWhCMB75doP7
	 JpTFsh0cQ+hFhG5QZh5D/ZNjaY1x/Fta5r2TpkDtR9V9IPpiS76tMZwJW3K22sB8IN
	 EAG8+g4Gm4j0pl1f+AVKPz1E6xGcWNRFb41wizKJAbfIF2HMxLv4s3WigJhivf4+kZ
	 3OS5/BnuC014cUzCg608tCL4JhciovUdQm/5f5MRszqSieTe6CxeVbgF/rcrCDo+th
	 Mw9IbW4mz3Z+w==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:50 +0100
Subject: [PATCH 03/11] spi: cadence: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-3-3587b0183cbe@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1076;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=7ryTaWhNi8ChUqf0oxEn4I8b8j6TXrR69Y5MVmBHIzo=;
 b=XEy0GJpe6Ov4zqcALncuUT6jddNiwNeYVMZWThaB6PLrMi1hQwCv44EamxPFgI+3RNX1xg/dQ
 /suNNKO2Ze+AkeDwK1UbE3FGGfZpJXzzzDMVUFDtNKzToWkpFllvtii
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
 drivers/spi/spi-cadence.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index 50ef3a7871c2..ccab85a07d77 100644
--- a/drivers/spi/spi-cadence.c
+++ b/drivers/spi/spi-cadence.c
@@ -762,7 +762,6 @@ static int cdns_spi_probe(struct platform_device *pdev)
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_set_suspended(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
 	}
 
 	return ret;
@@ -794,7 +793,6 @@ static void cdns_spi_remove(struct platform_device *pdev)
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_set_suspended(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
 	}
 }
 

-- 
2.56.0


