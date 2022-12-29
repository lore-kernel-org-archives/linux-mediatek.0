Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED7C3DA79
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wa6SjqwqigYFjQFg4yvpSnYsIPPCeb4XidrvPSv3jSk=; b=T55vLVSEisqeNN0xD8KGFayQRb
	/8p3eS1Mp/ABRnxqe7DNf01NrBy6IIIUonkL2+6qh0LLydWHAxxhF3gH9PiBnHgMJyGMldoZ4AcEV
	dE9qjNNJEQre0L7cDzX+KHGJqVK5NEjUkYUBLdWFJQaz9giMwl3xxMY5AVJAN8/VYnLfwehk3sIEe
	dRq2ddXrfvojq7aXwFeQwVJMv7CrN9CNnZhU8dBZg9mTdUYInsDoTTPCYuY2jzqVix2e4l7PcSEgx
	DqjD/vJUJtRC6+AL5kCkyMAa/zIv1xZ8syJXEhqbbdZ2h81soPfJURmfbbcxRdnNRIvE4E1lVfy+1
	KPAYqJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAzSg-001lcc-P7; Thu, 29 Dec 2022 20:25:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAzSU-001lWb-7Z; Thu, 29 Dec 2022 20:24:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16D51617E3;
	Thu, 29 Dec 2022 20:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9475FC433D2;
	Thu, 29 Dec 2022 20:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672345492;
	bh=ETuogk7ACYxYQV9uzj4PmKQpxDQ3mxpqHb49NYgVa5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jDjpE5mIfycRAMFRF5PXuWGu+Wm+D4yjbQRpRtMnYPV5iP75n6NeyrDgtwgXs4Xvj
	 KwKuW5/TL6hk0hYJDPzkWnbkYb5A4oFEUmmjGpsyL/Ay4jVEnJUHieya8e9cF6D0F7
	 BgSlvWjR0uEeisdRgvsWSjjqfgHf8qC/Ds2AoHjPEXSLMgmFtdrNHEhyT6NLUSZd8l
	 QjoFB6b6UnyDSOJnDYbmUCv7ueQp4nDx+rNqr3Y9megkYbZp+Nqa4i127kPnUhOxl/
	 pdgtLuW9/jygdy71PSh2O9Xczuz3z0YVo1A53D/KLob5sRVMUYvsHhxYbKW5HIaknm
	 ABHqiXd2rOZzQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20221228115756.28014-1-allen-kh.cheng@mediatek.com>
References: <20221228115756.28014-1-allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Add machine support for max98357a
Message-Id: <167234548928.88546.3169179138497536747.b4-ty@kernel.org>
Date: Thu, 29 Dec 2022 20:24:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_122458_381530_E2F2F61A 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, 28 Dec 2022 19:57:56 +0800, Allen-KH Cheng wrote:
> Add support for mt8186 with mt6366 and max98357a.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Add machine support for max98357a
      commit: 8a54f666db581bbf07494cca44a0124acbced581

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

