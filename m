Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A62AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 19:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D8B61179
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 19:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21D8B61179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3dosulMbDXnwc8DKL47yEH9qgdn+85gxRufnq3BTXI=; b=gSZxiIUrjoYmQE
	lfOu2DlgBcFS1bcE73nq1hOxdAtpZzii8Lme48QUl081g/K7NLD7gqOShX+VBft2KLphdcZVlfdMa
	ekOvj94vDZkhQleC375935RO+HO9PjB2FfumVH+QJ+moOCks/Ykg+d7v+M1QxIogpxZT5bms7XnAU
	kMGBKIxwNdUDzXtNysOctHxCX50HQ2baDYLnhvMUOKqfeM9+UgaqQw8dKJdDTeKGR2YRYG+WVMeDO
	xvPjKfnIxMW/V0IupyQF/CyOkVTd5q17WvxDkGTM2hfzvvcnLGA3LL4OdkeMqT8frkb63eJ9xyvdW
	alK6qO1C3kDSnU+cgbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnmly-008iUB-If; Thu, 18 Nov 2021 19:08:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnmja-008hnB-SG
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 19:06:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1593061179;
 Thu, 18 Nov 2021 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637262370;
 bh=x/8W7Lu2kSw6qOUXMhXb4en3vbd9NS6PLiCqwX2Q9lg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GwpYSB7Xjn+qX66MvdErOtoL7HF3luTcERkkl9YJFgWm1ZAaa/x13N0smopzX2+dl
 BsQFpKz/gMul0bivrEG3dI8vXcSG7sGkBSPLLAGQv6eXUKvSIS2ZM5vKkzauNhTBum
 UW7mqmmnSPToCQrzWgVDDBuyUll7f/4f92aASGAYPHdUz5c1fL+J+OhDMNusJx60Rc
 aNpLV7qefXTyJwxwWxhLfU61Dhmo6acnGUrdOR2CNMrP1fYsc7pir1vHI91shsH8CQ
 GdFVzH44VJyE9ZgF3kaoGsJosTbfm5OG0wsKuOc8SSA6r/HLmQyU69GBiEGic6HzrG
 mzBEVk7EtD5Pg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-mediatek@lists.infradead.org, pierre-louis.bossart@linux.intel.com,
 Daniel Baluta <daniel.baluta@nxp.com>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@gmail.com, peter.ujfalusi@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, lgirdwood@gmail.com,
 kai.vehmanen@linux.intel.com
In-Reply-To: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: Add support for Mediatek MT8195
Message-Id: <163726236782.96213.13499504169654230804.b4-ty@kernel.org>
Date: Thu, 18 Nov 2021 19:06:07 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_110610_966280_843FFFA0 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, 1 Nov 2021 10:00:20 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> 
> This patch series adds initial SOF support on Mediatek mt8195 platform.
> MT8195 has four Cortex A78 cores paired with four Cortex A55 cores.
> It also has Cadence HiFi-4 DSP single core. There are shared DRAM and
> mailbox interrupt between AP and DSP to use for IPC communication.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: mediatek: Add mt8195 hardware support
      commit: 32d7e03d26fd93187c87ed0fbf59ec7023a61404
[2/6] ASoC: SOF: tokens: add token for Mediatek AFE
      commit: e6feefa541f309afed8aa54431681261bc57bcde
[3/6] ASoC: SOF: topology: Add support for Mediatek AFE DAI
      commit: b72bfcffcfc11858a8fc92998733372606db485e
[4/6] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware
      commit: b7f6503830cd8f3f7076635409460861b5ff6310
[5/6] ASoC: SOF: Add mt8195 device descriptor
      commit: 24281bc2bf1884e665dfbcd17aaaabbc5872e501
[6/6] ASoC: SOF: mediatek: Add dai driver dsp ops callback for mt8195
      commit: 24d75049c5ed5193bd12ce0d43c355c4ef74a7fa

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
