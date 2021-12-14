Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04481C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCbiBGcal0nRMKGc1E3unK10JtjKw3lRtxp29CFyuwA=; b=EHXM5MWeHMJ2EP
	JFqlqnIyospj3iEQb17lUjA10jJyn+18g1VkBoJI//psgHtcjgxBZ+WpIL7vsn8JNG3UERzIGJSvG
	DUqaHj8zYajg2XgK0NRQA6ivl6bpdH/Unv1q5sFXtlvF2xdoqn7l0s6++b4TOdi9Ih+2K96Gl6WNO
	2tGHBahTo1MSl+DvWVbXPgFTkDjNP52g8V4svy3/EESq8wpPtwaP++jUSyEf5MM5M5KwLWS3fbE8A
	d1dTkyvFJw9wfYBdB1S2hVrF7xfWnqEe+rQxZ+rr0eKAELHMtRKxCizXMTUOzX3qL4qe7tlOzWB4b
	O1YyRLJHNEkv3YpTPhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7oJ-00E9Ec-7z; Tue, 14 Dec 2021 13:25:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx7o6-00E9Ax-6F; Tue, 14 Dec 2021 13:25:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 337156149A;
 Tue, 14 Dec 2021 13:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5368C34601;
 Tue, 14 Dec 2021 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639488324;
 bh=Kfpg8F/M83/BGQDlYPcnf3fKEKL4vgzfFaEYnWCRd5M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WxUOtrNoJsZzUDkAZoEnCQpr8bYiQ7GZi5DCSyW5ApQv+Jk5QJGEkfyhaWJtC9/RC
 0fbXIU7EaEdQE0YHC0TXJk6+bcyP4xpvzuuL7PPMjqAgiTd97JhGUsoDIf2GziwL8V
 RADhkcRjbvjXYQmQ0+57gxkRRP19kibc2bDQGLeZ9ZzKPE0MYshi12g5WJvZQs2rGp
 o3V8+/Xi0B6/064bZ0FC2JjaOBbC0w0fRuENKuUuVKT44Dw3jvoLli8ESaMJgLbh92
 NXcIH97XXqqQbVZyjZO34RESiOfMfh5H+BGJUIM8SYxMt4Ne87OUH98VXvE9RDOopo
 VjvAEHH8ws6xg==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc: tzungbi@google.com, kernel test robot <lkp@intel.com>, yc.hung@mediatek.com,
 trevor.wu@mediatek.com
In-Reply-To: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
References: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: assign correct type to argument
Message-Id: <163948832239.2865729.5262628793021796967.b4-ty@kernel.org>
Date: Tue, 14 Dec 2021 13:25:22 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_052526_312621_6DA8CC26 
X-CRM114-Status: GOOD (  12.50  )
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

On Thu, 9 Dec 2021 15:32:24 +0800, Jiaxin Yu wrote:
> Fix the following sparse warning: (new ones prefixed by >>)
> >> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
>      sparse: sparse: incorrect type in argument 3 (different base types)
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      expected unsigned int to
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      got restricted snd_pcm_format_t [usertype]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: assign correct type to argument
      commit: 03c2192ab636987db72e99f319a942cc4f3cb352

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
