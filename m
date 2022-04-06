Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14085C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/ktLLEbnEC+iwe8Y/mhgA1iRW7Woe7z+g95jGs0h84=; b=0EzYSZk3tV6hgU
	f+1XTK3G2NXoBH9aLK5TWAfnmfD09EkUuz0F7xkQ/5dtLTrANYhpH8zVZ/3ZpryLG8ky1jy5d/FUo
	VJ/3aobpdS8WfZfE9vrlAB68aZ9dI6fyWcsM7ET9P/DBGq7vYmolhor5X4VoPH3nmMacc5jmqT59+
	zN8a1YqT1S2WD6na/WTRW1QtIVdBhc/l3KyFJ/ihizQJmfsoNZv415PZDY9SaiCnEvgT0N3Ox8ukR
	thpsEWrY9jQYgIE+YfYTNQr+l9bch+QBq/hRLynmxdEgtF9sGmFwkJcYoyIi5n5jW3SDckOkOXCpz
	PfLEyJpWdxtPvRUa3KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc5iV-006Hav-53; Wed, 06 Apr 2022 13:28:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc5iD-006HVP-RM; Wed, 06 Apr 2022 13:28:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A78D5615AE;
 Wed,  6 Apr 2022 13:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0FDC385A9;
 Wed,  6 Apr 2022 13:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251720;
 bh=SapR/NGS0zHiukVcEi1sjt1o5RguCptFWulxy98tqWA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=qBE6vy/DKRlrqfk8OWxSirFDZMVqiTSuBzW8DuegVviTNxduBA/czlteRsefSFsju
 eSrQDuT2Ri3W/8znnOPz1dvd1XS/CKOpYwo+Jhnp6pN7MOLE0pCWzsRAOnBULnwH4e
 SKuCZe+6Rlj52sdtm7QHPgTA6voOO9HfsmcvwvZZw0s8ngISWe7xCOVHSyXXiram29
 kvF9DVx4oFqWVMUXaHEcPzoXsU5mrmyxBjjTeXG1zpOuYQ9ArjNN5/M6emcLTRncEd
 ZCuW/AagOexFfhZQvjMoZfr0PGCR3AoHwup6HCUj9sn/rikJv1ifAcPGA/CLBmo90l
 XdYzf/YmcFq5w==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tiwai@suse.com, jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 linmq006@gmail.com, koro.chen@mediatek.com, lgirdwood@gmail.com,
 matthias.bgg@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org,
 tzungbi@google.com
In-Reply-To: <20220404092903.26725-1-linmq006@gmail.com>
References: <20220404092903.26725-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Fix error handling in
 mt8173_max98090_dev_probe
Message-Id: <164925171747.83821.17392124533479234810.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:37 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_062841_961065_C72BBB79 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, 4 Apr 2022 09:29:01 +0000, Miaoqian Lin wrote:
> Call of_node_put(platform_node) to avoid refcount leak in
> the error path.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Fix error handling in mt8173_max98090_dev_probe
      commit: 4f4e0454e226de3bf4efd7e7924d1edc571c52d5

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
