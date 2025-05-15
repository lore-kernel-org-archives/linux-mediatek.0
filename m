Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FE7C3DA6D
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vd65YnGuhtTn8slwg0SFiq/RNk37CrnwjztumqKdjI=; b=Qs0v4FnVNPi0WOwSbbps5GejBu
	va9a+E9pKPFV0fP+wSTL5vs8YwBIUczOBu1vDNEzZrTerzXCMR/apPT5RU0JNcFp5XxbL2CYZlRRD
	BiZri9AlVdQI3HgKn4Dk/E0cM8tXx1ybuUo2U/IfqnZQzEosAXJ1bnvceO+fhGjaN9JrcgKDm9xub
	r/+8xWIedNJCE4/EpfNOH6Azn/m/Ct3kKt+Mp4hAHaoZjeCD+HgHbruP9C7oxsjbzDsP0HAXFWmCR
	yUP4MurQR7pYyv0sxwiwwyTLY5tyaOHevVrvyAwojI4rauXJOFxYvf76xMlYvKYH7ismb7m8c9wlE
	F38G8L6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZi0-00000000u9k-0TcL;
	Thu, 15 May 2025 14:37:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZVp-00000000sPE-0UeN
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 14:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83EB261126;
	Thu, 15 May 2025 14:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58401C4CEEF;
	Thu, 15 May 2025 14:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747319080;
	bh=XDgcBvyX6F4CWv31xvsx2QdDXOR+w8P/sVKcor0Ztk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QnCteV9d0SEhl0Q7CGh0aDAZEzobi4ilmyEM4Ab/VLX9S0vK5MHjJgPQcDrsx9TvI
	 otWduQUhcbnTWygsjiXbPmGVmBETKA5iaJQP4K9kjlWSqJnqOj3Wp8Tu6SjYSsl9UE
	 nIbgoZZrrQ9CR3oYmTtIO+JoGvbFSqqR74V5nfGdupEVJXW60vrVYplUu1Xrm06ksq
	 cTzLsd5VXzhwU8A9z922Ow4UNNajgdvb/RDOPX+7Kj+h7uci3TLjIdTo9J9gai1W26
	 nYzrfhSeGy+RStrjcufhh2aB19PagLW0ySLzPEhkTlX7RKiqnOkBNQakpxduq7s94s
	 PtsP+PXTdzGGA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Darren Ye <darren.ye@mediatek.com>
In-Reply-To: <20250515073825.4155297-1-wenst@chromium.org>
References: <20250515073825.4155297-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source
 code
Message-Id: <174731907367.355366.17373014449076976140.b4-ty@kernel.org>
Date: Thu, 15 May 2025 16:24:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Thu, 15 May 2025 15:38:20 +0800, Chen-Yu Tsai wrote:
> Changes since v1:
> - Rebased on top of -next, dropping changes that cover the DMA address
>   MSB registers
> 
> This series is meant as an example on how to use macros and range cases
> to shorten the MediaTek audio frontend drivers. The drivers have large
> tables describing the registers and register fields for every supported
> audio DMA interface. (Some are actually skipped!) There's a lot of
> duplication which can be eliminated using macros. This should serve as
> a reference for the MT8196 AFE driver that I had commented on.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
      commit: 91c2685430f217ae8f2866e4372948eaf123b5c4
[2/3] ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
      commit: 0be889823f93429dab396cb7ac061d02046bd962
[3/3] ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
      commit: 29552dcc044a233be84ab9b64539fdc7d8f4314e

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


