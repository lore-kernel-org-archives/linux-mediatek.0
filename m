Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E5C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci6RcgRyuZCBvFPMv4hyBT1M4LJ4Z+zhTt0YbARAUOM=; b=cIp5bjHBdCo1h9vNWYRKJbA17P
	aXBzsCZ101ALSyfydvEwipKX9EPfyTBZOmgInTFJQErkqv81ALHZnbSnRwFy9ccxA8O+Rk2yFxjWk
	90NWqULn1FTlNzihqm4/DRmwmGu5qfjceKb1XhMIwn/PfQ29um5nLjTK74gzYdpW9BqSGPZIrQdhb
	sNpDVn2hpcHCpKP5yUOqyEJMuFJy33MP4NetCeKDHrV72ABVZ926sFUkhvsEMkUODW9OJnD1iYyQN
	qX6W38W+evGvCbFw4Z0F0aSKe3QpC5Lz2OhetjsEIRIcw2NaRl9EdlkNAl6gOAs0Y8QuzUGgnfpFB
	Rq93xxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGnMo-00HLjG-D8; Wed, 27 Jul 2022 20:10:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGnMg-00HLc4-6C
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 20:10:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81FA361AB8;
	Wed, 27 Jul 2022 20:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5837CC433C1;
	Wed, 27 Jul 2022 20:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658952639;
	bh=RLryZK18O+ABsv/1lGgmCNX3hO98CNsOxCCA0dlEy0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Naxm0hKo/NSRdQvPmAeLlnmypQ7jOKaUjRzxct/QSxvI9l8egmZ4Xb8lUi3wtDvcx
	 arMIjV9oJ6sXYSemhWE5LSB38K2GZYXjdK3+uKebmttlN/3xlcOUH/gU/Fqy5sNM+7
	 bRS24pn0ue728Mr4vzSKziDQtGG12zpC6Xrn06lRpP+o3sPWk+luVD3xu+UFKsoKl7
	 BO5jjnhbE296lmIseT5u/OJitR6/cHpB3yVEloKR5l5xCwl4K2+DGF2wGsSA0az0fA
	 jaMKUl57ffL91dIq1ov2m2EEoW++GHz2UN/VZjlARDpvuSJ/thJnBCcLounLnS/x+d
	 3WLEe5jVrP/Eg==
From: Mark Brown <broonie@kernel.org>
To: Jean Delvare <jdelvare@suse.de>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chenglin Xu <chenglin.xu@mediatek.com>
In-Reply-To: <20220727132637.76d6073f@endymion.delvare>
References: <20220727132637.76d6073f@endymion.delvare>
Subject: Re: [PATCH RFC] regulator: mt6380: Fix unused array warning
Message-Id: <165895263806.3544585.667891678901862229.b4-ty@kernel.org>
Date: Wed, 27 Jul 2022 21:10:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_131042_306084_0918D7EB 
X-CRM114-Status: GOOD (  13.79  )
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

On Wed, 27 Jul 2022 13:26:37 +0200, Jean Delvare wrote:
> With the following configuration options:
> CONFIG_OF is not set
> CONFIG_REGULATOR_MT6380=y
> we get the following build warning:
> 
>   CC      drivers/regulator/mt6380-regulator.o
> drivers/regulator/mt6380-regulator.c:322:34: warning: ‘mt6380_of_match’ defined but not used [-Wunused-const-variable=]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6380: Fix unused array warning
      commit: 9cc0590ae351a354c51375a1ee22edc2e4931fd0

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

