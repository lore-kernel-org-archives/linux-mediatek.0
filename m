Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA672C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWxKOyPPYocgLEKPuplwmiVRM4Ywkhf0ny7/fUl6GkQ=; b=Fs6Yr51E8Bfvg6
	iWNS7kKOo3Mm/FllG6LFBrFZXqw4is/4v4ugxDpH/oUhjeK77wFKat3Lk3uV2hsDvCt1ihkiA5AlE
	IRAhqhklURGSzmDQCoAyASiLaw384TzMdYWcK0GGsAZyQ0IPOTDHH35jo//QNly1OIxIQ7dk8HFcw
	L7jyn3dedxpHEQIijrZV0KPAh++8Nb0eORtjjI9Lim0u080nH/iJmYTTW1oR+2SQQPgzsOmGxmAtq
	wmML7tX5NdFkEH8ArTJy8iRRZSSpJlbuAwqIlKJRhXEyWKplpJK7NDZXHmcigfKRpS7wJms+Z2/FL
	5ilTUc9vrQhUxueLKsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGj1-007Yrs-Sq; Mon, 21 Mar 2022 12:01:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGiH-007YcV-RZ; Mon, 21 Mar 2022 12:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EA44FCE1762;
 Mon, 21 Mar 2022 12:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E71C340E8;
 Mon, 21 Mar 2022 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647864037;
 bh=x7RIt4mLNf8mNberwc71l5fBa0XC8ugDp4MrJBP6Nek=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Xa6xRMwoEmgjWxCWOEJdmmp7L8ZGpxrrK/IlLjLMCpZPbOecdMtKsY4ttW5bkyiQn
 RQdQv+QdS/hH+Aa4AWx213Q864twi8Ro6gvE6BX1ttwwdPhY3CO+n685a17NeHdXJb
 r4n7YMUlYiqSq4O6IGLvRKMpHHAgTmgI5N4PzK+fNfeh4BtsVZWG+/n9ODaVQ5RkdU
 ftCJHj+SPsQQWa/J28XMkReAUUpgUaXPsRdx74w0qkQSPZTcOO7SicAeBXGbGliEZj
 A1elc8hIO0p5rT5DdSpiLF6IBT+FCWBMHYDjMzNVotBhhHO7pcD2qt3VnOEYimFV/p
 DKAYtWS5X3zPw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 trevor.wu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, angelogioacchino.delregno@collabora.com,
 tzungbi@google.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220319120325.11882-1-jiaxin.yu@mediatek.com>
References: <20220319120325.11882-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
Message-Id: <164786403520.879132.12234155577870165792.b4-ty@kernel.org>
Date: Mon, 21 Mar 2022 12:00:35 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050042_150725_DC43B6CB 
X-CRM114-Status: GOOD (  12.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 19 Mar 2022 20:03:25 +0800, Jiaxin Yu wrote:
> Fixes the following build errors when mt6358 is configured as module:
> 
> >> ERROR: modpost: "mt6358_set_mtkaif_protocol"
> >> [sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.ko] undefined!
> >> ERROR: modpost: "mt6358_set_mtkaif_protocol"
> >> [sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.ko] undefined!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
      commit: a7663c89f4193dbf717572e46e5a3251940dbdc8

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
