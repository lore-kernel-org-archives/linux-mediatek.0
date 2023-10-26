Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F67BC25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBaJpxUQ436RwEeH2JrcVb/jgx/Zu9JsFS6J2noPx3A=; b=0Z4LpSFm0Xa8rAXb0tUArJnAvY
	vpxCLtFPq7eK2/RTMIFoWdaH6nuUfyvNvjHGC2EN/bYL9E+m9ULlThQXj6x5tHO//yo4klA/keSJZ
	vnE96j7qYO2VNXsrQY0WAS4uouRLrjnSlTrFMB/uVyQW7krFjVhEYMhpi5Q145lc60VRkqNTOE1J/
	iR1zsJHqfjN3QTwGeM/LBkxQODCNcjARJ+Rbw1JU1Iw3Jizhe2rb1jkBpVgGEKnzZ2zp69TagxyDU
	XvD/Hzxt+G9zGcEyAe3TzPF4HiDs95XvPl5BkAZ6PoZn+GDkP0Yk3PqwfzUCfDfvfCXHadNxWdPNF
	o41gNwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw3sN-00EuZe-0V;
	Thu, 26 Oct 2023 17:10:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw3sJ-00EuYu-2J;
	Thu, 26 Oct 2023 17:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E17E0B836CB;
	Thu, 26 Oct 2023 17:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28356C433CD;
	Thu, 26 Oct 2023 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698340225;
	bh=Va1jEBWyzwHMFJmzyliMsvcYTsQhokdCctBTTd7BWks=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PhIcRJkAlRvEUJKrmKS2QMIqgY34kubBOM7CJ2dz9jx7eL/QMCkhRfmsJygzZf/cQ
	 DlrzJl4vB5hk4L6rcHwKbGdUGfx2P9LIIEn7xYjzdaTpX1aZoRRQw3IReF+Duv/Gud
	 lFTgp3N/zdkkA1VTMjkdtkeDcx9Tqr2vDotqSL/pqYAFZDutEnNid/HWFiRCHVSI9q
	 7XWl3TAWHeb78ij9BENyAptFlO3Elvew6KX+mk22drx7L/Wg66PR5MUfmW55RJMQ3M
	 tFuMYbozMKxsHov4K4u2DHDxeiwG+mLafID8JZemuGSS8g6pgy1v6q0IhE5KSgCUXx
	 pWjp0dPIJFVwA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RFT PATCH 00/17] ASoC: fix widget name comparisons (consider
 DAI name prefix)
Message-Id: <169834021871.149939.12687771696008766047.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 18:10:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_101028_058344_9C260998 
X-CRM114-Status: GOOD (  11.66  )
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

On Mon, 23 Oct 2023 11:54:11 +0200, Krzysztof Kozlowski wrote:
> Some codec drivers compare widget names with strcmp, ignoring
> the component name prefix.  If prefix is used, the comparisons start failing.
> 
> Except Qualcomm lpass-rx-macro, none of the patches were tested
> on hardware.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: codecs: 88pm860x: Handle component name prefix
        commit: ccd0c6c7097b52b01a2c5951cfe96714d4421cd2
[02/17] ASoC: codecs: adau1373: Handle component name prefix
        commit: 7a0762587a814387e631c07ae81169a7c646f012
[03/17] ASoC: codecs: adav80x: Handle component name prefix
        commit: ecea1812b911fed5e675b2d37b29ad4265c067ce
[04/17] ASoC: codecs: lpass-rx-macro: Handle component name prefix
        commit: 5efc1c903e2b43a267ad13696698fcc152ed873a
[05/17] ASoC: codecs: max9867: Handle component name prefix
        commit: a1fa72a780f428ddc956cf5ed4b97e2be76ceba3
[06/17] ASoC: codecs: rt5682s: Handle component name prefix
        commit: b2056ce3cf61a39796041dc5c94d7255de7f9f0c
[07/17] ASoC: codecs: rtq9128: Handle component name prefix
        commit: e2d38e1196f61735716f9c2dd89dff32c0655529
[08/17] ASoC: codecs: wcd9335: Handle component name prefix
        commit: 7df1e6a3c608ab0c345b8898f9ee5d5ac19f2eb4
[09/17] ASoC: codecs: wm8962: Handle component name prefix
        commit: e54db8826f48c9ca52f2abd108d6e030ff20cae5
[10/17] ASoC: codecs: wm8994: Handle component name prefix
        commit: e13b63c47578a27dbf8907974f0dcba0bb2efe58
[11/17] ASoC: codecs: wm8995: Handle component name prefix
        commit: 343b62590d5b950c8bf7f78fef7c81103c5f982c
[12/17] ASoC: mediatek: mt8183: Handle component name prefix
        commit: e84c7f5db97474cb4becd863a93d4ea541dc4110
[13/17] ASoC: mediatek: mt8186: Handle component name prefix
        commit: 0fe153a99fcc2edeae4e863b03c5a8f71376629e
[14/17] ASoC: mediatek: mt8188: Handle component name prefix
        commit: d1ecaabe9f1a669354de7420261bd8737da4bf48
[15/17] ASoC: mediatek: mt8192: Handle component name prefix
        commit: 86cfaf99e4d3c7b4707fb8cc9eb06d8db10c1414
[16/17] ASoC: samsung: speyside: Handle component name prefix
        commit: 317dd0dbadd8bd4de2d69fa6a0611456f3e15b1a
[17/17] ASoC: tegra: machine: Handle component name prefix
        commit: f82eb06a40c86c9a82537e956de401d497203d3a

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


