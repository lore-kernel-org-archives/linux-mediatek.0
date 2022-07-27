Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E33BC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV/97Jp38ShHfp3LJd8L5W1ZjGG845qYAlyAenb+EIk=; b=o6++YRA3taVyzi3vEhTg+FP7qc
	c8mOqLB5L8TA5sKj083JuxoA1skGdEGoGu6ZUs4wmfRs0SKjq/MekHbPchrt/unjsUNT7EEIx6ZR5
	8uQWkHmnB4OgqPxuoLpEwUYz8u4bTpJXoCT3Z09xGkJUha481IQCqLU54uEAHNZA/ZO8sqzHGSiUY
	Usn7qPmGxgbPx+MJaFg6PfRXYH6Sse0XTJ6kvIBS/QvKsYJKio4Ww2aMXZAfD5HlWsBsaNJdF7oaI
	TydNmPRekMGKdJD+tKpcv2jkOkbhe+1T0OkDua1Wo4uuEud2e2CDdphh8UcANvaTHH4c0CDz3ky+c
	35LzHiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGnXw-00HSWB-Al; Wed, 27 Jul 2022 20:22:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGnXd-00HSKE-Jq; Wed, 27 Jul 2022 20:22:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1134C61AB6;
	Wed, 27 Jul 2022 20:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B224EC433C1;
	Wed, 27 Jul 2022 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658953319;
	bh=oD9V7VnPE00dz4yqUuVgqIQpVscpbOrU9NDfS7TeMag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hy87mm+OftQ8pTPkrMDnGEAp7fJZ3T7ICtQs3ZOKepiXumIUL0pd/COsz2+l/K/lU
	 ZlLSw9nUR4potEC9J3baapNtpsPMh5KIXjNV31YkStKsmDwyT3/sPjzeacLOjdWLXm
	 jOIHQcGLFu95zepELiAr1Fobg/CItHVDxv4l94vrlmRL0NepvsNW/ZRErwLpoTHN4v
	 HRjTSCHi2ErRQlHH/hgXSNsZHXXx09LWf6DI2PN0kJW1tb4UCbXe3iB9//mixKPDA8
	 Ignk1QoTrTP6muB7eak/PXTPQMNqzMNBVLsJ+vlufbxHgsaN8Dcxf2VYch2c7UDMCf
	 7fSf1MmpcjvuQ==
From: Mark Brown <broonie@kernel.org>
To: angelogioacchino.delregno@collabora.com, Jiaxin Yu <jiaxin.yu@mediatek.com>, dan.carpenter@oracle.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, linux-arm-kernel@lists.infradead.org, aaronyu@google.com,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220726154220.28141-1-jiaxin.yu@mediatek.com>
References: <20220726154220.28141-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: remove unnecessary judgments
Message-Id: <165895331742.3760230.5472631801057984251.b4-ty@kernel.org>
Date: Wed, 27 Jul 2022 21:21:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_132201_714145_A8B35E1A 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, 26 Jul 2022 23:42:20 +0800, Jiaxin Yu wrote:
> The afe_priv->dai_priv[] is allocated when platform driver probe(), if it
> failed, the ASoC platform driver probe() will return fail first.
> Therefore, this is excessive judgment, and the condition will never be
> established.
> 
> Bug report: https://www.spinics.net/lists/alsa-devel/msg145609.html
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: remove unnecessary judgments
      commit: d7bffbe9cbd3c96fe51a8482127cabf6fa1fd9b2

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

