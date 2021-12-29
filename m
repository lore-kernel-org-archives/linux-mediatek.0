Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A205C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdEIlXiASr2GRE1A+fCPCyeJNo1a+dIsFGuE5pcmqsg=; b=0iRHhgBXe+A7qJ
	3/hRu5XMxUIfgM2ZJ3chMzIBZBv7fVLiUFCnJoCh7ujkGte0Y6d46pnnGEIpflzABA0FhhLnFifIH
	wD4PoZ8hervHpvL/CnlEiZOVOh6xklaEVyNQxb8xxJLFhFT4cjAWxMLAZGmv0QaGqF2gt1auSIabT
	5vsZDXFrErVUn9jLHDpjSd5DXJ8I3f4FkL28lnnCqHIu91fBJGZuDkZjvI6+KrdG6t9v6tkXmRuMr
	exrwTgHIvZoQyBO8u21f0fNUWq2X8RDtzdIfk3Nm7YnEfzkZZeo3Lo9OTIOswt8s+ZHTad53oehyb
	gmcqUg/2HXsu2AStGDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Z1c-002pdg-Tp; Wed, 29 Dec 2021 13:29:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Z1R-002pcU-VY; Wed, 29 Dec 2021 13:29:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E647B81909;
 Wed, 29 Dec 2021 13:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4942C36AE7;
 Wed, 29 Dec 2021 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640784579;
 bh=bk4jM8QLUK3Drk+Pn2dYURwUnfzbNco8xaPEn3dvdCU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=m9AaPfcgi8aWZin3GD1ksPkBlmIPdqIomyB3jW5OoIpD/gsOcT6zhF5p66aDhNV8S
 hwuNZGkxqEs/oPTd3q++pI+nP+KEv//q5cDaZM32iwENl54VNBw5fF2gK1uNzyiK6O
 omj3L4FEMSljFBVkKKw5UsNDC43krAeYAGbvQQDU5uy9C5ZwK1gMp3mcAmhMb6OxO2
 9vPE/c2tShHhkv8q+qKVl1CzrYrZ+VCTyhRmcMdLQy7kPYOPZG8fz6CqMUwWVk1Nsp
 Bp6Qb0NCHFlqj66vfkBs9XNqrKyV5FlxZGcuR3Hy8XZWvg74/k301qNSxj0qn1gHh6
 kSgIek5StfNEA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>,
 robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tzungbi@google.com, jiaxin.yu@mediatek.com, shumingf@realtek.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20211228064821.27865-1-trevor.wu@mediatek.com>
References: <20211228064821.27865-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: update control for RT5682
 series
Message-Id: <164078457646.1246652.7413539172267193137.b4-ty@kernel.org>
Date: Wed, 29 Dec 2021 13:29:36 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_052942_202546_5432AC39 
X-CRM114-Status: GOOD (  14.65  )
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

On Tue, 28 Dec 2021 14:48:21 +0800, Trevor Wu wrote:
> Playback pop is observed and the root cause is the reference clock
> provided by MT8195 is diabled before RT5682 finishes the control flow.
> 
> To ensure the reference clock supplied to RT5682 is disabled after RT5682
> finishes all register controls. We replace BCLK with MCLK for RT5682
> reference clock, and makes use of set_bias_level_post to handle MCLK
> which guarantees MCLK is off after all RT5682 register access.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: update control for RT5682 series
      commit: c5ab93e289ce554a4e0d47330dde120284541aa1

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
