Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF77C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2mgAU1S9OnVpKvwgSdHKlmn1mMVdYwm/9c71ys35aI=; b=qW/pathgAUHoKTNJoH0DNDKrIi
	Pv4Jlq0ncUcm1FDsPRY6y7hLn7yw32icKbeBS5HVWZkslUkqp06pgEIjEezLDaSGQ3NwcfxHK14L1
	vD5EgWJWtvq8biyKarn/9hPYZcAFMLDIEIQQFUFdPc/zXDLsPAqnhPGT9NTo4z/TofHoOmFkVUAvJ
	0N76pnwrqsWcuoXlSUhCJwhDvDBusYZwqvGibSTDsbkV9/JZcF38uS1FtVRWG8En998pa9ZEFUZqj
	TyPIoSUkEiVS9XiZ//takjsKxmWgJsiFS4KwoQBkY7o7jdAibHVnawBrqFsD8oVRyMW8EiiMf56li
	Saq+BwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKIh-00A8gX-0D;
	Mon, 20 Mar 2023 18:32:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKIY-00A8eZ-1e;
	Mon, 20 Mar 2023 18:31:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 157E06179B;
	Mon, 20 Mar 2023 18:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B21C4339C;
	Mon, 20 Mar 2023 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337117;
	bh=h+iKiZTxlrZriKA3thm4jrdMcAtXKyFnJ24Dz8l78d0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H9/UnK1ymJI55JadZlMZt3CaGTo7zVWc9YDKQD58whi14JvN209bNcfx2cHOwOacq
	 TkhEo5Hyeno5MlLqz8uj/IawP1UYIFRwPRJBljlrqDVWm79Qy9QK4bgVYKVY7ERfCx
	 rtSWhyUs478HsFID8DrTEEHfxNGoS9cBnL11ZLKqAhFYlhTitI9/jTSRA4VFhuqBEA
	 YNQ2vtqGNSavM/jsoi9trYKBb9s6sdxBn12ATX94eXGklnYmTbka8GGlRfnC9MCmjO
	 YymQgcG5gmDBGnws6SG9uXRjtC3B2X1R0orAKTAbuCJZt9+9U5sYjuCH+PCLjCgMkB
	 z2PWQaNcp84SQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20230317233612.3967849-1-robh@kernel.org>
References: <20230317233612.3967849-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Drop unneeded quotes
Message-Id: <167933711212.198283.1787020882861078735.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:31:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_113158_606362_B007D906 
X-CRM114-Status: GOOD (  12.99  )
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

On Fri, 17 Mar 2023 18:36:10 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Drop unneeded quotes
      commit: d9e909e219a843c6bf49f9affe536660f830d6fc

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


