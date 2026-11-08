Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F7606A331
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3qp3UP+t;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt6D6o3w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t0HhTPj4bzTBaikkJltYtx6Hu1FRWN4PirZ6ZWFxmvo=; b=3qp3UP+tt/GxDA
	lKlws/vb3DrKASGtBnuzyvcyV+n4fjeLr22puY6aqzOfUHdgSJi6C2MjMqlMWCa6o1DaNb5JqzsYK
	n+avxD73Q0kkSOs2qwjAzXeFFWrtGppNVCo1u4IWHu1hj2YVcaiNAnSsbRBLmqM3BSXd/EtD+hABP
	sg2kSIh0liFq3qo1cuPZ7hqBtdiIYKm51GLxZJ5+OUgZsfSOYEvnolJWAvtsYpHrIxNmlTxWCdaX4
	d2od4WSdDVNiwI7RPMuiyuiKyEGg5UhmhdaYwR4bMugYQqbn6ELQeXgrfTBBJWJRWVHZlNXQiuGrg
	B2W8rZI/Uc6ID8F688yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pl-0000000G7jd-4892;
	Sun, 08 Nov 2026 12:17:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1pk-0000000G7iA-2wpj;
	Sun, 08 Nov 2026 12:17:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB87B608FA;
	Sun,  8 Nov 2026 12:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6762E1F008A2;
	Sun,  8 Nov 2026 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140235;
	bh=t0HhTPj4bzTBaikkJltYtx6Hu1FRWN4PirZ6ZWFxmvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xt6D6o3wwRmLzN1HgqrLJFG+iw7lbY42O4ANyK6/MQUzGsGtAMnfARTq9wTW8gmWx
	 rQ2EqDfMXU7i8S8Yddd3QBeEf3pN90lGN9W9PEUvfuWn0j3qB3qsSwwDatNjHLyPvz
	 HzB5cBousC4t6KlOklo4xmThMQOSPJg3sD91RLl94qwVBAyc8cxpxEfxEUx1pwwwsO
	 ysXUyuEe1XGfCTMGw2OoD1jMSDB6HlMp5NcCI5C198YzdAAik/gKYvIC3ADb2JYRiI
	 UzpvIDDI/Jtf0krhU7ItMYAN5FXib7fWfidwt45NB6LdLEg1Pnf/BPdwRBoYKkAE7P
	 vYudWIe4dDHVw==
From: Joshua Crofts <crofts@kernel.org>
Date: Sun, 08 Nov 2026 13:16:49 +0100
Subject: [PATCH 02/11] spi: cadence-quadspi: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-spi-dont-use-autosuspend-v1-2-3587b0183cbe@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140215; l=1162;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=uyKe4YBV0WQ4xjRxVeaEsXG0/WnAC3tiK57fwM2IAFg=;
 b=93g0ybMATTAxNpyewzVSnIR92o5FRQQxSwuay4wOjBW1FQjHkbqT39CYxeIHluV2ZLyEZNY2D
 SG1evYLXLYOD+B2LJyza+hd7pn1c0HFaiTfUHHvvDMNpDZ/Wc+rMECW
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
 drivers/spi/spi-cadence-quadspi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 73ea51c41f95..a276745095e4 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -2001,7 +2001,6 @@ static int cqspi_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 	pm_runtime_put_noidle(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 
 	cqspi_controller_enable(cqspi, 0);
 disable_clks:
@@ -2037,7 +2036,6 @@ static void cqspi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 static int cqspi_runtime_suspend(struct device *dev)

-- 
2.56.0


