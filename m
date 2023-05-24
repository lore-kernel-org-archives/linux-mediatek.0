Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B560C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/don9PJmsQn75n1zk58+oklOtK4vxhFmo5vJHcbmOT0=; b=fLOuWqknjTXW14UL96NVRUh4jz
	RLx8XPSPlAeUragxDvSbRWkHOFtOA1kysw7Xmo1HZ6Hnf/LaKgEOqf/wQLRz+dic2KYXd4sCHorcg
	difqU5tSENQIyaZ9wGKszS8dW3xviV0cUmboMva7XGp/mYOlpTZY+iCNFf802LyiqZIkhssXPTAE2
	I+9SN6ABvLztMbk46+46nMYINFLiWy2zcNdESRRANZXSlDwRbPm0pGcE3j9GRJQjUDq1eApa5gX42
	RFjnqyGvIxNYZQHEtGpGzz3xRz6BC9jqMm/yTc1di8rFTLo80wJZHkH8IkFC3O7ZEOI/vn0eJ+hc9
	Dk2wWEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mIQ-00DGqx-1i;
	Wed, 24 May 2023 11:04:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1mIN-00DGpE-1A;
	Wed, 24 May 2023 11:04:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD4C363510;
	Wed, 24 May 2023 11:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8685CC4331D;
	Wed, 24 May 2023 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684926282;
	bh=gSfPnPjxQ+g5yc36jkezG18RMtNAGuoMZoOVm/qXtTk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=hJXyXP5mJz8gnTLp5D5Ov89xtBbXvOV38zbwsu3TQLvFbwHzZVTdHm7/WhqYKnr2C
	 5//c4/C/ZcPI4HyNLZC3afU4VDVwsB8q31BfWCv3h6ELyZpX/8h/FTZNhfzZLaqrua
	 PGh5fei8RPfjdCAeUO1m4gzdZ60mbJ4Qu3YD3JTthQBQ/TAvw9dihxG5ItWjajLD08
	 Ckqheu+mhzZMQs7NZi6TA1yZO4iOqVC9MCOojHKZlXwjPaA90DJKo+9XLPstDHDlNh
	 Jp5JSWdQ1d9iTJPJsJthVicAvEqNiruU6LaGI9shj4H0RVh6q6TZFmtItwrZ2Z/RAD
	 V/QGnLfyU0pJg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Leilk Liu <leilk.liu@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <ZFAF6pJxMu1z6k4w@makrotopia.org>
References: <ZFAF6pJxMu1z6k4w@makrotopia.org>
Subject: Re: [PATCH] spi: mt65xx: make sure operations completed before
 unloading
Message-Id: <168492628027.37394.11329859234589803044.b4-ty@kernel.org>
Date: Wed, 24 May 2023 12:04:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_040443_480964_4889BCAE 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, 01 May 2023 19:33:14 +0100, Daniel Golle wrote:
> When unloading the spi-mt65xx kernel module during an ongoing spi-mem
> operation the kernel will Oops shortly after unloading the module.
> This is because wait_for_completion_timeout was still running and
> returning into the no longer loaded module:
> 
> Internal error: Oops: 0000000096000005 [#1] SMP
> Modules linked in: [many, but spi-mt65xx is no longer there]
> CPU: 0 PID: 2578 Comm: block Tainted: G        W  O       6.3.0-next-20230428+ #0
> Hardware name: Bananapi BPI-R3 (DT)
> pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __lock_acquire+0x18c/0x20e8
> lr : __lock_acquire+0x9b8/0x20e8
> sp : ffffffc009ec3400
> x29: ffffffc009ec3400 x28: 0000000000000001 x27: 0000000000000004
> x26: ffffff80082888c8 x25: 0000000000000000 x24: 0000000000000000
> x23: ffffffc009609da8 x22: ffffff8008288000 x21: ffffff8008288968
> x20: 00000000000003c2 x19: ffffff8008be7990 x18: 00000000000002af
> x17: 0000000000000000 x16: 0000000000000000 x15: ffffffc008d78970
> x14: 000000000000080d x13: 00000000000002af x12: 00000000ffffffea
> x11: 00000000ffffefff x10: ffffffc008dd0970 x9 : ffffffc008d78918
> x8 : 0000000000017fe8 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : ffffff807fb53910 x4 : 0000000000000000 x3 : 0000000000000027
> x2 : 0000000000000027 x1 : 0000000000000000 x0 : 00000000000c03c2
> Call trace:
>  __lock_acquire+0x18c/0x20e8
>  lock_acquire+0x100/0x2a4
>  _raw_spin_lock_irq+0x58/0x74
>  __wait_for_common+0xe0/0x1b4
>  wait_for_completion_timeout+0x1c/0x24
>  0xffffffc000acc8a4 <--- used to be mtk_spi_transfer_wait
>  spi_mem_exec_op+0x390/0x3ec
>  spi_mem_no_dirmap_read+0x6c/0x88
>  spi_mem_dirmap_read+0xcc/0x12c
>  spinand_read_page+0xf8/0x1dc
>  spinand_mtd_read+0x1b4/0x2fc
>  mtd_read_oob_std+0x58/0x7c
>  mtd_read_oob+0x8c/0x148
>  mtd_read+0x50/0x6c
>  ...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mt65xx: make sure operations completed before unloading
      commit: 4be47a5d59cbc9396a6ffd327913eb4c8d67a32f

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


