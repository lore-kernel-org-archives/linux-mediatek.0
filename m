Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A7EC47073
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vyaVc2ZBYpAXsk6Pbvuihq+ETaJUl1FbvatQj74u8g=; b=Y1EtCyuRXZ3QmoDPCBdhgRKJU3
	hIvUTgFkj3OGEv1pdolJa7JYFCtpySJPoj87jdnro8XOJqCxsNG+Bg0mhXlNFm/Ibc19FiaNwuoFT
	aP/ygHfEpXtZ532D8nryE8eTdxjY3Hrikq2B0wEdWtK5exgLY7egUUVO5XHnC8ywetXOrcD+A4U+9
	BVH6E6hfiMpsLXHodnXrvz0++JOaYmgeT8xbEFBF6IJDwGWZvap3ClY8vMTpiWCk5PZEm6Wt3QQVb
	erVl5Kk+i7OTQcTOYJ0paZy/T0SI3iFa7pEl4fc2fWIzK/8CbnsbZo6IzMpgtRrKbn+F7bO3HWn9q
	5Qh68HZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJHlK-001K1H-2x;
	Fri, 29 Dec 2023 18:39:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJHlH-001K0b-22;
	Fri, 29 Dec 2023 18:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9666A611EE;
	Fri, 29 Dec 2023 18:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDC1C433C7;
	Fri, 29 Dec 2023 18:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703875150;
	bh=sTxR6z5JOWgh+34pWTsQbRixIn+UfsgPr8ZOpdldSIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rW4QzQXsxou3N/rtnJwoktJXEcINLWb+6cYcPwnu1jSUyQ/4Guh0j5AGr5fJeCsGi
	 u3IBxg42F87pjcnhpE5NyrJ/u14mgxwUIu/06jXkJXgNUfAjk0ehb4+igcjBiV+kFS
	 16TufM4Hc41S0hWv4vaf+24mf2qe/mnemI4BHe01NkbAoAWWvG5LkLbKeo03XiAISk
	 6/UI4LPySjsbOLv3fPyTKdxYnmxcDp7If7nGNGTGzKuoEiYy70vSesajOxdd1uYhwz
	 t51NAJJ/EE1oSMmBfUsQWEcNvsHrKD4ht76FY3HJaKyAvLltXuHhD996FfxuMCaxAn
	 nQloDkoTHS5bQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Eugen Hristev <eugen.hristev@collabora.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 allen-kh.cheng@mediatek.com, jiaxin.yu@mediatek.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20231229114342.195867-1-eugen.hristev@collabora.com>
References: <20231229114342.195867-1-eugen.hristev@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: fix AUD_PAD_TOP register and
 offset
Message-Id: <170387514707.3010118.10483161102893986503.b4-ty@kernel.org>
Date: Fri, 29 Dec 2023 18:39:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_103911_736533_64916DB0 
X-CRM114-Status: GOOD (  12.25  )
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

On Fri, 29 Dec 2023 13:43:42 +0200, Eugen Hristev wrote:
> AUD_PAD_TOP widget's correct register is AFE_AUD_PAD_TOP , and not zero.
> Having a zero as register, it would mean that the `snd_soc_dapm_new_widgets`
> would try to read the register at offset zero when trying to get the power
> status of this widget, which is incorrect.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: fix AUD_PAD_TOP register and offset
      commit: 38744c3fa00109c51076121c2deb4f02e2f09194

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


