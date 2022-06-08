Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8735C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7B/nOJsVuQvC80yxc7vVpbO/yJNCWXhrthkL7HW/oE=; b=o0LjTRF6CM7TNk
	aHKqXKrUAM8ecAa5iokDW2LTVJUa/wU3pn9Ja+AhMPo33lwwMS89Z2kZOUWkr90rBT9B4Wo+5H/iI
	pEzZUDXs6GeU3AnUosmJ+5TpUfeX4uz4sXUT+YFVHEDytEcJH9TzaeKwFWyztEuWGPqEfMfE8452g
	MjgnZgBw1LQfe+OFOebTUqeadEFjK+Ojuw0VLQwTjt7CE+WiwKzUajQp0/+oL7dcspvb627DFBm/E
	LI5TpE8wYXKh9mFuYDPufR/OfvySy9FMBrbDwF0FP5N+Kn/ZuqXIWbW6EHMlbwURT5WA9OMNmHrsm
	x74rid9dXB24rHvMgu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvwu-00DGbZ-52; Wed, 08 Jun 2022 13:42:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvqH-00DDZU-AD; Wed, 08 Jun 2022 13:35:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9E1D61ABA;
	Wed,  8 Jun 2022 13:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FE5C3411D;
	Wed,  8 Jun 2022 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654695324;
	bh=5LB/laBhD+UgSSOr7WRcH6UEhfeHkVEIj7KyPjpj7bk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hEdu1RTA30wC/gVRvrUhamV4CIrMaI7UIJc2NGAqmGgsT6dbAjDo4FBPJFL+b+/D8
	 ZJeBpPbyJkpirCUplI61/Gq1yjZHZG4T5C+bCPyeGkGggfU/0M5VKj8E8Z7vQxDLAj
	 Ji90W1x9PiwNLAiSlagnIz/Z44sWRwPGDOs7wgOvqFrzAZ5kDqulANOtym3pL7fQwd
	 EFgw/Zk0iwP9DDGNfAEwwBWMsP8Mx21B6nLRwN9wUvrBBirQZkQO45yLF+wNTvd78t
	 QCXWFe0ImNoRz81zN2mnXF3xtLYcoTV46kHQs4fH+PW2JMJaUb/CSMPI4miSidZAbC
	 4bn+/O3h0XkDw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com, angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, Colin Ian King <colin.king@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20220608082338.2083456-1-colin.i.king@gmail.com>
References: <20220608082338.2083456-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: mediatek: mt8186: Fix a handful of spelling mistakes
Message-Id: <165469532211.615471.3502999805996832817.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 14:35:22 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_063525_423459_88503DDC 
X-CRM114-Status: GOOD (  10.95  )
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

On Wed, 8 Jun 2022 09:23:38 +0100, Colin Ian King wrote:
> There are several spelling mistakes in dev_err messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix a handful of spelling mistakes
      commit: b09654e39c89a86680528345f3a95b832236ee82

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
