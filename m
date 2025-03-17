Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE18C35FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Mar 2025 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y741dWcvCY6nAM6VzGo7rDnzA56dLYDjkgr+XSQ3oqY=; b=hIXKJe9dJX4X/JmUPe/NXhiy7M
	JF1XtDmtrIgErw54OyIWGHuMg3c3kiKIWWJduEJPP4J/UyvES4KUtJ5XOgV0nefSRjHqRQfCPjwp5
	L1sVBAbpgfxCSKWQo4vqBp+gOgqZxKfC5C2Im/hbpNk60/a4aEST5/s4kEeX/GVOGEZbWa/MHtca/
	M7p6J8D342MtBFplqP2McgkmKofmX6cuqNSBH6CKQrzTZYHcraji1yaWNFoHIpbTDJF3tbcqpUVVd
	h1EePXOyQd5U4DUcr5SCgNTCl7fYyKEN9pbS8m6abpFU0K0LgpuoniocSBNozcKj9MHCptxzEIaHj
	+anMR8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gE-000000028uB-0BNb;
	Mon, 17 Mar 2025 10:26:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7XN-000000026GG-48A9;
	Mon, 17 Mar 2025 10:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B64DEA489BE;
	Mon, 17 Mar 2025 10:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABBDC4CEE3;
	Mon, 17 Mar 2025 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742206656;
	bh=0h+XlZja1L0Hzx3E+PGSZyubLgYa+1MEZ5jOyeF2nFY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SQQd7VAp97n+EP2wnT7EhjnjSQYMqPggqRuKwocLOXd4I5bP+xFBTTUFaPGOfE5eF
	 YwYoZrchZ/RrDX/Gxs5SvEqk8W0kzi0kaetDdptZ2bOrqdfqGl6gLcKl4BBgftL2F6
	 KjuBRH4H7ApRz69XnWSmeU7boPakb18YeLqtRQHjJF4M2m4mdjLOFfBVfXzNRB43b4
	 Cyupa7TPcaUOErZG4fU1KboYM28OAba2Dew+dunNgzt7SUI0dTsvegWtRGXg2+9x45
	 kQXyuse2Je3cDFQGLPJxgdI55b5Q3jKZfNxdprMDc5MDQgwgeacAqOXwh0A2RaUvIN
	 wkOFHAJThJiwg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 amergnat@baylibre.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Chen Ni <nichen@iscas.ac.cn>
In-Reply-To: <20250312032600.1235158-1-nichen@iscas.ac.cn>
References: <20250312032600.1235158-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mt8365: remove unnecessary NULL check before
 clk_disable_unprepare()
Message-Id: <174220665367.86423.10873134642092088398.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 10:17:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_031738_105985_D9EECB55 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

On Wed, 12 Mar 2025 11:26:00 +0800, Chen Ni wrote:
> clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
> Remove unneeded NULL check for clk here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt8365: remove unnecessary NULL check before clk_disable_unprepare()
      commit: f37ab219a3336ef787ce4babd20510f060f6f48d

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


