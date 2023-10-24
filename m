Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E21BC00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzohQsev/vBngZfZZmdTac8/On7np9NwAKFAiiKaXqc=; b=fxAf9n/YCTl8OWeAL/UWeb3WT3
	dXq5RXtTn7bH2YjiZBSWUe5AU+x5KrPWuJhXKAr7mK5/H0VPlQG4EOIsVVni/lVcJoW1FmKRYZRur
	coU2c+syQxpLKWoQVGyZP6HFuEW5Qr8Dp2TqOPOvp1a1+PqYkGW9nSxMdBRR3X3AF+zY5y6VGthdC
	k6czp7Kx50W105zWWRAqPXdVWtR/o4naanq6hrmYuERkIoI7HBu791q8KJT6dEqAeE7I0E4cyF+5s
	cWDHcjPThCe5Xciwu4dt93WmD0Rz81j+qX6SH+9nC+kPI7SAL1a00szdJ03oO1wQVz21K+SkussDk
	bvMxvZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMXE-00Ahay-0M;
	Tue, 24 Oct 2023 18:53:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMX6-00AhYj-0F;
	Tue, 24 Oct 2023 18:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E27CF61470;
	Tue, 24 Oct 2023 18:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945ECC433C8;
	Tue, 24 Oct 2023 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698173617;
	bh=Q7AQ8oRrcdeG+H+90jdi3d1PI7uSdUbtZvihZFgYw2Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DhD9CmR9cubugRb44Rs4NUYR5/idllTmfjVSEheguSSbt/3VVJYgdZtKzONNdhwTM
	 qC5+d29qkLvZm79zotQxiYd+JOMeiDwHmbtEqAr6UphPOUS3bxsPdKv6RENTs7V+17
	 2Nivw8KuvYtYO4M9r2kJsrqoo7kZsft/TuXEYMKf5Cr+FJqeAXml2wjHgJP/LjxDwn
	 2TpTfAnWlmYMbS/SQyy4zxSZle5auGVN4/Av73i4XAk3NhU1FSZEYVqit1Lt3DbkQ4
	 erLNTMcUa1MV4tMt4SggyUqcQjbyphc6ELGXOzUOAZOjIpNRE62t0f6J5annN9NoDK
	 SbbKfl9H6qtvw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Maso Huang <maso.huang@mediatek.com>
In-Reply-To: <20231024035019.11732-1-maso.huang@mediatek.com>
References: <20231024035019.11732-1-maso.huang@mediatek.com>
Subject: Re: [PATCH v2 0/3] ASoC: mediatek: Remove redundant code and add
 sample rate checker of MT7986 SoC
Message-Id: <169817361532.82257.15939611846447961034.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 19:53:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_115340_156408_C681CB1A 
X-CRM114-Status: GOOD (  12.25  )
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

On Tue, 24 Oct 2023 11:50:16 +0800, Maso Huang wrote:
> Changes in v2:
>  - devide v1 patch [1/2] into v2 [1/3] [2/3] with appropriate title and description
>  - refine error log based on reviewer's suggestions [3/3]
> 
> 1. Drop the remove callback of mt7986_wm8960.
> 2. Remove the mt7986_wm8960_priv structure
> 3. Add sample rate checker.
> Patches are based on broonie tree "for-next" branch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt7986: drop the remove callback of mt7986_wm8960
      commit: 3e92ea2a460bc410789b24f328de9985ddc3eea6
[2/3] ASoC: mediatek: mt7986: remove the mt7986_wm8960_priv structure
      commit: 0f10adb0ed0c0d74f8bc5facf2c70bc515210295
[3/3] ASoC: mediatek: mt7986: add sample rate checker
      commit: 0e20929434080aa87614fa0135c97bb9337ece27

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


