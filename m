Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F271C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eu1GCd0b4v89jlglC+kgPYaXrkhFcrnKZgwX8ZScaYY=; b=4pLMwPVRpQyVOV
	Z7nzpb1/kL4JCf3vUINFxU7GZiiSPeIxNURH3eD0KoLazW8IP8ee/3GcBX4AkPonFk3bahYVRUwwG
	7HvtieNL3jpdS0Zr36ShNq2DfSQKAuLgV7dyanJ6TjH0QCCklUYu0FrYVH4ulIqGX9PAoQpcHVBMq
	QBcej/YgJtTX0wMGtanTIciOK2excQ7DJnrNwbsyGT7HEGmZYPezsobk2CnIQje4JdwL8PtFvLlRw
	5SAnuaueOGC7MSxFipydHCPzFMklXQ/Kuqcrtkty/MOMxjgmGWU/iqRVAqWDnbwMpXRx1jKX9F6Sp
	52XoH8DTy7t84kZ/RiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msUPn-009oKO-W3; Wed, 01 Dec 2021 18:33:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msUP4-009nsb-7Y; Wed, 01 Dec 2021 18:32:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 532EDB820E0;
 Wed,  1 Dec 2021 18:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A096C53FCD;
 Wed,  1 Dec 2021 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383543;
 bh=4g5v88qsCsd2eOxSUuIi5nfN0VvYnTAxUAxeb2Tfytw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EiKCubeadJNn/PHgCLjVjjAtpedMYyGlyEzDsIuLfsuC4bsRfNHPGYUCDM3bA2ppQ
 FF20EIagtMESiQPT4ruwPZhdu+wQmj3P15w9vYA7EFcxJzccUwoffoa++4Jsb4oA+f
 fbabmk65q/nbSY4N8QNquvyp24Vlt3eF1CbQn6uuj8kKs6ucHwyKjkLhAG3va7gvVV
 K6gAo8a2bS8TQekkeJ/jDoNN5ofos5ehd3EsZZQFqwgih0Q5JtkQQ7hvBF/+6U+1AF
 O8q1iFKf5stU7gLqsN7LhwI5G1WfAqyFEhOlasjl2p/qHUbBYlT25g3z7VPRpFcKA5
 H7EV93Ea5bBmw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Colin Ian King <colin.i.king@googlemail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20211129224236.506883-1-colin.i.king@gmail.com>
References: <20211129224236.506883-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: make several arrays static const
Message-Id: <163838354089.2179787.18120653222525343560.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:20 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_103226_434955_50E7C915 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, 29 Nov 2021 22:42:36 +0000, Colin Ian King wrote:
> Don't populate various arrays on the stack but instead make them
> static const. Also makes the object code smaller by a few hundred
> bytes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: make several arrays static const
      commit: 91745b034dca6044407b559fe28dd1cf7efccc29

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
