Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538C7C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxEqiCj/b8Dhp5jWvRbC51zP2sQLyH8rrLz1STFZUOs=; b=0Ui0KJO89nEGcN
	1jmbr+sYPlZekNaJPZThAGXJsowMxumkNBX/09iSZEc1RShNip2cpIMp6DNNXuK3xHKwD3/YHrqbk
	ckJqt3HNwMwFf4KPYJjC3DOihMbNvSIJ21zPqZn2LaPGgDCxOW1SLKHFxVW2SHVOy1GKQYwnthur5
	WAc4l7XfaGVIw+EUnrpn0x2ukouXYh/Wfh9qBGlpvn/qSU18BCA0anXggBcKHrAAnWnTfDOmJ33O0
	40h+PM1zNygUayz5okE7aR5Dmtba+q8C/xkYWjrYFIuoUaaeaQfrjNEESMAe5ylTQZGab0ZgNEan9
	wXhOM/WQ94+0loL/DdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZwF-007y9Y-NK; Tue, 07 Jun 2022 14:12:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZvm-007xtj-Ao; Tue, 07 Jun 2022 14:11:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C5946157A;
	Tue,  7 Jun 2022 14:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DADCC385A5;
	Tue,  7 Jun 2022 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654611096;
	bh=cJyU+230aiz3hoabBrQP0N+I1Q926hj1jnMqC2WpPTo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Xaa7RW0UOlpXmuEQJCNVGyLHFldqiJn1YvEvkSSJk6FYeqT/mwPcEq/X2EkBkMNJE
	 8/S6s++4kXiQjCJ1Ne17gp+hxWYyCGfssDyxcRBuHIeC8h3RaGilmktV6vbxSq28ev
	 OF7gq/r3h2qCI21Ti/8jSz9fVzK6j6wcgivZtB0ywaQ1wt/camEcx/U9cLuekBQJOL
	 ECCjBxtDCWbQtUyL1u5e4/WhBb2jlqVkTp1E717ZoAWaj3/PmkAPSmDLWaOEbATkXQ
	 VKLVy34eecT3Ow6KS5uHK0Am9GjANeGZTNo6BlH4v0XoHceSmKtjMONamMyAm6OHUC
	 4p5oLYP8cxiAw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, akihiko.odaki@gmail.com, pc.liao@mediatek.com, angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, tzungbi@google.com, koro.chen@mediatek.com, linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, tiwai@suse.com, drinkcat@chromium.org, linmq006@gmail.com, lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, matthias.bgg@gmail.com
In-Reply-To: <20220603124243.31358-1-linmq006@gmail.com>
References: <20220603124243.31358-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
Message-Id: <165461109323.1597191.3939968146449868630.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 15:11:33 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_071138_496604_3768BE2A 
X-CRM114-Status: GOOD (  13.85  )
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

On Fri, 3 Jun 2022 16:42:41 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Fix refcount leak in some error paths.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
      commit: efe2178d1a32492f99e7f1f2568eea5c88a85729

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
