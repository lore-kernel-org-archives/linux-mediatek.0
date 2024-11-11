Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7334BD3ABCE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07dXqy3HjEindHKJ/nOKnTwPnj9qDW6kZt/Uk5z88bs=; b=1iCS+qlBwfOrZ+DwdgPHg9lw0u
	ymJfhQaknFtoU/MR4ur2kYfHvgPfPJrj04bkbyS57fw7hxoXi6ezIbKOnDbpmwQjfFVnnUmwmfr77
	5swTlmTfmkysJ7SMSTSiuKtzvEqQN2z7Q6H4hM8SkgoITm8TSB329FrcCK8a8KmhqeH8flW6hzQQ5
	rjg94pUzHL6P4tp774a602LD4DywEPXpowUErjNDCmn1xveFKMwU6uKD+8ahLR1LsNn+eCZDRF+A+
	ZULdbzatqzRBtUxGJaLzR+ve2Nf7aiBGTayBOe48qokAakmFENdvACXcdSP4bUPQG12jullG+qMvy
	vGBjZ+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXW4-00000000cTr-0k74;
	Mon, 11 Nov 2024 16:43:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXW1-00000000cSs-3JXV
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Nov 2024 16:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1F81A40242;
	Mon, 11 Nov 2024 16:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EB7C4CECF;
	Mon, 11 Nov 2024 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731343428;
	bh=aGwfk83gwUEPk4v8XnSoB0A/kyurmmGDOEwNg5Xdigk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SNpHJGSRBbSbklMqG7wwbDDl25NjY7UkrTofRiCUZpF5G4zKnzTvZi9GeBZ+2/cPY
	 ZGuHgt4q2lPMUYojh3rmwTB6BcQdyI3KR0Vu7wrZG564DU1wNCg/0KOHXP/y6d5sfU
	 IcFPAZYtIbgiW9cKr4DUKXMChtiiBILRQsvBW2V1kRQFaa1+lzyUxBzAIock6IFKsh
	 8mBzQ0nj2P6t71dfb0UlywPQn2ePKY5M5HdhP1xJRwq5LTIwVJ2x5bqz+fR2J+L97R
	 c4r9xIuTeXrz+RJsTqfjY22mOFWLOdouiJzQFn6K5STbIpr2qLIlE479IaFxgoWXi7
	 A+8WP+Tk2Q9iw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <87zfmd8bnf.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfmd8bnf.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: add symmetric_ prefix for
 dai->rate/channels/sample_bits
Message-Id: <173134342735.341130.7543402410748480816.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 16:43:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_084349_928308_1BEBEA7B 
X-CRM114-Status: GOOD (  13.01  )
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

On Wed, 06 Nov 2024 00:10:44 +0000, Kuninori Morimoto wrote:
> snd_soc_dai has rate/channels/sample_bits parameter, but it is only valid
> if symmetry is being enforced by symmetric_xxx flag on driver.
> 
> It is very difficult to know about it from current naming, and easy to
> misunderstand it. add symmetric_ prefix for it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: add symmetric_ prefix for dai->rate/channels/sample_bits
      commit: 1bd775da9ba919b87b2313a78d5957afc1a62dde

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


