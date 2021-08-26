Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4F6C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 14:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CDBD60E78
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 14:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CDBD60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKAqN9d3m0aBthUb/ExB1M3u7n5j42QHDsl2ClQ3UMs=; b=tY06JlShkQUeBu
	atIRx+BFItFtqYzIDRDvzG5NjFuwlLHeC9BNjb64I/cEDNbxyKH2n7oBAFQZnDNAXmBB7XL4f9EBy
	4WYCpP+dBbmyG/LIBx1MFxH42F5jQAcpGGasVt7LYC8VK7o515kA33BWPhykT9t+ceLmjyYKCYXlz
	cgcTK1vqW48xEwMEfKN+ICrvuARKkOZkoHdBGrUDjRFPVo5GfJ6LQD5WwBXOOyhQlBWmTg3b+HZwv
	qye6TN66bDkxkegnaYzdotRU7p6boVkNMOPaNS1Fs37ZuRqr+Nvb5+/YtMz0/tK/GimrHYB2/NkcC
	bnD7wTBELesrDjWw4Bdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGBe-00ALOZ-Ny; Thu, 26 Aug 2021 14:16:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGB5-00ALBO-Li; Thu, 26 Aug 2021 14:16:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4D4260E78;
 Thu, 26 Aug 2021 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629987383;
 bh=Id9hdMS4ZVRLE8sX6tHUAZFHZyYA74j1rQP2S76OPIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h3hLyQPwalKZygt/4rARZPh/L7wWvt3/aLK27jxsyYNxuZ3pe/n4X0J3cF4UWEEMW
 Pu7M3vDvPlvzJEwXitSWmyUJfECA7ej52IPb8x2XXL2+4GAEM2t7H5md29y4lFz5uu
 kik/jTyhhV3+nHwQULaNcssBhRN7DaDHbrJ3wv8gno7FUicqk1D3N5un125cStujUj
 F/cseX3ayQDm2fKaz+WY1PFapnBPus01BocUdoAtTD1g3wyc61wC9yzMtoBANnpkX+
 6qwQBeTiVoArdogg0Iu0JnV+/sIKUiig9bb1q9Jl+FkeAlHn+UnCULPNNJnfGDnRoJ
 Aoqfzfw+EDUHQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-mediatek@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: mediatek: mt8195: Fix spelling mistake
 "bitwiedh" -> "bitwidth"
Date: Thu, 26 Aug 2021 15:15:45 +0100
Message-Id: <162998707936.5647.1881702741528479360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826112611.10356-1-colin.king@canonical.com>
References: <20210826112611.10356-1-colin.king@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_071623_771120_058C6263 
X-CRM114-Status: GOOD (  11.53  )
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

On Thu, 26 Aug 2021 12:26:11 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix spelling mistake "bitwiedh" -> "bitwidth"
      commit: 11a08e05079a9328023d236b82bd7981bcde0852

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
