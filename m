Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6BDC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZsQljSvRoiviH2OK8fR7sxoSOw1EOC0bwU9dDdgcS8=; b=4kxVnaqyToi5zvPxxUOlAlt+MP
	HNsLqkVTVs0Fhv4EgGmw9s/iJ4TNHa8FGLLeo5XIVj5CxPuq2tmJIsFKsmTnYtv2lKfRha6iKZkH2
	Kn2p0w8db0kX/QmXj1FsBrwq6Hy3hwaO7yo46zN2SveaShkX/2Xucac4Xj9z6TzlouZH3G7zsd+tx
	pXYNV1Jct6UjyaFmUoGouo7i2+HZM0rUId9uHeTOTgakEgX5ogYkR60Rx5sV/0he9p+7fOv+f2hVe
	M6/N6a3GnxqkpzEn7/l2nVRvUkSw1ti74axUw8j1Sg9rFEpuYqgNOiCjH1HkPORXbYepT5cri/+iX
	Ag61236g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPMo-00GpF7-50; Wed, 01 Mar 2023 16:31:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPMd-00GpBs-8f; Wed, 01 Mar 2023 16:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7231B810D6;
	Wed,  1 Mar 2023 16:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62365C4339C;
	Wed,  1 Mar 2023 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677688291;
	bh=L4jlMMdY5+vXff3HkIyD62qExEfKSQ2Kua/FRvp/i0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uT5HtI8pstrVytkQosOYEks70B7+x4u/NK9pUQvJfieKVnQYWrlT12z0xmjVzZjoC
	 dzTYM1QfNLP0CamFVRviSa7obvzop7LN0fvUZmieTjI+s8d058AgLflKcbWa5wvoW2
	 NQ2KRw1IUhezvcWLu0/twY3IdmX8FXcBvpsb9tgZSf2Qhi1+lEtWlppEv+o5z6YduM
	 YIbm7UFxjgmBLhoDNWzs/wlKPYlT2VQHhiHUvasQ8e8G78ADbThogNljD4a0AhpOtx
	 k+8Tp657eqHO8km2i8ffAXIII6v0nPo+93YBZEjMjCduRw2TI4lHqAugZEMXJMlkPm
	 8y15t4+c3aUGA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230301110200.26177-1-trevor.wu@mediatek.com>
References: <20230301110200.26177-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: add missing initialization
Message-Id: <167768828912.48425.1653466601154354942.b4-ty@kernel.org>
Date: Wed, 01 Mar 2023 16:31:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_083135_494383_B247998E 
X-CRM114-Status: GOOD (  13.83  )
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

On Wed, 01 Mar 2023 19:01:58 +0800, Trevor Wu wrote:
> Fix dts parsing problem in mt8188 and mt8195 etdm dai drivers.
> 
> Changes since v1:
>   - split the patch into two commits and add Fixes tag.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8188: add missing initialization
>   ASoC: mediatek: mt8195: add missing initialization
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8188: add missing initialization
      commit: 23badca4248a9a467f630adbd1557f664585e1db
[2/2] ASoC: mediatek: mt8195: add missing initialization
      commit: b56ec2992a2e43bc3e60d6db86849d31640e791f

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


