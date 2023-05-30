Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514CDC7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxAgbzT5EvKVAx/Dk1ILEhNRmGxKecteWUuv+ybD8uk=; b=H6FP7zU1RX8uDz89bUx9o2xnHx
	distWs7yBMOFn4Mvw7F48NwMO1hvTN7GT37hoaasNxaVrVpcp4fN+jzFoTet56oa1HE1h3XY2grP0
	3oy7NNia1sQ+wkCxhJ1/slslD3rcCLDs7t4cMhnqWln04n8FgbUn8dvH2eH0zrmUDEh0cd+yWROgN
	oszoiyYtsjTKx6UQTnjUATkVqA+ja+BRgjx+7abaVu5xoLxvtOjHchJZEvcN2Kdtl/+kOp30dlAcK
	J7nFwCHfCF9iI0HASp2w3A/Af5ne+IDyR+ld/UQYRKAJ+PYH7sIjE9jORfd121X1eeBAY0VeXhktv
	hqFkpNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43L2-00EmBU-0Y;
	Tue, 30 May 2023 17:40:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43Kw-00Em9N-1M;
	Tue, 30 May 2023 17:40:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7DA0627D1;
	Tue, 30 May 2023 17:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F2DC4339C;
	Tue, 30 May 2023 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685468445;
	bh=9/VTo/U8Y27wlwxBTkPK9EJhdYwlyyuveYD1A6GQW2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fzt0l5QzQ9LIhT/UsnD/zi5KyBJo9G9Y55kC3Eirjp4RavaBqN+SXSCkrebQUxBGW
	 v9w2S8bTL4c3WrSeT6B+rJ8Iyva8dwc12cQtEi2d8TEr4pkJNV8O9PRGjFuPhEWXNS
	 pb6IspnYyA+l+qeaMBTlBbQ9W48hjb4WxFcQbr/WNkaD3VE1f2oUESTFyhvtRSW7ep
	 wFGm3SrRwAFWToemu3u8g8ihiFnsP86oYOCyc5pECjs2xn6J4TaX7mKukJ+xX/MkiU
	 m2eF/7gN2ETxTCPabODcGVnRYQMw3CROoBwhqP2fR5G66uZUP4oaif4mcsRiPpKLMy
	 IlDEy4FDbPPtw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-spi@vger.kernel.org, kernel@pengutronix.de, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
References: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/3] spi: mt65xx: Convert to platform remove callback
 returning void
Message-Id: <168546844352.691057.11112317404702040826.b4-ty@kernel.org>
Date: Tue, 30 May 2023 18:40:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_104046_499868_00D9A33D 
X-CRM114-Status: GOOD (  16.64  )
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

On Thu, 09 Mar 2023 10:47:01 +0100, Uwe Kleine-König wrote:
> this series converts the spi-mt65xx driver to .remove_new(). While the
> preparing patch that gets rid of an early error return is in many cases
> a bug fix, it's not tragic here, as the early return only skips steps
> that are not necessary after resume failed. Still rework the code flow
> to prepare for conversion to .remove_new(). The 2nd patch actually
> converts the driver. The third is a small nitpick cleanup the I noticed
> while working on the driver.
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


