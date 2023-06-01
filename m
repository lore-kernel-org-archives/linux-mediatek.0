Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6182DC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4YNmuyBGATqhYGar7laaTMgNiGK0zXBEB4EVYqcu1k=; b=odpfpWn7conrzHKBAsg9sa0Y0r
	rClGrnl95Dae0PJmu/PXXdynsCCxJ8vDkkX8v981iOdxDXTojQ6XAfsg1hFUpmtLmlU/zH4uFhUr0
	r6j1SqWX8TmGiDh4Ol/SfH2b5NOMFRJ93Rw2TrG5uDhmv2m0LhlMHXPYCIJCdHvYv4lLQ1ScKGW1a
	B07mW9UEqhBBgh8m5W916PnM0+Hc74txEuv51T6qNZK9XPRj6jXUPEGETpDcu5IGfIWFuqiQJswe2
	jmMu/n+zgMtp0WrZlf/dMA4SOxM8gkb7w+pWl8DuR0UiYnEEHgSinndIuB8ACuzlc8wiaZmJjb9ad
	6SOCFzKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kTY-0045C8-25;
	Thu, 01 Jun 2023 15:44:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kTV-0045Ae-1U;
	Thu, 01 Jun 2023 15:44:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4F2C640E6;
	Thu,  1 Jun 2023 15:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6FAC433EF;
	Thu,  1 Jun 2023 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685634268;
	bh=6wfuvEex59Ok6T5gRrkfMoK/HR47V0aNeFPlA0QEhM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZqvvUnO/0qfrMMhnw3xdHydTy+Y8BJRfv87V1KJ9TvwRrbOBm1vH4kx+bc/BXg0S4
	 eR9mepejozTdE7nmqzwznxeTOrt32CR96/BljyQbeZlkZ7aEwBcxmcJ6ZN92DtCBXH
	 GcVer9bs2bPDkAYjZsn6weI9nRIkxj2kAS0cZU8Mrmi8kNfPZz9mWnjL/0WsZTQBnS
	 cGNKH0v+cCrodvUzd5XAiMLz4XBDCDta6EmixY2D4MsR8U+jysWux25USD2YV37sN+
	 E/Pvpq4mNP9RoEVjJJmiT6jVUTETmwrcKGFrfXOX+Jsgum6Juz8ibk3AN/PiftsDtx
	 H1ZIZuRUAxaQA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: dianders@chromium.org, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230601033318.10408-1-trevor.wu@mediatek.com>
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: fix use-after-free in driver
 remove path
Message-Id: <168563426581.132600.16426299018571667864.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 16:44:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_084429_544577_88B3A108 
X-CRM114-Status: GOOD (  14.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 01 Jun 2023 11:33:16 +0800, Trevor Wu wrote:
> These patches concern modifications made in mt8186[1]. The clock
> unregistration mechanism used in mt8188 and mt8195 is similar with
> mt8186, resulting in the same problem existing within the driver.
> Therefore, the solution has also been applied to these two platforms.
> 
> [1] https://lore.kernel.org/all/20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8188: fix use-after-free in driver remove path
      commit: fd67a7a1a22ce47fcbc094c4b6e164c34c652cbe
[2/2] ASoC: mediatek: mt8195: fix use-after-free in driver remove path
      commit: dc93f0dcb436dfd24a06c5b3c0f4c5cd9296e8e5

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


