Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F78C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZe9nR22503id7mCWYlLyuxoXbqUPeri6pqKPq2JeZI=; b=1WPhDNySUp6NLXXQGX253grC9L
	teMv2K7VFutLgIFp4zy1J3NZgD7gsbfF1jX+nBI4IuTAAZ8FftHwxgB0s9qH1VfXTVKfOvWsxXF0O
	yBPFUhKUaj3c3RQHa+yrFIP/UUJh98B8KOuJZg10lot9Cj+/Y3UjmhhGCqBru6KLTJ7KoaZW/bqzj
	p3BoDUVOfIgoWh171F1Bkix/Xc9xEekbsDZLL860HdlrHeYqWMqteK3w4FpOOAfyV9bm+36DR5JcX
	tzW7fQkcAXssp7whmD/j7G5sedENzW/4S/2CDH1F3q0NAuYWUP5Ie9kElzYYaeFXIKsI9YEkHj7Ox
	wAjq1YjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDR2W-00DrvU-J1; Mon, 18 Jul 2022 13:44:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDR2I-00Drm4-Cb; Mon, 18 Jul 2022 13:43:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B11C1B81011;
	Mon, 18 Jul 2022 13:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678A2C341C0;
	Mon, 18 Jul 2022 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658151823;
	bh=7tFBGqUCkSt48dOZXzzfz1gzARNR5pWpaicXyiZifAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZpQlyzBX+qw7XQHIlBSp/jjGa9M1Rd7hoGLTAZAEHVNR6vkW7pre56b/B3TkdfqPG
	 YFZuBdAZpYt4TJxpaldPAiAy7NbT7zla/5ts/XDnQOhgg4TaDLYe7dHrm5Fm5uX6IE
	 XKREkjDZdbDHAfuaLGK+x5xAtV9IQ1gETwlZLGcXy0s7aLgPLkJxYxJXWXaD8QqaL6
	 6oSRXj3cT07k7fWaIbxmSfVeW09vQeANSI8lg8rM6ShSnJXiC7J4ziezzuA4bUgAQi
	 AJVYjMSGknCWP0qUkTosPTx1oUEBwupxjk5PKPjZWdn1bdMX2J9Y61tZOvMKw0hjoB
	 oRB29qgPRd2Zg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com, chunxu.li@mediatek.com
Cc: tzungbi@google.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org, trevor.wu@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220715085903.7796-1-chunxu.li@mediatek.com>
References: <20220715085903.7796-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: extract SOF common code
Message-Id: <165815182112.53643.17525611218975401104.b4-ty@kernel.org>
Date: Mon, 18 Jul 2022 14:43:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_064346_654288_4C42B692 
X-CRM114-Status: GOOD (  13.48  )
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

On Fri, 15 Jul 2022 16:59:03 +0800, Chunxu Li wrote:
> The functions related to SOF can be reused in different machine drivers,
> such as mt8195 or mt8186, so extract the common code to avoid duplication.
> 
> Set mtk_soc_card_data which include machine private data and SOF private
> data as card drvdata, then the difference between machine private can be
> ignored such as mt8195_mt6359_priv or mt8186_mt6366_priv, at the same
> time the SOF related code can be reused in different machine drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: extract SOF common code
      commit: 0caf1120c58395108344d5df4e09359b67e95094

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

