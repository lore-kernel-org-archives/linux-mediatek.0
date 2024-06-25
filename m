Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17733C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2VtGJ+3Jg0aXeWx8u4/3zC3zTZMRl9bZxgbFJl+qrI=; b=47FIDYINkmxhAYp32Do25ILk6V
	a4+8INz7VFDEzBlpIodKuG4EF+aX2pGRICcv2ICAWnhIVyIWT+uUH3FmSSgpD3Jo/oa/sZX5vno3A
	W3apTu7Duhw2kPmd/f89aDYIsDSGvnJ3aK1qXwsy4m5Ay2zt5w0NiIW+HX7nd0ynv9Dm/DDF8WwLA
	KGvX9l1FZU9FkG6oQl+wD8UhhJuSYcGoUFyajxQfuXbxKdwXqqGXb6QXLw9I6fJYGiJ5/X1ykKFhh
	rwunyrhvCE/I9TU/oiUt6M5IWBtx+wa++nNVcz063d9r81mqplNpDkZAt6ExPEcSND6jyilWTGkW7
	Ys7/UWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4Qx-00000002Ydn-3avj;
	Tue, 25 Jun 2024 11:33:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4Qq-00000002YaW-4BJN;
	Tue, 25 Jun 2024 11:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E33EE612D7;
	Tue, 25 Jun 2024 11:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E1AC32781;
	Tue, 25 Jun 2024 11:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719315231;
	bh=NqJdMjPT9r805HO+jweg1g1ihBCkWTI4j4kjDfQkDEs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k7LB9nl9SPm9p8yq0UhgCUR7+bcQ2vC25wnADZiANHdw/FVB5qEUdBC8IbJbQCOT1
	 BLEEZKSC49WA0vTxYItoAqXfj2sqUj8nNQS4Boy4O2+gTssCZs5zttp/JKX0E/m1Qf
	 Vhxh5oOW9C36dE3IXhfV/XxJoiYN2b7ssTX7cJUmQJV64C56HXcGXIEkhhBhpKFaka
	 8kun7jFHzecU7wm6KpbiXDIIQ3GKEqdzIHqFg1iejFNdYe13loKLOfqac1dyiOFvs6
	 fo3ZvMXOvaiC/6UhhfYyPrmWMAfrDuPMbcJ0o0SnzfDvBo//IccR6rR5fC0pt+U8/7
	 NHtse6bPnwYuw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 angelogioacchino.delregno@collabora.com
In-Reply-To: <20240613020725.27874-1-jiaxin.yu@mediatek.com>
References: <20240613020725.27874-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt6358: Add "Dmic Mode Switch"
 kcontrol for switch DMIC mode.
Message-Id: <171931523011.64144.683590179914133512.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 12:33:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_043353_148110_EEB4F624 
X-CRM114-Status: GOOD (  12.01  )
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

On Thu, 13 Jun 2024 10:07:25 +0800, Jiaxin Yu wrote:
> There are two hardware connection methods for DMICs on the MT6358. In cases
> where more than two DMICs are used, we need to time-multiplex these DMICs.
> Therefore, we need to dynamically switch the modes of these DMICs based on
> the actual usage scenarios.
> 
>             ---- DMIC1
> AU_VIN0 ---
>             ---- DMIC2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6358: Add "Dmic Mode Switch" kcontrol for switch DMIC mode.
      commit: 4ae814dabcdae3e434820c64396e15ccb33cc0ce

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


