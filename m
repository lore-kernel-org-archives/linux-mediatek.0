Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59868CD8CAE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 18:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpdB3Q1FT+wwvp+SFThVPL5guKy5i7kriXxDZZLgUv8=; b=k5Lb7XzX/cdP8w89taX8BXz0qO
	t4ZtqsNwHrwpTA2xb7S98qeMJvKHymeXrQBUtQ9pKDvWG9zrHMxcBRLLfhmFMX5HuQZGEUi3aTzfC
	mwMBQM/HQt7iDNkG3v54YQIVkSa8uUVXWaQrtnhlZyeQkv0+Wjk0YXbk/qw8Xbn7l9vZSsTwQzEkg
	E2YDPDFzVPGeHJW78C/qIaWofAviNbYo6XeZjB3rhCMQFBVcDQJkmfCmoqXz12/Gw8gvW5WtuFgLr
	vpCKe2od5MYHAWCF3F6aoGDNZzGO3+zcw3THzdvw16B+kTsm5jxMFg8mNfk5JyxLfDkcPpZDvGDZ+
	MuMZcQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqHY5-00Dx6J-2V;
	Tue, 10 Oct 2023 18:33:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqHY2-00Dx5Z-0S
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 18:33:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58769617C2;
	Tue, 10 Oct 2023 18:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09051C433C8;
	Tue, 10 Oct 2023 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696962816;
	bh=FBG4dlajtykfzMX/8w9AtsLkDPUKg5hOUXTrm5l9Stg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oxT26bVGbjXMrDDViObRjNSkFr37Xxq1pvX3bQMhdhM1FNNcyixTLWVGOm32AaatM
	 +RRzHoj/dIIKYxeS1c9QuIGPjWlp80sblxsemtbmrjBepLtcQGF1vVf/35pSj+uTha
	 jyzzq7ie+gTIXiarIlKHvn0XrP/7rtcw/Rsr4zYCC7HccmYvGyGz5ivOjLyM1Q86S4
	 efFGdjjVYKam3mQqb30fch8uqehQNmxQ8/mgKEt0ugYm1SubBhPYOiCohaopY5AW+x
	 OA08f/05wnO5iQMk1YWBBXKCjaf5S7j90MdDRndSHmzyA8dmKZ1SWaOXL3NE2aid1U
	 RUOl54lwq7HGA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, perex@perex.cz, 
 trevor.wu@mediatek.com, 
 xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [v5 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Message-Id: <169696281374.221758.11961649530549486978.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 19:33:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_113338_224692_A905CA1C 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, 10 Oct 2023 10:37:36 +0800, xiazhengqiao wrote:
> To use RT5682S as the codec and MAX98390 as the amp, add a new
> sound card named mt8188_rt5682s.
> 
> Changes in v5:
> - PATCH 2/2: modify asoc_rtd_to_codec to snd_soc_rtd_to_codec and make it consistent with the latest revisions
>              remove common struct definitions like rt5682s_jack_pins,mt8188_rt5682s_widgets
>              and mt8188_rt5682s_controls.
> - Link to v4: https://lore.kernel.org/all/9c28b84e-2d4e-7bc2-88f3-ad5b30d2c727@collabora.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
      commit: 748d508e5b4cb537ed91e7bc5a664c526b6c64f6
[2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
      commit: 163284402c42e9094b6aa8e4f69e43da1031efc6

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


