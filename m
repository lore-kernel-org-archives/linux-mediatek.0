Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BECC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x57F/rywJM7xQ1nmcZF5eRDZsxqa/dLb5WqCczS3Od8=; b=f0rXtuGYYcb5xUUBgfImvHv0qs
	Vt8p7pnf5rxzG90gas8Jrr99AXlcESBnhSxOwH+ZxIWHoWDzeNUNzjJpfX/bNWiE20zH5NRkFkP+J
	oRqZEOPY4v55XDyIUOIWRRRmJDTGbK/eVJHCd89j468sZmnLdiKs3lJeTsbpcWUe18MEPEO4dG1Nb
	kobLKaqpyh4qpQ171kv1BPhitf2xaW1qhqcOtlXsUXYTRDajYvk+z5FcHGTCDg0v2ecoQ9P0UDJop
	ddskVkI4QzVRGrQZAduqPOgbuZZl7QmI7fqbu45XP6O6pXZGs1megFBlQRsUi2wpsqFYle3ps+nVQ
	ShpiTo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LFw-009aX9-2K; Fri, 17 Jun 2022 23:20:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LFk-009aTN-FS; Fri, 17 Jun 2022 23:19:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E563CB82C09;
	Fri, 17 Jun 2022 23:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B984C3411D;
	Fri, 17 Jun 2022 23:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655507985;
	bh=0/gO3abdMtjXJJpqM36aCEMHAeb67MB4T5VdLEmQPhU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mSYB4A8vVI8/80VKW+wQI60aipjNbjGuov8aEaeV3xzY0qi+mC1IsiMJlrSyx2mcu
	 7tgluN/XY6yo1SBCnBgB4ZGnckTjbQMxu7tuwyPKm0E+6Tz2TWP66lT1QfRraSLtHs
	 8iz9aXtIeDFQlh0JV8hEwAyc0FQWdR1W3REhmkGYayAm7OFCO50HmRrIq8PiLP6BCV
	 +TOnacjJxVxcCl+DC5vFEIYdoyv8hWiA5rvY2sSJX/36lENJjIBfqe7zVHSplywl+W
	 gcPoT1cuH8XPRDWTUGocZhKUufUszJyxqfEBrr6Ze4WB1J9SZ9fEn3Mt+93EkJfBON
	 DoBIr/62K9WRg==
From: Mark Brown <broonie@kernel.org>
To: jiaxin.yu@mediatek.com, fshao@chromium.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220617111003.2014395-1-fshao@chromium.org>
References: <20220617111003.2014395-1-fshao@chromium.org>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request
Message-Id: <165550798423.994018.10916752817659523759.b4-ty@kernel.org>
Date: Sat, 18 Jun 2022 00:19:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_161948_712520_68237BF9 
X-CRM114-Status: GOOD (  11.53  )
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

On Fri, 17 Jun 2022 19:10:04 +0800, Fei Shao wrote:
> The lockdep mechanism revealed an unbalanced unlocking on MT8186:
> 
>   [    2.993966] WARNING: bad unlock balance detected!
>   [    2.993978] -------------------------------------
>   [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request_mutex) at:
>   [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
>   [    2.994012] but there are no more locks to release!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request
      commit: 6c9e9046e1ff356bda66661213735d33c6cfea53

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

