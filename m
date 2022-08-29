Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4322AECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 20:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbMmcxxI8KjTNHyeLHkB41UPmND5d8mLKcCEsnvdDCU=; b=PyyVyKy4tiFb0pY3hbfBb56EqB
	5qY8WxcwRY5yt/X29FaQWCWHHzIKODbOdmRqTCmS0X82twmH9oVDyfmRiPKaljh9K/lXDg1wA0jcW
	Pp22EHs/GYhZN+S7LYqEQLbNxZGpTvDrAcLBr3zWtMdj+Gxw79IKKoVI9yHbWv+4C9gJ3TJSETa13
	iaH2oNGzPyyITH+BQ9jfLTttOlatD9gZuYsTkK62UT1c51FtUvl7W0xDjrsb+zWLCQf8LbMFevBFj
	1j27EJ1tVAzviMZ/SKM8txSrWvdzaIj/cIgp2h0IdeIS4smHn3wVROCtM8tTrKzfhTYRc9HolAZZX
	djeujmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSlmJ-00Cgpp-12; Mon, 29 Aug 2022 20:54:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSlm7-00Cgmr-6d; Mon, 29 Aug 2022 20:54:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 488A2611D3;
	Mon, 29 Aug 2022 20:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170FAC433D6;
	Mon, 29 Aug 2022 20:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661806463;
	bh=kQN0K1JdQf+wETbVKAjAg7qcB5LeYW6ExuLEV5ZgUug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mLeNaRBVUBII8aBY8A2zCbDN/yXsfnpQolkq1xfmEPimrFjXrjbTbZ8Dr9J8lGdq2
	 ACREAuOoMj0wQyXSELbvaDCgN8WoFEji16ma9bJBWTqTVmkBbXkZgWNBLIsxsclSgm
	 9GPrlwhngaM9vBSZub395LOeJ5Jyfh67awglIyaAWbT8HseyO1AhzIbBWokfGXm8TL
	 gYQO2LheCAApV91RxXY2jpPNsYkGZF1yYzeh+4OpNLv7DMgIBVEJ25dcOzSo5X4vr0
	 u1Mi2dGgCjAGAtghvA0AuBX3+W/EpHx9OKtwzJb1fIeVvwCw4UsgR8WC3aXviHthoC
	 82yzwtgD9pBcQ==
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, neil@brown.name, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, blogic@openwrt.org
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 0/4] spi: mt7621: Fix an erroneous message + clean-ups
Message-Id: <166180645965.972874.4626638273769561589.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 21:54:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_135427_299599_709CF445 
X-CRM114-Status: GOOD (  14.20  )
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

On Sat, 27 Aug 2022 13:41:39 +0200, Christophe JAILLET wrote:
> Patch 1 fixes an issue about an error code that is erroneously logged.
> 
> Patch 2-4 are just clean-ups spotted while fixing it.
> 
> Additional comments are added below --- in patches 2 and 3.
> 
> Christophe JAILLET (4):
>   spi: mt7621: Fix an error message in mt7621_spi_probe()
>   spi: mt7621: Use the devm_clk_get_enabled() helper to simplify error
>     handling
>   spi: mt7621: Use devm_spi_register_controller()
>   spi: mt7621: Remove 'clk' from 'struct mt7621_spi'
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/4] spi: mt7621: Fix an error message in mt7621_spi_probe()
      commit: 2b2bf6b7faa9010fae10dc7de76627a3fdb525b3
[2/4] spi: mt7621: Use the devm_clk_get_enabled() helper to simplify error handling
      commit: 3d6af96814d753f34cf897466e7ddf041d0cdf3b
[3/4] spi: mt7621: Use devm_spi_register_controller()
      commit: 30b31b29a866d32fc381b406d4c4f5db2636e5ec
[4/4] spi: mt7621: Remove 'clk' from 'struct mt7621_spi'
      commit: 4a5cc683543f5f6ed586944095c65cb4da4b9273

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

