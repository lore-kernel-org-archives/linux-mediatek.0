Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430C4C61D97
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shNwRSJAh0/ETlL0NEUSQCQi7Y0q43GbKvBc1vtEiE0=; b=VWtUv/qCyIlp6S1O6LRr2O6BOA
	vKVi8kb0yxkixvzJ0Vd0O2AYht1Jg7BGGgyjzqmRcL6y31DARAICgs+NvCJlPis7lDYqElw1THZbS
	KjY0jbinHF1nfsVR85HfieDF+m3NsAsNv3wBywaKfjlULoMY2dlcZlgBLt+6qZPK0YCSORNvDEMQg
	gqjuKL57midNUgrm+WnXmWu7M1eIHzPg6wmXC/ZIvo+SU/jtCadxZhRPOoR0Q3asREIbSxZqChDYZ
	ShEr+USBG8EJE+L4gpMslouKXMPpGJIwnYlK9v1kiVEaBBjrFfXP8g9gRANVKshj5Gxe33ZpTCAF9
	Cp2kI2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6D3m-005Mcw-2f;
	Thu, 23 Nov 2023 17:00:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6D3j-005Mc4-1A;
	Thu, 23 Nov 2023 17:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 30C5FCE2B49;
	Thu, 23 Nov 2023 17:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712E7C433CA;
	Thu, 23 Nov 2023 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700758808;
	bh=zGd8DxX1wjCChLzUne6ijJYjDDvfRf0xhdz0NGOau8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YuFMepwnkk1Ibv/ZBmbqWCCs12vo6vaJDeqmnjEUC+86kx0cM3RNA7ub58tJbDhbn
	 Dy5FDpgrzCZxQU2wrFwjxPvHsOwNp+u1LSlBGJ1nuYPcS8k6CqZHYXPrCtPoBGW9Ql
	 2FqtrnIYIAWr9J8GjDh+R5wLbY5UlFAC9exhti2D2qXdC9ampGxp/oTSBPqxK2GGSw
	 jrP7UR7A9Et4XcPvvbeb93IkXA6vVKcshp3UyvG/G3QNLuIOzQNlVzkR4BiXROuAG5
	 1shAK1QFDS8rtSFNVFOdISztpU5b0+504LUZuIGeOX4uuGu2JgbxHhyE07FsxlAgle
	 MlvqzVtg7vzoQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, perex@perex.cz, 
 tiwai@suse.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com, 
 tinghan.shen@mediatek.com, u.kleine-koenig@pengutronix.de, 
 kuninori.morimoto.gx@renesas.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 wenst@chromium.org, kernel@collabora.com
In-Reply-To: <20231123084454.20471-1-angelogioacchino.delregno@collabora.com>
References: <20231123084454.20471-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186: Add Google Steelix
 topology compatible
Message-Id: <170075880330.2448402.15081642632125216155.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:00:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_090011_585624_E3FCB03A 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

On Thu, 23 Nov 2023 09:44:54 +0100, AngeloGioacchino Del Regno wrote:
> Add the machine compatible and topology filename for the Google Steelix
> MT8186 Chromebook to load the correct SOF topology file.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: mt8186: Add Google Steelix topology compatible
      commit: 505c83212da5bfca95109421b8f5d9f8c6cdfef2

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


