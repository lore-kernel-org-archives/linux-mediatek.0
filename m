Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54F8C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQcOQYZnlWJWG3dwNjhp6DaZdmsdFdfCvAjvOwArSus=; b=uyrrOcRe7Sj85luAYpkVzwEm40
	iNddhB9a9BmFlIQKbUGDrU2NruppkHJkEj6hQLXuxBgrzvHglhYflyvavjAkqAtdL8ZMRkjY12KVJ
	8sevb0Vw0bs238d284ItzVQ/HmHRKeUw6FXcFxBj8ZxO5oFCcYgEXSGhTHDS4CbMqqzWOkxePoTrc
	ZVgTMlhbS+IazFf3ZNPfmMjHbWqSPFJ1oFJqc/D8cldi7kb8QBW1hH9IoVFpTsxUzPvAOGc3yidlN
	SIOgZysQwDp4QJMsZVyDjJLW80AyDGnQEO+kwFfQ3qiNws+29SFNdGpj+KQu5ok7TFf7k1yHBOatY
	HmowidKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otBmC-007t6r-R3; Thu, 10 Nov 2022 17:55:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otBlz-007szn-U9; Thu, 10 Nov 2022 17:55:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54F76B822A4;
	Thu, 10 Nov 2022 17:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD9BC43470;
	Thu, 10 Nov 2022 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668102929;
	bh=uV0gS8Zym8itzBA6jauOP1PQV82pLKsM1MencwuTk4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z7DtR/W642sNyhHLYsGF9t6PWbPia5GkKB4yquzhZFYAvCBEnTcYcisLNDHz9Bm63
	 OTf+hyTDdcTBydtqHGAogg+cRonEAQGpoD4mTzw6wCOXzR0yjB/6ZKcMpZXi42Mbyn
	 rANmyW37gYKhH6RrxflwttID57nm9PwgFtphiXGERDsfT8sxydKAd5r+vP7TTHIy7C
	 Qzo4XmmpN0Ad/ebklnZr0Gng49ivNjEmDGJ0CXENDqgHpgYmnJ8v99neDo7/nihMGZ
	 Soglp8CY1c9ue1w5rdnoosLUs8pL8D++mN2+t8w6PxPD6BzKdOu00cUf0KbyFwR+kn
	 J45ZAFyZv45vA==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Cc: alsa-devel@alsa-project.org, kernel@collabora.com, Miaoqian Lin <linmq006@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221104212409.603970-1-nfraprado@collabora.com>
References: <20221104212409.603970-1-nfraprado@collabora.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8183-da7219: Register to module device table
Message-Id: <166810292583.959181.9972965736235328683.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_095532_136763_30AEEDD9 
X-CRM114-Status: GOOD (  15.62  )
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

On Fri, 4 Nov 2022 17:24:07 -0400, Nícolas F. R. A. Prado wrote:
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8183-da7219: Register to module device table
      commit: b5e004b0e5b57d14ac7804875878cdfdb31c9288
[2/2] ASoC: mediatek: mt8183-mt6358: Register to module device table
      commit: bc63a806acdcfca201c68c820731d74185118789

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

