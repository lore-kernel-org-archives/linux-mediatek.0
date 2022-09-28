Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF866C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCppjTNjMRA3F4CBNgrYdnnvQaxmmL7EeQB18wzpTxs=; b=fNO6wb2TVmU8ij24NYq7R+WegD
	pXbhhXUbKiSgMl8VorCm18huGcqKjhn6wNBLS/KsAY6NziNdF4JW0sYZOrz0B+oDVfkqtVpnO6Ao7
	RQgkRv1XEX8KFOOLUuMNJ/CvKbo427bI3QvU1zyvZtkw8vfj6pkpVfwBpdcCxib9vkir800Ap/NFO
	TdrngIEKmzM7yLW3CdBRg+RewCK50V0sJhYocHS/DXCoIm5Kp3b/OiNmdMBSxrbfyjn36NURy7pDr
	p2ZVSc/mUSfukev8zalbuEWKNWswWQAlF55BGBBu91dgcLFBgaoSexexRH1fLmXlwe6x5eujN8x5R
	iR3dtIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odaq4-00HN28-8K; Wed, 28 Sep 2022 17:27:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odapq-00HMyG-Hy; Wed, 28 Sep 2022 17:27:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF79661F4C;
	Wed, 28 Sep 2022 17:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7EFC433D7;
	Wed, 28 Sep 2022 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664386021;
	bh=dkjJX3GmTUUEkX53QWs8rV3NWH4VfCMRbH6qGJMwdts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A9sOr9ddn0zmiTF4Gq7/WqosRJlG6j/PR+b7EyX39g572sg+QfEpvDtSAyMjt6Rgw
	 w+l7U7p3snIl0oxw8jw4HJyYWPos/rUJBqLBoiFa6moWg/PDPB+n1DDCa5D8UQkrUs
	 oZxfDtDrFRiS5gV6Ayb+G8SkebthxyECwvxOrmZjDNQN8P1RPR8PJr4Gw2Gaf3Mq4/
	 C1b3aHJF05hCXOPZbUgdTngmO8PrD/9VSRZBnxxUZ9eTBvwoeDwpVjXx37Mgv9UC3H
	 pWD1O2rD00jyi3EkE6Mgue5lZIpPlTF/pSFILWoDA5PpjHyWUQtXwzkp/rUtECBoYr
	 vvlJ3/96QANXw==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com, tiwai@suse.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220927151141.11846-1-trevor.wu@mediatek.com>
References: <20220927151141.11846-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: update audio tuner settings
Message-Id: <166438601946.235698.6774354071024623483.b4-ty@kernel.org>
Date: Wed, 28 Sep 2022 18:26:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_102702_660165_BFE4147D 
X-CRM114-Status: GOOD (  13.90  )
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

On Tue, 27 Sep 2022 23:11:41 +0800, Trevor Wu wrote:
> Audio tuner is used to handle clock drift between 26M and APLL domain.
> 
> It's expected when abs(chg_cnt) equals to upper bound, tuner updates pcw
> setting automatically, and then abs(chg_cnt) decreases.
> In the stress test, we found abs(chg_cnt) possibly equals to 2 at the
> unexpected timing. This results in wrong pcw updating.
> Finally, abs(chg_cnt) will always be larger than upper bound,
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: update audio tuner settings
      commit: 7ba6546b547c75b0196029c7e0aaaab2eb6694a4

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

