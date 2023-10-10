Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8DBCD98C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 21:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UOuzOZ1VzEieCnVEmeQEyb99FHWwHz9LzbqORqpg6w=; b=rNiuFrEMlsLbAyfZhagj/+rDFi
	EVUau+SOD73ULitAQGm/ZE47nFBS1reRVY5Qn/5VW561hNRmu78zZBznnyDpUsPn0ryJ/VVwsNLQG
	5GEfeIEa6asXPRhJqabWc6lpE4UtkoEtMsi0oYace2uauYxJvqrdcwpLMpcDg8muPm4m1Q89E6SLk
	5Ip4P0jyislt3CUnaqCxZfOMbWYoiyd2RqPEcw0d+xeols8L3YGIm4NC2fZIkcrH9OfdBzjfhlWPU
	1Ch5uvdsvUzQ7UTQz/06D1SAM7Rqun6v7+StAnGjJy05AxDCfVok82czeB9eVN+Fh5kFnKEaA0pZV
	iVbix1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqJua-00EAD8-1a;
	Tue, 10 Oct 2023 21:05:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqJuW-00EAC4-36;
	Tue, 10 Oct 2023 21:05:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F030B6187A;
	Tue, 10 Oct 2023 21:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE473C433C7;
	Tue, 10 Oct 2023 21:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696971899;
	bh=yvPMXP2l4TfL9XGBebXnmFKqikjauh9MRR4XumXFlTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nQ+3EkzOMqum9iILMoJWwVqSEg4JHyrW5nbtYIhCBruFlKDx0CxnviKGEixaVdHvj
	 +710FuLg+zgREUHUBk1aafDFz9fCh1iG86SLNYd/AF572bbh3VoM+9BwpQA+HIk9g5
	 brrXfiilEFwbUEeznBv8H/kWK/L62RORmOARQW7eDzWxV+MC2kSx8IJ3nuOChtF4H5
	 a4n2HQ5ommNXa9kUObzX7UhnVnYpvlSY21QvKd+emid4Ztu3LGJ9jcXmTlc29uZjrY
	 hhJsk25hSU3amgIXvqyq/fu2eM4lsNGqE0e/VtNQnF/eB2+Qe3zxyJeG3ixq5VcmDp
	 ytZwDpnwG/DQQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback
 returning void
Message-Id: <169697189438.374969.14160714279506826790.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 22:04:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_140501_046517_F054A3D5 
X-CRM114-Status: GOOD (  15.19  )
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

On Mon, 09 Oct 2023 17:59:45 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Convert to platform remove callback returning void
      commit: 52fee5c9158000db607d734383fd862969782de5

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


