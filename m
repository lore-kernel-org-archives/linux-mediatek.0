Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A00C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:42:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F115205F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFsK+blb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JaSTjnKE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOS8mXkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F115205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LBFe38y3fw7VVA8qexMuaukCix7JEIzQ463Glg3Qh1Q=; b=sFsK+blbgjZgKPtRRerYVWTfR
	7U2EEMRrSJKjB70W2MzCmompFzTf9CXQmbFibDnPKR398E21j0PyE1LZxg3oiq5cMdp52h04g47vB
	iVP6/0tQdopnAOqvzJbW0t29mSUygpsMF1gbBbM4U1x+apz0dylXm+GfSmyJhr6+3EXWvG7f/0GIW
	8gA8W3w6QzcjFyPXssIeYKCH9Eq31b5qt51EnWf+R5hQXKtw73G1EhHo0V+keal5ZdHmuWD3LxfjE
	xoJDql0YZH9+eJPWTZgqdaKvDAMQLkMR6FFvW3ByiVmgKwYDvJzSfuqkImb9Dj6cy7eXU7pwn4NAf
	bIS2TACoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaWAI-0003ZK-J4; Thu, 05 Nov 2020 03:42:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW9D-0002bw-6t; Thu, 05 Nov 2020 03:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=76S9Pg6UZc4IU3uHCkL+6FrsA8kRsuFfo9JTBQMjJqU=; b=JaSTjnKEiMQXUZHhXQeR+dEjRe
 J/RqIaF0F2p74nz6aPz+XnYzQepn+IT421ZoidN8WkvskCUcEQmjkO5ETcNoiE7jhJyuOV5ANeCnf
 cNJavJUBNeHcrzTbojZncykym7/Yj2nFhfhSIov474aXutJzE7NTL/zvJTy/8DTEmcnhIj5OSSOBI
 r7VFWcbTZQEdm+0vv7CTW7zQJbjDKhMH7IgmrNoZIK2xKqRWFdl1ePuGw9sN0sQlOUTR1k1H4u7fY
 JxxzfJ8nWZ+8dqp8um+b1GS2iA3BPaT/m38YoGOeadlgycpGVLIQP3vQPrhTzYSP/66vD1gVzMrNP
 VAKuJecA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaPcg-0006Ht-TH; Wed, 04 Nov 2020 20:43:19 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE27220637;
 Wed,  4 Nov 2020 20:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604522585;
 bh=qHG+qglNHl7EPko96pTWFo/vpVvFsDwd7t26z3aXLJc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DOS8mXkcDZNKMUjg+ZIQqDOAwtHelZak+3QSk6S4F39enXPIJ718WG2AOBUxNJRB7
 XbUkby8jGhOE1J0RrQypWuPdNV4d0auEe+7+L0J7gFVcElF6JDKiC5Z12/C6ilAef6
 nhXRYEvEyGFlFxdChviPRbiomgXa3oX1txwFMauY=
Date: Wed, 04 Nov 2020 20:42:54 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, tiwai@suse.com, robh+dt@kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com
In-Reply-To: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v4 0/9] ASoC: Mediatek: Add support for MT8192 SoC
Message-Id: <160452257414.7226.8411635930831702201.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_204315_525426_1263BE85 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 3 Nov 2020 15:59:29 +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE for MT8192 SoC. At the same
> time, the calibration function of MT6359 is completed with real machine driver.
> The patch is based on broonie tree "for-next" branch.
> 
> Change since v3:
>   - use normal conditional statements to improve legiblity in [v3,3/9]
>   - remove mtk_i2s_hd_en_event as there's trace in the core
>   - impove mt8192_i2s_enum and mt8192_adda_enum
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: mediatek: mt6359: add the calibration functions
      commit: 682c5a72a2bb0745da73211bed5f47ccccd84025
[2/9] ASoC: mediatek: mt8192: add platform driver
      commit: 125ab5d588b0b3b842064c4d53a666ca74521ae8
[3/9] ASoC: mediatek: mt8192: support i2s in platform driver
      commit: 2c37b4ed730bc45e936794031a2fa13d75fb4572
[4/9] ASoC: mediatek: mt8192: support adda in platform driver
      commit: 607ac48595640d549a769f0dde0732e69c3a6c03
[5/9] ASoC: mediatek: mt8192: support pcm in platform driver
      commit: c63b7866011e63038d32bc37f3abd0deabbc34f6
[6/9] ASoC: mediatek: mt8192: support tdm in platform driver
      commit: 52fcd65414abfcf31206d9d8ac6dba9cc1cbbf85
[7/9] dt-bindings: mediatek: mt8192: add audio afe document
      commit: 1afc60e00de3abbb6c559da409c5c1bb8c1d98ec
[8/9] ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and rt5682
      commit: 18b13ff23fab34a9d35cec60ed19aceab61dc3f9
[9/9] dt-bindings: mediatek: mt8192: add mt8192-mt6358-rt1015-rt5682 document
      commit: 4a232122124bcbc241b8099c2f98a62c79699324

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
