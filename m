Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43DFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRavO71NumIEVmERPkScJK9IC76xG86aN8j/Px/puNc=; b=VFMQfZErtEDpCD
	/U2eXuecLApAi1jfXz4aX+WFt8rg4BQFhVsYEExnrWKF/pF6AC8UezECaSN+yl1o6cGnWJhAy5dKk
	dzSwR2lwBudhwlc7vOJp9T7bkXPdMaEq3VLvXZQe5i6w2CZi1Tke7ZocS2a50iS7AM8exYosb1iqS
	T/d9TQWPKR5ffQxWo/K9x5Gu1oIWISn40VIijg7mbJFo9OuSJ+fT6ibLAifMC49uJmwUtez4dvN5e
	PSMVwyykgyvF0lE6+5wh4uXeDf8gSyyhBY5kzvQf5B8SM5/TxkO5UXcBbAxnoTRv6tE5r9EKB8UOF
	FPxCFDzONCz+DXUuYgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpuP-0004At-TE; Fri, 08 Apr 2022 14:48:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncptM-0003b5-Ph; Fri, 08 Apr 2022 14:47:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BBFF61E80;
 Fri,  8 Apr 2022 14:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83655C385A3;
 Fri,  8 Apr 2022 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649429236;
 bh=uFnBK08Qb+sRg8CpeU7lutMdHslM9UrQV5P3vlPmCTo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SR14bS9XZdZlWBPdwJk2dhc0y7mJ3szTSdJQBHqgk7Dzg2tKGWt7uvap5xdqLKfbW
 vUrsxRBZge/RaZlppUwlKeylWmzUoBV1vw7+vjMR4jZucZNy/qCvaLK8vpYgpKjoUU
 Xf3KkLTFwji71kNfzl2Eirl4xanWmsxRmMZAjhFm75lB43/+w8u+hZ91Z4f6vYhkvK
 k4xsG7An4L/Ot7YhrlvX7wjJyq/GOEndRnvUspEO36JGWOzRFsUg1hcBqrCvQ5ROwK
 lPnFop0aQZQfP+FnltShJ05o8Eq5Oa29RoJYPd+KZI+hTWJUGTvFsDu4cTKeuTSptd
 YerGw4ef56s1Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, cgel.zte@gmail.com
Cc: trevor.wu@mediatek.com, tzungbi@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 zealci@zte.com.cn, matthias.bgg@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, lv.ruyi@zte.com.cn,
 linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com
In-Reply-To: <20220408100309.2495462-1-lv.ruyi@zte.com.cn>
References: <20220408100309.2495462-1-lv.ruyi@zte.com.cn>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Make sure of_device_id table are
 NULL terminated
Message-Id: <164942923326.1424253.13615107780674647897.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 15:47:13 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_074716_908468_384B5C48 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, 8 Apr 2022 10:03:09 +0000, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> Fix the following coccicheck review:
> ./sound/soc/mediatek/mt8195/mt8195-mt6359.c:1657:1-2:
> mt8195_mt6359_dt_match is not NULL terminated at line 1657
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Make sure of_device_id table are NULL terminated
      commit: a2c11c5b68f49b36be9ad4a60165bfbeca5cbb1d

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
