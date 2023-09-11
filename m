Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F05CA0EC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 23:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEvBrU3HByKq7wInziSYC+D7v4AI+KrXU7eTsxH2UrE=; b=kykQUztwIzmTITkWxmChkIUsWr
	druy50d/z7ltpCRPqOCezgLzWf3YvE+AhHfNw/kMeAJ5vs2SlSwx9Rw6ozraYbCufE5RLjklmVxD6
	QTi9xXuBlVinWKScRFcfUI78J/aj/8hJ3/6ym49q406cp+dFUUhRZ6BjHmb3BWmakDglcBbRCToGX
	plCF4qXczDqxvT9RvCeNTv/pwwFUwvgTxe/P/o+8zrNxUeFeMjlbVDpd55N6/up+zbD9PGMbtKNhx
	R4XhqTSPonSEUxZJuqctsSNF/e9gmVQtfOtlWBDgF4l8zsFVBaijZ8wgI/LxICWxyxxSkVPqu1xFx
	/Q7qU3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqmp-001doe-2l;
	Mon, 11 Sep 2023 23:57:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqmm-001dnh-0g;
	Mon, 11 Sep 2023 23:57:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B33CB614B3;
	Mon, 11 Sep 2023 23:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9376C32779;
	Mon, 11 Sep 2023 23:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476662;
	bh=DgTYRQBSoJwFvdOE21aqdGWssFdi96AaqXB7ox6Gvl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sCsbC+kBVOnYpheOEgpvIQenH7Rc5ejskACNLgOFadmXomrRduMQWUqt747gbZEYn
	 DJWD9sn8SQpvwnUc5i4Er6yDrW0g/ekW5W/18qnu6473W9xqN8DJ27U0VgvRRvaoeb
	 z/GXRQYMe8bwrZ2zkCFgV6g2pvNY3MluE9cr97p4/2BpIx4VQgRu9Q//+PChIVK7dU
	 ewEQjQgO2jiYrE/FmbTpFfinrqanrbUgcneOk6iBk53977A06j109yuNWsG9ctKUdY
	 +Hoet91nTSOyQ7Pq/zKpGAFXddjr3wD2u4CUurCxwTylM7HYRd/alkV9cAKR47ST8u
	 SB7Rb7xiu+/rw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230825024935.10878-1-trevor.wu@mediatek.com>
References: <20230825024935.10878-1-trevor.wu@mediatek.com>
Subject: Re: [RESEND,v3 0/3] ASoC: mt8188-mt6359: add SOF support
Message-Id: <169447666040.2387538.8880759925016184457.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_165744_292271_C02B030D 
X-CRM114-Status: GOOD (  13.59  )
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

On Fri, 25 Aug 2023 10:49:32 +0800, Trevor Wu wrote:
> This series introduces dynamic pinctrl and adds support for the SOF on
> the mt8188-mt6359 machine driver.
> 
> Changes since v2:
>   - revise mtk_sof_check_tplg_be_dai_link_fixup().
> 
> Changes since v1:
>   - minor changes to incorporate the suggestions from the reviewer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
      commit: d601bb78f06b9e3cbb52e6b87b88add9920a11b6
[2/3] ASoC: mediatek: common: revise SOF common code
      commit: 4047b35c836ff9f8bf1f57c4ab871136899267e9
[3/3] ASoC: mediatek: mt8188-mt6359: add SOF support
      commit: 1bce95deab841ece9602f941e68c7b919fde303d

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


