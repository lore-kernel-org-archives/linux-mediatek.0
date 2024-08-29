Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61484C83F0A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPg6C7savy4BxR615E+KnZmJjs0TuQYNi025FhmflTk=; b=LkOqZOUZo8gPuzpWqA6urzTmzk
	w9qw1FQRzYTXhnf1f8mUFiCZvaTO3heUM5R1uzbex0u9JMzNMsEsCFICOfksU3rS/Bx9FZ1o/nq96
	6DvmylAl/NewGTpVk1wHBDJHrZiPAuXFnRrY4tY5qOh4rhlVJEAp3uojcqouFtfSQh0C78LjN2Stv
	duo2dPPC30Q6hbD0DREZWwkpihM2Q0p/21p68n4o4lUkpyr5wIEvc754LJZKCi8e7j9Xs3M+TpRak
	jz7l85BTeBcWsnlTFN1RFxYMK3ZoMXmZy5/xctiqOu3nK7I4P3KKdOgsklwftWRPCtAN+uiqTHH5j
	NlcEuBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjdyF-00000001reZ-3MdO;
	Thu, 29 Aug 2024 12:09:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjdyC-00000001reB-40tW
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Aug 2024 12:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04A8AA41DAC;
	Thu, 29 Aug 2024 12:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA357C4CEC1;
	Thu, 29 Aug 2024 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724933383;
	bh=KgMvNg9vlrPlxz4c1NDG/hOTZD1lYa/I+MSvbr8Ecyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JWMFSx4IDvgUncCaUB0GiDrKqA+pDhQd8T6uKPpnmuEmfBAb6uxdtxrrzxk550CWM
	 FpNolle7pSas6JKoeXJpaklPQxnfwu8LFBNg0x/kKRAyEdyUbnv9TITxjj4ku0r/kc
	 MKLbKEa97IZG5YxzbAi/tqrIRTnvROfT5FmCleYI+QxFvcwJS5sQQrMeXpTCHwSOkx
	 c9foLEHOHWN7AVoNjayjI6zYnPx9Spt2l+GPc3hoAR53TrP9hjaypP4661GytO38Gd
	 d/vyNuNAaiE53LO1f4NrIOxmHpJDbVcKalvBwpI4OoZxJs4h+9XAAiico70fBC7SIt
	 jyvjixqwqGosA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, angelogioacchino.delregno@collabora.com, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com, 
 linux-mediatek@lists.infradead.org, yangxiaohua@everest-semi.com, 
 zhuning@everest-semi.com
In-Reply-To: <20240816114921.48913-1-zhangyi@everest-semi.com>
References: <20240816114921.48913-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Modify key
Message-Id: <172493338155.25837.14171784732486140029.b4-ty@kernel.org>
Date: Thu, 29 Aug 2024 13:09:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_050945_093555_962F4F9D 
X-CRM114-Status: GOOD (  10.11  )
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

On Fri, 16 Aug 2024 19:49:21 +0800, Zhang Yi wrote:
> In order to get the correct keys when using the ES8326.We will associate
> SND_JACK_BTN_1 to KEY_VOLUMEUP and SND_JACK_BTN_2 to KEY_VOLUMEDOWN
> when the ES8326 flag is recognized.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: Modify key
      commit: 5325b96769a5b282e330023e1d0881018e89e266

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


