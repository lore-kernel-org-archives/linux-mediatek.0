Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BE6ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOfQXY/A6gxYduGlhhCQwnPLt3hFvfXbKzE4Uxhkir4=; b=sNEI2vlcxrrq2Z+V5U8og25Wzm
	Bs4rsjEPU/2Xkf8XXoDXpNb90FXD9VRO5g6vLlqW67VLocvafNvWG8TAVK1oiQN96ov9Q3vyV0eDF
	fdGcLuxOfdoWpfSWGcPhyMckGWTIolk16ZoXWDptI7MqkrDPXegtbWibhHnWeHm4CvfqVEf69lZCM
	b8dz1YpG6/XAAyGlaJAnoxvZM4vqZKEIJ7V0TPhezIFpCkFk9upCJsoKxYKfGhGbZBeaOKM3n3wnx
	jEWzGkScbE9Fm8e7dh4ZsxcAGVAkvbJp1/9TAN+o+EGPh9cBJe2lzWTuNpL9SBI6x7fJyXEtVnbPU
	0ezTnrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni4U-00000002noT-2xYZ;
	Mon, 09 Sep 2024 17:21:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni2S-00000002nI3-0DVo;
	Mon, 09 Sep 2024 17:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65ED15C00B1;
	Mon,  9 Sep 2024 17:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E5AC4CEC7;
	Mon,  9 Sep 2024 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725902334;
	bh=EhoK4r8YL8dVYI1oM5qZI8MIrFWarHcSHL0ip3G9iw8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MoNfweyk+KZ23+E30IX43XB2oxHv24uNClsK9sCkJuO4txLMOOI6Ha0hjsDcoBPDW
	 y5JL3lbnUIwVyws1OWsNdPk56DtyJUTrql6OZNItZbjQrVmAtbv+xOknkYh58vYWZB
	 4s4M2w4t9MNvNgwDH10C4elbKGXgLqeEX1UrJSToovIka5MvJQQ0CZyc4Ydm0bXDz4
	 sFrLTKkI3rarbA7EfrMib08D/z7tKsYkD+bsAJpHWV9lL3riHR12HiA+h4X3wKpOQi
	 1hw4JwJIGkaxDcjX6nAoXq2v6DRkgaPThUvN71u2mxhO5davDqEdsZM7wmIaNYY9NL
	 y1QO5embhMS2Q==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240908221754.2210857-1-arnd@kernel.org>
References: <20240908221754.2210857-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8365: include linux/bitfield.h
Message-Id: <172590232922.1707146.8389752525404411197.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 18:18:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_101856_169233_F76B9D45 
X-CRM114-Status: GOOD (  12.37  )
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

On Sun, 08 Sep 2024 22:17:34 +0000, Arnd Bergmann wrote:
> On x86, the header is not already included implicitly,
> breaking compile-testing:
> 
> In file included from sound/soc/mediatek/mt8365/mt8365-afe-common.h:19,
>                  from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:18:
> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c: In function 'mt8365_afe_cm2_mux_conn':
> sound/soc/mediatek/mt8365/mt8365-reg.h:952:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
>   952 | #define CM2_AFE_CM2_CONN_CFG1(x)        FIELD_PREP(CM2_AFE_CM2_CONN_CFG1_MASK, (x))
>       |                                         ^~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8365: include linux/bitfield.h
      commit: 6b31d6a4ca3b4d8abfb39127130889f9a9a38aa1

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


