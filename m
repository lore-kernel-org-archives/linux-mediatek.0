Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cQ+2F62BB5P2RwtKC9mfago+bxxz+edYsK/Gpnfp4M=; b=h+yQg9YOMkzH6H
	uscH7sYXqcZrG2yRGeeh0yXDgkh8PiycDXPetDUuE6asD6+UZrAqIASM/JtCleiS/pxsNmasA0ewM
	ZW5VPa+1UHbwGjO3Hm0iA9CMpSgGw8VB5jyn9CYBaczGT1+DJiDxGHAdLX8g6wPba5383vZhdEOrk
	pOfem0px1XoVjYqmL87rpQeYrbd0TqKa2UpFY69r6EOvS0p72KTkEpsKBOYnSmf1WBSE94YmDA9op
	uXbLyWwHzk/pe4wA9Vrtz+KpV4O0XpNT9OK09FYLvfTFwH1oyPmuLGDt8YVRMKEypqHvFcVMyt2Nk
	yGuk0LnHlHTJhnSESEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0TwL-00DN29-8K; Thu, 23 Dec 2021 19:39:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Tw7-00DN13-RK; Thu, 23 Dec 2021 19:39:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 31B4FCE21B2;
 Thu, 23 Dec 2021 19:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EC9C36AE5;
 Thu, 23 Dec 2021 19:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640288367;
 bh=NXKPcFkHdy31EhKH/FMtlR3cjqWl/bNcNYvTSC2jU2o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JZ31nVQNXLP8rowM79W9RZo5V3ohrOaMCEqTxFiDfadUoLfWB3NyDo+w26jAzB4aq
 ZjpRYfe9uTmF/BmF454DFDI5OR/GA0SYKZDlbqUNZD1nzRliuoRq6k6dIGbqVK8JEp
 ZJhqwC7TDK/sFW+kcvZGhfv+JzxAV38tF0w93zNXhE8EuZisI+H9PsZA8nF8OT1SND
 pK1ZawJOWzeD3G1H222tSV+KQX3yXbJXSewOZP4Nhctrt4YW/9BuQPtg1MO+uJsWko
 RdFvx+Exg6q8F55PKgBxP1zPiVQalsbFke6J2NUdZmBrBv2Tr/6JSmv3Ts32+gQLht
 vFg2/850KYOZw==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20211214040028.2992627-1-tzungbi@google.com>
References: <20211214040028.2992627-1-tzungbi@google.com>
Subject: Re: [RFC PATCH] ASoC: mediatek: mt8192-mt6359: fix device_node leak
Message-Id: <164028836574.13551.15479631717321569277.b4-ty@kernel.org>
Date: Thu, 23 Dec 2021 19:39:25 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_113936_090793_46769350 
X-CRM114-Status: GOOD (  12.75  )
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

On Tue, 14 Dec 2021 12:00:28 +0800, Tzung-Bi Shih wrote:
> The of_parse_phandle() document:
>     >>> Use of_node_put() on it when done.
> 
> The driver didn't call of_node_put().  Fixes the leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: fix device_node leak
      commit: 4e28491a7a198c668437f2be8a91a76aa52f20eb

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
