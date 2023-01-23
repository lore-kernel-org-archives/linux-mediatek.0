Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1189C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMD/qU3UpeHD8YpCJJSqb7t7EOFh5ECV8XDE9kRrCZU=; b=hxiV9cO9GFgJKuCGU/jlt+644M
	iZpYO/mb994ZaSNhFMECdyFD8OHmAzAqry0KbbrTCCfKYEih4P0ZO9WU1+RRiFGQwoRWEk2n7lQkS
	vg20dQ7pQL1ikUnZ9fjJ/vinbCWCJ5iAWgJvGMoHUggYPRlSdM6Fgn9uthxODXkwVceLj9TFMFHfc
	a74Xs0qRiFg/nATN7R+B0hepOq0jIQ6ek9YrodPMxQCJTznU5WeAC04WnajTJu8q3I4z3afePWPUZ
	KSudC7C52RZfSMwDVwSxGM690oSn6tcwhuJRISUKkDiGRYtlz1TdyxNYxteeXfyXJaD/7ZM82AOeX
	UPQh/QPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK021-000gyf-0z; Mon, 23 Jan 2023 16:50:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzuS-000dfH-V6; Mon, 23 Jan 2023 16:43:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0FD360FB1;
	Mon, 23 Jan 2023 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B3AC433A0;
	Mon, 23 Jan 2023 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674492183;
	bh=I6q+1TqaHhwNsgg4BdDkxDvo9F1rclT1/qSrFDqO+YM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ptp60oyTKkwQPeovyuULop1bZsBG02hFVIVxS02La7Mktoop9wmWl4boWnW8aDB23
	 tW96Nx+Mip0+JAlOU+E+0otkxbCzZuOezqq/zO4S0y6BPT/xD4Z85q3KlkjT1rvla2
	 agDbOfqKOjI+p4kdxFQu/Yuh09y6JlFb5vpms+16nRzaES/AW9oMjjTjC7zxzpU5rV
	 FtEVH/v9b9NOWw3siPzDxn3ffBOpZuTwEo+wngpN/8I81m3GSbD3Nep1rH8SzHrnT9
	 oaA5mXkUL6Kpt14DYPac10PAX1ECenIvQhUEfd4ARNImIUraMixKamPE+K7wCC3uTI
	 QHpIWUP6phTFw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com, 
 jiaxin.yu@mediatek.com, Chunxu Li <chunxu.li@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 project_global_chrome_upstream_group@mediatek.com
In-Reply-To: <20230110092623.13035-1-chunxu.li@mediatek.com>
References: <20230110092623.13035-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: add AFE_DAC_CON0 to volatile
 register list
Message-Id: <167449218051.1484410.8537098920978259746.b4-ty@kernel.org>
Date: Mon, 23 Jan 2023 16:43:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_084305_089935_328AFD7B 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, 10 Jan 2023 17:26:23 +0800, Chunxu Li wrote:
> Mark AFE_DAC_CON0 as volatile since DSP firmware will access this
> register too.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: add AFE_DAC_CON0 to volatile register list
      commit: 42fc858cc7e3f9e7a5762b29f9daaf23a15e45ef

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


