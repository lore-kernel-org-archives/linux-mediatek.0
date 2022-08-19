Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878FCC28D13
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 22:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/SLOcF5OdtKvohQe157tZz0O3rbQZ5KFu5GFrNK/as=; b=fDjZwj2JwEwchyI3UsgZrU4Tp2
	bBBIYDEcPUft3WWKZxDR93c+Vt94Z5F4Uj5RZt9pA+C/OdyCjCGECsRmDbZMmcgfhjAKtQO05wdPJ
	WYBpu7C5nIw9XPol80WlTldR90h0WDo2jQZieDbLy3XJq0pTbEWydFfVKm6VcD+8llBP3zvvKM/r/
	uU/kgo9Y3k1lSty6kgbW3Q01zPlNkOWYJrZ8w+f+putu25CJJ7vAHFST6HTrT1LJeXwtWwbYVPFSj
	H1p0vRgjO6eFak8WiO0EJjJmKb/PxyHuYb4SZ9WWMrSFKXqHPDD6Sp2POppMlqgmaAoHFFE2/5+ml
	T5HHQQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPAmX-00D2w6-MU; Fri, 19 Aug 2022 22:48:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPAmK-00D2p2-OI; Fri, 19 Aug 2022 22:47:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F0FD61831;
	Fri, 19 Aug 2022 22:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F755C43147;
	Fri, 19 Aug 2022 22:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660949267;
	bh=gr61zTXhKdKcoL+U9nYufVpT53h0XuUHqgUWQ/ZCDhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H9LOGmLgCybT/7Njtw0vQgLu4tyWlpZKZpBtljeF1D2v0tJEm64oHQyJ9pKxsXbkm
	 8DhQ276M9td/uMBrxJpVUNjfe/aDKnyKbAtPHcWUuTdcp3vse12eRjXX4mLVqDOpkI
	 NLUyWC1F1APQlYNXp+HjeF+eGxpMofDvKHM904dkfV0wOqXQ0LG2nbMBJS1rHhvYNu
	 0vJ7WrpdzsL+25kJoxuBqUomz+zq91FhP7Z0dQ7KVeNJwJASJotpgny/lP4PiH1Jwx
	 EYvI74DbXB92Q7PNOzRFHzWlp/Q7+mjxCXZe0SuDEApcAuQWCXWBBpBFG8CSucvDqm
	 P2y4aBOPMaa2g==
From: Mark Brown <broonie@kernel.org>
To: Chunxu Li <chunxu.li@mediatek.com>, angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 project_global_chrome_upstream_group@mediatek.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220818025113.17144-1-chunxu.li@mediatek.com>
References: <20220818025113.17144-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH RESEND 0/3] ASoC: mediatek: support SOF for mt8186
Message-Id: <166094926478.19151.18027354027835618602.b4-ty@kernel.org>
Date: Fri, 19 Aug 2022 23:47:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_154748_871024_2E02323C 
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

On Thu, 18 Aug 2022 10:51:10 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> In these patches, we add SOF support for mt8186 which have HiFi5 DSP
> inside.
> 
> Chunxu Li (3):
>   ASoC: mediatek: mt8186: support DSP downlink
>   ASoC: mediatek: mt8186: add SOF support on
>     mt8186-mt6366-rt1019-rt5682s
>   ASoC: mediatek: mt8186: add SOF support on
>     mt8186-mt6366-da7219-max98357
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8186: support DSP downlink
      commit: 3c15abbed0ab99bac2e075ad38d43a7004778e91
[2/3] ASoC: mediatek: mt8186: add SOF support on mt8186-mt6366-rt1019-rt5682s
      commit: 4be34e1b70ac72415a55e02683cd847436424588
[3/3] ASoC: mediatek: mt8186: add SOF support on mt8186-mt6366-da7219-max98357
      commit: 9398381a3904d8849691fb3ec173b48f077c185e

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

