Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787A6C3ABC9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzBvhPSmo90NO22mlcYYepQi5fAGn2l/eESCIeQc4Z8=; b=uL48tCtdTa6fnuO8qDuwXrEg8W
	2YxrYq37+b8GFPi3mDmPpNH5dfQ6Zygeh1njj/i8VMSDEqPsxT1/Q6egZxUHbXNmWJCguMhsMSAA+
	iNdhFq8LAUTrithp+LDZjZbOdGr2766pzM/z1Q34j9SELkmS720DkANgTL8q5chP5KjOeXmbvTbwQ
	B5XgngxhvdE4dTXKblRrXqNdmwIzhXEuTH1/i88s+WJNimNculUj1kLc6XdSB/QIqH3SlITSINqgH
	f7LwF3SVl02YHltPAWb5u5BcFXoW41bvV5okep1s3YtoIPhny2VG5SYWLDgc1jqgMudGO993ZQeMx
	F0xH83Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzvr-00000004LZc-2Ox5;
	Fri, 16 May 2025 18:37:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzUU-00000004Gpt-40pY
	for linux-mediatek@lists.infradead.org;
	Fri, 16 May 2025 18:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A902A4384C;
	Fri, 16 May 2025 18:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE31AC4CEEF;
	Fri, 16 May 2025 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747418942;
	bh=b1CY2mAKjx8/A8MQbS9mFdTqZfmhoUC+by+9X6ymOIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HL7Das7aMLmX9xrouCm0SYxN5JCpTARIF5lg1N9zKcsD+tVWO1F6Y+bPSIS5NObRQ
	 sFRLxkrKIIUV6KFZmDwAmDvcPsGMLfgW29f1CtXCk3Vg2XDj1SCI3D450jjPgM50Cy
	 +KKVUzjggpW0YcSvXSOrTp9X04RMq5ZCp2pIkGoGR6klt/n0bJZV8mAWo7MaZf7udM
	 Qgy4dqzovhiKHdprBJ2LzVuMEg1bAwXi0TAqPDj1Jo4WpUbKela+8xCzgAoMh6JkdR
	 Qt4+reT9n5cSkgKOdL0tJ5dzTNC46OY46JPuRCWKVJs6DuAc0JCUUFseJXpaH/nHEM
	 7xRiRabtSpObg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20250516050549.407133-1-wenst@chromium.org>
References: <20250516050549.407133-1-wenst@chromium.org>
Subject: Re: [PATCH] ASoC: soc-utils: Check string pointer validity in
 snd_soc_dlc_is_dummy()
Message-Id: <174741894022.384649.9583972742635774457.b4-ty@kernel.org>
Date: Fri, 16 May 2025 19:09:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110903_021510_677E83FD 
X-CRM114-Status: GOOD (  12.84  )
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

On Fri, 16 May 2025 13:05:48 +0800, Chen-Yu Tsai wrote:
> In the recently added snd_soc_dlc_is_dummy(), the helper uses the .name
> and .dai_name fields without checking their validity.
> 
> For .name, this field is NULL if the component is matched by .of_node
> instead. In fact, only one of these fields may be set. This caused a
> NULL pointer dereference on MediaTek MT8195 and MT8188 platforms with
> the subsequent conversion to snd_soc_dlc_is_dummy() in their machine
> drivers. The codecs are all matches through the device tree, so their
> .name fields are empty.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()
      commit: 628479afc7a157bca3430a75e759ed06c1a81c66

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


