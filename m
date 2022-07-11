Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E3C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BF7n1w93MbhMcWyG25iULsxXiasL+1X4h9CVOl0KEx8=; b=eYqb7G55oddU5D44TRlzu1Nm64
	fs1gQfK+l6B4ccS5aA5E24Gfltdvsh3HZX+ea7g9W7falpDXaKGVp46Wsw3CKoYXE69uBfq0MAGAZ
	A1gnCW94My7Th3pvE+TaPL47R9Tux9zA3GlahyXgWxpae3wtD5EqZvQR0TQcqSsr7zUPkicOihPPU
	KHJP6g76xJKZa0Ivh+zabaFMQW2Z9D+JenPWIb3Mq54nI0gXuLA1MQprAdQSfoqh30AQVOT1Qvysg
	oWWZTnVP0rSzmtN6LUo6du4idHqU5C3fByA2eeDIFbbIgfRPHQyF4sgWX91u7CeiFMQGIIO4NI6qK
	28RhpiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtgF-0020C0-1n; Mon, 11 Jul 2022 13:42:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtg2-002077-QF; Mon, 11 Jul 2022 13:42:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7125EB80EFE;
	Mon, 11 Jul 2022 13:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F271C34115;
	Mon, 11 Jul 2022 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657546936;
	bh=p8ORd2QPR8RvrqSvkiemyZJhadncjyk4UWpXgXg70WY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ldoLgmodCYQDgStD4Vaqe5rs2omN2SKIuO4JfFJXoFYyKPfbijaa1TCZ5mKesN9Al
	 qzO9CVdPg/qbr/arCiVJHeULdG+8FeaDVxn00mjkQSbgXqfjO4CEZWbxk+mEdvRc8U
	 jza7EZVVyL9wW5r22EXOOmRVtVWW7TrzV+BXLTw6X8QZ4Ryw8+ASimKL68GgZ+mU+H
	 eD4Ih7SSiyEqdtAaPYsU8vHqY2kWRpZwXBfc/M9TXFjDbVfla/fHz0cS1JoDfARR/o
	 N+f/JFBNdC8bKodbgVpoW0gX829ViloCIzQ7D5ykdz+xIEh7f+nsg1RyqAcdWAZEtN
	 QN+zNgD9+TjYw==
From: Mark Brown <broonie@kernel.org>
To: jiaxin.yu@mediatek.com, lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com, tiwai@suse.com, hbut_tan@163.com, perex@perex.c, tanzhongjun@coolpad.com, matthias.bgg@gmail.com, colin.king@intel.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220708024651.42999-1-hbut_tan@163.com>
References: <20220708024651.42999-1-hbut_tan@163.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Message-Id: <165754693321.334539.8263656402397393470.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 14:42:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_064219_033872_3CA1D1C7 
X-CRM114-Status: GOOD (  12.00  )
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

On Fri, 8 Jul 2022 10:46:51 +0800, Zhongjun Tan wrote:
> From: Zhongjun Tan <tanzhongjun@coolpad.com>
> 
> Remove condition with no effect
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Remove condition with no effect
      commit: 19bb587f3ffcb9c166bac2debdc3b08fb362c0b7

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

