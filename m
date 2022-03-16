Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FF0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBUpz6tP07SQn3TCyGL4RH3LA+rCb5pg6hde7EF2lqY=; b=iwBurQl3x0KDMQ
	hXhh91FjlfWA/VJk2s/rPu1Xuz9k76S3so/DpHhRk0rMco9dm69bSxV0mKRU3o1rbRTt98/pns7P4
	W9DDUBsVvUg7REfT4t9/Dqg0nh+IKnEwfcT55zF4WzReRFfS5LWwU87rc5OaooDVbWhX4Lz7T1o1H
	WoZRmY1tY+28ePKL6lmFge96cNfhcHvkIx/icNkJuiVmw5a0D5E9VylyyQ6UhD0Oai2ryqLuIPzsH
	48OZJhsoaBhKvbstFkcr9bWoikLBimuKnRriacopEJWJKpsv/l95lhzttSCNI+1l+u0Zv78mWcYhE
	z6/DyYso9pH1mPiAe4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUaNN-00EG3k-3A; Wed, 16 Mar 2022 20:36:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUaNA-00EFza-MX; Wed, 16 Mar 2022 20:35:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09B0861467;
 Wed, 16 Mar 2022 20:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90745C340EE;
 Wed, 16 Mar 2022 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462953;
 bh=AAAhWEJi/anFNCmxfNhIiBbA6Y0GIdzJjvQH3bJNz/k=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=J1gz/E1CchAXd+lS5jkyTs1XeC9RQX/mBXckYjl3klNfDO/r3soyjfzUEVuoLAAe5
 lC54LRj0+gFBhgxEVGCiiEVKy1CkQHi6qdqB4jgkaJAU2O6zQK+SUggzSRyhr+OeYb
 D1tZT1dpw/XvUm3GMidGdyt2pt8HbPPMw3AeEEufiGmBeZCo26/Geap712HYLSODbi
 kn4cqxQteP+75j+hEOmJUotLedQCYzfET+jXMhIH2VIE7vsiYLI/9P3OmeUFqR2dvm
 /oIyYQQ0iphi3q8Srp4PjtkkFot5tRl0X2NJ9++zaGOHansIttRB0McVx10mQiBtk4
 HfLkkDHibg0wQ==
From: Mark Brown <broonie@kernel.org>
To: Shunli Wang <shunli.wang@mediatek.com>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Miaoqian Lin <linmq006@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220316014059.19292-1-linmq006@gmail.com>
References: <Yia5XgkGyLbIRc1f@google.com>
 <20220316014059.19292-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Message-Id: <164746295130.1220201.16478310954172024054.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:51 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_133556_799531_51F1CFAB 
X-CRM114-Status: GOOD (  15.90  )
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

On Wed, 16 Mar 2022 01:40:57 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Fix error handling in mt8183_da7219_max98357_dev_probe
      commit: 28a265a1ee11febeec5ea73a804f30dcec3181ca

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
