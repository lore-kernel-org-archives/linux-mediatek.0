Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC56C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXfF6oouNmgEW6pSbPb7hMp9xs5Uyzbgo4hqSTPqeHg=; b=Nm+OiyL8knCmT/
	CZ8XN/g4xcd2WMAV2DWoxaeZZJmsNHmEkus4OSUnTWYD0YlPFLR9vIl85S+pPpivtw926AOgkDlqN
	TLedNXmeTDyG2+GH/aqDMLqsIvu3igIIkjX9WuljPFQDQt1hY/FU9CkbPdC4XLdoP0JUp8jIblySV
	jhrFhw7Rx2JtfDZh5BDYv2bHRRTYVzc0G3Gjt/CAJi7TP6tqpcF+47jnGgECDN2XaSJNTtwfokh11
	Ms0dvWc/m3RXQlVcIjOxQUK6M3aU5vvi0hauXc0YKA7n8CjinZtAz2EOw92lVCnS+4g3/nJMGIbDn
	gOZZVvRIaimf3yHKEgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUaNj-00EGDb-Lp; Wed, 16 Mar 2022 20:36:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUaNI-00EG20-0v; Wed, 16 Mar 2022 20:36:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A30261470;
 Wed, 16 Mar 2022 20:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CE3C340EC;
 Wed, 16 Mar 2022 20:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462962;
 bh=ckBpUYs7lGZ5xVv8erHYOiifWXqrkP05DbKl6A1MzhM=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=JlAvFFQ614+Y/9z+uHoovLZ2D34RImM7vhHicpisrn9mUPgCs9dCoMeHHKvh16Bu/
 DkENs9F6KIeRQE3xK6lpuU3jupIggS3otE8qqEkaGREzYqXv7w6QvSjVzuixD9LSnn
 IJTyofcFBkLLVJ/qbQn/vab/ZPvr65w4lLKBSINAtFORVtwofyzJuU+BQ1Sk9STkBf
 QFBbQOXVKU4KKanwvPOJrHRCQ6FmRvK5+WEHgkC8ZhY8hcRcCLHb3O2N9R3jVcw2LI
 LRjolW9TpyjYCVjyKy6Mzi6VBL9liP3znV7LQiWMci4I3gpL+/pGmRtdbaMm2Hl2Uw
 Q855HmIPnIyyw==
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Bixuan Cui <cuibixuan@huawei.com>, YC Hung <yc.hung@mediatek.com>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Trevor Wu <trevor.wu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220316084623.24238-1-linmq006@gmail.com>
References: <20220316084623.24238-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix error handling in
 mt8195_mt6359_rt1019_rt5682_dev_probe
Message-Id: <164746295912.1220201.14496447901680691673.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:59 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_133604_134630_354BD6E1 
X-CRM114-Status: GOOD (  15.05  )
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

On Wed, 16 Mar 2022 08:46:15 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error path.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix error handling in mt8195_mt6359_rt1019_rt5682_dev_probe
      commit: c4b7174fe5bb875a09a78674a14a1589d1a672f3

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
