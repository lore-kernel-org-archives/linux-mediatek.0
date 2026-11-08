Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DE4606A33F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTn1H20D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZgmf/U4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+QnPHIBmwdoJ1mg7wG97R78F4P6cWdZ4faiCfZ2d3bY=; b=OTn1H20DpMCyjazTHJ7a5EHwPI
	4M+BCzps9gCC7sCgU36mx8TPM7FAr1gW7KL2z5NDLL8w5oO/plciRjm0eZivfM8itg8LHvLSOxs5x
	pPvTzKO5NHr6yV8+JUMnvcmFyaxq3KgSkOTqStigHzI48vE+3goWzu8uWxX58Kt31X0e+DTs2xZrm
	pkRJ6dYqUKVgSN+YbvZg2r/eECgilbH4ul5y0+Mg4pLLQrZUFAEaYQoC909wESQBvQkw27ZSiDBIm
	WJjkFfg3Bb/hPvEemCgYuHxxuw8AmWSCRkP3jeOxVxIjqKwqCE4aYhULxG+O8cy6BYxSqgz8UxFke
	UqDAT5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pY-0000000G7YC-1knr;
	Sun, 08 Nov 2026 12:17:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pW-0000000G7XL-1gYh;
	Sun, 08 Nov 2026 12:17:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B1740BAC;
	Sun,  8 Nov 2026 12:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9394D1F0089F;
	Sun,  8 Nov 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140221;
	bh=+QnPHIBmwdoJ1mg7wG97R78F4P6cWdZ4faiCfZ2d3bY=;
	h=From:Subject:Date:To:Cc;
	b=JZgmf/U4Z9wyKVlkorX0WlwOTO91gix93zMroEa6FXjVqmvIdO0rSRZr0fxVWcr1/
	 MrKA2pu6TO7yhtHE9RxOdRTO5AL1OX0jZ2sKmj2jqVpNbVv1b43aOM06Y/DNSVBtO8
	 Dm5xvAlS+YtWcI/EGhzzqlzzXpO5KjvwF//yolW87dMlkX903ueJqEUA4m3wHY6mNf
	 vyTHlWOenWovV5E/sdhHUYGnOw+wCYC1SE6vaA5lIH8Ii70MBlacyyExYd3YfBeATX
	 DRr07PUi7fAhGO8T+Yg3y4ggMSM60v2Vw4EEM5/dmzPywFmhoVGxr16F9bPQg2NBZv
	 XmlK4BUNGNo6w==
From: Joshua Crofts <crofts@kernel.org>
Subject: [PATCH 00/11] spi: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Date: Sun, 08 Nov 2026 13:16:47 +0100
Message-Id: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQ6DMAxA0asgz7VEEE0JV6k6hNopXpIoJhUS4
 u5EjG/4/wDlIqwwdwcU/otKig3m0cF39fHHKNQMQz9YY/oJNQtSihtWZfR1S1o1cyR0zr2WMdg
 nE0HLc+Eg+71+f87zAl3CFTZqAAAA
X-Change-ID: 20261108-spi-dont-use-autosuspend-9997b4f65edd
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=2214;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=LE9JAEK3uf/fTYpkCMzFmTQWpH/6qGCGHtNgMH5qPu0=;
 b=RPcJRMVGnrnJGMB1ZAmeSk2QRKr5GrfThl48m4h9ie56yEG6K6SvblDR3kPi5lJuxYr5MY0k6
 eaAn83VEbErAaMkMcr6mKQsFWEP7GT0wIpUCogUOVfocctLvl6Rhq2D
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

NOTE: Some drivers in drivers/spi/ (fsl-lpspi, imx, nxp-fspi, omap2-mcspi,
rpc-if) still keep their calls because they either rely on
pm_runtime_dont_use_autosuspend() before pm_runtime_disable() to flush
pending autosuspend delays and trigger synchronous runtime suspension,
or operate on a parent device rather than the platform device itself.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
Joshua Crofts (11):
      spi: axiado: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: cadence-quadspi: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: cadence: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: stm32: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: stm32-qspi: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: zynqmp-gqspi: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: mtk-nor: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: orion: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: rockchip-sfc: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: rtk-nor: remove redundant pm_runtime_dont_use_autosuspend() calls
      spi: tegra210-quad: remove redundant pm_runtime_dont_use_autosuspend() calls

 drivers/spi/spi-axiado.c          | 2 --
 drivers/spi/spi-cadence-quadspi.c | 2 --
 drivers/spi/spi-cadence.c         | 2 --
 drivers/spi/spi-mtk-nor.c         | 2 --
 drivers/spi/spi-orion.c           | 2 --
 drivers/spi/spi-rockchip-sfc.c    | 2 --
 drivers/spi/spi-rtk-nor.c         | 2 --
 drivers/spi/spi-stm32-qspi.c      | 2 --
 drivers/spi/spi-stm32.c           | 2 --
 drivers/spi/spi-tegra210-quad.c   | 2 --
 drivers/spi/spi-zynqmp-gqspi.c    | 2 --
 11 files changed, 22 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-spi-dont-use-autosuspend-9997b4f65edd

Best regards,
-- 
Joshua Crofts


