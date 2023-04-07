Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBEDC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stlFoA3n43CU4QgbC7EJVbPiBB38TTLBE+ALMZTWERI=; b=lrXnAFJqCiy/mjcFdbas0LpfxN
	2cZ50aTkTQLkuxfolY+rKZx/Rvb+naN7G0p13gQ/WuMltp7fne9qY/kCjEwrZ3QDUrjmy7OrCwNQg
	3CKnmi4RS9Wrl+kClqiwZm4QNk954mKqepM5OPEPlcJEtO2dT625G5scaVYz1YRCSq5seadOwqL9A
	Rqhx4fw20irNmjKYAO5dMhdOUZ68jy0Cj/Rjhv6j+z2IzDL9SeVhrNvNkKNLlPC5HPPSVgTcB74Q0
	TEdHYLjr+5A47ucqdK5NnYYmcwVQ9EWpCfWOuXkFLc/Enxd3hYnIXzTZrtjC54M91rOdOrZ8Nll3T
	7vHa2WWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkqof-00AtYP-16;
	Fri, 07 Apr 2023 18:28:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkqoc-00AtXo-0B;
	Fri, 07 Apr 2023 18:28:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C44D46531A;
	Fri,  7 Apr 2023 18:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65268C433EF;
	Fri,  7 Apr 2023 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680892080;
	bh=IaqEVSvO4+ec0TMhLkqBwp/Pr6mbvqqD98gAzdvOZHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CB6dOTtScPKXalKF3JrhUEVFMkjNB/W8xrIsDLtw7o/SNFs7/NUayzVsVrI7xZTi6
	 X0uxshqcVt8/ZQ+HQFP/ISqfg2rEQM+1/7fsznDZZ1xVHaYpRO+cGUThOF0czMDS9p
	 aIbj5s+dOxbhvcTm8ox6+jUwTzBb9DhE23Xa4iKQ6aNSlRw76MEzMi6DcfwEitwZ1S
	 QL8as3fZZVBuzbVFXdRwX2oV1qxiRLq6w8L28SKmiDDeM6kLibtgqw7EsOwyKFqNrV
	 ICy1BgUTt1BTI2EFfQ3VSlpquZQgx1VqLOoyChsryqFTYbvOzYJKzS05cDKcik2hg1
	 Yh0tyYdp0SNdw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 colin.i.king@gmail.com, fshao@chromium.org, jiaxin.yu@mediatek.com, 
 allen-kh.cheng@mediatek.com, Tom Rix <trix@redhat.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230407115553.1968111-1-trix@redhat.com>
References: <20230407115553.1968111-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: set variable aud_pinctrl to
 static
Message-Id: <168089207711.180511.12653080399028672980.b4-ty@kernel.org>
Date: Fri, 07 Apr 2023 19:27:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_112802_151391_CE65904A 
X-CRM114-Status: GOOD (  13.39  )
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

On Fri, 07 Apr 2023 07:55:53 -0400, Tom Rix wrote:
> smatch reports
> sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:14:16: warning: symbol
>   'aud_pinctrl' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: set variable aud_pinctrl to static
      commit: 672029caa5708934817a331f3323bbe48d456c5c

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


