Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA2BC52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Aug 2024 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOlktBrKr2ZRN0l1EmSQLP0KfhxjckjJalu7pcZtMaE=; b=K3U8XBaWzHOnuGckLL5GdE/W5B
	yA3qWVLaT37xASX6VQKUMRkhm0X41mg0RfbuX8NyN+kcnFsxbFKz6FHOB4EN4MFx84W/flv05etVB
	ZP26SiWRT3i5GW8h1rw+Tj1HJYDbL4xTaqLLYHa0gJytVeqtMZcs2gN2gL9AsdLrCvPhXa/UQS3+7
	LRaCvhgcFmfB6HUhOTHT+nBS/snjprvQiuDngcMJbM03QQriY43w622YQhSfpITiG207zJTrfncjH
	ObbO33RJPLFLUMuvXsmQoGxW/PfrdKohbEmV1vrdTfE/g5vSC/k50yUSpKgihSCTR3AQuaKWDOnCV
	Cy9NJHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seaul-0000000A6km-0unN;
	Thu, 15 Aug 2024 13:53:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seau2-0000000A6Y0-3J9Z;
	Thu, 15 Aug 2024 13:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bOlktBrKr2ZRN0l1EmSQLP0KfhxjckjJalu7pcZtMaE=; b=VAM1YT/pr3EfAeVNLjGUg/Ec2u
	gHOkGbyMEkMsDsgxXn01ZV4u1LsERnQjwkEzg+6Io6EqnlOZD9HPSJUuDTRALyA5q7D8IthU26F7w
	3wWZeQUs3OhcmnPagg6uI3tZEGUiXoL/7NQ75BummyA/GRNO3Q8c9+gmsN/rezeVBmsdNH4EnXp9y
	0eErwT2NmoozC5kUYSujq15pCY7ATMT/b71NtX6Rkn9Olxuy3OXMaAyruz4DXwqKAT6krUCZJc9hb
	AAE6npyYgZM3HRZHNdrAXP3JnaGDgyD0nx1vkHwgEAluSrCDLva+lbRckX1+EyPmN+ntqwnEaHYp1
	/NmWQV1w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seatz-00000008NJY-1uVZ;
	Thu, 15 Aug 2024 13:52:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3455461EC3;
	Thu, 15 Aug 2024 13:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EEFC4AF0C;
	Thu, 15 Aug 2024 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723729947;
	bh=XuBfDATDcvAiZT5CdLIKzlIJ8W1fzMosWfJyMuCN/pI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZfpdB1Cbz1GsLjrkkdZ2F/nRymjc9Q6cRXrso00Y5VwxvnPM3Bqu6B6wan7OcdTXX
	 rVCogQGcY6OMGqbYalK9A2lFQ5cb4xMRKjljFOcuu8P5rcIAYYhCk5PpvvAwGoD6Y0
	 7T1qq8LKF53Mb0ju+nQcWeV+OxiZIgnNxUkmsFg0BrIiDYkVUibf7Zrn5JwXX4V/uF
	 4VCHsyo5+18tDGESHTXgwNU/6F3u5o+dSi3Fo8xVr7PQ/RhWnDpomYYUg3Dz2A/M8A
	 fgR4PUBsPHHURaA4rRDv/DoVIHdYA3bAxY6kx7TrjPyJb/Q9iUR6/EugfUidTXsNYX
	 IlNtycBWIVODg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "yr.yang" <yr.yang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20240801084326.1472-1-yr.yang@mediatek.com>
References: <20240801084326.1472-1-yr.yang@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register
 as volatile
Message-Id: <172372994551.42484.5241249306313134145.b4-ty@kernel.org>
Date: Thu, 15 Aug 2024 14:52:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_145231_747066_424543F3 
X-CRM114-Status: GOOD (  14.78  )
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

On Thu, 01 Aug 2024 16:43:26 +0800, yr.yang wrote:
> Add AFE Control Register 0 to the volatile_register.
> AFE_DAC_CON0 can be modified by both the SOF and ALSA drivers.
> If this register is read and written in cache mode, the cached value
> might not reflect the actual value when the register is modified by
> another driver. It can cause playback or capture failures. Therefore,
> it is necessary to add AFE_DAC_CON0 to the list of volatile registers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile
      commit: ff9f065318e17a1a97981d9e535fcfc6ce5d5614

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


