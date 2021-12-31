Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC88C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Dec 2021 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GI7/B2514xte29FH8Qs9omST3BECPGiF5QE3QREgxNI=; b=Wl6JwnIxjOAcKu
	XEGyJ8bC7RzDezhnHryjWJphCE/gKrWl1Gj7WkZVOC8ls31NxOLnTTHGrOr9kF7qZKFcIAUh5gDoB
	qCpcHQwRirjVqN8YxCaIfrsQxWi0jGWi3HXqY2T1f9p4CorEQnUyeoFCELxHTeJv5fF/Jhw6LDof8
	jlN18lriu8dh1A9ofasHlCKwK2aBHNePqtfyDBUxZKO8/MfiooTE7xBHkL2nSSHnPOJu2z0wBxvxw
	64yURZaEtHcFGao/UpArHpDkZa6Fn9Odqq4j7NvW8YOmFJ4FbAIobXAOU+TYPb1O8qhfUDiGXQSez
	2h3Dt0NxLyl2bYJO1odA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3J4p-0069uu-CN; Fri, 31 Dec 2021 14:40:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3J4c-0069nd-2S; Fri, 31 Dec 2021 14:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 277A0B81D85;
 Fri, 31 Dec 2021 14:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8EFC36AF0;
 Fri, 31 Dec 2021 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640961599;
 bh=lAxyCxUkQlETTh2egsQpr5ZWqt6MG6luXxuJleTC4Pk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r/FWhMvqFHATTAndSxG3zmrOdPr6YgnaMsrO/ijlgdOg6yKa/ejJvd9NU4f972sDn
 aWQleQrjD7dcnLtwnF4KQqR1zbhm4+m/rMDjfpBshkMa+wrTdHIziNj6BvkwWpOkjl
 OMs/QAkR0z+mOUsuiiLHZC1w/0lJrw2K8siV7Rdx4vek9JApq74KfVkLjR+zO7xWNQ
 LdgpuzBTqb/EcKVF+Z5zUtXxSjqV/Xbh3lO8zjVwSI8M8vHsJV/IrCISovfnuPdKhk
 89M0a2toxISI5ZH6Atb1GsKpPl+6lkQfORkyADEaF9IOdMC/TP4QBqW0aIU4zNtBWV
 GwkZp8rIlhbvw==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com, tiwai@suse.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20211230084731.31372-1-trevor.wu@mediatek.com>
References: <20211230084731.31372-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: mt8195: repair pcmif BE dai
Message-Id: <164096159738.2355590.6915184863464134873.b4-ty@kernel.org>
Date: Fri, 31 Dec 2021 14:39:57 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_064002_308036_BB18196A 
X-CRM114-Status: GOOD (  14.89  )
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

On Thu, 30 Dec 2021 16:47:29 +0800, Trevor Wu wrote:
> This series of patches repairs some problems for pcmif BE dai.
> The unexpected control flow is corrected, and the missing playback
> support of DPCM is added.
> 
> Patches are based on broonie tree "for-next" branch.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8195: correct pcmif BE dai control flow
>   ASoC: mediatek: mt8195: add playback support to PCM1_BE dai_link
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8195: correct pcmif BE dai control flow
      commit: 2355028c0c54c03afb66c589347f1dc9f6fe2e38
[2/2] ASoC: mediatek: mt8195: add playback support to PCM1_BE dai_link
      commit: db5e1c209b92a67ab7c1d7771a48294c9c093f7c

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
