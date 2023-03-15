Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F77DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F1z0WVreCCiuFyV616SLzGFnQzvM0ucFsGI75maKY4=; b=qfJaWMnNrsEzmn2HWaAqGvlCZa
	mZQcD19G+c9ohRpVdJ6qjOfiTG7qwrH5vNyeruP6l2Fy2FxuKTgpGnJj2+GjeqB19svk3Hrsjnjoc
	ds2SrUDWFuZlriWK1aNvb9FZDw8J7K1uCENKyqU5oysdUqgBq2AxfklsPjJMsOlj6osOYDcdeuc2n
	yBLGiyiCHLQ6YTdLmadFyW90HMWfdKoSkWPgPAvKY7yJkFbaHYZ6RmpUEKsKnq5j/wMxjjco9i8aq
	DZwwMYwAKaDVXlkXDELHjlNdLaoUnI5D2r00ShQzRgkEZM2kjVfMrd3ASBmbTbLnOczXrRbbqb+nM
	5zzi61Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcR2a-00DQPK-1s;
	Wed, 15 Mar 2023 13:19:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcR2S-00DQLa-1J;
	Wed, 15 Mar 2023 13:19:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4424561D78;
	Wed, 15 Mar 2023 13:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55B2C4339B;
	Wed, 15 Mar 2023 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678886368;
	bh=3djw40rUw+nNpWOAp6TWK8VOxJM0awfRn9QjEkHNKHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p4mBqVpmQqEMVYVJfpmuIorD57kG3lYxffPv8FymWpo+oa1igyr9QmzShnpRkmQjr
	 vUcbNL2SrLmsLfttD/qAkP83LbDvzTLCP+ZgFJ+vlpDkpj+ayiv9IyqhVi+PXTeD9R
	 p5Rb6yfIoyAhcubaB6aPioQT17mW921CqMT0mF5INNZqY4xNVM6A0ckFvuECsO6P1N
	 AupXtcFddWgsJzkScqnIio8WCUMa3CsufmGXHG9F/1DeTjngoc881sED5Ns3bE8sbL
	 9Lku4MJXOK5zUofRkbF7LF9BE38dCCHJjHqSjeEi2Llwli+U4o4oCylraGLzAozTYE
	 lIUBVexzbta2g==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 kernel@collabora.com, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20230313212908.2282961-1-nfraprado@collabora.com>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
Subject: Re: [PATCH 0/2] ASoC: mt8192: Address spammy log messages
Message-Id: <167888636565.25434.17339984677925115588.b4-ty@kernel.org>
Date: Wed, 15 Mar 2023 13:19:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_061932_478827_17E26AFE 
X-CRM114-Status: GOOD (  12.59  )
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

On Mon, 13 Mar 2023 17:29:05 -0400, Nícolas F. R. A. Prado wrote:
> A couple commits to make the mt8192 sound driver not spam the console.
> 
> 
> Nícolas F. R. A. Prado (2):
>   ASoC: mt8192: Remove function name log messages
>   ASoC: mt8192: Move spammy messages to debug level
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mt8192: Remove function name log messages
      commit: f147ca85d6ecaf65106d1650f3c2e8afacbc833f
[2/2] ASoC: mt8192: Move spammy messages to debug level
      commit: 5f2a53c0687b151c2ecad19995108b40df76ba86

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


