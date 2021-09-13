Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A49C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039626103B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 039626103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EdNHNu+f7qBqqPdaswil3Ub5K9u5oEuorzdrU6ZJSU=; b=GWGhIl2VDAC0G+
	k6dAsuDhWVk7kivZdwrmJRRIoFzE4XWbwgUz8MbamGBXeEh8dtrC9bNVdVxC88Zy6bj3WJfcGdMcu
	2F0jqh5hX3XuIpAPOBznk6f5Ld7LDzpOXuTTUWMgrlqwJRCO5jPO32T61nwgLE2AATy6GFn1HiroR
	E2zayQUPjxGdmOEzy+jRg87yboubM+JcqXZSHj8WOp07Np7S12GSaRR0uwP5bEa0R5D/0Qo6Hzfu7
	vRGUySADG0lDhdnzX0wS45hYOF4pKf2Jp/7i/ODcJRGpSsnycJosEsMO9sfTmzunlfvnJyyw3Dpev
	UYaI2da2JsxgNOocBP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPjcB-001Odk-If; Mon, 13 Sep 2021 10:55:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPjc6-001Oca-8u
 for linux-mediatek@lists.infradead.org; Mon, 13 Sep 2021 10:55:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 759906103B;
 Mon, 13 Sep 2021 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530502;
 bh=qVDEd4KPGzwlXD7REl4gi3XNnBFXMku8Vz1o29jsDWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kn0pYiZ/IyDNur0YZLsxyjXh+Ej6lL1Bg+fVYqkCh5e9kkHMXFDzm4C3ZsHvsOYeJ
 +rbpcUPsDLtJYwYYJo9xukdBBq/3pkn18zo8SnHY0g/c5yjHhZrCJPVYmlAohMuayz
 Z2zP4hn8k9dMysdbEG4JT20NvPSG+dFFMntoVh9Jd3dw3d+N2iUOio6jhZ02nC71zT
 WCC4MYRZP8CT9bRuHofdoEF7zP/jwDVw7ffDvz9as6MrpEs/W+L/CH8Duk+ZJFZAYw
 WBQ5v/XpEay2L25mKi9krzGUM5sUyLkzLGtR0faaZx9Uj+pyp6Ym+2X5ZG8tUn9AvM
 i2wy/e0j+jZSw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mediatek@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Remove unsued irqs_lock.
Date: Mon, 13 Sep 2021 11:53:23 +0100
Message-Id: <163152996586.45703.9396342816792427705.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910094847.3430413-1-bigeasy@linutronix.de>
References: <20210910094847.3430413-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_035502_388564_8BB862F5 
X-CRM114-Status: GOOD (  10.32  )
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

On Fri, 10 Sep 2021 11:48:47 +0200, Sebastian Andrzej Siewior wrote:
> irqs_lock is not used, never was.
> 
> Remove irqs_lock.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Remove unsued irqs_lock.
      commit: c3815f8bc777370999ced0b6b6f846094b33d583

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
