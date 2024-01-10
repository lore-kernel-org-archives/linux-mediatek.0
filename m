Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A80C4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HT5JRZYTCQ57YToBYrO9pXZWje8nxFjU1HxldQ/3JY=; b=S2YjSdLbWCxvRWACckKRASDMdP
	FHnUIPULK2dzs00WTRejt3WBlFR6u3GRCGAmQap5BwrymKhpu2lDRnMxfP7knfueG52j+iTB5bA9W
	WrhA0PQtdQNlBfo72r6WWtOkaCO1VJlNEaa20TahBjKR1QnecZIfuaQFSdWuMvKk4BUF6LnKdU5yc
	VACUOnHRzmjXvVHcJ7VVzKjFHng8A7X96WfNqeWC7qt+YG6SAP2hDIvPPjTulD4m73rCr/I+E6jD/
	mZvwNtTDESTuAW31CX3HGGtHRwHbqLeKJRcvMCl5LwgjYTHYxALTlFCmxt5Wu8y3XfXdeL346OlL+
	6sc6DcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNb36-00Cm2L-11;
	Wed, 10 Jan 2024 16:03:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNb32-00ClxL-00;
	Wed, 10 Jan 2024 16:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AFBAAB81A68;
	Wed, 10 Jan 2024 16:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43118C43394;
	Wed, 10 Jan 2024 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704902597;
	bh=wxt5E37GpoAUW7+xtOpR1biWeJ1ynUtUPy5bRry8n0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LJqRFiB3mlGh1+j4qu4hv8AFXbWTnTmwx0EMXFoxarsuALChaldVkrHnYsktMMU0Z
	 NvFc3cQqKSdWAJwq8HiD9mfs7a2tmKWhn4Ctq7N1EnchsRqqaKMli0TseJTrAW9mlg
	 NCq8XcjgB/OL1xZbkUYlWwsehSFqHZ16h1p2fJfVoglMzhivx+a6U9W3qkHScqjr76
	 OpPeRciHO91c+MNGLb9pkAPiB3BrrmhYIzageHXugtfmzIllp+B5mquPrZ7iIysXKC
	 cscmenbgfx3EvY+oSMu13QDQYFd9limyajnBuhS31kaxsWdpf79JbaqSzcWAHEyzVK
	 2accJDBoZ7Asg==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, u.kleine-koenig@pengutronix.de, 
 kuninori.morimoto.gx@renesas.com, trevor.wu@mediatek.com, 
 jernej.skrabec@gmail.com, claudiu.beznea@tuxon.dev, robh@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240110105757.539089-1-angelogioacchino.delregno@collabora.com>
References: <20240110105757.539089-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Remove afe-dai component and
 rework codec link
Message-Id: <170490259398.18995.11219791852170871212.b4-ty@kernel.org>
Date: Wed, 10 Jan 2024 16:03:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_080320_177835_AF5978B0 
X-CRM114-Status: GOOD (  13.64  )
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

On Wed, 10 Jan 2024 11:57:57 +0100, AngeloGioacchino Del Regno wrote:
> Remove the extra 'mt8195-afe-pcm-dai' component, register the DAI
> drivers to the main AFE component, and rework the DAI linking between
> the headset codec (RT5682/RT5682S) and the TDM interface in the probe
> function to stop assigning name, relying on the of_node of the codec.
> Also replace the COMP_DUMMY codec entry with a COMP_EMPTY for the
> ETDM2_IN and remove it entirely from ETDM1_OUT to fix the registration
> flow for this sound card.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link
      commit: e70b8dd26711704b1ff1f1b4eb3d048ba69e29da

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


