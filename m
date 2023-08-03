Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E763EC001DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 16:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTkqFR6q726nRHd5A7Fd2fcxQ/BUl+q5XHs1dnDMVXc=; b=20LdsBPG58mMZ/Pf7c44L44vfI
	0mCkv4/iGiN8Zh1h73kg3D9zSiJ2awgaDfSnX+cBN8WtOpuc2I43cEK++kwpDMre8xmA6F+5tUF1W
	/M13+005QoVp8U+ltrrrV8RRQFVR8DwkGiKgPkR+RSKcKJOh+eEwdRY1AfuL7hOkyfPJ6V5b2Z3Uo
	KcMDZ4s056gIdhJSNrvUbHVNN66Gf+87jLy528zgHly+1WOWFwnv/ZHLQrph3Yn9GJAgt56Nt6t88
	oqApYDxMdQVfjph88cvEoECy5Vi+1CINy9GcsvJD+5ZB+vFVLoNqpTQ1WuFpKUe6ZrwT3Y5gdg4pH
	Ez532Y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRar4-00AHTJ-1W;
	Thu, 03 Aug 2023 16:07:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRar0-00AHQG-0U;
	Thu, 03 Aug 2023 16:07:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CCE861DF3;
	Thu,  3 Aug 2023 16:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD9DC433C9;
	Thu,  3 Aug 2023 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691078820;
	bh=WFkWYTKMLYwXJPpiFwn6+nzj0asvIDnafBfv+uPqLzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TbvhIzx8+/0bmePAnHF0GvFZvkFX+FRP23Raa41AAn/yCkE4TKXLDO6eH/276hAw4
	 q78+4Ed3RMhrsQnhqKYfKWlB6Kv3hzw5zl3VjZecchWrcdz23VSvV+VA+5WiLaY4iE
	 6YquXb7FRZMrg6r6uFVu52EanFnWxlFp1QUM97P1s6dSs4DDs+MGbDm+hbX7Va1wLo
	 IvSdDMVY27kkfqkUstUeyIFYHzRJJj/olO3VbbueAtgCp1IXIOSkKy9y4q/ayzLyix
	 9ndgi6B3ryHAopGe3aiBuJXS0ydfgjBxkJ/Vu3bkcs6nmb/iRyHZ62Wz9a4+xkNUol
	 Rz2sbDgka5+xg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <20230803083908.9DxbPvOK@linutronix.de>
References: <20230803083908.9DxbPvOK@linutronix.de>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove unused mutex.
Message-Id: <169107881835.86804.11585848310133291937.b4-ty@kernel.org>
Date: Thu, 03 Aug 2023 17:06:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_090710_249541_8881BAFE 
X-CRM114-Status: GOOD (  11.84  )
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

On Thu, 03 Aug 2023 10:39:08 +0200, Sebastian Andrzej Siewior wrote:
> The mutex mutex_request_dram has no user.
> 
> Remove mutex_request_dram.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Remove unused mutex.
      commit: 248c74bf42c16262f95f26523683334686a26263

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


