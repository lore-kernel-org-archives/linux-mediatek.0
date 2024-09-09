Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D493DECE589
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCmRqOe+HDO81bSmE8MN6bptIZEYPzdRKR04N6fAtEI=; b=0sIeRh5em6KkfzHbXEq3IhqI+h
	itax4yO7zwgnkonUU8wV0SuuehhdFZjU44H2Aak++gp8TFl8Bbby8C/rw4ubRNSZc68y0i0xwVhRP
	Y41jX60N/GlyWxFXaNqIgPUwNH96dXRBqNlrZG2YCDPOD4Fqoi2mcJQH8FOXsScSG2Z4H7O8TldxF
	0TuPm+OkLeLgC81I6LPy+cWGCw1BcaL5lyfiacp5q8imKjXoQs/0fnGTj1K5rnn/sLbJ5BwbUls38
	YRrfNWG6n3YgKuPYweIbK+BdHgohAZPGbmQ7yJJq+fNDFQoI00BWr+dJPPAgKuv0aCS3LLtr+dpyZ
	yV5fZcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlX8-00000003JDI-1PvH;
	Mon, 09 Sep 2024 21:02:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlW6-00000003J2G-0BUx;
	Mon, 09 Sep 2024 21:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A668D5C03F3;
	Mon,  9 Sep 2024 21:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7C7C4CEC5;
	Mon,  9 Sep 2024 21:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915704;
	bh=jxL+ub2/BNNjbnn0ZgajuJ4HTjl9JV3DFe99yHB85Js=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fFbnoERZ/JUbYGmIOJA65uYscqWs9uIsxE2v5WECHkkG/mReJe7MobdUcT2HoAu1d
	 baMdiRag0IGtw1vxr9XV4i1nQ7prQaoT8c/7FvISDOuqD6o0xvD76DhntReF7FQCfK
	 IF+orY7NOUOxq2yCxz5cxvuFbDdze2+hyXWf3/lgRYU8hQx8d1XjFBOLSFrGXFrbmn
	 XR6hCrsemJoefAdrzwUOpwinYSXrc1Nz/hwGGoUtv7J+hfek35BGcKq30GYov354Qo
	 jdTVgLYYpNxI9DTGDm1yIQwh6yEwOKPWIo1Nig1O/cesoWb1Z4fZahvKH8x3ZbEQZI
	 6GP21X28pplrA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240908134604.3652-1-tangbin@cmss.chinamobile.com>
References: <20240908134604.3652-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: codecs: fix the right check and simplify code
Message-Id: <172591570270.136248.14851761791754524473.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:01:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_140146_183260_5B1372C3 
X-CRM114-Status: GOOD (  12.34  )
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

On Sun, 08 Sep 2024 21:46:04 +0800, Tang Bin wrote:
> In the file drivers/base/platform.c, the return description of
> platform_get_irq is 'non-zero IRQ number on success, negative
> error number on failure.', so the check is wrong, fix it. And
> when get irq failed, the function platform_get_irq logs an error
> message.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: fix the right check and simplify code
      commit: 130eb72d3cb38a629205a2a192800b4b1b9bc5c9

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


