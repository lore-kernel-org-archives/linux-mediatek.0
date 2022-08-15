Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9EAC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlyDAFbyCoy+MXEHKuA7vDkqz9kvmuJ6xma2BiX31vM=; b=eaEsapDPHKAtZvuaNiqQBxpzL4
	UivSQWMF4LKmB16AhtEg2oo4/yDoyK05LiTs+fZIllxSUbxyAzXjlaNtkDj6CTF/7/31wTOOKTANF
	A63RwTVn1NWvi/myqABBwfOhzvM1dc5639KbcBERkKU2fxmgXUXgPNZXsgDecV9nP+Ck2khFy5q3w
	DuQPiNuEsrMKbcQklZDz/xYVEu+DHIK8zfq60eYX12+kO7Q2GV8snMnF3lIo9sI6wk8hHGw9nkupE
	xTWtLRcJboX4K7iC0yMlve9VGxiOS9B/G4SDQpURuQUEKmmpNALoMJtyYd26STKdDTVBzChob4Dcg
	9OSTtstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNd0v-001gG0-DC; Mon, 15 Aug 2022 16:32:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcrp-001YaE-AA
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 16:23:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83067611B1;
	Mon, 15 Aug 2022 16:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB92EC433C1;
	Mon, 15 Aug 2022 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660580581;
	bh=e7z1wZFXKyKTx+/Gp205MIBB5Y2JE/nLNvE5mKdLmXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=swWLDFdwixRMFnyIcl35ZTLWeedljORzZDGDlFZh3QvDRfNe6/gmdy6t5vNSOUCMs
	 cFISGVQPxpedO9pFaxqUTBkVeCBDd9eaI83aFsIZwpehtBo00koo7k2f12NZUZPKvy
	 SmcfpEZvylc2uRegQo9l3/Wl6HwIx06MRNmBLp5zar4H1r/mPBQANOCllbgF0Fcjg4
	 rT0d8M16VP0HWqCwV24Mced9oCvNfoPV2ciZw7xFBXfBlUr2gZ6FWsB4+60TPboZsH
	 wz1ffFFcu69E/UwtwCCJugZM5Nlmb6Q26yx6CJ+t6gFvWkANg89rGPfSdwd30gSBEv
	 STpwYIxwladCw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org
In-Reply-To: <Yuo7LGPk8KnBW6ac@kili>
References: <Yuo7LGPk8KnBW6ac@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: remove unnecessary NULL check
Message-Id: <166058057968.769843.14245211698253942822.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:22:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_092305_450659_9FF1C382 
X-CRM114-Status: GOOD (  11.47  )
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

On Wed, 3 Aug 2022 12:09:00 +0300, Dan Carpenter wrote:
> The "i2s_priv" pointer cannot be NULL.  Some NULL checks were deleted
> in commit d7bffbe9cbd3 ("ASoC: mediatek: mt8186: remove unnecessary
> judgments") but this one was accidentally left behind.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: remove unnecessary NULL check
      commit: b9f0a8ffd6265e7d8c7464a7990330da85ee07ef

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

