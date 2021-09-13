Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C09C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:56:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E9A61004
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38E9A61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW8hoXKnCFQwJTUE6uULWN1J9F5YCW6RQmlZRwDLSAg=; b=Vb21kPxJgTI1he
	QuVkWJY3NgmyQAIv1c8djGi1w8VIiL7/kSofXTXzBN9Q3ZvlHpUVp+uaLRy0Cue/BDyjP5PR3Yart
	kvt/O2JMdTCBnsTEKROZPZGBgu5F6m6K3u4zWXFdhIXQ5cHEuV/lSX/rYr0qVGiwT1K96jmt6ryk4
	+eqqHnA5rWb9drWzsGswiqgK7mhUUpC5eKmTMmAwQ2pHQHbrMKQpcc/4aQYq+vufZYDCHtKMRaIep
	PgY5wfrXix53e/OQbk24WY7tMuywSwfjy6IWynjI9P5QOkmC5gGcBZvvdJKQk2bmIY5p45/0f7jto
	Ed+cjEq9/9+j5JmC4GoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPjd4-001P2O-M7; Mon, 13 Sep 2021 10:56:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPjcT-001OjT-2I; Mon, 13 Sep 2021 10:55:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B31660F12;
 Mon, 13 Sep 2021 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530524;
 bh=jjg6yzmoYmrgF/kupfGziCDMx2GVtuJGY7oPruMvnVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VrrT8olopk85eVfPt+B6eBAre8D1nMrLOz9HALE8hjM1WyJcVSwNt+Kf6t6xrnj0y
 jv5CgAfOMv2lTIPy5fypia/YhLZ00ixv0yTwrq4qnB52NKJy0WEvD8r/28yBLArUa6
 umHdxhSjwMzLteVcJPngl1UPpeU7GQfd+nxm/R1/ojOES7h0Hcqlswt/nOmPeQMGR5
 ngfw5HoaafYETLg3fsNsp0+eee/FQ5X/cmb60qqR/PZF+cQ0+yL8xj1BczkK0yt/RW
 Uia9w7RCdtQIGtSgCQdPvK6iaiHcjLLKWdqbVeBMG/uzZkzjpCYXSFFZW0gWck8CN0
 r/ObDk9j3MdVw==
From: Mark Brown <broonie@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Mon, 13 Sep 2021 11:53:32 +0100
Message-Id: <163152996580.45703.9693182447056291147.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901132742.31714-1-caihuoqing@baidu.com>
References: <20210901132742.31714-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_035525_213752_CEDE0075 
X-CRM114-Status: GOOD (  11.32  )
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

On Wed, 1 Sep 2021 21:27:41 +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Make use of the helper function devm_platform_ioremap_resource()
      commit: c6b1b57469b4768b83e9ccc9bc3e5c2c7eb93013

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
