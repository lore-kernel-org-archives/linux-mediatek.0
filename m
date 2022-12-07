Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1B2C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 17:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKTyCyTVxIX06cONXAdZM9/ScImSlYf8cwegM325JqY=; b=0QdYIi6yGp+Kssg3mZv5itnE4m
	bQ6LRCOccJjyXSGLJMIzid4HqyhB6w0Q4LoOyVp0CV8kCO6zsFw5XergdWwGBP2TjX5zQ9aCZIAeb
	Rjd3KhJY1J3W2WHaOgyDCOVILLsARw741kggKjE9bE++6vbL9Hm3I2jGFcxPJ5dlyATURbcSLjohh
	fbDZR9i+urJLMU/DKlGbemjnA88cgnJg3BEiYvG8cX3vk7vdSDaT0hhliNb/zHKEPfN31RdlSrFJR
	nr8ogYgHWkeJCxUHuZkt0mHTys74fvxhV14zcjuQb68d05sbVpr1ir/oUyvWmYlvNt9ot29Lg4EcF
	DEJU0G8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yMi-007Ulq-L0; Wed, 07 Dec 2022 17:37:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yMV-007UXp-CV; Wed, 07 Dec 2022 17:37:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E13E161B77;
	Wed,  7 Dec 2022 17:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BC7C433C1;
	Wed,  7 Dec 2022 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670434658;
	bh=l/Hux/68V+al46JNc+uBAW3FAqg3S010/czLJPsKipM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UhbrPF7bQhhj/AM69qDVz4xBlD0EB0Ibzkb7Z4hNx3T7f95NHB3TqGO5hAH0Ya7N4
	 OV0Tk+pr2mSdNl8inq7RkCNIs9BsBIz9KizJ7/QczoVogxJ2OgWyL1SmmSARO3V8hI
	 oLTTL1PuqhU12LAZ/kUNNSvpV52QGEIbDLGeNdKXNDqDTPXTM8Z5lKfnu1i2/Nf6w2
	 4tWGmlr59/dkIN/3cDhHmO45uCqHY28NwWDLkA5kypyzfrtZ9i/Hl7cdG9/IoqcaDK
	 JUE8WCyBNyn2vM3w2GEoCPzEgNRICGR+zIQpZEXw6dMAxnIzrkoQVAKOVK1GoGdfxo
	 qphvY6E43eCgg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, Wang Yufen <wangyufen@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <1670234188-23596-1-git-send-email-wangyufen@huawei.com>
References: <1670234188-23596-1-git-send-email-wangyufen@huawei.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183: fix refcount leak in
 mt8183_mt6358_ts3a227_max98357_dev_probe()
Message-Id: <167043465528.393374.16429232928958937003.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_093739_500699_5BCCE2D7 
X-CRM114-Status: GOOD (  13.01  )
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

On Mon, 05 Dec 2022 17:56:28 +0800, Wang Yufen wrote:
> The node returned by of_parse_phandle() with refcount incremented,
> of_node_put() needs be called when finish using it. So add it in the
> error path in mt8183_mt6358_ts3a227_max98357_dev_probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183: fix refcount leak in mt8183_mt6358_ts3a227_max98357_dev_probe()
      commit: 38eef3be38ab895959c442702864212cc3beb96c

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

