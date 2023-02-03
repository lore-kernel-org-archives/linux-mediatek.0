Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kt/4G7lzjjpdwZqs9CmX3c69H4We+zvtJy9t78XbQJk=; b=AFldYg0AUgz9h8Ivrz+Pg+aYCE
	FHk30NKZsi3fMHo1T0M9MH6dqQCk8gpoISYoVcEVN9zrtbZ8q4CpUmACrRjaYTk2TjWpeFBiHJ1EK
	ljrwXJ7NduoTxYwey/lSDiPkXoG3cJ7Zi45yyx9cxcaxc0/BPXTypfnrNrOkkU3UnSTQw8BEIsqrQ
	T1jBFtfEep6wcNQXuPOFYCZBN3Ep+bK9fvL+qjOFoN1h66Wyd3rHnMKJ77rqzr5j0hSKQU3KHEkyz
	VCzfRznUJJTiCJrC6pQtygnBdNeTJ0MT2eGkdZ9Oi7Vm3gMhtZsX7S1dPg/5AfwT5Ngj1ayJM0I5B
	FAdUn7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxUI-002YlQ-2F; Fri, 03 Feb 2023 14:56:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxU7-002YiH-KW; Fri, 03 Feb 2023 14:56:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7FFC61F65;
	Fri,  3 Feb 2023 14:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF24C433A0;
	Fri,  3 Feb 2023 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675436174;
	bh=HBW7gQQhXYjcv51yj9Mg8t0xqUMKWXdcmuW5/POrA4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rJ69gpF9aipo4mKw2c/YxbUOTxC9hSsdzvi2N6dixE54ys38FTHnMDle5M9hPbvBr
	 8X5xuBSYak2+bVBIEVqZVuA58z4qW6MOLZ3m0i0u7JxXMpL2ELo/TUQIr+5+h58ZJr
	 JyWfj8hkOSE/FQuVgomrX2FA31hdMIwSuXIvzo9gAnGyXQdIhw4Ep6U411acOtIxOa
	 Co4G1BXvJv89u/mItFYOI+nl1N53XLiDnONGLE1iPbP1xPYr2ZBJKwJ6YWu3F/ljL0
	 GeW23JfwFjhz4kIpzLgplML4md+fwK2pGF++KLkRLPnw0ycYVR2zUfK92ZJCkA94FF
	 VhSGrgIpOMXoQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 error27@gmail.com
In-Reply-To: <20230202103704.15626-1-trevor.wu@mediatek.com>
References: <20230202103704.15626-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove etdm dead code
Message-Id: <167543617210.928818.16034479848573995520.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:56:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_065615_750188_4DCF0FE8 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, 02 Feb 2023 18:37:04 +0800, Trevor Wu wrote:
> Some Smatch static checker warning like below was found.
> 
> sound/soc/mediatek/mt8188/mt8188-dai-etdm.c:2487
> mt8188_dai_etdm_parse_of()
> warn: 'ret' returned from snprintf() might be larger than 48
> 
>     2479         for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
>     2480                 dai_id = ETDM_TO_DAI_ID(i);
>     2481                 etdm_data = afe_priv->dai_priv[dai_id];
>     2482
>     2483                 ret = snprintf(prop, sizeof(prop),
>     2484                                "mediatek,%s-multi-pin-mode",
>     2485                                of_afe_etdms[i].name);
>     2486                 if (ret < 0) {
> --> 2487                         dev_err(afe->dev, "%s snprintf
> err=%d\n",
>     2488
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: remove etdm dead code
      commit: 66b9e94cb7783d3c632e2c1b436b26ece8c14e5d

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


