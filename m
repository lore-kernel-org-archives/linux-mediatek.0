Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B8606A333
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 22:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ANr6TnGk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YS340XH9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lbmh/0Z0zwTEAIGZ8vw8plOMg7G98sTILva2sucTUcE=; b=ANr6TnGkTi3HL4
	GfEO3KMczLfbqZR2Kml+hutCqUvmZPTZJAvm6IgQ7wGTOUFgelqVlJpaO5S0i9yYFg73wcmzH2W6X
	RRMggiY7Ux1nb7bs+PgmfHeXrI5+aU9qfRMIETlNuS9vprVCR5wVWO1rr9/Ug0kUjwpDGNLVy/kje
	61uxI9wfM4GL+or5xYHRNB6svOQwadAMNc7stvdaz4vODJIBAvuYTLtaq6pvlT+ithioxbWeuABAb
	SNwe4gZMO/+8vGQ44B/SmKYyKG5QAjAIAFCTBLekWSmhl3Ec86CSyCeIj9V3DauAGDF+rH7sTnbTl
	3KV+SjXsfZnDfQSDDC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQY6L-00000001u4u-3r5d;
	Mon, 09 Nov 2026 22:44:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQY6K-00000001u4J-19rg;
	Mon, 09 Nov 2026 22:44:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5701A60A7A;
	Mon,  9 Nov 2026 22:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61871F0089F;
	Mon,  9 Nov 2026 22:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264271;
	bh=lbmh/0Z0zwTEAIGZ8vw8plOMg7G98sTILva2sucTUcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YS340XH9AgYiYC0jmay2BOZ8psYLNTS9Zrj+ai1c0l0V3ody+zwIbLGKaNGAGBa4J
	 d9aPJgiLauxuP8BmJQSc4iHfqQSdIMPFvqoZdhvllfDpSeXc3vutC6h9i9MK/xnRN9
	 dIRg1N6rLkEd2ZBuRQl19ce7kHwCYP6jorqrFPJxo1LriWVol/DWOFmnbLH1HMilCc
	 7Uj68OXXpLHznUZRlz7kcg6kTHT3s1XEMPq+7NHYItafxe7T66Oh3nx8NXaqJT/l7T
	 dBvKnsrMMJzH/z0kiG9OTMLFTueglK0GqfYsdJKUEz8yrPmdhSIpTDARYW5sQLa6NL
	 pdO/hDQ3kA+2g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 351CF303EFF9;
	Mon, 09 Nov 2026 22:44:27 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
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
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Joshua Crofts <crofts@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
References: <20261108-spi-dont-use-autosuspend-v1-0-3587b0183cbe@kernel.org>
Subject: Re: [PATCH 00/11] spi: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-Id: <179425512291.3711751.11313466595449863242.b4-ty@b4>
Date: Mon, 09 Nov 2026 20:12:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2825; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fGK1+6kBLTgLKjWD8aKdb74u71yNwRTJZfTglc1HBn0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI++ZwODWpPPLn8k2Swd6BwZ+i06Lcex+7e3ZW06bQrL
 8vrE7O/dpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiHC2MDGc67Hb+5puz5IRx
 GdsjBpnZF97yZonUlPO0X+D66L1UIZKR4au03ISGG6cDm2792q+lcTQvZNuXKQqR0/3a7jyzWrv
 Sjx8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 08 Nov 2026 13:16:47 +0100, Joshua Crofts wrote:
> spi: remove redundant pm_runtime_dont_use_autosuspend() calls
> 
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[01/11] spi: axiado: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/9c5ba93a5a13
[02/11] spi: cadence-quadspi: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/4a1cab30f7e0
[03/11] spi: cadence: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/e5187e13ce1f
[04/11] spi: stm32: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/6d2a6ec8942d
[05/11] spi: stm32-qspi: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/73f3bb4134f4
[06/11] spi: zynqmp-gqspi: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/affeee16b705
[07/11] spi: mtk-nor: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/634d73e929cb
[08/11] spi: orion: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/ca8b81eca7f1
[09/11] spi: rockchip-sfc: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/b90c9acd16cb
[10/11] spi: rtk-nor: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/1fcfd0275515
[11/11] spi: tegra210-quad: remove redundant pm_runtime_dont_use_autosuspend() calls
        https://git.kernel.org/broonie/spi/c/ff3bd58298fc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


