Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE3AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElcSzmQ9mnNuA3Yziss729b5JfuaNjFhe260oXtZzxA=; b=vpEhJdMWSdAoLO
	zPhNqfjtA9shkK+TM+MC3oSu8wzR/H9uCkIYGtB5Aejx/SRLmcv0eeM1tGZ9dK/hQNiITcr2XFXX8
	H8e5fFOHo9OFPDZ62FEXM9MA3QlJ4y6qpRiltFwTwhN09ltko8WbSfC36XmF51cup0p7qG1AehiSs
	cCSUqQhdK5cB1yxs1Sl70PbT2y5G4FHdb4gVMHrxxgR1W03PaE/csQc2N7RhqSJ0zKvOpcrgjDJY1
	raaRT1FGhLDK9ZVojdpi86DzvcnbvNLeBm7h1S2VlSXMNAAYJP+XxsO6yXZon0foVJkarJ4YBz2jM
	0rZ9EBOjXvqCFELbeQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neMXM-00Fd2l-0j; Tue, 12 Apr 2022 19:50:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neMXA-00Fd1x-4N; Tue, 12 Apr 2022 19:50:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F063161BF4;
 Tue, 12 Apr 2022 19:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2128C385A1;
 Tue, 12 Apr 2022 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649793037;
 bh=nT93jamfbYnoTsEm4Lz28WvUjv7TcUJr8AkbHMTMDsE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FFTT6xhZR3P/Za71GH6f8NdS9a3R+L4wdP/9Dnnt9P9nSVQMSXWkFM2e/xJok2D+w
 BoUuK5stxD3hBYUF2nP+768waVpkiZtg1kz1Y+50upJV2x2JWRyb0Bxdrj41Gr9+so
 8cEA4J9JScVxL2v3NJJiV0OK+6FUGIDqnrydku9ZE8tX47x2Ef5skrIpNOlqpIIzjI
 9ZIW0MJYtT9veiko9WPcNEBI7mc/F5MO0MXiKOyFqPBhYrLQKnaPbyhh1yv2FRlg6h
 KP6iWtKTADlDuw9lwfVhDiOteHLpemmKzcYva+0WDI/ijYl2upquQg/EUsr/Sv++/O
 /ktC1HEV/ziBA==
From: Mark Brown <broonie@kernel.org>
To: allen-kh.cheng@mediatek.com, ikjn@chromium.org, matthias.bgg@gmail.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, linux-spi@vger.kernel.org
In-Reply-To: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
References: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] spi: spi-mtk-nor: initialize spi controller after resume
Message-Id: <164979303551.449574.9303978009033918270.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 20:50:35 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_125040_252634_0187C24B 
X-CRM114-Status: GOOD (  12.50  )
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

On Tue, 12 Apr 2022 19:57:43 +0800, Allen-KH Cheng wrote:
> After system resumes, the registers of nor controller are
> initialized with default values. The nor controller will
> not function properly.
> 
> To handle both issues above, we add mtk_nor_init() in
> mtk_nor_resume after pm_runtime_force_resume().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: initialize spi controller after resume
      commit: 317c2045618cc1f8d38beb8c93a7bdb6ad8638c6

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
