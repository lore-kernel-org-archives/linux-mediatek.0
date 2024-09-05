Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15797CD98FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 18:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALOW/Q+B0dwuEOZyVTwad+iq3QiyytjmRV7ZO9psvx8=; b=JfEI4f55fCSSvldBGHSw3zCraD
	UWahmKGQtfeR7lZIXxno4074Av7AmjP0ELYukviAZDN47Lv4At0u01qh9VWYYQhOeo8sHrniUkVzz
	UfDb2wz18U1WY30L1B0TimqKcB4UnptxVZ9WvPy+lCWE1GLkv/Wv55K/RpOCnP08fXfv+KOuKKY6T
	nnVdvRmSV07nrfu5O1WKu2iJyw11hpRLTk+dQmT4f6eCS3bspYyUiROWk9LeF3GSPUJ8ZwpNmTjmy
	qrZV4mAaLIEsDhOGg9lSYwbHHJLqdukJn4Ijt1s4Hl+zcIyu/ajmXBkWIkqpzVR9ST9H4W0Fga02l
	2XJ+PkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHSj-00000009U4y-2vHV;
	Thu, 05 Sep 2024 18:44:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHR6-00000009TiV-0MmE;
	Thu, 05 Sep 2024 18:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 091A3A43391;
	Thu,  5 Sep 2024 18:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58B1C4CEC3;
	Thu,  5 Sep 2024 18:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561746;
	bh=4eWG/a/26/vZU95IBABJgRDgFGSUm8AvCLiQp6PJwQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mV+s/giiqa2lTulNqxBg2vltuHE7NO/2vObB7ZNwXKPdSfwEiCKW7MQwuYBO2knWU
	 tRpPi0dWs9oN4ufQFxUegT2HKYIbf/gQm9CP6d9qThM+hPLla6lveIImLmVX6PGPtY
	 VIZXzcoWzCar2VqiK5Ty5xMg8eDzmYMFg99UyeK6UPJF7FTiA4DcEJjrH8HUL+KqeS
	 QzQCo+3Vv3zOXLBxLQZ5Zaa4MuBx6ss/VqqbhQJFo3g967w6qd6LSU+VfEoZ6DATTP
	 OMELBiKR+Uxcb9JBR1W0NB29/S/6atbMAJAx3ktc3qn6TmbzhYfkbFlWElbQm+3lM+
	 yNgp6FcD1UlnQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, amergnat@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
Subject: Re: (subset) [PATCH v8 0/5] Add audio support for the MediaTek
 Genio 350-evk board
Message-Id: <172556174352.65454.6443840128203694133.b4-ty@kernel.org>
Date: Thu, 05 Sep 2024 19:42:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_114228_224705_0FC264E6 
X-CRM114-Status: GOOD (  11.91  )
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

On Thu, 05 Sep 2024 11:06:57 +0200, amergnat@baylibre.com wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx
> - Capture
>   - 1ch DMIC (On-board Digital Microphone)
>   - 1ch AMIC (On-board Analogic Microphone)
>   - 1ch Headset Jack (External Analogic Microphone)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: add MT6357 support
      commit: 5e2404493f9f6028bf143972b18c88156c9893e6
[2/5] ASoC: mediatek: Add MT8365 support
      commit: 5bbfdad8cf8d4b2c3189fee8e6300b38f65f8d72

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


