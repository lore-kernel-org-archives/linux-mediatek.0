Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48F0D17127
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3fO6wHXSaf3pzOursKnErORUmgqxZYnhLXkzeF7OPw=; b=ea/E1X02or8IxKmhJqiL7+pBw1
	uOSt+hDEntzWjYO5OnIU8kT+X12IwxYX//gsLY6IcV191hHF43e9GV/e+sPAMqs01N/X773uAX1/0
	9vRiDBIIaBh6rAAaE1hl23tDFTmdQmUcci8T7l+7qMlBLvlV7rXYW+ZR0f7ljEEGOKrPQixRyzyJa
	NsexYPZ8NQmVW3A6cnCbOIhpVeGXTV+uf9vGYVLbJ8f9EJOMcLgNUxLk+0YGeFwLJpNAg5zHurRDV
	KIQ6XvZBLNNKPWAlTnPBHglG7Z6U7ZhYLzRmBzfJQZYW+59kGBRl55RntCsYsrWl/tH+n73LAnK55
	1niFAXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xZD-00000008MRA-34XK;
	Mon, 21 Oct 2024 18:55:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xXh-00000008MDO-1RKG;
	Mon, 21 Oct 2024 18:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49C28A4257C;
	Mon, 21 Oct 2024 18:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD036C4CEC3;
	Mon, 21 Oct 2024 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729536852;
	bh=OWlqbW+2Dn/AzRWzu0cQ1Bnyezpt2t6ppecw+i011ME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BsVcaczxj2gAoU8O7KbCqkx2gXKsCSXxRi63ZnDlnwNkPTiOt45hy8OgbR+8ZQabl
	 4M/m2Yt/qz4D/jptZciOZy3MzC1e/UJDGyq3k4mTnbZetjJxwiJ3iNtBFkssqDH2fQ
	 bNhkh55hRTjVNFZgRL3Hb7URom8fMh+wFAdkOdom5Szw0hnt4pM/hKssOlxRz/mZID
	 utgayqR3j33DBJG3Mb+4T/ehCMNZGUxU2aZ4z69RpKbsEbJtEfZ/pLk3XAMdzR6/RT
	 ePIXJ/0s9VJ1ABdV9VEKeTdUjkwlh6ZJc9uvemjnx9/G957DoTxzVb/LlXBAoRtHbV
	 QU5Nc/8lm6ihA==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20241021142113.71081-1-brgl@bgdev.pl>
References: <20241021142113.71081-1-brgl@bgdev.pl>
Subject: Re: [PATCH] spi: mtk-snfi: fix kerneldoc for
 mtk_snand_is_page_ops()
Message-Id: <172953684947.122063.5239058776799131206.b4-ty@kernel.org>
Date: Mon, 21 Oct 2024 19:54:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_115413_479992_E8E0B811 
X-CRM114-Status: GOOD (  12.45  )
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

On Mon, 21 Oct 2024 16:21:13 +0200, Bartosz Golaszewski wrote:
> The op argument is missing the colon and is not picked up by the
> kerneldoc generator. Fix it to address the following build warning:
> 
> drivers/spi/spi-mtk-snfi.c:1201: warning: Function parameter or struct member 'op' not described in 'mtk_snand_is_page_ops'
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mtk-snfi: fix kerneldoc for mtk_snand_is_page_ops()
      commit: f2b5b8201b1545ef92e050735e9c768010d497aa

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


