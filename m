Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F42C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 18:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZveEMswGt19jry65RQmVZW80tu3IFwG4m0iUXP37gDI=; b=KqDIFxaxIX8y4jolGHp0Vm2qj8
	x3IIyCXiDqErzd1O02RliObZrk0JK3VhUv6kgEinCjA1zgG0DyfDsv4QyRKQ5+/NBW8latTa3bQ6G
	dQRJ3TPlN+X9sZpoYOHWdrIKGXIrDSkeFi5IySt71PzcEwLoJukUY1j0FRhXSe0wuDBgpfUl63uhI
	yTvo+xYUz4+CejPf+YvDDm51T8ptJSce9y7dSKam00fHx3fwrKuULRYMHAO+eNM2wi1vEDpi7cMLC
	QYM/tjtXd7sJNJeCOVUL00wx3U+3jDRWhEDyub7GKQtEEilVV/Xf6giiyyLWzjZwSEKI/Nqp4vjZZ
	5z8dic9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4HY-00Dvcg-DZ; Tue, 28 Feb 2023 18:00:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4HF-00DvY8-Dr; Tue, 28 Feb 2023 18:00:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 98503B80E9D;
	Tue, 28 Feb 2023 18:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F8FC4339B;
	Tue, 28 Feb 2023 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607233;
	bh=R/7POyqmq1O7Bzcc0o56fhcltvP3fzPvqgmzOYaJR8U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ufFPg2bk7+2WvYWDcsSzbKVfit/Oft1Z9PyGt9qcvsTWxLyJQyohKsbFi+/dk0iDu
	 km0RaMt8Bavvj0U/VhMKENOFNz1DYEETmuezgKRzogenDXOlan858UhcnXK+GYQ45K
	 J/zvr4SU7u6UjxLMUjY3dKH+1yUOkRNXmIZWX6ylj/nhBlo0ajPbHIDWWw3GaaTG1G
	 zaYZVn6Mbac0SC0QqiTENjFGm+BxEKHwpMviez02BruQ+YkzXtZgFEiBAW4WktFGKm
	 pjnSrNUAITG1euMH4biu6bhLdzwdmEC6LYYMlmi1216SFeMlt/nKdBLdaI3kWNhA7R
	 ncmAHUGky6uWg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: mt6358: Fixes from an initial glance at a
 kselftest run
Message-Id: <167760723093.68866.904867313003535507.b4-ty@kernel.org>
Date: Tue, 28 Feb 2023 18:00:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_100037_659240_D78B38EB 
X-CRM114-Status: GOOD (  14.94  )
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

On Sun, 26 Feb 2023 12:47:55 +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the snappily named Kukui Jacuzzi SKU16 Chromebook
> on KernelCI.  There are more issues flagged, this is just what I fixed
> thus far.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mt6358: Fix event generation for wake on voice stage 2 switch
      commit: 3425ddaea57af77ca96a59a5b8eaa2f9e1b021ba
[2/3] ASoC: mt6358: Validate Wake on Voice 2 writes
      commit: 8e847a43c28fca0aaa11fba8f91da7dfd9d6936f
[3/3] ASoC: mt6358: Remove undefined HPx Mux enumeration values
      commit: 8cbd7273a724d4e9615b26d696bb1221a8a48e4c

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


