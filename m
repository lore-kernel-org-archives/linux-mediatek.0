Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01721C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bex7Wkx2cvghG5GzpuzZzmFp+NZItELrYSPudwI0tR0=; b=o8J9qad5dqFyh4Wf2YsuodomFl
	+LHiGC7bey+8LrYsSan0J8r+/sHTlYydjC6QIqusFjbX/wVi2Dv+bfDgNw5LPaAhpvUJlJwa7hh2D
	HqZ8R1hllp8+ypbzdMZgCuqiAzxBMoGA8bbCbpx+rjQfdD2DNRNO6qUUl4S3wwTRP10HzrGyvUhPb
	Ge4RE3jH1RPd15N6Lo3Y+7g80wfDT6MP5TI5Hdy3vgM5zCcHO4KHFGxaG9AeoPJ/zUFTUdz3wUhV7
	+CvdtN79al0NBH61U41trIFcBcxIQyVgxYJCf+yTMYFjfZIRfaInw9CA2cSc5NpUIx5h4St8hduR3
	vhPodLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43LA-00EmF8-1x;
	Tue, 30 May 2023 17:41:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43Ky-00Em9p-1a;
	Tue, 30 May 2023 17:40:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB01A62BF4;
	Tue, 30 May 2023 17:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB5FC433EF;
	Tue, 30 May 2023 17:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685468447;
	bh=2ea8N67c7G2yOchRm+WL0kAMJsqs8Q3ilNqdiR2zHuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i/Vl5v+gv/l3piJuaLKSeHoU1/AQhZIpgP8m0jLqxv9GRcTQqg9sSsje/Ea8kpkgU
	 VMY9tMcf6VMSWiWEGDCb/cbKOiK54tCfoplGMNxOGsWlMIUGjs/JROUuJ4/t4opm7o
	 vDVewVauKe0nEGBpfMCTxRbAwxL3Md/nlXUypBfmhD2jQUin2cG3dVqyLHvtbnOyTp
	 ZuRn09LfPfiMwIbIRaLlqOUPMLjfqsssusES5jDtowwUuXJIfE8yO7NJeE95/J6fRe
	 ahJJTzxf6hq1fcVQYkOktBAcoybQxvmrPJvrP98Z/pLXl3zJUT6n/u0aq8yNF303vm
	 8v53gipcwNbhg==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
References: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 0/3] spi: mt65xx: Convert to platform remove
 callback returning void
Message-Id: <168546844548.691057.7800675401872237520.b4-ty@kernel.org>
Date: Tue, 30 May 2023 18:40:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_104048_571009_B03F7938 
X-CRM114-Status: GOOD (  13.49  )
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

On Tue, 30 May 2023 10:16:45 +0200, Uwe Kleine-König wrote:
> compared to (implicit) v1 sent in March with Message-Id:
> <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>, I reworked
> patch 1 on feedback by AngeloGioacchino Del Regno. Patches 2 and 3 got
> his Reviewed-by.
> 
> Best regards
> Uwe
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: mt65xx: Properly handle failures in .remove()
      commit: 22f407278ea43df46f90cece6595e5e8a0d5447c
[2/3] spi: mt65xx: Convert to platform remove callback returning void
      commit: df7e47196fcef5d5611caa65f91d813578cf3efd
[3/3] spi: mt65xx: Don't disguise a "return 0" as "return ret"
      commit: 6f089e986778d3657247fdc2b38bd38de796732b

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


