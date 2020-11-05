Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CFAC4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 16:45:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5210221FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 16:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KBCF91LL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLhqhGWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5210221FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zUxiGelKPPluHe2E5z65wIl1A08d6xb2dYYF+lPSlig=; b=KBCF91LLZxX/diJrkKvvuF0Yo
	XirswqE1I6/0E6jKgj2oPukjOI4UbkV0/vV5ji/ho6Ko16R0+E192QI2I8uiq/7NUkBqkK4hJRaRw
	wr5YmwYOdrblLZ8Z5tU1gYOg6eZH+mXwKmdeQgiBEGs13r+moXr0FtS3qe75qFF5cn/U+7Jou7QkO
	KvRn0Ja9CslSljVMcnxEI6kupJxp40Wxf4uZiOEVxHBc25RlG72kKtGseu6MCkB08Icw0l0GcXB4z
	xMbWSKyXMRf6jWo+HFUpvgWmMzTdaSvG7v9VY77rdfG6rdTqYDePjN8+xiM2hlajOi5+ljYRK1W3V
	/tttaMrsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaiOO-0006JK-Sp; Thu, 05 Nov 2020 16:45:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaiOJ-0006I6-Sx; Thu, 05 Nov 2020 16:45:40 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8747A2080D;
 Thu,  5 Nov 2020 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604594739;
 bh=1RsXmYB4zCj2jaeADbfq59xOu2k8CzrD8CU1zJns5Ns=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MLhqhGWkfnNlnY+Z8zzA1y2bzWmyu1mhidmsGBJGklbZ+cKftwN7eSvqPEuMpnF/O
 fjMkwh+1jgbrjLe2znUd1EBmSwFA3mJPvAMDeANBzPDckSLp+JTAUgfBZ/S53Bqebn
 xOq9V6y8L5GeUZ3EUwwEQDtuKA5c+7y1qoRvAcNc=
Date: Thu, 05 Nov 2020 16:45:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20201105124747.18383-1-sudipm.mukherjee@gmail.com>
References: <20201105124747.18383-1-sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: Fix build failure
Message-Id: <160459472200.54851.16651455731881675062.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_114540_050271_699C6A92 
X-CRM114-Status: GOOD (  11.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 5 Nov 2020 12:47:47 +0000, Sudip Mukherjee wrote:
> A build of arm64 allmodconfig with next-20201105 fails with the error:
> ERROR: modpost: "mt8192_afe_gpio_request" undefined!
> ERROR: modpost: "mt8192_afe_gpio_init" undefined!
> 
> Export the symbols so that mt8192-mt6359-rt1015-rt5682.ko finds it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: Fix build failure
      commit: 8bfe8c967546dc05385b52bac49ad972fea5887c

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
