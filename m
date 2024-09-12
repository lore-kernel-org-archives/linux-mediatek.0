Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DE3EEE241
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6n+a3o3w3yH+jyK6rZjUC0IKcKZ0VAi0FRcOfom090=; b=iVseRSGxI7x561Ne0SAl1/LP7A
	Vz1jsU+2K/Ztpf997F3ZQtP9ewKb5/VKfIqrou5f1joCRm/zVOCp56yhV6N0Hxm8S1akxIf6b3N/V
	X55/t2sJt1I/6760e8bj9JZehzHlNhFuKiG6jcMQYnj6ot2Ck6MS821lnZ7V7eK+BQn+v2eTB0G1w
	1CclLs4NdF5n8YYSRVm7SlF0bWGnHmYL60bBfDNEvL+Zcj4FbbhKckNvVHWVg94I38Sc1F9M94db3
	jfX7RFlhRIX+ZxP57Mzz6iG/XEW6nDhV2f0Zz1EuQ8kFTrIHxZZI02qC0zsqnvKkSzDnIVz6S1gpj
	ovO+mv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sop3h-0000000DzFO-29HZ;
	Thu, 12 Sep 2024 19:00:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sop2a-0000000DyzM-1IDA;
	Thu, 12 Sep 2024 18:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A3B65C5C0E;
	Thu, 12 Sep 2024 18:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67133C4CEC3;
	Thu, 12 Sep 2024 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726167579;
	bh=KD8sqECrwoDM4LaxhflSqmK1RgaQnuagu+p694T6Azw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h+8NQEfJp5eI6VYnVV+LZocFyCT/54Znb1rldlxfYy0YQHRCziVGfxN5uVHStD2Ay
	 4y+3uN6WQVliYRZYtlcO/OJOHOFcLpu0DaYpGW2CGYz7t5Q0p+ItzswlPGvZeYKUzT
	 D8NH9L3LOPrhT7UZZ5WFsPVjUrJntdvU1iQ9MmLPWw7EFzjl0KW0dpU8wn2C+0WcSd
	 +zLxgUriGr/uA0BcSV2/oLoVKPsiXFtXa2p2KTZA6tsMCF+jFFr4otYbw8jWG5/DtN
	 X5WxpR3VacOdnVaUoXezxPZxsC2lwWxziauuZB18dwUtXRA235BmyjkRC6d2Ms0aEx
	 dQzMvAdWkZVUw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240912084110.1854-1-tangbin@cmss.chinamobile.com>
References: <20240912084110.1854-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt7986-afe-pcm: Remove redundant
 error message
Message-Id: <172616757716.88520.13515459901367957704.b4-ty@kernel.org>
Date: Thu, 12 Sep 2024 19:59:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_115940_446617_E82CF4A8 
X-CRM114-Status: GOOD (  10.83  )
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

On Thu, 12 Sep 2024 16:41:10 +0800, Tang Bin wrote:
> In the function mt7986_afe_pcm_dev_probe, when get irq
> failed, the function platform_get_irq() logs an error
> message, so remove redundant one here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt7986-afe-pcm: Remove redundant error message
      commit: f6e2e7397d00192bda11166d5fb3e2e67a8cf92e

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


