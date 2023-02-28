Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189B9C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+iE5ezTWChahLOSne2jUH43Z4U6NQQK1WEtSKgh4gY=; b=zL25loS8LAztEHPEgzN8iMCN5g
	/Rsff9sauOBpDJ3ODBabk0e7b7+OtmkoFih581WmGXPOuiCfyWYZmYc09nPefvlS6ahnSvFk7mz2I
	692F66DasOJ2qsQVNUfxCmrUZimMlFZtAfcRkO0PMTndxzEl+eu13S6FJKiCk64HjQ3HrceVxsqsf
	x8mryrlT07HnJ7UJBto5kR7ToRam6P2fK6uUhFTouHc1EfWyN6Kfh+sZjFx2zbHyx0D0hdXfaV11h
	IniSHd9RJVJyKL8zwfyOfwlxUPKanqQjXc9SPGEgt842GK22N5HxNpVYwm+3tkHX5CWxYrFWSC01x
	UjmNeIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4HP-00Dvb3-1P; Tue, 28 Feb 2023 18:00:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4HD-00DvXr-TG; Tue, 28 Feb 2023 18:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A8C261179;
	Tue, 28 Feb 2023 18:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BD8C433D2;
	Tue, 28 Feb 2023 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607230;
	bh=g/zRMqEHWvrUdMovSA/zwPxEgtx1YbVsjFwL8peZugg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HZobxikkQG2ou9HWf9cwO80G/+gCBkcX18aLab76EEwpTtYw+lxF8IHqxBAC6+GXJ
	 BlkOzb9P9w01cIPARw6UG+mydWBCXarm5pTkQ/RmNVbBI10GrzvoGeExZLBRKCSgeF
	 I8s7vbJ7tshwQ8R5n9o9pz/Dbtic7IqxKrxQB+tV7jjiB4Idr3n6T8fDtTwoueM4Jj
	 lM9v8Ed7TbLgf5FNexWIfvjADWwcPYMGqwCU4vpk7fc5QyS+VP2xqGw6Gy7od/kMY/
	 Klpv/cAv4vLHt+IuQnw04T/aUYaxaMCCeIxFV4sFZvVOsWNjst+9TL9BqyEQMVNs7K
	 TK4UF3I2GouTA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: mt8192: Fixes from initial glance at
 kselftest run
Message-Id: <167760722797.68866.15387830398391668204.b4-ty@kernel.org>
Date: Tue, 28 Feb 2023 18:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_100036_033876_8A5AB232 
X-CRM114-Status: GOOD (  16.68  )
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

On Fri, 24 Feb 2023 14:03:54 +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the Spherion Chromebook on KernelCI.  There are
> more issues flagged, this is just what I fixed thus far - the volume
> controls on the MT6359 have issues for example, and a lot of controls
> aren't marked as Switches like they should be.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mt8192: Remove spammy log messages
      commit: 5df1a5d28449f2b98ff84f69dea74b06f9b8e362
[2/4] ASoC: mt8192: Fix event generation for controls
      commit: b373076f609993d333dbbc3283b65320c7a41834
[3/4] ASoC: mt8192: Report an error if when an invalid sidetone gain is written
      commit: 05437a91173b8780692ac35313f98cac68be7c42
[4/4] ASoC: mt8192: Fix range for sidetone positive gain
      commit: ce40d93b062c0bdcd29218c12ab1dba544382dd8

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


